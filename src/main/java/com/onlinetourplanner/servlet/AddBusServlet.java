package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.BusDAO;
import com.onlinetourplanner.model.Bus;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@WebServlet("/AddBusServlet")
public class AddBusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        try {
            Bus bus = new Bus();

            bus.setOperator(request.getParameter("operator"));
            bus.setBusNumber(request.getParameter("busNumber"));
            bus.setSource(request.getParameter("source"));
            bus.setDestination(request.getParameter("destination"));
            bus.setDepartureTime(
                LocalDateTime.parse(request.getParameter("departureTime"))
            );
            bus.setArrivalTime(
                LocalDateTime.parse(request.getParameter("arrivalTime"))
            );
            bus.setPrice(new BigDecimal(request.getParameter("price")));
            bus.setAvailableSeats(
                Integer.parseInt(request.getParameter("availableSeats"))
            );

            if (bus.getPrice().signum() <= 0 || bus.getAvailableSeats() < 0) {
                response.sendRedirect("addBus.jsp?error=1");
                return;
            }

            boolean added = new BusDAO().addBus(bus);

            if (added) {
                response.sendRedirect("AdminBusServlet");
            } else {
                response.sendRedirect("addBus.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addBus.jsp?error=1");
        }
    }
}