
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.onlinetourplanner.model.Hotel" %>

<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    Hotel hotel = (Hotel) request.getAttribute("hotel");

    if (hotel == null) {
        response.sendRedirect("AdminHotelServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Hotel - Online Tour Planner</title>

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
            min-height: 90px;
            padding: 25px 8%;
            background: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 15px rgba(0,0,0,0.08);
        }

        header h1 {
            color: #172554;
            font-size: 30px;
        }

        header a {
            color: #dc2626;
            text-decoration: none;
        }

        .container {
            width: 90%;
            max-width: 850px;
            margin: 45px auto;
            padding: 35px;
            background: white;
            border-radius: 14px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.06);
        }

        h2 {
            color: #172554;
            font-size: 30px;
            margin-bottom: 28px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 22px;
        }

        .field {
            display: flex;
            flex-direction: column;
            gap: 9px;
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
            padding: 13px;
            border: 1px solid #cbd5e1;
            border-radius: 7px;
            font-size: 15px;
            color: #172554;
        }

        textarea {
            min-height: 110px;
            resize: vertical;
        }

        input:focus, textarea:focus {
            outline: none;
            border-color: #172554;
        }

        .error {
            color: #b91c1c;
            margin-bottom: 20px;
        }

        .buttons {
            display: flex;
            gap: 12px;
            margin-top: 28px;
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

        @media (max-width: 600px) {
            .container {
                padding: 22px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
            }

            header h1 {
                font-size: 23px;
            }
        }
    </style>
</head>

<body>

<header>
    <h1>Online Tour Planner</h1>
    <a href="LogoutServlet">Logout</a>
</header>

<main class="container">
    <h2>Edit Hotel #<%= hotel.getHotelId() %></h2>

    <% if ("1".equals(request.getParameter("error"))) { %>
        <p class="error">Update failed. Please check the details and try again.</p>
    <% } %>

    <form action="EditHotelServlet" method="post">
        <input type="hidden" name="hotelId"
               value="<%= hotel.getHotelId() %>">

        <div class="form-grid">

            <div class="field">
                <label for="name">Hotel Name</label>
                <input id="name" type="text" name="name"
                       value="<%= hotel.getName() %>" required>
            </div>

            <div class="field">
                <label for="location">Location</label>
                <input id="location" type="text" name="location"
                       value="<%= hotel.getLocation() %>" required>
            </div>

            <div class="field full-width">
                <label for="description">Description</label>
                <textarea id="description" name="description"
                          required><%= hotel.getDescription() %></textarea>
            </div>

            <div class="field">
                <label for="pricePerNight">Price Per Night (₹)</label>
                <input id="pricePerNight" type="number"
                       name="pricePerNight" min="0.01" step="0.01"
                       value="<%= hotel.getPricePerNight() %>" required>
            </div>

            <div class="field">
                <label for="availableRooms">Available Rooms</label>
                <input id="availableRooms" type="number"
                       name="availableRooms" min="0"
                       value="<%= hotel.getAvailableRooms() %>" required>
            </div>

        </div>

        <div class="buttons">
            <button type="submit">Save Changes</button>
            <a class="cancel" href="AdminHotelServlet">Cancel</a>
        </div>
    </form>
</main>

</body>
</html>
