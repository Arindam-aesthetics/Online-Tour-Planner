package com.onlinetourplanner.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBTest {

    public static void main(String[] args) {
        try {
            Connection connection = DBConnection.getConnection();

            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SHOW TABLES");

            System.out.println("Tables in database:");

            while (resultSet.next()) {
                System.out.println(resultSet.getString(1));
            }

            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}