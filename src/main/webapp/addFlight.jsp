<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <title>Add Flight</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6fa;
            margin: 0;
            color: #172033;
        }

        header {
            background: white;
            padding: 25px 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
        }

        header h1 {
            color: #172554;
        }

        header a {
            color: #dc2626;
            text-decoration: none;
        }

        .container {
            width: 50%;
            margin: 40px auto;
        }

        h2 {
            color: #172554;
        }

        form {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.07);
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 11px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            font-size: 15px;
        }

        button {
            margin-top: 25px;
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            background: #172554;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #2563eb;
        }

        .back {
            display: inline-block;
            margin-bottom: 20px;
            color: #172554;
            text-decoration: none;
        }
    </style>
</head>

<body>

<header>
    <h1>Online Tour Planner</h1>
    <a href="LogoutServlet">Logout</a>
</header>

<div class="container">

    <h2>Add Flight</h2>

    <a class="back" href="AdminFlightServlet">← Back to Flights</a>

    <form action="AddFlightServlet" method="post">

        <label>Airline</label>
        <input type="text" name="airline" required>

        <label>Flight Number</label>
        <input type="text" name="flightNumber" required>

        <label>Source</label>
        <input type="text" name="source" required>

        <label>Destination</label>
        <input type="text" name="destination" required>

        <label>Departure Time</label>
        <input type="datetime-local" name="departureTime" required>

        <label>Arrival Time</label>
        <input type="datetime-local" name="arrivalTime" required>

        <label>Price</label>
        <input type="number" name="price" step="0.01" min="0" required>

        <label>Available Seats</label>
        <input type="number" name="availableSeats" min="0" required>

        <button type="submit">Add Flight</button>

    </form>

</div>

</body>
</html>