
package com.onlinetourplanner.dao;

import com.onlinetourplanner.model.Bus;
import com.onlinetourplanner.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class BusDAO {

    public List<Bus> searchBuses(String source, String destination) {
        List<Bus> buses = new ArrayList<>();

        String sql = "SELECT * FROM buses " +
                     "WHERE LOWER(TRIM(source)) = LOWER(TRIM(?)) " +
                     "AND LOWER(TRIM(destination)) = LOWER(TRIM(?))";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, source);
            statement.setString(2, destination);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    buses.add(mapBus(resultSet));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return buses;
    }

    public List<Bus> getAllBuses() {
        List<Bus> buses = new ArrayList<>();
        String sql = "SELECT * FROM buses";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                buses.add(mapBus(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return buses;
    }

    private Bus mapBus(ResultSet resultSet) throws SQLException {
        return new Bus(
                resultSet.getInt("bus_id"),
                resultSet.getString("operator"),
                resultSet.getString("bus_number"),
                resultSet.getString("source"),
                resultSet.getString("destination"),
                resultSet.getTimestamp("departure_time").toLocalDateTime(),
                resultSet.getTimestamp("arrival_time").toLocalDateTime(),
                resultSet.getBigDecimal("price"),
                resultSet.getInt("available_seats")
        );
    }

    public boolean addBus(Bus bus) {
        String sql = """
                INSERT INTO buses
                (operator, bus_number, source, destination, departure_time,
                 arrival_time, price, available_seats)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, bus.getOperator());
            statement.setString(2, bus.getBusNumber());
            statement.setString(3, bus.getSource());
            statement.setString(4, bus.getDestination());
            statement.setTimestamp(5, Timestamp.valueOf(bus.getDepartureTime()));
            statement.setTimestamp(6, Timestamp.valueOf(bus.getArrivalTime()));
            statement.setBigDecimal(7, bus.getPrice());
            statement.setInt(8, bus.getAvailableSeats());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateBus(Bus bus) {
        String sql = """
                UPDATE buses
                SET operator = ?, bus_number = ?, source = ?, destination = ?,
                    departure_time = ?, arrival_time = ?, price = ?,
                    available_seats = ?
                WHERE bus_id = ?
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, bus.getOperator());
            statement.setString(2, bus.getBusNumber());
            statement.setString(3, bus.getSource());
            statement.setString(4, bus.getDestination());
            statement.setTimestamp(5, Timestamp.valueOf(bus.getDepartureTime()));
            statement.setTimestamp(6, Timestamp.valueOf(bus.getArrivalTime()));
            statement.setBigDecimal(7, bus.getPrice());
            statement.setInt(8, bus.getAvailableSeats());
            statement.setInt(9, bus.getBusId());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteBus(int busId) {
        String sql = "DELETE FROM buses WHERE bus_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, busId);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
