package com.onlinetourplanner.dao;

import com.onlinetourplanner.model.Flight;
import com.onlinetourplanner.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class AdminFlightDAO {

    public List<String[]> getAllFlights() {
        List<String[]> flights = new ArrayList<>();

        String sql = "SELECT * FROM flights ORDER BY flight_id";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                String[] flight = {
                    String.valueOf(resultSet.getInt("flight_id")),
                    resultSet.getString("airline"),
                    resultSet.getString("flight_number"),
                    resultSet.getString("source"),
                    resultSet.getString("destination"),
                    String.valueOf(resultSet.getTimestamp("departure_time")),
                    String.valueOf(resultSet.getTimestamp("arrival_time")),
                    String.valueOf(resultSet.getBigDecimal("price")),
                    String.valueOf(resultSet.getInt("available_seats"))
                };

                flights.add(flight);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flights;
    }

    public void addFlight(Flight flight) {
        String sql = """
                INSERT INTO flights
                (airline, flight_number, source, destination,
                 departure_time, arrival_time, price, available_seats)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, flight.getAirline());
            statement.setString(2, flight.getFlightNumber());
            statement.setString(3, flight.getSource());
            statement.setString(4, flight.getDestination());
            statement.setTimestamp(5, Timestamp.valueOf(flight.getDepartureTime()));
            statement.setTimestamp(6, Timestamp.valueOf(flight.getArrivalTime()));
            statement.setBigDecimal(7, flight.getPrice());
            statement.setInt(8, flight.getAvailableSeats());

            statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateFlight(Flight flight) {
        String sql = """
                UPDATE flights
                SET airline = ?, flight_number = ?, source = ?,
                    destination = ?, departure_time = ?, arrival_time = ?,
                    price = ?, available_seats = ?
                WHERE flight_id = ?
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, flight.getAirline());
            statement.setString(2, flight.getFlightNumber());
            statement.setString(3, flight.getSource());
            statement.setString(4, flight.getDestination());
            statement.setTimestamp(5, Timestamp.valueOf(flight.getDepartureTime()));
            statement.setTimestamp(6, Timestamp.valueOf(flight.getArrivalTime()));
            statement.setBigDecimal(7, flight.getPrice());
            statement.setInt(8, flight.getAvailableSeats());
            statement.setInt(9, flight.getFlightId());

            statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteFlight(int flightId) {
        String sql = "DELETE FROM flights WHERE flight_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, flightId);
            statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}