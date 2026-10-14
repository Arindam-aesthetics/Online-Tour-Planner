
package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.HotelDAO;
import com.onlinetourplanner.model.Hotel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/AddHotelServlet")
public class AddHotelServlet extends HttpServlet {

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

            hotel.setName(request.getParameter("name"));
            hotel.setLocation(request.getParameter("location"));
            hotel.setDescription(request.getParameter("description"));
            hotel.setPricePerNight(
                new BigDecimal(request.getParameter("pricePerNight"))
            );
            hotel.setAvailableRooms(
                Integer.parseInt(request.getParameter("availableRooms"))
            );

            boolean added = new HotelDAO().addHotel(hotel);

            if (added) {
                response.sendRedirect("AdminHotelServlet");
            } else {
                response.sendRedirect("addHotel.jsp?error=1");
            }

        } catch (NumberFormatException | NullPointerException e) {
            response.sendRedirect("addHotel.jsp?error=1");
        }
    }
}
