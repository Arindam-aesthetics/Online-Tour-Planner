package com.onlinetourplanner.dao;

import com.onlinetourplanner.model.Hotel;
import com.onlinetourplanner.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class HotelDAO {

    public List<Hotel> searchHotels(String location) {

        List<Hotel> hotels = new ArrayList<>();

        String sql = "SELECT * FROM hotels WHERE LOWER(location) = LOWER(?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, location);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Hotel hotel = new Hotel(
                        resultSet.getInt("hotel_id"),
                        resultSet.getString("name"),
                        resultSet.getString("location"),
                        resultSet.getString("description"),
                        resultSet.getBigDecimal("price_per_night"),
                        resultSet.getInt("available_rooms")
                );

                hotels.add(hotel);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return hotels;
    }

    public List<Hotel> getAllHotels() {

        List<Hotel> hotels = new ArrayList<>();

        String sql = "SELECT * FROM hotels";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Hotel hotel = new Hotel(
                        resultSet.getInt("hotel_id"),
                        resultSet.getString("name"),
                        resultSet.getString("location"),
                        resultSet.getString("description"),
                        resultSet.getBigDecimal("price_per_night"),
                        resultSet.getInt("available_rooms")
                );

                hotels.add(hotel);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return hotels;
    }
    
    public boolean addHotel(Hotel hotel) {
        String sql = """
                INSERT INTO hotels
                (name, location, description, price_per_night, available_rooms)
                VALUES (?, ?, ?, ?, ?)
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, hotel.getName());
            statement.setString(2, hotel.getLocation());
            statement.setString(3, hotel.getDescription());
            statement.setBigDecimal(4, hotel.getPricePerNight());
            statement.setInt(5, hotel.getAvailableRooms());

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateHotel(Hotel hotel) {
        String sql = """
                UPDATE hotels
                SET name = ?, location = ?, description = ?,
                    price_per_night = ?, available_rooms = ?
                WHERE hotel_id = ?
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, hotel.getName());
            statement.setString(2, hotel.getLocation());
            statement.setString(3, hotel.getDescription());
            statement.setBigDecimal(4, hotel.getPricePerNight());
            statement.setInt(5, hotel.getAvailableRooms());
            statement.setInt(6, hotel.getHotelId());

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteHotel(int hotelId) {
        String sql = "DELETE FROM hotels WHERE hotel_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, hotelId);

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}