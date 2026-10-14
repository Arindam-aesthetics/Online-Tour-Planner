package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.BookingDAO;
import com.onlinetourplanner.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

@WebServlet("/PackageBookingServlet")
public class PackageBookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int packageId = Integer.parseInt(request.getParameter("packageId"));
            LocalDate travelDate = LocalDate.parse(request.getParameter("travelDate"));
            int numberOfPeople = Integer.parseInt(request.getParameter("numberOfPeople"));

            int userId = 1;

            String sql = "SELECT price, available_slots FROM packages WHERE package_id = ?";

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(sql)) {

                statement.setInt(1, packageId);

                try (ResultSet resultSet = statement.executeQuery()) {

                    if (!resultSet.next()) {
                        response.sendRedirect("PackageServlet");
                        return;
                    }

                    BigDecimal price = resultSet.getBigDecimal("price");
                    int availableSlots = resultSet.getInt("available_slots");

                    if (numberOfPeople <= 0 || numberOfPeople > availableSlots) {
                        response.sendRedirect("PackageServlet");
                        return;
                    }

                    BigDecimal totalAmount =
                            price.multiply(BigDecimal.valueOf(numberOfPeople));

                    BookingDAO bookingDAO = new BookingDAO();

                    boolean success = bookingDAO.createBooking(
                            userId,
                            "package",
                            packageId,
                            travelDate,
                            numberOfPeople,
                            totalAmount.doubleValue()
                    );

                    if (success) {
                        response.sendRedirect("MyBookingsServlet");
                    } else {
                        response.sendRedirect("PackageServlet");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("PackageServlet");
        }
    }
}