<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard - Online Tour Planner</title>

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
            width: 84%;
            max-width: 1100px;
            margin: 50px auto;
        }

        main > h2 {
            text-align: center;
            color: #172554;
            font-size: 34px;
            margin-bottom: 35px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .card {
            position: relative;
            background: white;
            padding: 35px 25px;
            min-height: 220px;
            border-radius: 14px;
            text-decoration: none;
            color: #172033;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.07);
            overflow: hidden;
            transition: 0.4s;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 18px 35px rgba(0, 0, 0, 0.13);
        }

        .card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            transform: scaleX(0);
            transition: 0.4s;
        }

        .card:hover::before {
            transform: scaleX(1);
        }

        .icon {
            font-size: 50px;
            margin-bottom: 20px;
            transition: 0.4s;
        }

        .card:hover .icon {
            transform: scale(1.15);
        }

        .card h3 {
            font-size: 22px;
            margin-bottom: 12px;
        }

        .card p {
            color: #666;
            line-height: 1.5;
        }

        .flight::before {
            background: #2563eb;
        }

        .hotel::before {
            background: #9333ea;
        }

        .bus::before {
            background: #16a34a;
        }

        .package::before {
            background: #f97316;
        }

        .flight:hover .icon {
            animation: fly 0.8s ease;
        }

        .hotel:hover .icon {
            animation: bounce 0.6s ease;
        }

        .bus:hover .icon {
            animation: drive 0.8s ease;
        }

        .package:hover .icon {
            animation: rotate 0.8s ease;
        }

        @keyframes fly {
            50% {
                transform: translateX(35px) rotate(-10deg);
            }
        }

        @keyframes bounce {
            50% {
                transform: translateY(-15px);
            }
        }

        @keyframes drive {
            50% {
                transform: translateX(35px);
            }
        }

        @keyframes rotate {
            100% {
                transform: rotate(360deg);
            }
        }

        @media (max-width: 800px) {
            .cards {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 550px) {
            .cards {
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
        <a href="userHome.jsp">Dashboard</a>
        <a href="myBookings.jsp">My Bookings</a>
        <a href="LogoutServlet">Logout</a>
    </nav>

</header>

<main>

    <h2>User Dashboard</h2>

    <div class="cards">

        <a class="card flight" href="flights.jsp">
            <div class="icon">✈</div>
            <h3>Flights</h3>
            <p>Search and book flights to your destination.</p>
        </a>

        <a class="card hotel" href="hotels.jsp">
            <div class="icon">🏨</div>
            <h3>Hotels</h3>
            <p>Find comfortable hotels for your stay.</p>
        </a>

        <a class="card bus" href="buses.jsp">
            <div class="icon">🚌</div>
            <h3>Buses</h3>
            <p>Search buses and explore available routes.</p>
        </a>

        <a class="card package" href="packages.jsp">
            <div class="icon">🌍</div>
            <h3>Tour Packages</h3>
            <p>Choose a complete package for your journey.</p>
        </a>

        <a class="card" href="myBookings.jsp">
            <div class="icon">📋</div>
            <h3>My Bookings</h3>
            <p>View and manage your existing bookings.</p>
        </a>

    </div>

</main>

</body>
</html>