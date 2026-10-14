
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Hotel | Online Tour Planner</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6fa;
            color: #172554;
        }

        header {
            background: white;
            padding: 30px 8%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.06);
        }

        header h1 {
            margin: 0;
            font-size: 28px;
        }

        header a {
            color: #dc2626;
            text-decoration: none;
        }

        .container {
            width: 90%;
            max-width: 750px;
            margin: 45px auto;
            padding: 32px;
            background: white;
            border-radius: 14px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.06);
        }

        h2 {
            margin: 0 0 25px;
            font-size: 28px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .field {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        label {
            font-size: 14px;
            font-weight: bold;
            color: #334155;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 15px;
            font-family: inherit;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        input:focus, textarea:focus {
            outline: none;
            border-color: #172554;
        }

        .buttons {
            display: flex;
            gap: 12px;
            margin-top: 25px;
        }

        button, .cancel {
            padding: 13px 20px;
            border: none;
            border-radius: 7px;
            font-size: 15px;
            font-weight: bold;
            text-decoration: none;
            cursor: pointer;
        }

        button {
            background: #172554;
            color: white;
        }

        .cancel {
            background: #e2e8f0;
            color: #172554;
        }

        .error {
            color: #b91c1c;
            margin-bottom: 18px;
        }

        @media (max-width: 600px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
            }

            .container {
                padding: 22px;
            }
        }
    </style>
</head>

<body>

<header>
    <h1>Online Tour Planner</h1>
    <a href="LogoutServlet">Logout</a>
</header>

<div class="container">
    <h2>Add New Hotel</h2>

    <% if ("1".equals(request.getParameter("error"))) { %>
        <p class="error">Unable to add hotel. Please check the details and try again.</p>
    <% } %>

    <form action="AddHotelServlet" method="post">
        <div class="form-grid">

            <div class="field">
                <label>Hotel Name</label>
                <input type="text" name="name" required>
            </div>

            <div class="field">
                <label>Location</label>
                <input type="text" name="location" required>
            </div>

            <div class="field full-width">
                <label>Description</label>
                <textarea name="description" required></textarea>
            </div>

            <div class="field">
                <label>Price Per Night (₹)</label>
                <input type="number" name="pricePerNight"
                       min="0.01" step="0.01" required>
            </div>

            <div class="field">
                <label>Available Rooms</label>
                <input type="number" name="availableRooms"
                       min="0" required>
            </div>

        </div>

        <div class="buttons">
            <button type="submit">Add Hotel</button>
            <a class="cancel" href="AdminHotelServlet">Cancel</a>
        </div>
    </form>
</div>

</body>
</html>
