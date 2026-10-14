package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.HotelDAO;
import com.onlinetourplanner.model.Hotel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminHotelServlet")
public class AdminHotelServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HotelDAO hotelDAO = new HotelDAO();
        List<Hotel> hotels = hotelDAO.getAllHotels();

        request.setAttribute("hotels", hotels);

        request.getRequestDispatcher("adminHotels.jsp")
               .forward(request, response);
    }
}