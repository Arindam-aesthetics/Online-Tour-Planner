<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error - Online Tour Planner</title>

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
            transition: 0.3s;
        }

        nav a:hover {
            color: #2563eb;
        }

        .error-container {
            width: 90%;
            max-width: 600px;
            margin: 80px auto;
            text-align: center;
        }

        .error-card {
            background: white;
            padding: 50px 35px;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
        }

        .error-icon {
            width: 90px;
            height: 90px;
            margin: 0 auto 25px;
            border-radius: 50%;
            background: #fee2e2;
            color: #dc2626;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 50px;
            animation: shake 0.6s ease;
        }

        @keyframes shake {
            0%, 100% {
                transform: translateX(0);
            }

            25% {
                transform: translateX(-8px);
            }

            75% {
                transform: translateX(8px);
            }
        }

        h2 {
            color: #172554;
            font-size: 32px;
            margin-bottom: 15px;
        }

        p {
            color: #64748b;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .button {
            display: inline-block;
            padding: 13px 25px;
            background: #172554;
            color: white;
            text-decoration: none;
            border-radius: 7px;
            transition: 0.3s;
        }

        .button:hover {
            background: #2563eb;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.2);
        }

        @media (max-width: 600px) {
            header {
                padding: 0 5%;
            }

            nav a {
                margin-left: 10px;
            }

            .error-container {
                margin-top: 50px;
            }
        }
    </style>
</head>

<body>

<header>

    <h1>Online Tour Planner</h1>

    <nav>
        <a href="index.html">Home</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
    </nav>

</header>

<main class="error-container">

    <div class="error-card">

        <div class="error-icon">
            !
        </div>

        <h2>Something Went Wrong</h2>

        <p>
            We couldn't complete your request.
            Please try again or return to the home page.
        </p>

        <a href="index.html" class="button">
            Return to Home
        </a>

    </div>

</main>

</body>
</html>