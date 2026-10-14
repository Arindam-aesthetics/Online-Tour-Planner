package com.onlinetourplanner.servlet;

import com.onlinetourplanner.model.Hotel;
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

@WebServlet("/HotelBookingDetailsServlet")
public class HotelBookingDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int hotelId = Integer.parseInt(request.getParameter("hotelId"));

        String sql = "SELECT * FROM hotels WHERE hotel_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, hotelId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {

                    Hotel hotel = new Hotel(
                            resultSet.getInt("hotel_id"),
                            resultSet.getString("name"),
                            resultSet.getString("location"),
                            resultSet.getString("description"),
                            resultSet.getBigDecimal("price_per_night"),
                            resultSet.getInt("available_rooms")
                    );

                    request.setAttribute("hotel", hotel);
                    request.getRequestDispatcher("hotelBooking.jsp")
                           .forward(request, response);

                } else {
                    response.sendRedirect("hotels.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("hotels.jsp");
        }
    }
}