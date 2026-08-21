<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Packages - Online Tour Planner</title>

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
            color: #f97316;
        }

        main {
            width: 88%;
            max-width: 1150px;
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
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.07);
            margin-bottom: 40px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 18px;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: 500;
        }

        input,
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            outline: none;
            font-size: 15px;
        }

        textarea {
            resize: vertical;
            min-height: 110px;
        }

        input:focus,
        textarea:focus {
            border-color: #f97316;
        }

        button {
            margin-top: 22px;
            margin-right: 8px;
            padding: 12px 22px;
            border: none;
            border-radius: 7px;
            background: #172554;
            color: white;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #f97316;
            transform: translateY(-2px);
        }

        .table-box {
            background: white;
            padding: 20px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.07);
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
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

        tbody tr {
            transition: 0.2s;
        }

        tbody tr:hover {
            background: #fff7ed;
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

            .full-width {
                grid-column: auto;
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

    <h2>Add Tour Package</h2>

    <div class="form-box">

        <form action="PackageAdminServlet" method="post">

            <div class="form-grid">

                <div>
                    <label>Package Name</label>
                    <input type="text" name="name" required>
                </div>

                <div>
                    <label>Destination</label>
                    <input type="text" name="destination" required>
                </div>

                <div>
                    <label>Duration</label>
                    <input type="text" name="duration" placeholder="Example: 5 Days / 4 Nights" required>
                </div>

                <div>
                    <label>Price</label>
                    <input type="number" name="price" min="0" required>
                </div>

                <div class="full-width">
                    <label>Description</label>
                    <textarea name="description" placeholder="Enter package details..." required></textarea>
                </div>

            </div>

            <button type="submit">
                Add Package
            </button>

            <button type="reset">
                Reset
            </button>

        </form>

    </div>

    <h2>Existing Packages</h2>

    <div class="table-box">

        <table>

            <thead>

                <tr>
                    <th>ID</th>
                    <th>Package Name</th>
                    <th>Destination</th>
                    <th>Duration</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>

            </thead>

            <tbody>

                <tr>

                    <td colspan="7" class="empty">
                        Package records will appear here.
                    </td>

                </tr>

            </tbody>

        </table>

    </div>

</main>

</body>
</html>