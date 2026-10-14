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
    <title>Admin Dashboard</title>

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

        .logout {
            color: #dc2626;
            text-decoration: none;
        }

        .container {
            width: 84%;
            margin: 45px auto;
        }

        h2 {
            color: #172554;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.07);
        }

        .card h3 {
            color: #172554;
        }

        .card p {
            color: #64748b;
        }

        .card a {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 18px;
            background: #172554;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }
    </style>
</head>

<body>

<header>
    <h1>Online Tour Planner</h1>
    <a class="logout" href="LogoutServlet">Logout</a>
</header>

<div class="container">

    <h2>Admin Dashboard</h2>
    <p>Welcome, <%= session.getAttribute("admin") %></p>

    <div class="grid">

        <div class="card">
            <h3>Manage Flights</h3>
            <p>Add, update and delete flight records.</p>
            <a href="AdminFlightServlet">Manage</a>
        </div>

        <div class="card">
            <h3>Manage Hotels</h3>
            <p>Add, update and delete hotel records.</p>
            <a href="AdminHotelServlet">Manage</a>
        </div>

        <div class="card">
            <h3>Manage Buses</h3>
            <p>Add, update and delete bus records.</p>
            <a href="AdminBusServlet">Manage</a>
        </div>

        <div class="card">
            <h3>Manage Packages</h3>
            <p>Add, update and delete tour packages.</p>
            <a href="AdminPackageServlet">Manage</a>
        </div>

        <div class="card">
            <h3>View Bookings</h3>
            <p>View all customer bookings.</p>
            <a href="AdminBookingServlet">View</a>
        </div>

    </div>

</div>

</body>
</html>