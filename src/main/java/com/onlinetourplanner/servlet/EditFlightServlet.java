
package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.AdminFlightDAO;
import com.onlinetourplanner.model.Flight;
import com.onlinetourplanner.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

@WebServlet("/EditFlightServlet")
public class EditFlightServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int flightId = Integer.parseInt(request.getParameter("flightId"));

            String sql = "SELECT * FROM flights WHERE flight_id = ?";

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(sql)) {

                statement.setInt(1, flightId);

                try (ResultSet resultSet = statement.executeQuery()) {
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
                        request.getRequestDispatcher("editFlight.jsp")
                               .forward(request, response);
                    } else {
                        response.sendRedirect("AdminFlightServlet");
                    }
                }
            }
        } catch (Exception e) {
            throw new ServletException("Unable to load flight details.", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Flight flight = new Flight();

            flight.setFlightId(Integer.parseInt(request.getParameter("flightId")));
            flight.setAirline(request.getParameter("airline"));
            flight.setFlightNumber(request.getParameter("flightNumber"));
            flight.setSource(request.getParameter("source"));
            flight.setDestination(request.getParameter("destination"));
            flight.setDepartureTime(
                java.time.LocalDateTime.parse(request.getParameter("departureTime"))
            );
            flight.setArrivalTime(
                java.time.LocalDateTime.parse(request.getParameter("arrivalTime"))
            );
            flight.setPrice(new BigDecimal(request.getParameter("price")));
            flight.setAvailableSeats(
                Integer.parseInt(request.getParameter("availableSeats"))
            );

            new AdminFlightDAO().updateFlight(flight);

            response.sendRedirect("AdminFlightServlet");

        } catch (Exception e) {
            throw new ServletException("Unable to update flight.", e);
        }
    }
}
