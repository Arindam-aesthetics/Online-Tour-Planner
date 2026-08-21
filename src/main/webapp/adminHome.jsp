<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Online Tour Planner</title>

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
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
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
            width: 84%;
            max-width: 1100px;
            margin: 50px auto;
        }

        .heading {
            text-align: center;
            margin-bottom: 40px;
        }

        .heading h2 {
            color: #172554;
            font-size: 34px;
            margin-bottom: 10px;
        }

        .heading p {
            color: #64748b;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .card {
            position: relative;
            background: white;
            padding: 30px 25px;
            min-height: 210px;
            border-radius: 14px;
            text-decoration: none;
            color: #172033;
            box-shadow: 0 5px 20px rgba(0,0,0,0.07);
            overflow: hidden;
            transition: 0.4s;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 18px 35px rgba(0,0,0,0.13);
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
            font-size: 45px;
            margin-bottom: 18px;
            transition: 0.4s;
        }

        .card:hover .icon {
            transform: scale(1.15);
        }

        .card h3 {
            color: #172554;
            font-size: 21px;
            margin-bottom: 10px;
        }

        .card p {
            color: #64748b;
            line-height: 1.5;
        }

        .users::before {
            background: #2563eb;
        }

        .flights::before {
            background: #2563eb;
        }

        .hotels::before {
            background: #9333ea;
        }

        .buses::before {
            background: #16a34a;
        }

        .packages::before {
            background: #f97316;
        }

        .bookings::before {
            background: #dc2626;
        }

        .flights:hover .icon {
            animation: fly 0.8s ease;
        }

        .hotels:hover .icon {
            animation: bounce 0.6s ease;
        }

        .buses:hover .icon {
            animation: drive 0.8s ease;
        }

        .packages:hover .icon {
            animation: rotate 0.8s ease;
        }

        @keyframes fly {
            50% {
                transform: translateX(30px) rotate(-10deg);
            }
        }

        @keyframes bounce {
            50% {
                transform: translateY(-12px);
            }
        }

        @keyframes drive {
            50% {
                transform: translateX(30px);
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
        <a href="adminHome.jsp">Dashboard</a>
        <a href="AdminLogoutServlet">Logout</a>
    </nav>

</header>

<main>

    <div class="heading">

        <h2>Admin Dashboard</h2>

        <p>
            Manage users, travel services and bookings
        </p>

    </div>

    <div class="cards">

        <a class="card users" href="manageUsers.jsp">

            <div class="icon">👥</div>

            <h3>Manage Users</h3>

            <p>
                View and manage registered users.
            </p>

        </a>

        <a class="card flights" href="manageFlights.jsp">

            <div class="icon">✈</div>

            <h3>Manage Flights</h3>

            <p>
                Add, update and remove flight details.
            </p>

        </a>

        <a class="card hotels" href="manageHotels.jsp">

            <div class="icon">🏨</div>

            <h3>Manage Hotels</h3>

            <p>
                Manage hotel information and rooms.
            </p>

        </a>

        <a class="card buses" href="manageBuses.jsp">

            <div class="icon">🚌</div>

            <h3>Manage Buses</h3>

            <p>
                Manage bus routes and schedules.
            </p>

        </a>

        <a class="card packages" href="managePackages.jsp">

            <div class="icon">🌍</div>

            <h3>Manage Packages</h3>

            <p>
                Create and manage tour packages.
            </p>

        </a>

        <a class="card bookings" href="allBookings.jsp">

            <div class="icon">📋</div>

            <h3>All Bookings</h3>

            <p>
                View and manage customer bookings.
            </p>

        </a>

    </div>

</main>

</body>
</html>