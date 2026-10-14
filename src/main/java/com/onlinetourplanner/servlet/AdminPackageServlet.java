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

@WebServlet("/AdminPackageServlet")
public class AdminPackageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TourPackageDAO packageDAO = new TourPackageDAO();
        List<TourPackage> packages = packageDAO.getAllPackages();

        request.setAttribute("packages", packages);

        request.getRequestDispatcher("adminPackages.jsp")
               .forward(request, response);
    }
}