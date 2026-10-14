package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.BusDAO;
import com.onlinetourplanner.model.Bus;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/BusServlet")
public class BusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String source = request.getParameter("source");
        String destination = request.getParameter("destination");

        BusDAO busDAO = new BusDAO();
        List<Bus> buses;

        if (source == null || source.trim().isEmpty()
                || destination == null || destination.trim().isEmpty()) {

            buses = busDAO.getAllBuses();

        } else {
            buses = busDAO.searchBuses(source.trim(), destination.trim());
        }

        request.setAttribute("buses", buses);
        request.getRequestDispatcher("buses.jsp").forward(request, response);
    }
}