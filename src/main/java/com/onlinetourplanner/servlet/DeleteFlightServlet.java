package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.AdminFlightDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteFlightServlet")
public class DeleteFlightServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int flightId = Integer.parseInt(request.getParameter("flightId"));

        AdminFlightDAO flightDAO = new AdminFlightDAO();
        flightDAO.deleteFlight(flightId);

        response.sendRedirect("AdminFlightServlet");
    }
}