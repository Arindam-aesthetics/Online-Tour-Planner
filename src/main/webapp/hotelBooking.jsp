<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.onlinetourplanner.model.Hotel" %>

<%
    Hotel hotel = (Hotel) request.getAttribute("hotel");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Booking - Online Tour Planner</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f5f7fb;
            color: #172033;
            min-height: 100vh;
        }

        header {
            height: 75px;
            padding: 0 8%;
            background: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.08);
        }

        header h1 {
            color: #172554;
            font-size: 24px;
        }

        nav a {
            color: #333;
            text-decoration: none;
            margin-left: 25px;
            font-weight: 500;
        }

        nav a:hover {
            color: #2563eb;
        }

        main {
            width: 84%;
            max-width: 850px;
            margin: 45px auto;
        }

        .booking-container {
            background: white;
            padding: 35px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.07);
        }

        h2 {
            color: #172554;
            margin-bottom: 25px;
        }

        .hotel-summary {
            background: #f8fafc;
            padding: 22px;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .hotel-summary h3 {
            color: #172554;
            font-size: 24px;
            margin-bottom: 12px;
        }

        .hotel-summary p {
            margin-bottom: 8px;
            color: #555;
        }

        .price {
            color: #9333ea !important;
            font-size: 20px;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 15px;
        }

        input:focus {
            outline: none;
            border-color: #2563eb;
        }

        .submit-btn {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 7px;
            background: #172554;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .submit-btn:hover {
            background: #2563eb;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #172554;
            text-decoration: none;
        }

        .back-link:hover {
            color: #2563eb;
        }
    </style>
</head>

<body>

<header>
    <h1>Online Tour Planner</h1>

    <nav>
        <a href="userHome.jsp">Dashboard</a>
        <a href="MyBookingsServlet">My Bookings</a>
        <a href="LogoutServlet">Logout</a>
    </nav>
</header>

<main>

    <div class="booking-container">

        <h2>Hotel Booking Details</h2>

        <div class="hotel-summary">
            <h3><%= hotel.getName() %></h3>

            <p>Location: <%= hotel.getLocation() %></p>

            <p><%= hotel.getDescription() %></p>

            <p>Available Rooms: <%= hotel.getAvailableRooms() %></p>

            <p class="price">
                ₹<%= hotel.getPricePerNight() %> per night
            </p>
        </div>

        <form action="HotelBookingServlet" method="post">

            <input type="hidden"
                   name="hotelId"
                   value="<%= hotel.getHotelId() %>">

            <input type="hidden"
                   name="pricePerNight"
                   value="<%= hotel.getPricePerNight() %>">

            <div class="form-group">
                <label for="checkin">Check-in Date</label>
                <input type="date"
                       id="checkin"
                       name="checkin"
                       required>
            </div>

            <div class="form-group">
                <label for="checkout">Check-out Date</label>
                <input type="date"
                       id="checkout"
                       name="checkout"
                       required>
            </div>

            <div class="form-group">
                <label for="rooms">Number of Rooms</label>
                <input type="number"
                       id="rooms"
                       name="rooms"
                       min="1"
                       max="<%= hotel.getAvailableRooms() %>"
                       value="1"
                       required>
            </div>

            <button type="submit" class="submit-btn">
                Confirm Hotel Booking
            </button>

        </form>

        <a href="hotels.jsp" class="back-link">
            &#8592; Back to Hotels
        </a>

    </div>

</main>

</body>
</html>