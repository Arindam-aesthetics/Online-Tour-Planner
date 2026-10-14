package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.BookingDAO;
import com.onlinetourplanner.model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminBookingServlet")
public class AdminBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> bookings = bookingDAO.getAllBookings();

        request.setAttribute("bookings", bookings);

        request.getRequestDispatcher("adminBookings.jsp")
               .forward(request, response);
    }
}