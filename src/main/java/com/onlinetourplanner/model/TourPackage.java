package com.onlinetourplanner.model;

import java.math.BigDecimal;

public class TourPackage {

    private int packageId;
    private String name;
    private String destination;
    private String description;
    private int duration;
    private BigDecimal price;
    private int availableSlots;

    public TourPackage() {
    }

    public TourPackage(int packageId, String name, String destination,
                       String description, int duration,
                       BigDecimal price, int availableSlots) {
        this.packageId = packageId;
        this.name = name;
        this.destination = destination;
        this.description = description;
        this.duration = duration;
        this.price = price;
        this.availableSlots = availableSlots;
    }

    public int getPackageId() {
        return packageId;
    }

    public void setPackageId(int packageId) {
        this.packageId = packageId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getAvailableSlots() {
        return availableSlots;
    }

    public void setAvailableSlots(int availableSlots) {
        this.availableSlots = availableSlots;
    }
}
