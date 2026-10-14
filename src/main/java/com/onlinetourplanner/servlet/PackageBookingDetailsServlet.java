package com.onlinetourplanner.servlet;

import com.onlinetourplanner.model.TourPackage;
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

@WebServlet("/PackageBookingDetailsServlet")
public class PackageBookingDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int packageId = Integer.parseInt(request.getParameter("packageId"));

        String sql = "SELECT * FROM packages WHERE package_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, packageId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {
                    TourPackage tourPackage = new TourPackage(
                            resultSet.getInt("package_id"),
                            resultSet.getString("name"),
                            resultSet.getString("destination"),
                            resultSet.getString("description"),
                            resultSet.getInt("duration"),
                            resultSet.getBigDecimal("price"),
                            resultSet.getInt("available_slots")
                    );

                    request.setAttribute("tourPackage", tourPackage);
                    request.getRequestDispatcher("packageBooking.jsp")
                           .forward(request, response);
                } else {
                    response.sendRedirect("PackageServlet");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("PackageServlet");
        }
    }
}