# Online Tour Planner

A Java web application that allows users to search and book flights, hotels, buses, and tour packages through a single platform.

## Features

### User Features
- User registration and login
- Search for available flights, hotels, and buses
- Browse tour packages
- Book travel services
- View booking history
- Cancel confirmed bookings

### Admin Features
- Admin login and dashboard
- Add, view, edit, and delete flights
- Manage hotels, buses, and tour packages
- View all bookings

## Technologies Used

- **Backend:** Java, JSP, Servlets, JDBC
- **Frontend:** HTML, CSS, JavaScript, JSP
- **Database:** MySQL
- **Server:** Apache Tomcat 10.1
- **IDE:** Eclipse

## Database

Database name: `ONLINE_TOUR_DBMS`

The application uses MySQL to store user accounts, admin accounts, travel services, tour packages, and bookings.

## Setup Instructions

1. Clone this repository:

   ```bash
   git clone https://github.com/Arindam-aesthetics/Online-Tour-Planner.git
   ```

2. Import the project into Eclipse as an existing project.

3. Install Java 21 and configure Apache Tomcat 10.1.

4. Create a MySQL database named `ONLINE_TOUR_DBMS`.

5. Create the required tables using your database schema.

6. Add the MySQL Connector/J library to the project build path.

7. Configure the database connection in `DBConnection.java` using your local MySQL credentials.

8. Run the project on Tomcat and open it in your browser.

## Important Notes

- The database schema and sample data must be configured separately.
- Update database credentials for your local environment.
- Never commit real passwords, private credentials, or database backups containing personal information.

## Future Improvements

- Online payment integration
- Improved search and filtering
- Enhanced booking receipts
- Deployment to a public server

## Author

**Arindam Bhattacharjee**

GitHub: [Arindam-aesthetics](https://github.com/Arindam-aesthetics)
