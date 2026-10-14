<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.onlinetourplanner.model.Booking" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Booking> bookings =
            (List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Bookings - Online Tour Planner</title>

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
            min-height: 75px;
            padding: 15px 8%;
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
            transition: 0.3s;
        }

        nav a:hover {
            color: #2563eb;
        }

        main {
            width: 88%;
            max-width: 1100px;
            margin: 50px auto;
        }

        h2 {
            color: #172554;
            font-size: 32px;
            margin-bottom: 30px;
        }

        .message {
            padding: 14px 18px;
            margin-bottom: 22px;
            border-radius: 8px;
            font-size: 14px;
        }

        .success-message {
            background: #dcfce7;
            color: #166534;
        }

        .error-message {
            background: #fee2e2;
            color: #991b1b;
        }

        .booking-card {
            background: white;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.07);
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 25px;
            transition: 0.3s;
        }

        .booking-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.12);
        }

        .booking-info {
            min-width: 0;
        }

        .booking-info h3 {
            color: #172554;
            margin-bottom: 12px;
            font-size: 21px;
        }

        .booking-info p {
            color: #666;
            margin: 6px 0;
            overflow-wrap: anywhere;
        }

        .booking-id {
            color: #2563eb !important;
            font-weight: bold;
        }

        .status,
        .cancelled-status {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
            margin-top: 8px;
        }

        .status {
            background: #dcfce7;
            color: #15803d;
        }

        .cancelled-status {
            background: #fee2e2;
            color: #b91c1c;
        }

        .actions {
            text-align: right;
            flex-shrink: 0;
        }

        .price {
            font-size: 22px;
            font-weight: bold;
            color: #172554;
            margin-bottom: 12px;
        }

        .cancel-btn {
            padding: 10px 18px;
            border: none;
            border-radius: 7px;
            background: #dc2626;
            color: white;
            cursor: pointer;
            transition: 0.3s;
        }

        .cancel-btn:hover {
            background: #b91c1c;
            transform: translateY(-2px);
        }

        .empty {
            background: white;
            padding: 45px;
            text-align: center;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.07);
        }

        .empty-icon {
            font-size: 60px;
            margin-bottom: 15px;
        }

        .empty h3 {
            color: #172554;
            margin-bottom: 10px;
        }

        .empty p {
            color: #666;
            margin-bottom: 20px;
        }

        .explore-btn {
            display: inline-block;
            padding: 12px 22px;
            background: #172554;
            color: white;
            text-decoration: none;
            border-radius: 7px;
            transition: 0.3s;
        }

        .explore-btn:hover {
            background: #2563eb;
            transform: translateY(-3px);
        }

        @media (max-width: 700px) {
            header {
                padding: 15px 5%;
                flex-wrap: wrap;
                gap: 15px;
            }

            header h1 {
                font-size: 21px;
            }

            nav {
                display: flex;
                flex-wrap: wrap;
                gap: 12px;
            }

            nav a {
                margin-left: 0;
            }

            main {
                width: 92%;
                margin: 30px auto;
            }

            h2 {
                font-size: 27px;
            }

            .booking-card {
                flex-direction: column;
                align-items: flex-start;
                gap: 20px;
            }

            .actions {
                text-align: left;
            }
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

    <h2>My Bookings</h2>

    <% if ("1".equals(request.getParameter("cancelled"))) { %>
        <div class="message success-message">
            Booking cancelled successfully.
        </div>
    <% } else if ("cancel".equals(request.getParameter("error"))) { %>
        <div class="message error-message">
            Cancellation failed. The booking may already be cancelled,
            or it may not belong to your account.
        </div>
    <% } %>

    <% if (bookings == null || bookings.isEmpty()) { %>

        <div class="empty">
            <div class="empty-icon">📋</div>

            <h3>No Bookings Yet</h3>

            <p>
                You haven't made any bookings yet.
                Start planning your next journey!
            </p>

            <a href="userHome.jsp" class="explore-btn">
                Explore Services
            </a>
        </div>

    <% } else { %>

        <% for (Booking booking : bookings) { %>

            <div class="booking-card">

                <div class="booking-info">

                    <h3>
                        <% if ("flight".equalsIgnoreCase(booking.getBookingType())) { %>
                            Flight Booking
                        <% } else if ("hotel".equalsIgnoreCase(booking.getBookingType())) { %>
                            Hotel Booking
                        <% } else if ("bus".equalsIgnoreCase(booking.getBookingType())) { %>
                            Bus Booking
                        <% } else { %>
                            Tour Package Booking
                        <% } %>
                    </h3>

                    <p class="booking-id">
                        Booking ID: <%= booking.getBookingId() %>
                    </p>

                    <p>
                        Service ID: <%= booking.getItemId() %>
                    </p>

                    <p>
                        Travel Date: <%= booking.getTravelDate() %>
                    </p>

                    <p>
                        <% if ("hotel".equalsIgnoreCase(booking.getBookingType())) { %>
                            Rooms: <%= booking.getNumberOfPeople() %>
                        <% } else { %>
                            Travellers: <%= booking.getNumberOfPeople() %>
                        <% } %>
                    </p>

                    <% if ("Cancelled".equalsIgnoreCase(booking.getStatus())) { %>
                        <span class="cancelled-status">Cancelled</span>
                    <% } else { %>
                        <span class="status"><%= booking.getStatus() %></span>
                    <% } %>

                </div>

                <div class="actions">

                    <p class="price">
                        &#8377;<%= booking.getTotalAmount() %>
                    </p>

                    <% if ("Confirmed".equalsIgnoreCase(booking.getStatus())) { %>

                        <form action="CancelBookingServlet"
                              method="post"
                              onsubmit="return confirm('Are you sure you want to cancel this booking?');">

                            <input type="hidden"
                                   name="bookingId"
                                   value="<%= booking.getBookingId() %>">

                            <button type="submit" class="cancel-btn">
                                Cancel Booking
                            </button>

                        </form>

                    <% } %>

                </div>

            </div>

        <% } %>

    <% } %>

</main>

</body>
</html>