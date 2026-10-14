
package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.HotelDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/DeleteHotelServlet")
public class DeleteHotelServlet extends HttpServlet {

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

            boolean deleted = new HotelDAO().deleteHotel(hotelId);

            if (deleted) {
                response.sendRedirect("AdminHotelServlet");
            } else {
                response.sendRedirect("AdminHotelServlet?error=delete");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("AdminHotelServlet?error=delete");
        }
    }
}
