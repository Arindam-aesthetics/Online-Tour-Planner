<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Bus</title>
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
        <h2>Add New Bus</h2>

        <% if ("1".equals(request.getParameter("error"))) { %>
            <p class="error">Unable to add bus. Check the entered details.</p>
        <% } %>

        <form action="AddBusServlet" method="post">
            <div class="grid">
                <div>
                    <label>Bus Operator</label>
                    <input type="text" name="operator" required>
                </div>

                <div>
                    <label>Bus Number</label>
                    <input type="text" name="busNumber" required>
                </div>

                <div>
                    <label>Source</label>
                    <input type="text" name="source" required>
                </div>

                <div>
                    <label>Destination</label>
                    <input type="text" name="destination" required>
                </div>

                <div>
                    <label>Departure Time</label>
                    <input type="datetime-local" name="departureTime" required>
                </div>

                <div>
                    <label>Arrival Time</label>
                    <input type="datetime-local" name="arrivalTime" required>
                </div>

                <div>
                    <label>Price (₹)</label>
                    <input type="number" name="price" min="0.01" step="0.01" required>
                </div>

                <div>
                    <label>Available Seats</label>
                    <input type="number" name="availableSeats" min="0" required>
                </div>
            </div>

            <button type="submit">Add Bus</button>
            <a href="AdminBusServlet" class="back">Cancel</a>
        </form>
    </div>
</body>
</html>