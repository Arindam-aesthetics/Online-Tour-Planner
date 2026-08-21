<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Bookings - Online Tour Planner</title>

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
            transition: 0.3s;
        }

        nav a:hover {
            color: #dc2626;
        }

        main {
            width: 92%;
            max-width: 1250px;
            margin: 45px auto;
        }

        h2 {
            color: #172554;
            margin-bottom: 25px;
            font-size: 32px;
        }

        .summary {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 35px;
        }

        .summary-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 18px rgba(0, 0, 0, 0.07);
            transition: 0.3s;
        }

        .summary-card:hover {
            transform: translateY(-5px);
        }

        .summary-card h3 {
            color: #64748b;
            font-size: 15px;
            margin-bottom: 10px;
        }

        .summary-card p {
            color: #172554;
            font-size: 28px;
            font-weight: bold;
        }

        .table-box {
            background: white;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.07);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1000px;
        }

        th {
            background: #172554;
            color: white;
            padding: 14px;
            text-align: left;
        }

        td {
            padding: 13px;
            border-bottom: 1px solid #e2e8f0;
        }

        tbody tr {
            transition: 0.2s;
        }

        tbody tr:hover {
            background: #f8fafc;
        }

        .status {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }

        .confirmed {
            background: #dcfce7;
            color: #15803d;
        }

        .cancelled {
            background: #fee2e2;
            color: #dc2626;
        }

        .pending {
            background: #fef3c7;
            color: #b45309;
        }

        .cancel-btn {
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
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
            text-align: center;
            color: #64748b;
            padding: 30px;
        }

        @media (max-width: 750px) {
            .summary {
                grid-template-columns: 1fr;
            }

            header {
                padding: 0 5%;
            }

            nav a {
                margin-left: 10px;
            }
        }
    </style>
</head>

<body>

<header>

    <h1>Online Tour Planner</h1>

    <nav>
        <a href="adminHome.jsp">Dashboard</a>
        <a href="AdminLogoutServlet">Logout</a>
    </nav>

</header>

<main>

    <h2>All Bookings</h2>

    <div class="summary">

        <div class="summary-card">
            <h3>Total Bookings</h3>
            <p>0</p>
        </div>

        <div class="summary-card">
            <h3>Confirmed</h3>
            <p>0</p>
        </div>

        <div class="summary-card">
            <h3>Cancelled</h3>
            <p>0</p>
        </div>

    </div>

    <div class="table-box">

        <table>

            <thead>

                <tr>
                    <th>Booking ID</th>
                    <th>User Email</th>
                    <th>Service</th>
                    <th>Destination</th>
                    <th>Date</th>
                    <th>Travellers</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>

            </thead>

            <tbody>

                <tr>

                    <td colspan="9" class="empty">
                        Booking records will appear here.
                    </td>

                </tr>

            </tbody>

        </table>

    </div>

</main>

</body>
</html>