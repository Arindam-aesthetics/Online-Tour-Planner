<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

        .booking-card {
            background: white;
            padding: 25px;
            margin-bottom: 20px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.07);
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: 0.3s;
        }

        .booking-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.12);
        }

        .booking-info h3 {
            color: #172554;
            margin-bottom: 12px;
            font-size: 21px;
        }

        .booking-info p {
            color: #666;
            margin: 6px 0;
        }

        .booking-id {
            color: #2563eb !important;
            font-weight: bold;
        }

        .status {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            background: #dcfce7;
            color: #15803d;
            font-size: 13px;
            font-weight: bold;
            margin-top: 8px;
        }

        .actions {
            text-align: right;
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
                padding: 0 5%;
            }

            nav a {
                margin-left: 10px;
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
        <a href="myBookings.jsp">My Bookings</a>
        <a href="LogoutServlet">Logout</a>
    </nav>

</header>

<main>

    <h2>My Bookings</h2>

    <!--
    Booking records will later be generated dynamically
    from MySQL using BookingServlet.
    -->

    <div class="empty">

        <div class="empty-icon">
            📋
        </div>

        <h3>No Bookings Yet</h3>

        <p>
            You haven't made any bookings yet.
            Start planning your next journey!
        </p>

        <a href="userHome.jsp" class="explore-btn">
            Explore Services
        </a>

    </div>

    <!--
    Example booking:

    <div class="booking-card">

        <div class="booking-info">

            <h3>✈ Flight Booking</h3>

            <p class="booking-id">
                Booking ID: BK1001
            </p>

            <p>
                Kolkata → Delhi
            </p>

            <p>
                Date: 25 August 2026
            </p>

            <span class="status">
                Confirmed
            </span>

        </div>

        <div class="actions">

            <p class="price">
                ₹5,000
            </p>

            <form action="CancelBookingServlet" method="post">

                <input type="hidden" name="bookingId" value="BK1001">

                <button type="submit" class="cancel-btn">
                    Cancel Booking
                </button>

            </form>

        </div>

    </div>
    -->

</main>

</body>
</html>