<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.onlinetourplanner.model.TourPackage" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    TourPackage tourPackage = (TourPackage) request.getAttribute("tourPackage");

    if (tourPackage == null) {
        response.sendRedirect("AdminPackageServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Tour Package</title>
    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f3f6fb;
            color: #1e293b;
        }

        .container {
            max-width: 650px;
            margin: 40px auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px #00000012;
        }

        h2 { margin-top: 0; }

        label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            font-weight: bold;
        }

        input, textarea {
            width: 100%;
            padding: 11px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            margin-bottom: 16px;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        button, .back {
            display: inline-block;
            padding: 11px 18px;
            border: none;
            border-radius: 6px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            cursor: pointer;
            font-size: 14px;
        }

        .back {
            background: #64748b;
            margin-left: 8px;
        }

        .error {
            color: #dc2626;
            margin-bottom: 15px;
        }

        @media (max-width: 550px) {
            .container { margin: 15px; padding: 20px; }
            .grid { grid-template-columns: 1fr; gap: 0; }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Package #<%= tourPackage.getPackageId() %></h2>

        <% if ("1".equals(request.getParameter("error"))) { %>
            <p class="error">Update failed. Please check the entered details.</p>
        <% } %>

        <form action="EditPackageServlet" method="post">
            <input type="hidden" name="packageId"
                   value="<%= tourPackage.getPackageId() %>">

            <label>Package Name</label>
            <input type="text" name="name"
                   value="<%= tourPackage.getName() %>" required>

            <label>Destination</label>
            <input type="text" name="destination"
                   value="<%= tourPackage.getDestination() %>" required>

            <label>Description</label>
            <textarea name="description" required><%= tourPackage.getDescription() %></textarea>

            <div class="grid">
                <div>
                    <label>Duration (Days)</label>
                    <input type="number" name="duration" min="1"
                           value="<%= tourPackage.getDuration() %>" required>
                </div>

                <div>
                    <label>Price (₹)</label>
                    <input type="number" name="price" min="0.01" step="0.01"
                           value="<%= tourPackage.getPrice() %>" required>
                </div>
            </div>

            <label>Available Slots</label>
            <input type="number" name="availableSlots" min="0"
                   value="<%= tourPackage.getAvailableSlots() %>" required>

            <button type="submit">Update Package</button>
            <a href="AdminPackageServlet" class="back">Cancel</a>
        </form>
    </div>
</body>
</html>