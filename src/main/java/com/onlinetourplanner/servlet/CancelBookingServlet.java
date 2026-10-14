package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.BookingDAO;
import com.onlinetourplanner.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {

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
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));

            if (bookingId <= 0) {
                response.sendRedirect("MyBookingsServlet?error=cancel");
                return;
            }

            boolean cancelled = bookingDAO.cancelBooking(bookingId, userId);

            if (cancelled) {
                response.sendRedirect("MyBookingsServlet?cancelled=1");
            } else {
                response.sendRedirect("MyBookingsServlet?error=cancel");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("MyBookingsServlet?error=cancel");
        }
    }
}