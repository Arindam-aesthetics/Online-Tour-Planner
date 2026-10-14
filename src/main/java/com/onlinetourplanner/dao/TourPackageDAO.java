package com.onlinetourplanner.dao;

import com.onlinetourplanner.model.TourPackage;
import com.onlinetourplanner.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TourPackageDAO {

    public List<TourPackage> getAllPackages() {
        List<TourPackage> packages = new ArrayList<>();
        String sql = "SELECT * FROM packages";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                packages.add(mapPackage(resultSet));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return packages;
    }

    public List<TourPackage> searchPackages(String destination) {
        List<TourPackage> packages = new ArrayList<>();

        String sql = "SELECT * FROM packages WHERE LOWER(TRIM(destination)) = LOWER(TRIM(?))";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, destination);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    packages.add(mapPackage(resultSet));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return packages;
    }

    public TourPackage getPackageById(int packageId) {
        String sql = "SELECT * FROM packages WHERE package_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, packageId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapPackage(resultSet);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean addPackage(TourPackage tourPackage) {
        String sql = "INSERT INTO packages (name, destination, description, duration, price, available_slots) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, tourPackage.getName());
            statement.setString(2, tourPackage.getDestination());
            statement.setString(3, tourPackage.getDescription());
            statement.setInt(4, tourPackage.getDuration());
            statement.setBigDecimal(5, tourPackage.getPrice());
            statement.setInt(6, tourPackage.getAvailableSlots());

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePackage(TourPackage tourPackage) {
        String sql = "UPDATE packages SET name = ?, destination = ?, description = ?, duration = ?, price = ?, available_slots = ? WHERE package_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, tourPackage.getName());
            statement.setString(2, tourPackage.getDestination());
            statement.setString(3, tourPackage.getDescription());
            statement.setInt(4, tourPackage.getDuration());
            statement.setBigDecimal(5, tourPackage.getPrice());
            statement.setInt(6, tourPackage.getAvailableSlots());
            statement.setInt(7, tourPackage.getPackageId());

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deletePackage(int packageId) {
        String sql = "DELETE FROM packages WHERE package_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, packageId);
            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private TourPackage mapPackage(ResultSet resultSet) throws SQLException {
        return new TourPackage(
                resultSet.getInt("package_id"),
                resultSet.getString("name"),
                resultSet.getString("destination"),
                resultSet.getString("description"),
                resultSet.getInt("duration"),
                resultSet.getBigDecimal("price"),
                resultSet.getInt("available_slots")
        );
    }
}