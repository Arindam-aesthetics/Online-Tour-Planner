package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.BookingDAO;
import com.onlinetourplanner.model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/MyBookingsServlet")
public class MyBookingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = ((com.onlinetourplanner.model.User) session.getAttribute("user")).getUserId();

        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> bookings = bookingDAO.getBookingsByUserId(userId);

        request.setAttribute("bookings", bookings);

        request.getRequestDispatcher("myBookings.jsp").forward(request, response);
    }
}