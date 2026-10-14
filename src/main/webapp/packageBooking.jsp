<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.onlinetourplanner.model.TourPackage" %>

<%
    TourPackage tourPackage =
            (TourPackage) request.getAttribute("tourPackage");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Package Booking</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6fa;
            margin: 0;
            padding: 40px;
        }

        .container {
            max-width: 650px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        h1 {
            color: #18245c;
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
            background: #18245c;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>

<body>

<div class="container">

    <h1><%= tourPackage.getName() %></h1>

    <div class="details">
        <p><strong>Destination:</strong>
            <%= tourPackage.getDestination() %>
        </p>

        <p><strong>Description:</strong>
            <%= tourPackage.getDescription() %>
        </p>

        <p><strong>Duration:</strong>
            <%= tourPackage.getDuration() %> Days
        </p>

        <p><strong>Price:</strong>
            &#8377;<%= tourPackage.getPrice() %> per person
        </p>

        <p><strong>Available Slots:</strong>
            <%= tourPackage.getAvailableSlots() %>
        </p>
    </div>

    <form action="PackageBookingServlet" method="post">

        <input type="hidden"
               name="packageId"
               value="<%= tourPackage.getPackageId() %>">

        <input type="hidden"
               name="price"
               value="<%= tourPackage.getPrice() %>">

        <label for="travelDate">Travel Date</label>
        <input type="date" id="travelDate" name="travelDate" required>

        <label for="numberOfPeople">Number of People</label>
        <input type="number"
               id="numberOfPeople"
               name="numberOfPeople"
               min="1"
               max="<%= tourPackage.getAvailableSlots() %>"
               required>

        <button type="submit">Confirm Booking</button>

    </form>

</div>

</body>
</html>