package com.onlinetourplanner.servlet;

import com.onlinetourplanner.model.Flight;
import com.onlinetourplanner.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/BookingDetailsServlet")
public class BookingDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String flightIdString = request.getParameter("flightId");

        if (flightIdString == null || flightIdString.isBlank()) {
            response.sendRedirect("flights.jsp");
            return;
        }

        int flightId = Integer.parseInt(flightIdString);

        String sql = "SELECT * FROM flights WHERE flight_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, flightId);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
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

                request.setAttribute("flight", flight);
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            } else {
                response.sendRedirect("flights.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}