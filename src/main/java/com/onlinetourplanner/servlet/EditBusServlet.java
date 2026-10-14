package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.BusDAO;
import com.onlinetourplanner.model.Bus;
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
import java.time.LocalDateTime;

@WebServlet("/EditBusServlet")
public class EditBusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        try {
            int busId = Integer.parseInt(request.getParameter("busId"));

            String sql = "SELECT * FROM buses WHERE bus_id = ?";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, busId);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        Bus bus = new Bus();

                        bus.setBusId(rs.getInt("bus_id"));
                        bus.setOperator(rs.getString("operator"));
                        bus.setBusNumber(rs.getString("bus_number"));
                        bus.setSource(rs.getString("source"));
                        bus.setDestination(rs.getString("destination"));
                        bus.setDepartureTime(
                            rs.getTimestamp("departure_time").toLocalDateTime()
                        );
                        bus.setArrivalTime(
                            rs.getTimestamp("arrival_time").toLocalDateTime()
                        );
                        bus.setPrice(rs.getBigDecimal("price"));
                        bus.setAvailableSeats(rs.getInt("available_seats"));

                        request.setAttribute("bus", bus);
                        request.getRequestDispatcher("editBus.jsp").forward(request, response);
                    } else {
                        response.sendRedirect("AdminBusServlet");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminBusServlet");
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
            Bus bus = new Bus();

            bus.setBusId(Integer.parseInt(request.getParameter("busId")));
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

            if (bus.getPrice().signum() <= 0 || bus.getAvailableSeats() < 0
                    || !bus.getArrivalTime().isAfter(bus.getDepartureTime())) {
                response.sendRedirect("EditBusServlet?busId="
                    + bus.getBusId() + "&error=1");
                return;
            }

            boolean updated = new BusDAO().updateBus(bus);

            if (updated) {
                response.sendRedirect("AdminBusServlet");
            } else {
                response.sendRedirect("EditBusServlet?busId="
                    + bus.getBusId() + "&error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminBusServlet");
        }
    }
}