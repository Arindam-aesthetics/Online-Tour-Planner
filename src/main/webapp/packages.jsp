<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tour Packages - Online Tour Planner</title>

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
            position: sticky;
            top: 0;
            z-index: 100;
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
            max-width: 1200px;
            margin: 45px auto;
        }

        .heading {
            text-align: center;
            margin-bottom: 35px;
        }

        .heading h2 {
            color: #172554;
            font-size: 38px;
            margin-bottom: 10px;
        }

        .heading p {
            color: #64748b;
            font-size: 16px;
        }

        .search-box {
            background: white;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.06);
            margin-bottom: 40px;
        }

        .search-form {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr auto;
            gap: 12px;
        }

        .search-form input,
        .search-form select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #d1d5db;
            border-radius: 7px;
            outline: none;
            font-size: 14px;
            background: white;
        }

        .search-form input:focus,
        .search-form select:focus {
            border-color: #2563eb;
        }

        .search-btn {
            padding: 12px 24px;
            border: none;
            border-radius: 7px;
            background: #172554;
            color: white;
            cursor: pointer;
            font-size: 14px;
            transition: 0.3s;
        }

        .search-btn:hover {
            background: #2563eb;
            transform: translateY(-2px);
        }

        .packages {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .package-card {
            position: relative;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
            transition: 0.4s;
        }

        .package-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 18px 35px rgba(0, 0, 0, 0.14);
        }

        .badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: #f97316;
            color: white;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: bold;
            z-index: 2;
        }

        .package-image {
            height: 190px;
            overflow: hidden;
            position: relative;
        }

        .package-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: 0.5s;
        }

        .package-card:hover .package-image img {
            transform: scale(1.08);
        }

        .image-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 80px;
            background: linear-gradient(
                transparent,
                rgba(0, 0, 0, 0.55)
            );
        }

        .package-content {
            padding: 22px;
        }

        .package-content h3 {
            color: #172554;
            font-size: 22px;
            margin-bottom: 8px;
        }

        .rating {
            color: #f59e0b;
            font-size: 15px;
            margin-bottom: 12px;
        }

        .rating span {
            color: #64748b;
            margin-left: 5px;
            font-size: 13px;
        }

        .package-content p {
            color: #64748b;
            line-height: 1.6;
            font-size: 14px;
            margin-bottom: 17px;
        }

        .package-details {
            display: flex;
            justify-content: space-between;
            border-top: 1px solid #e5e7eb;
            padding-top: 15px;
            margin-bottom: 17px;
        }

        .detail {
            color: #475569;
            font-size: 13px;
        }

        .detail strong {
            display: block;
            color: #172554;
            margin-top: 4px;
            font-size: 14px;
        }

        .price-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .price {
            color: #f97316;
            font-size: 22px;
            font-weight: bold;
        }

        .price span {
            color: #64748b;
            font-size: 12px;
            font-weight: normal;
        }

        .view-btn {
            display: block;
            width: 100%;
            text-align: center;
            padding: 12px;
            background: #172554;
            color: white;
            text-decoration: none;
            border-radius: 7px;
            transition: 0.3s;
        }

        .view-btn:hover {
            background: #f97316;
            transform: translateY(-2px);
        }

        .empty {
            background: white;
            padding: 40px;
            text-align: center;
            border-radius: 12px;
            color: #64748b;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.06);
        }

        @media (max-width: 950px) {

            .packages {
                grid-template-columns: repeat(2, 1fr);
            }

            .search-form {
                grid-template-columns: 1fr 1fr;
            }

        }

        @media (max-width: 600px) {

            .packages {
                grid-template-columns: 1fr;
            }

            .search-form {
                grid-template-columns: 1fr;
            }

            header {
                padding: 0 5%;
            }

            nav a {
                margin-left: 10px;
            }

            .heading h2 {
                font-size: 30px;
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


    <div class="heading">

        <h2>Explore Tour Packages</h2>

        <p>
            Discover amazing destinations and plan your perfect journey.
        </p>

    </div>


    <div class="search-box">

        <form class="search-form" action="PackageServlet" method="get">

            <input
                type="text"
                name="destination"
                placeholder="Search destination..."
            >

            <select name="duration">

                <option value="">Duration</option>

                <option value="1-3">1 - 3 Days</option>

                <option value="4-6">4 - 6 Days</option>

                <option value="7+">7+ Days</option>

            </select>


            <select name="budget">

                <option value="">Budget</option>

                <option value="10000">Under &#8377;10,000</option>

                <option value="25000">Under &#8377;25,000</option>

                <option value="50000">Under &#8377;50,000</option>

            </select>


            <button type="submit" class="search-btn">
                Search
            </button>

        </form>

    </div>


    <section class="packages">


        <!-- DARJEELING -->

        <div class="package-card">

            <span class="badge">
                POPULAR
            </span>

            <div class="package-image">

                <img
                    src="https://images.unsplash.com/photo-1544735716-392fe2489ffa?auto=format&fit=crop&w=900&q=80"
                    alt="Darjeeling"
                >

                <div class="image-overlay"></div>

            </div>


            <div class="package-content">

                <h3>
                    Darjeeling Escape
                </h3>


                <div class="rating">
    &#9733;&#9733;&#9733;&#9733;&#9733;
    <span>4.8</span>
</div>


                <p>

                    Explore beautiful hills, tea gardens
                    and breathtaking views of Darjeeling.

                </p>


                <div class="package-details">

                    <div class="detail">

                        Duration

                        <strong>
                            4 Days / 3 Nights
                        </strong>

                    </div>


                    <div class="detail">

                        Location

                        <strong>
                            Darjeeling
                        </strong>

                    </div>

                </div>


                <div class="price-row">

                    <div class="price">

                        &#8377;18,000

                        <span>
                            / person
                        </span>

                    </div>

                </div>


                <a
                    href="booking.jsp"
                    class="view-btn"
                >
                    View &amp; Book
                </a>

            </div>

        </div>


        <!-- GOA -->

        <div class="package-card">

            <div class="package-image">

                <img
                    src="https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?auto=format&fit=crop&w=900&q=80"
                    alt="Goa"
                >

                <div class="image-overlay"></div>

            </div>


            <div class="package-content">

                <h3>
                    Goa Getaway
                </h3>


               <div class="rating">
    &#9733;&#9733;&#9733;&#9733;&#9734;
    <span>4.6</span>
</div>


                <p>

                    Enjoy beautiful beaches, nightlife
                    and the coastal atmosphere of Goa.

                </p>


                <div class="package-details">

                    <div class="detail">

                        Duration

                        <strong>
                            5 Days / 4 Nights
                        </strong>

                    </div>


                    <div class="detail">

                        Location

                        <strong>
                            Goa
                        </strong>

                    </div>

                </div>


                <div class="price-row">

                    <div class="price">

                        &#8377;25,000

                        <span>
                            / person
                        </span>

                    </div>

                </div>


                <a
                    href="booking.jsp"
                    class="view-btn"
                >
                    View &amp; Book
                </a>

            </div>

        </div>


        <!-- RAJASTHAN -->

        <div class="package-card">

            <span class="badge">
                BEST VALUE
            </span>


            <div class="package-image">

                <img
                    src="https://images.unsplash.com/photo-1477587458883-47145ed94245?auto=format&fit=crop&w=900&q=80"
                    alt="Rajasthan"
                >

                <div class="image-overlay"></div>

            </div>


            <div class="package-content">

                <h3>
                    Rajasthan Heritage
                </h3>


                <div class="rating">
    &#9733;&#9733;&#9733;&#9733;&#9733;
    <span>4.9</span>
</div>


                <p>

                    Discover magnificent forts, palaces
                    and the rich cultural heritage of Rajasthan.

                </p>


                <div class="package-details">

                    <div class="detail">

                        Duration

                        <strong>
                            6 Days / 5 Nights
                        </strong>

                    </div>


                    <div class="detail">

                        Location

                        <strong>
                            Rajasthan
                        </strong>

                    </div>

                </div>


                <div class="price-row">

                    <div class="price">

                        &#8377;30,000

                        <span>
                            / person
                        </span>

                    </div>

                </div>


                <a
                    href="booking.jsp"
                    class="view-btn"
                >
                    View &amp; Book
                </a>

            </div>

        </div>


    </section>


</main>

</body>
</html>