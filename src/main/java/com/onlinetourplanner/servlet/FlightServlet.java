package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.FlightDAO;
import com.onlinetourplanner.model.Flight;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/FlightServlet")
public class FlightServlet extends HttpServlet {

    private final FlightDAO flightDAO = new FlightDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String dateString = request.getParameter("date");
        
        
        System.out.println("Source: " + source);
        System.out.println("Destination: " + destination);
        System.out.println("Date: " + dateString);
        

        if (source == null || destination == null || dateString == null
                || source.isBlank() || destination.isBlank() || dateString.isBlank()) {

            response.sendRedirect("flights.jsp");
            return;
        }

        LocalDate date = LocalDate.parse(dateString);

        List<Flight> flights = flightDAO.searchFlights(source, destination, date);

        request.setAttribute("flights", flights);

        request.getRequestDispatcher("flights.jsp").forward(request, response);
    }
}