<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login - Online Tour Planner</title>

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
            transition: 0.3s;
        }

        nav a:hover {
            color: #2563eb;
        }

        .login-container {
            width: 90%;
            max-width: 450px;
            margin: 70px auto;
        }

        .login-container h2 {
            text-align: center;
            color: #172554;
            margin-bottom: 25px;
            font-size: 32px;
        }

        form {
            background: white;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }

        label {
            display: block;
            margin: 15px 0 7px;
            font-weight: 500;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 15px;
            outline: none;
        }

        input:focus {
            border-color: #2563eb;
        }

        button {
            width: 100%;
            margin-top: 22px;
            padding: 13px;
            border: none;
            border-radius: 7px;
            background: #172554;
            color: white;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #2563eb;
            transform: translateY(-2px);
        }

        .admin-note {
            text-align: center;
            color: #64748b;
            margin-top: 18px;
            font-size: 14px;
        }
    </style>
</head>

<body>

<header>

    <h1>Online Tour Planner</h1>

    <nav>
        <a href="index.html">Home</a>
        <a href="login.jsp">User Login</a>
    </nav>

</header>

<main class="login-container">

    <h2>Admin Login</h2>

    <form action="AdminLoginServlet" method="post">

        <label>Username</label>
        <input type="text" name="username" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <button type="submit">
            Login as Admin
        </button>

    </form>

    <p class="admin-note">
        Authorized administrators only
    </p>

</main>

</body>
</html>