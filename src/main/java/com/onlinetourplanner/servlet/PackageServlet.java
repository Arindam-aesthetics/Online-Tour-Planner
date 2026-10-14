package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.TourPackageDAO;
import com.onlinetourplanner.model.TourPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/PackageServlet")
public class PackageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String destination = request.getParameter("destination");

        TourPackageDAO packageDAO = new TourPackageDAO();
        List<TourPackage> packages;

        if (destination == null || destination.trim().isEmpty()) {
            packages = packageDAO.getAllPackages();
        } else {
            packages = packageDAO.searchPackages(destination.trim());
        }

        request.setAttribute("packages", packages);

        request.getRequestDispatcher("packages.jsp")
               .forward(request, response);
    }
}