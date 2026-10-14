package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.TourPackageDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/DeletePackageServlet")
public class DeletePackageServlet extends HttpServlet {

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

            boolean deleted = new TourPackageDAO().deletePackage(packageId);

            if (deleted) {
                response.sendRedirect("AdminPackageServlet");
            } else {
                response.sendRedirect("AdminPackageServlet?error=delete");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminPackageServlet?error=delete");
        }
    }
}