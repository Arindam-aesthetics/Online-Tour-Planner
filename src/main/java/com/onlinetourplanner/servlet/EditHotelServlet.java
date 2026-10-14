
package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.HotelDAO;
import com.onlinetourplanner.model.Hotel;
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
import java.sql.SQLException;

@WebServlet("/EditHotelServlet")
public class EditHotelServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        try {
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
                        request.getRequestDispatcher("editHotel.jsp")
                               .forward(request, response);
                    } else {
                        response.sendRedirect("AdminHotelServlet");
                    }
                }
            }

        } catch (NumberFormatException | SQLException e) {
            throw new ServletException("Unable to load hotel details.", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        try {
            Hotel hotel = new Hotel();

            hotel.setHotelId(Integer.parseInt(request.getParameter("hotelId")));
            hotel.setName(request.getParameter("name"));
            hotel.setLocation(request.getParameter("location"));
            hotel.setDescription(request.getParameter("description"));
            hotel.setPricePerNight(
                new BigDecimal(request.getParameter("pricePerNight"))
            );
            hotel.setAvailableRooms(
                Integer.parseInt(request.getParameter("availableRooms"))
            );

            if (hotel.getPricePerNight().signum() <= 0
                    || hotel.getAvailableRooms() < 0) {
                response.sendRedirect(
                    "EditHotelServlet?hotelId=" + hotel.getHotelId() + "&error=1"
                );
                return;
            }

            boolean updated = new HotelDAO().updateHotel(hotel);

            if (updated) {
                response.sendRedirect("AdminHotelServlet");
            } else {
                response.sendRedirect(
                    "EditHotelServlet?hotelId=" + hotel.getHotelId() + "&error=1"
                );
            }

        } catch (NumberFormatException | NullPointerException e) {
            response.sendRedirect("AdminHotelServlet");
        }
    }
}
