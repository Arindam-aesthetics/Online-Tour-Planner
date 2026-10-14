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

@WebServlet("/EditPackageServlet")
public class EditPackageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        try {
            int packageId = Integer.parseInt(request.getParameter("packageId"));

            TourPackage tourPackage = new TourPackageDAO().getPackageById(packageId);

            if (tourPackage == null) {
                response.sendRedirect("AdminPackageServlet");
                return;
            }

            request.setAttribute("tourPackage", tourPackage);
            request.getRequestDispatcher("editPackage.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminPackageServlet");
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

        int packageId;

        try {
            packageId = Integer.parseInt(request.getParameter("packageId"));

            String name = request.getParameter("name").trim();
            String destination = request.getParameter("destination").trim();
            String description = request.getParameter("description").trim();
            int duration = Integer.parseInt(request.getParameter("duration"));
            BigDecimal price = new BigDecimal(request.getParameter("price"));
            int availableSlots = Integer.parseInt(request.getParameter("availableSlots"));

            if (name.isEmpty() || destination.isEmpty()
                    || duration <= 0 || price.signum() <= 0
                    || availableSlots < 0) {
                response.sendRedirect("EditPackageServlet?packageId="
                        + packageId + "&error=1");
                return;
            }

            TourPackage tourPackage = new TourPackage(
                    packageId, name, destination, description,
                    duration, price, availableSlots
            );

            boolean updated = new TourPackageDAO().updatePackage(tourPackage);

            if (updated) {
                response.sendRedirect("AdminPackageServlet");
            } else {
                response.sendRedirect("EditPackageServlet?packageId="
                        + packageId + "&error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminPackageServlet");
        }
    }
}