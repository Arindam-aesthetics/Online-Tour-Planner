<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Users - Online Tour Planner</title>

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

        main {
            width: 88%;
            max-width: 1100px;
            margin: 45px auto;
        }

        h2 {
            color: #172554;
            margin-bottom: 20px;
        }

        .form-box {
            background: white;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.07);
            margin-bottom: 40px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
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
        }

        input:focus {
            border-color: #2563eb;
        }

        button {
            margin-top: 22px;
            padding: 12px 22px;
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

        .table-box {
            background: white;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.07);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
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

        tr {
            transition: 0.2s;
        }

        tbody tr:hover {
            background: #f8fafc;
        }

        .delete-btn {
            background: #dc2626;
            margin: 0;
            padding: 8px 14px;
        }

        .delete-btn:hover {
            background: #b91c1c;
        }

        .empty {
            text-align: center;
            color: #64748b;
            padding: 25px;
        }

        @media (max-width: 650px) {
            .form-grid {
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

    <h2>Add User</h2>

    <div class="form-box">

        <form action="UserAdminServlet" method="post">

            <div class="form-grid">

                <div>
                    <label>Name</label>
                    <input type="text" name="name" required>
                </div>

                <div>
                    <label>Email</label>
                    <input type="email" name="email" required>
                </div>

                <div>
                    <label>Password</label>
                    <input type="password" name="password" required>
                </div>

                <div>
                    <label>Contact No.</label>
                    <input type="text" name="contact" required>
                </div>

            </div>

            <button type="submit">
                Add User
            </button>

        </form>

    </div>

    <h2>Registered Users</h2>

    <div class="table-box">

        <table>

            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>

                <!--
                User records will later be generated
                dynamically from the database.
                -->

                <tr>
                    <td colspan="5" class="empty">
                        User records will appear here.
                    </td>
                </tr>

            </tbody>

        </table>

    </div>

</main>

</body>
</html>