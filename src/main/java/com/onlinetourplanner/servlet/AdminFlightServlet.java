package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.AdminFlightDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/AdminFlightServlet")
public class AdminFlightServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminFlightDAO flightDAO = new AdminFlightDAO();

        request.setAttribute("flights", flightDAO.getAllFlights());

        request.getRequestDispatcher("adminFlights.jsp")
               .forward(request, response);
    }
}