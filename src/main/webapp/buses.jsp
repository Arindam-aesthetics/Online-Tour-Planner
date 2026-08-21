<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buses - Online Tour Planner</title>

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
            color: #16a34a;
        }

        main {
            width: 84%;
            max-width: 1100px;
            margin: 45px auto;
        }

        h2 {
            color: #172554;
            margin-bottom: 20px;
        }

        .search-box {
            background: white;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.07);
        }

        .search-form {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr auto;
            gap: 15px;
            align-items: end;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: 500;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            outline: none;
            font-size: 15px;
        }

        input:focus {
            border-color: #16a34a;
        }

        button {
            padding: 12px 24px;
            border: none;
            border-radius: 7px;
            background: #172554;
            color: white;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #16a34a;
            transform: translateY(-2px);
        }

        .results {
            margin-top: 45px;
        }

        .bus-card {
            background: white;
            padding: 25px;
            margin-bottom: 18px;
            border-radius: 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.07);
            transition: 0.3s;
        }

        .bus-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.12);
        }

        .bus-info h3 {
            color: #172554;
            font-size: 22px;
            margin-bottom: 10px;
        }

        .route {
            font-size: 18px;
            font-weight: bold;
        }

        .details {
            color: #666;
            margin-top: 8px;
        }

        .price {
            font-size: 22px;
            font-weight: bold;
            color: #16a34a;
            margin-bottom: 10px;
        }

        .book-btn {
            display: inline-block;
            padding: 10px 20px;
            background: #172554;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: 0.3s;
        }

        .book-btn:hover {
            background: #16a34a;
            transform: translateY(-2px);
        }

        .empty {
            background: white;
            padding: 30px;
            border-radius: 12px;
            color: #666;
            text-align: center;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.06);
        }

        @media (max-width: 800px) {
            .search-form {
                grid-template-columns: 1fr 1fr;
            }

            .bus-card {
                flex-direction: column;
                align-items: flex-start;
                gap: 20px;
            }
        }

        @media (max-width: 550px) {
            .search-form {
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

    <h2>Search Buses</h2>

    <div class="search-box">

        <form class="search-form" action="BusServlet" method="get">

            <div>
                <label>From</label>
                <input type="text" name="source" placeholder="Departure city" required>
            </div>

            <div>
                <label>To</label>
                <input type="text" name="destination" placeholder="Destination city" required>
            </div>

            <div>
                <label>Date</label>
                <input type="date" name="date" required>
            </div>

            <button type="submit">Search</button>

        </form>

    </div>

    <section class="results">

        <h2>Available Buses</h2>

        <div class="empty">
            <p>Search for a route to view available buses.</p>
        </div>

        <!--
        Example of a result that will later be generated using JSP:

        <div class="bus-card">

            <div class="bus-info">
                <h3>Green Line Travels</h3>
                <p class="route">Asansol → Kolkata</p>
                <p class="details">08:30 AM | AC Sleeper | 32 Seats</p>
            </div>

            <div>
                <p class="price">₹800</p>
                <a href="booking.jsp" class="book-btn">Book Now</a>
            </div>

        </div>
        -->

    </section>

</main>

</body>
</html>