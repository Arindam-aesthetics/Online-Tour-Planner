package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.BookingDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@WebServlet("/HotelBookingServlet")
public class HotelBookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int hotelId = Integer.parseInt(request.getParameter("hotelId"));
        double pricePerNight = Double.parseDouble(request.getParameter("pricePerNight"));

        LocalDate checkin = LocalDate.parse(request.getParameter("checkin"));
        LocalDate checkout = LocalDate.parse(request.getParameter("checkout"));

        int rooms = Integer.parseInt(request.getParameter("rooms"));

        long numberOfNights = ChronoUnit.DAYS.between(checkin, checkout);

        if (numberOfNights <= 0) {
            response.sendRedirect("hotelBooking.jsp?error=invalidDates");
            return;
        }

        double totalAmount = pricePerNight * numberOfNights * rooms;

        com.onlinetourplanner.model.User user =
                (com.onlinetourplanner.model.User) session.getAttribute("user");

        int userId = user.getUserId();

        BookingDAO bookingDAO = new BookingDAO();

        boolean success = bookingDAO.createBooking(
                userId,
                "hotel",
                hotelId,
                checkin,
                rooms,
                totalAmount
        );

        if (success) {
            response.sendRedirect("MyBookingsServlet");
        } else {
            response.sendRedirect("hotelBooking.jsp?error=bookingFailed");
        }
    }
}