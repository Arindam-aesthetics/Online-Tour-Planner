package com.onlinetourplanner.model;

import java.math.BigDecimal;

public class Hotel {

    private int hotelId;
    private String name;
    private String location;
    private String description;
    private BigDecimal pricePerNight;
    private int availableRooms;

    public Hotel() {
    }

    public Hotel(int hotelId, String name, String location, String description,
                 BigDecimal pricePerNight, int availableRooms) {
        this.hotelId = hotelId;
        this.name = name;
        this.location = location;
        this.description = description;
        this.pricePerNight = pricePerNight;
        this.availableRooms = availableRooms;
    }

    public int getHotelId() {
        return hotelId;
    }

    public void setHotelId(int hotelId) {
        this.hotelId = hotelId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPricePerNight() {
        return pricePerNight;
    }

    public void setPricePerNight(BigDecimal pricePerNight) {
        this.pricePerNight = pricePerNight;
    }

    public int getAvailableRooms() {
        return availableRooms;
    }

    public void setAvailableRooms(int availableRooms) {
        this.availableRooms = availableRooms;
    }
}