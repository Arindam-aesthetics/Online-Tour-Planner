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

@WebServlet("/AdminBusServlet")
public class AdminBusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BusDAO busDAO = new BusDAO();
        List<Bus> buses = busDAO.getAllBuses();

        request.setAttribute("buses", buses);

        request.getRequestDispatcher("adminBuses.jsp")
               .forward(request, response);
    }
}