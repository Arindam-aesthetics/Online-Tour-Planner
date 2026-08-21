<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - Online Tour Planner</title>

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

        .form-container {
            width: 90%;
            max-width: 500px;
            margin: 50px auto;
        }

        .form-container h2 {
            text-align: center;
            color: #172554;
            margin-bottom: 25px;
            font-size: 32px;
        }

        form {
            background: white;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
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
            margin-top: 22px;
            margin-right: 8px;
            padding: 12px 25px;
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

        button[type="reset"] {
            background: #64748b;
        }

        button[type="reset"]:hover {
            background: #475569;
        }

        .form-container p {
            text-align: center;
            margin-top: 20px;
        }

        .form-container a {
            color: #2563eb;
            text-decoration: none;
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

<main class="form-container">

    <h2>Create Account</h2>

    <form action="RegisterServlet" method="post">

        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <label>Contact No.</label>
        <input type="text" name="contact" required>

        <button type="submit">Register</button>
        <button type="reset">Reset</button>

    </form>

    <p>
        Already have an account?
        <a href="login.jsp">Login</a>
    </p>

</main>

</body>
</html>