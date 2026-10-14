<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.onlinetourplanner.model.TourPackage" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    List<TourPackage> packages =
            (List<TourPackage>) request.getAttribute("packages");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Packages - Online Tour Planner</title>

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

        .container {
            width: 90%;
            margin: 40px auto;
        }

        .heading-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 25px;
        }

        h2 {
            color: #172554;
            font-size: 30px;
        }

        .back {
            display: inline-block;
            margin-bottom: 25px;
            color: #172554;
            text-decoration: none;
            font-size: 16px;
        }

        .add-btn {
            display: inline-block;
            padding: 12px 18px;
            background: #2563eb;
            color: white;
            text-decoration: none;
            border-radius: 7px;
            font-size: 14px;
            font-weight: bold;
        }

        .add-btn:hover {
            background: #1d4ed8;
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
            min-width: 1150px;
        }

        th {
            background: #172554;
            color: white;
            padding: 17px 15px;
            text-align: left;
            white-space: nowrap;
        }

        td {
            padding: 16px 15px;
            border-bottom: 1px solid #e5e7eb;
            color: #334155;
            vertical-align: top;
        }

        tr:last-child td {
            border-bottom: none;
        }

        .description {
            min-width: 180px;
            max-width: 260px;
            overflow-wrap: anywhere;
        }

        .actions {
            display: flex;
            gap: 8px;
            align-items: center;
        }

        .action-btn {
            display: inline-block;
            padding: 8px 11px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            font-size: 13px;
            border: none;
            cursor: pointer;
        }

        .edit {
            background: #0d9488;
        }

        .edit:hover {
            background: #0f766e;
        }

        .delete {
            background: #dc2626;
        }

        .delete:hover {
            background: #b91c1c;
        }

        .empty {
            background: white;
            padding: 35px;
            text-align: center;
            border-radius: 12px;
            color: #64748b;
            box-shadow: 0 5px 20px rgba(0,0,0,0.06);
        }

        .error {
            padding: 13px 16px;
            margin-bottom: 20px;
            border-radius: 7px;
            background: #fee2e2;
            color: #991b1b;
        }

        @media (max-width: 600px) {
            .container {
                width: 94%;
                margin: 25px auto;
            }

            header {
                padding: 15px 5%;
            }

            header h1 {
                font-size: 19px;
            }

            h2 {
                font-size: 25px;
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

    <div class="heading-row">
        <h2>Manage Tour Packages</h2>
        <a href="addPackage.jsp" class="add-btn">+ Add Package</a>
    </div>

    <a href="adminDashboard.jsp" class="back">&#8592; Back to Dashboard</a>

    <% if ("delete".equals(request.getParameter("error"))) { %>
        <div class="error">
            Could not delete the package. It may be referenced by existing bookings.
        </div>
    <% } %>

    <% if (packages != null && !packages.isEmpty()) { %>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Package Name</th>
                        <th>Destination</th>
                        <th>Description</th>
                        <th>Duration</th>
                        <th>Price</th>
                        <th>Available Slots</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <% for (TourPackage tourPackage : packages) { %>
                        <tr>
                            <td><%= tourPackage.getPackageId() %></td>
                            <td><%= tourPackage.getName() %></td>
                            <td><%= tourPackage.getDestination() %></td>

                            <td class="description">
                                <%= tourPackage.getDescription() %>
                            </td>

                            <td><%= tourPackage.getDuration() %> days</td>
                            <td>&#8377;<%= tourPackage.getPrice() %></td>
                            <td><%= tourPackage.getAvailableSlots() %></td>

                            <td>
                                <div class="actions">
                                    <a class="action-btn edit"
                                       href="EditPackageServlet?packageId=<%= tourPackage.getPackageId() %>">
                                        Edit
                                    </a>

                                    <a class="action-btn delete"
                                       href="DeletePackageServlet?packageId=<%= tourPackage.getPackageId() %>"
                                       onclick="return confirm('Are you sure you want to delete this package?');">
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

        <div class="empty">
            No tour packages found. Click "Add Package" to create one.
        </div>

    <% } %>

</main>

</body>
</html>