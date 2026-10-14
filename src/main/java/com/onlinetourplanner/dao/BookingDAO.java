package com.onlinetourplanner.dao;

import com.onlinetourplanner.model.Booking;
import com.onlinetourplanner.util.DBConnection;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    public boolean createBooking(
            int userId,
            String bookingType,
            int itemId,
            LocalDate travelDate,
            int numberOfPeople,
            double totalAmount) {

        if (userId <= 0 || itemId <= 0 || numberOfPeople <= 0
                || travelDate == null || totalAmount <= 0
                || bookingType == null) {
            return false;
        }

        String type = bookingType.toLowerCase();

        String table;
        String idColumn;
        String availabilityColumn;

        switch (type) {
            case "flight" -> {
                table = "flights";
                idColumn = "flight_id";
                availabilityColumn = "available_seats";
            }
            case "bus" -> {
                table = "buses";
                idColumn = "bus_id";
                availabilityColumn = "available_seats";
            }
            case "hotel" -> {
                table = "hotels";
                idColumn = "hotel_id";
                availabilityColumn = "available_rooms";
            }
            case "package" -> {
                table = "packages";
                idColumn = "package_id";
                availabilityColumn = "available_slots";
            }
            default -> {
                return false;
            }
        }

        String inventorySql = "UPDATE " + table
                + " SET " + availabilityColumn + " = "
                + availabilityColumn + " - ? WHERE " + idColumn
                + " = ? AND " + availabilityColumn + " >= ?";

        String bookingSql = """
                INSERT INTO bookings
                (user_id, booking_type, item_id, booking_date,
                 travel_date, number_of_people, total_amount, status)
                VALUES (?, ?, ?, CURDATE(), ?, ?, ?, 'Confirmed')
                """;

        try (Connection connection = DBConnection.getConnection()) {
            connection.setAutoCommit(false);

            try {
                try (PreparedStatement inventoryStatement =
                             connection.prepareStatement(inventorySql)) {

                    inventoryStatement.setInt(1, numberOfPeople);
                    inventoryStatement.setInt(2, itemId);
                    inventoryStatement.setInt(3, numberOfPeople);

                    if (inventoryStatement.executeUpdate() != 1) {
                        connection.rollback();
                        return false;
                    }
                }

                try (PreparedStatement bookingStatement =
                             connection.prepareStatement(bookingSql)) {

                    bookingStatement.setInt(1, userId);
                    bookingStatement.setString(2, type);
                    bookingStatement.setInt(3, itemId);
                    bookingStatement.setDate(4, java.sql.Date.valueOf(travelDate));
                    bookingStatement.setInt(5, numberOfPeople);
                    bookingStatement.setBigDecimal(
                            6, BigDecimal.valueOf(totalAmount));

                    if (bookingStatement.executeUpdate() != 1) {
                        connection.rollback();
                        return false;
                    }
                }

                connection.commit();
                return true;

            } catch (SQLException e) {
                connection.rollback();
                throw e;
            } finally {
                connection.setAutoCommit(true);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Booking> getBookingsByUserId(int userId) {
        List<Booking> bookings = new ArrayList<>();

        String sql = """
                SELECT * FROM bookings
                WHERE user_id = ?
                ORDER BY booking_id DESC
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, userId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Booking booking = new Booking(
                            resultSet.getInt("booking_id"),
                            resultSet.getInt("user_id"),
                            resultSet.getString("booking_type"),
                            resultSet.getInt("item_id"),
                            resultSet.getDate("booking_date").toLocalDate(),
                            resultSet.getDate("travel_date").toLocalDate(),
                            resultSet.getInt("number_of_people"),
                            resultSet.getBigDecimal("total_amount"),
                            resultSet.getString("status")
                    );

                    bookings.add(booking);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();

        String sql = "SELECT * FROM bookings ORDER BY booking_id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Booking booking = new Booking();

                booking.setBookingId(resultSet.getInt("booking_id"));
                booking.setUserId(resultSet.getInt("user_id"));
                booking.setBookingType(resultSet.getString("booking_type"));
                booking.setItemId(resultSet.getInt("item_id"));
                booking.setBookingDate(
                        resultSet.getDate("booking_date").toLocalDate());
                booking.setTravelDate(
                        resultSet.getDate("travel_date").toLocalDate());
                booking.setNumberOfPeople(
                        resultSet.getInt("number_of_people"));
                booking.setTotalAmount(
                        resultSet.getBigDecimal("total_amount"));
                booking.setStatus(resultSet.getString("status"));

                bookings.add(booking);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }
    
    public boolean cancelBooking(int bookingId, int userId) {

        String selectSql = """
                SELECT booking_type, item_id, number_of_people, status
                FROM bookings
                WHERE booking_id = ? AND user_id = ?
                FOR UPDATE
                """;

        try (Connection connection = DBConnection.getConnection()) {
            connection.setAutoCommit(false);

            try {
                String type;
                int itemId;
                int quantity;

                try (PreparedStatement statement = connection.prepareStatement(selectSql)) {
                    statement.setInt(1, bookingId);
                    statement.setInt(2, userId);

                    try (ResultSet resultSet = statement.executeQuery()) {
                        if (!resultSet.next()
                                || !"Confirmed".equalsIgnoreCase(resultSet.getString("status"))) {
                            connection.rollback();
                            return false;
                        }

                        type = resultSet.getString("booking_type");
                        itemId = resultSet.getInt("item_id");
                        quantity = resultSet.getInt("number_of_people");
                    }
                }

                String table;
                String idColumn;
                String availabilityColumn;

                switch (type.toLowerCase()) {
                    case "flight" -> {
                        table = "flights";
                        idColumn = "flight_id";
                        availabilityColumn = "available_seats";
                    }
                    case "bus" -> {
                        table = "buses";
                        idColumn = "bus_id";
                        availabilityColumn = "available_seats";
                    }
                    case "hotel" -> {
                        table = "hotels";
                        idColumn = "hotel_id";
                        availabilityColumn = "available_rooms";
                    }
                    case "package" -> {
                        table = "packages";
                        idColumn = "package_id";
                        availabilityColumn = "available_slots";
                    }
                    default -> {
                        connection.rollback();
                        return false;
                    }
                }

                String cancelSql = """
                        UPDATE bookings
                        SET status = 'Cancelled'
                        WHERE booking_id = ? AND user_id = ? AND status = 'Confirmed'
                        """;

                try (PreparedStatement statement = connection.prepareStatement(cancelSql)) {
                    statement.setInt(1, bookingId);
                    statement.setInt(2, userId);

                    if (statement.executeUpdate() != 1) {
                        connection.rollback();
                        return false;
                    }
                }

                String inventorySql = "UPDATE " + table
                        + " SET " + availabilityColumn + " = "
                        + availabilityColumn + " + ? WHERE " + idColumn + " = ?";

                try (PreparedStatement statement = connection.prepareStatement(inventorySql)) {
                    statement.setInt(1, quantity);
                    statement.setInt(2, itemId);

                    if (statement.executeUpdate() != 1) {
                        connection.rollback();
                        return false;
                    }
                }

                connection.commit();
                return true;

            } catch (SQLException e) {
                connection.rollback();
                throw e;
            } finally {
                connection.setAutoCommit(true);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}