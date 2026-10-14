<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.onlinetourplanner.model.Bus" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    Bus bus = (Bus) request.getAttribute("bus");

    if (bus == null) {
        response.sendRedirect("AdminBusServlet");
        return;
    }

    String departure = bus.getDepartureTime().toString();
    String arrival = bus.getArrivalTime().toString();

    if (departure.length() >= 16) departure = departure.substring(0, 16);
    if (arrival.length() >= 16) arrival = arrival.substring(0, 16);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Bus</title>
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
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-size: 14px;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 11px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            margin-bottom: 16px;
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
        .back { background: #64748b; margin-left: 8px; }
        .error { color: #dc2626; margin-bottom: 15px; }
        @media (max-width: 550px) {
            .container { margin: 15px; padding: 20px; }
            .grid { grid-template-columns: 1fr; gap: 0; }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Bus #<%= bus.getBusId() %></h2>

        <% if ("1".equals(request.getParameter("error"))) { %>
            <p class="error">Update failed. Check the price, seats and journey times.</p>
        <% } %>

        <form action="EditBusServlet" method="post">
            <input type="hidden" name="busId" value="<%= bus.getBusId() %>">

            <div class="grid">
                <div>
                    <label>Bus Operator</label>
                    <input type="text" name="operator"
                           value="<%= bus.getOperator() %>" required>
                </div>

                <div>
                    <label>Bus Number</label>
                    <input type="text" name="busNumber"
                           value="<%= bus.getBusNumber() %>" required>
                </div>

                <div>
                    <label>Source</label>
                    <input type="text" name="source"
                           value="<%= bus.getSource() %>" required>
                </div>

                <div>
                    <label>Destination</label>
                    <input type="text" name="destination"
                           value="<%= bus.getDestination() %>" required>
                </div>

                <div>
                    <label>Departure Time</label>
                    <input type="datetime-local" name="departureTime"
                           value="<%= departure %>" required>
                </div>

                <div>
                    <label>Arrival Time</label>
                    <input type="datetime-local" name="arrivalTime"
                           value="<%= arrival %>" required>
                </div>

                <div>
                    <label>Price (₹)</label>
                    <input type="number" name="price" min="0.01" step="0.01"
                           value="<%= bus.getPrice() %>" required>
                </div>

                <div>
                    <label>Available Seats</label>
                    <input type="number" name="availableSeats" min="0"
                           value="<%= bus.getAvailableSeats() %>" required>
                </div>
            </div>

            <button type="submit">Update Bus</button>
            <a href="AdminBusServlet" class="back">Cancel</a>
        </form>
    </div>
</body>
</html>