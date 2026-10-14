package com.onlinetourplanner.servlet;

import com.onlinetourplanner.dao.BusDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/DeleteBusServlet")
public class DeleteBusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        try {
            int busId = Integer.parseInt(request.getParameter("busId"));
            boolean deleted = new BusDAO().deleteBus(busId);

            if (!deleted) {
                response.sendRedirect("AdminBusServlet?error=delete");
                return;
            }

            response.sendRedirect("AdminBusServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminBusServlet?error=delete");
        }
    }
}