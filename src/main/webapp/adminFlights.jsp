<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    List<String[]> flights = (List<String[]>) request.getAttribute("flights");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Flights</title>

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
            padding: 35px 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.06);
        }

        header h1 {
            margin: 0;
            font-size: 32px;
            color: #172554;
        }

        .logout {
            color: #dc2626;
            text-decoration: none;
            font-size: 16px;
        }

        main {
            width: 84%;
            margin: 50px auto;
        }

        .page-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .page-heading h2 {
            margin: 0;
            font-size: 30px;
        }

        .top-actions {
            display: flex;
            gap: 12px;
        }

        .btn {
            text-decoration: none;
            padding: 12px 18px;
            border-radius: 7px;
            font-size: 15px;
            font-weight: bold;
            display: inline-block;
        }

        .back-btn {
            background: white;
            color: #172554;
            border: 1px solid #cbd5e1;
        }

        .add-btn {
            background: #172554;
            color: white;
        }

        .table-container {
            background: white;
            border-radius: 12px;
            overflow-x: auto;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.06);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1150px;
        }

        th {
            background: #172554;
            color: white;
            text-align: left;
            padding: 18px 16px;
            font-size: 14px;
            white-space: nowrap;
        }

        td {
            padding: 18px 16px;
            border-bottom: 1px solid #e5e7eb;
            color: #334155;
            white-space: nowrap;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover td {
            background: #f8fafc;
        }

        .price {
            font-weight: bold;
            color: #15803d;
        }

        .actions-cell {
            display: flex;
            gap: 8px;
            align-items: center;
        }

        .edit-btn,
        .delete-btn {
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: bold;
        }

        .edit-btn {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .delete-btn {
            background: #fee2e2;
            color: #b91c1c;
        }

        .edit-btn:hover {
            background: #bfdbfe;
        }

        .delete-btn:hover {
            background: #fecaca;
        }

        .empty {
            text-align: center;
            padding: 35px;
            color: #64748b;
        }
    </style>
</head>

<body>

<header>
    <h1>Online Tour Planner</h1>
    <a class="logout" href="LogoutServlet">Logout</a>
</header>

<main>

    <div class="page-heading">
        <h2>Manage Flights</h2>

        <div class="top-actions">
            <a class="btn back-btn" href="adminDashboard.jsp">
                &#8592; Dashboard
            </a>

            <a class="btn add-btn" href="addFlight.jsp">
                + Add Flight
            </a>
        </div>
    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Airline</th>
                    <th>Flight No.</th>
                    <th>Source</th>
                    <th>Destination</th>
                    <th>Departure</th>
                    <th>Arrival</th>
                    <th>Price</th>
                    <th>Seats</th>
                    <th>Actions</th>
                </tr>
            </thead>

            <tbody>
                <%
                    if (flights != null && !flights.isEmpty()) {
                        for (String[] flight : flights) {
                %>

                <tr>
                    <td><%= flight[0] %></td>
                    <td><%= flight[1] %></td>
                    <td><%= flight[2] %></td>
                    <td><%= flight[3] %></td>
                    <td><%= flight[4] %></td>
                    <td><%= flight[5] %></td>
                    <td><%= flight[6] %></td>
                    <td class="price">
                        &#8377;<%= flight[7] %>
                    </td>
                    <td><%= flight[8] %></td>

                    <td class="actions-cell">
                        <a class="edit-btn"
                           href="EditFlightServlet?flightId=<%= flight[0] %>">
                            Edit
                        </a>

                        <a class="delete-btn"
                           href="DeleteFlightServlet?flightId=<%= flight[0] %>"
                           onclick="return confirm('Are you sure you want to delete this flight?');">
                            Delete
                        </a>
                    </td>
                </tr>

                <%
                        }
                    } else {
                %>

                <tr>
                    <td class="empty" colspan="10">
                        No flights available.
                    </td>
                </tr>

                <%
                    }
                %>
            </tbody>
        </table>
    </div>

</main>

</body>
</html>