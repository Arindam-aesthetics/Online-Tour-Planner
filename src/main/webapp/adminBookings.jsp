<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.onlinetourplanner.model.Booking" %>

<%
    List<Booking> bookings =
            (List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Bookings - Online Tour Planner</title>

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
        }

        header {
            height: 75px;
            padding: 0 8%;
            background: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
        }

        header h1 {
            color: #172554;
            font-size: 24px;
        }

        header a {
            color: #dc2626;
            text-decoration: none;
            font-size: 16px;
        }

        main {
            width: 90%;
            margin: 50px auto;
        }

        h2 {
            color: #172554;
            font-size: 32px;
            margin-bottom: 30px;
        }

        .back {
            display: inline-block;
            margin-bottom: 30px;
            color: #172554;
            text-decoration: none;
            font-size: 18px;
        }

        .table-container {
            background: white;
            border-radius: 14px;
            overflow-x: auto;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }

        th {
            background: #172554;
            color: white;
            padding: 18px 12px;
            text-align: left;
        }

        td {
            padding: 18px 12px;
            border-bottom: 1px solid #e2e8f0;
        }

        tr:last-child td {
            border-bottom: none;
        }

        .status {
            background: #dcfce7;
            color: #166534;
            padding: 7px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }

        .empty {
            padding: 30px;
            text-align: center;
            color: #64748b;
        }
    </style>
</head>

<body>

<header>
    <h1>Online Tour Planner</h1>
    <a href="LogoutServlet">Logout</a>
</header>

<main>
    <h2>All Customer Bookings</h2>

    <a class="back" href="adminDashboard.jsp">
        ← Back to Dashboard
    </a>

    <div class="table-container">

        <%
            if (bookings != null && !bookings.isEmpty()) {
        %>

        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>User ID</th>
                    <th>Booking Type</th>
                    <th>Service ID</th>
                    <th>Booking Date</th>
                    <th>Travel Date</th>
                    <th>Travellers</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                </tr>
            </thead>

            <tbody>
                <%
                    for (Booking booking : bookings) {
                %>

                <tr>
                    <td><%= booking.getBookingId() %></td>
                    <td><%= booking.getUserId() %></td>
                    <td><%= booking.getBookingType() %></td>
                    <td><%= booking.getItemId() %></td>
                    <td><%= booking.getBookingDate() %></td>
                    <td><%= booking.getTravelDate() %></td>
                    <td><%= booking.getNumberOfPeople() %></td>
                    <td>₹<%= booking.getTotalAmount() %></td>
                    <td>
                        <span class="status">
                            <%= booking.getStatus() %>
                        </span>
                    </td>
                </tr>

                <%
                    }
                %>
            </tbody>
        </table>

        <%
            } else {
        %>

        <div class="empty">
            No bookings found.
        </div>

        <%
            }
        %>

    </div>
</main>

</body>
</html>