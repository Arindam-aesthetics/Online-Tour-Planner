package com.onlinetourplanner.servlet;

import com.onlinetourplanner.model.Bus;
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

@WebServlet("/BusBookingDetailsServlet")
public class BusBookingDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int busId = Integer.parseInt(request.getParameter("busId"));

        String sql = "SELECT * FROM buses WHERE bus_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, busId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    Bus bus = new Bus(
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

                    request.setAttribute("bus", bus);

                    request.getRequestDispatcher("busBooking.jsp")
                           .forward(request, response);

                } else {
                    response.sendRedirect("buses.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("buses.jsp");
        }
    }
}