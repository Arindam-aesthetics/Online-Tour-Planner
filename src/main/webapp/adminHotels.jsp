
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.onlinetourplanner.model.Hotel" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotels");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Hotels - Online Tour Planner</title>

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
            min-height: 90px;
            padding: 25px 8%;
            background: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
        }

        header h1 {
            color: #172554;
            font-size: 30px;
        }

        header a {
            color: #dc2626;
            text-decoration: none;
            font-size: 16px;
        }

        .container {
            width: 90%;
            margin: 50px auto;
        }

        .page-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            margin-bottom: 25px;
        }

        h2 {
            color: #172554;
            font-size: 32px;
        }

        .back {
            display: inline-block;
            margin-bottom: 25px;
            color: #172554;
            text-decoration: none;
            font-size: 17px;
        }

        .add-btn {
            display: inline-block;
            padding: 14px 20px;
            background: #172554;
            color: white;
            text-decoration: none;
            border-radius: 7px;
            font-size: 15px;
            font-weight: bold;
            white-space: nowrap;
        }

        .add-btn:hover {
            background: #263875;
        }

        .table-container {
            background: white;
            border-radius: 12px;
            overflow-x: auto;
            box-shadow: 0 5px 20px rgba(0,0,0,0.06);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1050px;
        }

        th {
            background: #172554;
            color: white;
            padding: 18px 15px;
            text-align: left;
            white-space: nowrap;
        }

        td {
            padding: 18px 15px;
            border-bottom: 1px solid #e5e7eb;
            color: #334155;
        }

        tr:last-child td {
            border-bottom: none;
        }

        .price {
            color: #15803d;
            font-weight: bold;
            white-space: nowrap;
        }

        .actions {
            display: flex;
            gap: 10px;
        }

        .action-btn {
            display: inline-block;
            padding: 10px 14px;
            border: none;
            border-radius: 7px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
        }

        .edit-btn {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .delete-btn {
            background: #fee2e2;
            color: #b91c1c;
        }

        .action-btn:hover {
            opacity: 0.8;
        }

        .empty {
            background: white;
            padding: 35px;
            text-align: center;
            border-radius: 12px;
            color: #64748b;
        }

        @media (max-width: 600px) {
            .container {
                width: 94%;
                margin: 30px auto;
            }

            .page-heading {
                align-items: flex-start;
                flex-direction: column;
            }

            h2 {
                font-size: 27px;
            }

            header h1 {
                font-size: 23px;
            }
        }
    </style>
</head>

<body>

<header>
    <h1>Online Tour Planner</h1>
    <a href="LogoutServlet">Logout</a>
</header>

<main class="container">

    <div class="page-heading">
        <h2>Manage Hotels</h2>
        <a class="add-btn" href="addHotel.jsp">+ Add Hotel</a>
    </div>

    <a href="adminDashboard.jsp" class="back">← Back to Dashboard</a>

    <% if (hotels != null && !hotels.isEmpty()) { %>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Hotel Name</th>
                    <th>Location</th>
                    <th>Description</th>
                    <th>Price/Night</th>
                    <th>Available Rooms</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>
                <% for (Hotel hotel : hotels) { %>
                <tr>
                    <td><%= hotel.getHotelId() %></td>
                    <td><%= hotel.getName() %></td>
                    <td><%= hotel.getLocation() %></td>
                    <td><%= hotel.getDescription() %></td>
                    <td class="price">₹<%= hotel.getPricePerNight() %></td>
                    <td><%= hotel.getAvailableRooms() %></td>
                    <td>
                        <div class="actions">
                            <a class="action-btn edit-btn"
                               href="EditHotelServlet?hotelId=<%= hotel.getHotelId() %>">
                                Edit
                            </a>

                            <a class="action-btn delete-btn"
                               href="DeleteHotelServlet?hotelId=<%= hotel.getHotelId() %>"
                               onclick="return confirm('Are you sure you want to delete this hotel?');">
                                Delete
                            </a>
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <% } else { %>

    <div class="empty">No hotels found.</div>

    <% } %>

</main>

</body>
</html>
