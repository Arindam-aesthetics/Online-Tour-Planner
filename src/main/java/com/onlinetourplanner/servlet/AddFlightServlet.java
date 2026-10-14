package com.onlinetourplanner.servlet;

import com.onlinetourplanner.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;

@WebServlet("/AddFlightServlet")
public class AddFlightServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String airline = request.getParameter("airline");
        String flightNumber = request.getParameter("flightNumber");
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");

        LocalDateTime departureTime =
                LocalDateTime.parse(request.getParameter("departureTime"));

        LocalDateTime arrivalTime =
                LocalDateTime.parse(request.getParameter("arrivalTime"));

        double price = Double.parseDouble(request.getParameter("price"));
        int availableSeats = Integer.parseInt(request.getParameter("availableSeats"));

        String sql = """
                INSERT INTO flights
                (airline, flight_number, source, destination,
                 departure_time, arrival_time, price, available_seats)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, airline);
            statement.setString(2, flightNumber);
            statement.setString(3, source);
            statement.setString(4, destination);
            statement.setObject(5, departureTime);
            statement.setObject(6, arrivalTime);
            statement.setDouble(7, price);
            statement.setInt(8, availableSeats);

            statement.executeUpdate();

            response.sendRedirect("AdminFlightServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addFlight.jsp");
        }
    }
}