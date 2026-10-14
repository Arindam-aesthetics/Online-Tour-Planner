<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.onlinetourplanner.model.Bus" %>

<%
    Bus bus = (Bus) request.getAttribute("bus");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bus Booking</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fb;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h2 {
            margin-bottom: 20px;
        }

        .details {
            line-height: 1.8;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            box-sizing: border-box;
        }

        button {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }
    </style>
</head>
<body>

<div class="container">

    <h2>Book Your Bus</h2>

    <div class="details">
        <strong>Operator:</strong> <%= bus.getOperator() %><br>
        <strong>Bus Number:</strong> <%= bus.getBusNumber() %><br>
        <strong>Route:</strong>
        <%= bus.getSource() %> &rarr; <%= bus.getDestination() %>
        <strong>Departure:</strong> <%= bus.getDepartureTime() %><br>
        <strong>Arrival:</strong> <%= bus.getArrivalTime() %><br>
        <strong>Price per Person:</strong> &#8377;<%= bus.getPrice() %><br>
        <strong>Available Seats:</strong> <%= bus.getAvailableSeats() %>
    </div>

    <form action="BusBookingServlet" method="post">

        <input type="hidden" name="busId" value="<%= bus.getBusId() %>">
        <input type="hidden" name="price" value="<%= bus.getPrice() %>">

        <label>Travel Date</label>
        <input type="date" name="travelDate" required>

        <label>Number of People</label>
        <input type="number" name="numberOfPeople"
               min="1" max="<%= bus.getAvailableSeats() %>" required>

        <button type="submit">Confirm Booking</button>

    </form>

</div>

</body>
</html>