package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.BookingDAO;
import com.onlinetourplanner.model.User;
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

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    private final BookingDAO bookingDAO = new BookingDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || !(session.getAttribute("user") instanceof User)) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            User user = (User) session.getAttribute("user");

            int userId = user.getUserId();
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int travellers = Integer.parseInt(request.getParameter("travellers"));
            String type = request.getParameter("type");
            LocalDate travelDate = LocalDate.parse(request.getParameter("bookingDate"));

            if (itemId <= 0 || travellers < 1 || travellers > 20
                    || type == null
                    || !type.matches("(?i)flight|hotel|bus|package")
                    || travelDate.isBefore(LocalDate.now())) {
                response.sendRedirect("error.jsp");
                return;
            }

            String table;
            String idColumn;
            String priceColumn;
            String availabilityColumn;

            switch (type.toLowerCase()) {
                case "flight" -> {
                    table = "flights";
                    idColumn = "flight_id";
                    priceColumn = "price";
                    availabilityColumn = "available_seats";
                }
                case "hotel" -> {
                    table = "hotels";
                    idColumn = "hotel_id";
                    priceColumn = "price_per_night";
                    availabilityColumn = "available_rooms";
                }
                case "bus" -> {
                    table = "buses";
                    idColumn = "bus_id";
                    priceColumn = "price";
                    availabilityColumn = "available_seats";
                }
                case "package" -> {
                    table = "packages";
                    idColumn = "package_id";
                    priceColumn = "price";
                    availabilityColumn = "available_slots";
                }
                default -> {
                    response.sendRedirect("error.jsp");
                    return;
                }
            }

            String sql = "SELECT " + priceColumn + ", " + availabilityColumn
                    + " FROM " + table + " WHERE " + idColumn + " = ?";

            BigDecimal price;
            int available;

            try (Connection connection = DBConnection.getConnection();
                 PreparedStatement statement = connection.prepareStatement(sql)) {

                statement.setInt(1, itemId);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (!resultSet.next()) {
                        response.sendRedirect("error.jsp");
                        return;
                    }

                    price = resultSet.getBigDecimal(priceColumn);
                    available = resultSet.getInt(availabilityColumn);
                }
            }

            if (price == null || available < travellers) {
                response.sendRedirect("error.jsp");
                return;
            }

            BigDecimal totalAmount = price.multiply(BigDecimal.valueOf(travellers));

            boolean success = bookingDAO.createBooking(
                    userId,
                    type,
                    itemId,
                    travelDate,
                    travellers,
                    totalAmount.doubleValue()
            );

            if (success) {
                response.sendRedirect("MyBookingsServlet");
            } else {
                response.sendRedirect("error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}