
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.onlinetourplanner.model.Flight" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    Flight flight = (Flight) request.getAttribute("flight");

    if (flight == null) {
        response.sendRedirect("AdminFlightServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Flight | Online Tour Planner</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6fa;
            color: #172554;
        }

        header {
            background: white;
            padding: 30px 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.06);
        }

        header h1 {
            margin: 0;
            font-size: 30px;
        }

        header a {
            color: #dc2626;
            text-decoration: none;
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 45px auto;
            padding: 32px;
            background: white;
            border-radius: 14px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.06);
        }

        h2 {
            margin: 0 0 28px;
            font-size: 28px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .field {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        label {
            font-size: 14px;
            font-weight: bold;
            color: #334155;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 15px;
            color: #172554;
        }

        input:focus {
            outline: none;
            border-color: #172554;
            box-shadow: 0 0 0 3px rgba(23, 37, 84, 0.1);
        }

        .buttons {
            display: flex;
            gap: 12px;
            margin-top: 28px;
        }

        button, .cancel {
            border: none;
            border-radius: 7px;
            padding: 13px 20px;
            font-size: 15px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
        }

        button {
            background: #172554;
            color: white;
        }

        .cancel {
            background: #e2e8f0;
            color: #172554;
        }

        @media (max-width: 600px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .container {
                padding: 22px;
            }

            header h1 {
                font-size: 22px;
            }
        }
    </style>
</head>

<body>

<header>
    <h1>Online Tour Planner</h1>
    <a href="LogoutServlet">Logout</a>
</header>

<div class="container">
    <h2>Edit Flight #<%= flight.getFlightId() %></h2>

    <form action="EditFlightServlet" method="post">
        <input type="hidden" name="flightId"
               value="<%= flight.getFlightId() %>">

        <div class="form-grid">
            <div class="field">
                <label>Airline</label>
                <input type="text" name="airline"
                       value="<%= flight.getAirline() %>" required>
            </div>

            <div class="field">
                <label>Flight Number</label>
                <input type="text" name="flightNumber"
                       value="<%= flight.getFlightNumber() %>" required>
            </div>

            <div class="field">
                <label>Source</label>
                <input type="text" name="source"
                       value="<%= flight.getSource() %>" required>
            </div>

            <div class="field">
                <label>Destination</label>
                <input type="text" name="destination"
                       value="<%= flight.getDestination() %>" required>
            </div>

            <div class="field">
                <label>Departure Time</label>
                <input type="datetime-local" name="departureTime"
                       value="<%= flight.getDepartureTime().toString().substring(0, 16) %>"
                       required>
            </div>

            <div class="field">
                <label>Arrival Time</label>
                <input type="datetime-local" name="arrivalTime"
                       value="<%= flight.getArrivalTime().toString().substring(0, 16) %>"
                       required>
            </div>

            <div class="field">
                <label>Price (₹)</label>
                <input type="number" name="price" min="0.01" step="0.01"
                       value="<%= flight.getPrice() %>" required>
            </div>

            <div class="field">
                <label>Available Seats</label>
                <input type="number" name="availableSeats" min="0"
                       value="<%= flight.getAvailableSeats() %>" required>
            </div>
        </div>

        <div class="buttons">
            <button type="submit">Save Changes</button>
            <a class="cancel" href="AdminFlightServlet">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>
