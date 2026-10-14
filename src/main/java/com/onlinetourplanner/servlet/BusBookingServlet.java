package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.BookingDAO;
import com.onlinetourplanner.model.User;
import com.onlinetourplanner.util.DBConnection;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

@WebServlet("/BusBookingServlet")
public class BusBookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int busId = Integer.parseInt(request.getParameter("busId"));
            double price = Double.parseDouble(request.getParameter("price"));
            LocalDate travelDate = LocalDate.parse(request.getParameter("travelDate"));
            int numberOfPeople = Integer.parseInt(request.getParameter("numberOfPeople"));

            User user = (User) session.getAttribute("user");
            int userId = user.getUserId();

            String sql = "SELECT available_seats FROM buses WHERE bus_id = ?";

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(sql)) {

                statement.setInt(1, busId);

                try (ResultSet resultSet = statement.executeQuery()) {

                    if (!resultSet.next()
                            || resultSet.getInt("available_seats") < numberOfPeople) {
                        response.sendRedirect("buses.jsp?error=notEnoughSeats");
                        return;
                    }
                }
            }

            double totalAmount = price * numberOfPeople;

            boolean success = new BookingDAO().createBooking(
                    userId,
                    "bus",
                    busId,
                    travelDate,
                    numberOfPeople,
                    totalAmount
            );

            if (success) {
                response.sendRedirect("MyBookingsServlet");
            } else {
                response.sendRedirect("buses.jsp?error=bookingFailed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("buses.jsp?error=bookingFailed");
        }
    }
}