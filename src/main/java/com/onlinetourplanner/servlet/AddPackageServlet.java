package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.TourPackageDAO;
import com.onlinetourplanner.model.TourPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/AddPackageServlet")
public class AddPackageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        try {
            TourPackage tourPackage = new TourPackage();

            tourPackage.setName(request.getParameter("name").trim());
            tourPackage.setDestination(request.getParameter("destination").trim());
            tourPackage.setDescription(request.getParameter("description").trim());
            tourPackage.setDuration(Integer.parseInt(request.getParameter("duration")));
            tourPackage.setPrice(new BigDecimal(request.getParameter("price")));
            tourPackage.setAvailableSlots(
                Integer.parseInt(request.getParameter("availableSlots"))
            );

            if (tourPackage.getName().isEmpty()
                    || tourPackage.getDestination().isEmpty()
                    || tourPackage.getDuration() <= 0
                    || tourPackage.getPrice().signum() <= 0
                    || tourPackage.getAvailableSlots() < 0) {
                response.sendRedirect("addPackage.jsp?error=1");
                return;
            }

            boolean added = new TourPackageDAO().addPackage(tourPackage);

            if (added) {
                response.sendRedirect("AdminPackageServlet");
            } else {
                response.sendRedirect("addPackage.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addPackage.jsp?error=1");
        }
    }
}