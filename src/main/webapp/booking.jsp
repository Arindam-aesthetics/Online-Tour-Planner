<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking - Online Tour Planner</title>

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
            color: #2563eb;
        }

        .booking-container {
            width: 90%;
            max-width: 650px;
            margin: 55px auto;
        }

        .booking-container h2 {
            text-align: center;
            color: #172554;
            font-size: 32px;
            margin-bottom: 25px;
        }

        .booking-card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
        }

        .booking-details {
            background: #f8fafc;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .booking-details h3 {
            color: #172554;
            margin-bottom: 15px;
        }

        .detail {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .detail:last-child {
            border-bottom: none;
        }

        .detail span:first-child {
            color: #64748b;
        }

        .detail span:last-child {
            font-weight: 600;
        }

        label {
            display: block;
            margin: 15px 0 7px;
            font-weight: 500;
        }

        input,
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 15px;
            outline: none;
        }

        input:focus,
        select:focus {
            border-color: #2563eb;
        }

        .confirm-btn {
            width: 100%;
            margin-top: 25px;
            padding: 14px;
            border: none;
            border-radius: 7px;
            background: #172554;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        .confirm-btn:hover {
            background: #2563eb;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.25);
        }

        .back-btn {
            display: block;
            text-align: center;
            margin-top: 18px;
            color: #2563eb;
            text-decoration: none;
        }

        @media (max-width: 600px) {
            header {
                padding: 0 5%;
            }

            nav a {
                margin-left: 10px;
            }

            .booking-container {
                margin-top: 35px;
            }
        }
    </style>
</head>

<body>

<header>

    <h1>Online Tour Planner</h1>

    <nav>
        <a href="userHome.jsp">Dashboard</a>
        <a href="myBookings.jsp">My Bookings</a>
        <a href="LogoutServlet">Logout</a>
    </nav>

</header>

<main class="booking-container">

    <h2>Confirm Your Booking</h2>

    <div class="booking-card">

        <div class="booking-details">

            <h3>Selected Service</h3>

            <div class="detail">
                <span>Service Type</span>
                <span>Will be loaded</span>
            </div>

            <div class="detail">
                <span>Service Name</span>
                <span>Will be loaded</span>
            </div>

            <div class="detail">
                <span>Destination</span>
                <span>Will be loaded</span>
            </div>

            <div class="detail">
                <span>Price</span>
                <span>Will be loaded</span>
            </div>

        </div>

        <form action="BookingServlet" method="post">

            <input type="hidden" name="itemId" value="">
            <input type="hidden" name="type" value="">

            <label>Number of Travellers</label>
            <input type="number" name="travellers" min="1" max="20" value="1" required>

            <label>Booking Date</label>
            <input type="date" name="bookingDate" required>

            <button type="submit" class="confirm-btn">
                Confirm Booking
            </button>

        </form>

        <a href="userHome.jsp" class="back-btn">
            ← Back to Dashboard
        </a>

    </div>

</main>

</body>
</html>