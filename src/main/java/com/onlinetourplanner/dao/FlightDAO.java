package com.onlinetourplanner.dao;

import com.onlinetourplanner.model.Flight;
import com.onlinetourplanner.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

public class FlightDAO {

    public List<Flight> searchFlights(String source, String destination, LocalDate date) {
        List<Flight> flights = new ArrayList<>();

        String sql = """
                SELECT *
                FROM flights
                WHERE LOWER(TRIM(source)) = LOWER(TRIM(?))
                AND LOWER(TRIM(destination)) = LOWER(TRIM(?))
                AND departure_time >= ?
                AND departure_time < ?
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, source);
            statement.setString(2, destination);
            statement.setTimestamp(3, java.sql.Timestamp.valueOf(date.atStartOfDay()));
            statement.setTimestamp(4, java.sql.Timestamp.valueOf(date.plusDays(1).atStartOfDay()));

            ResultSet resultSet = statement.executeQuery();

            int count = 0;

            while (resultSet.next()) {
                count++;

                Flight flight = new Flight(
                        resultSet.getInt("flight_id"),
                        resultSet.getString("airline"),
                        resultSet.getString("flight_number"),
                        resultSet.getString("source"),
                        resultSet.getString("destination"),
                        resultSet.getTimestamp("departure_time").toLocalDateTime(),
                        resultSet.getTimestamp("arrival_time").toLocalDateTime(),
                        resultSet.getBigDecimal("price"),
                        resultSet.getInt("available_seats")
                );

                flights.add(flight);
            }

            System.out.println("Flights found: " + count);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flights;
    }
    public boolean addFlight(Flight flight) {

        String sql = "INSERT INTO flights " +
                "(airline, flight_number, source, destination, departure_time, arrival_time, price, available_seats) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

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

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteFlight(int flightId) {

        String sql = "DELETE FROM flights WHERE flight_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, flightId);

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateFlight(Flight flight) {

        String sql = "UPDATE flights SET airline = ?, flight_number = ?, " +
                "source = ?, destination = ?, departure_time = ?, arrival_time = ?, " +
                "price = ?, available_seats = ? WHERE flight_id = ?";

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

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}