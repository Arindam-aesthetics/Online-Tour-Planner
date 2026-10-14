package com.onlinetourplanner.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Booking {

    private int bookingId;
    private int userId;
    private String bookingType;
    private int itemId;
    private LocalDate bookingDate;
    private LocalDate travelDate;
    private int numberOfPeople;
    private BigDecimal totalAmount;
    private String status;

    public Booking() {
    }

    public Booking(int bookingId, int userId, String bookingType, int itemId,
                   LocalDate bookingDate, LocalDate travelDate,
                   int numberOfPeople, BigDecimal totalAmount, String status) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.bookingType = bookingType;
        this.itemId = itemId;
        this.bookingDate = bookingDate;
        this.travelDate = travelDate;
        this.numberOfPeople = numberOfPeople;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getBookingType() {
        return bookingType;
    }

    public void setBookingType(String bookingType) {
        this.bookingType = bookingType;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public LocalDate getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(LocalDate bookingDate) {
        this.bookingDate = bookingDate;
    }

    public LocalDate getTravelDate() {
        return travelDate;
    }

    public void setTravelDate(LocalDate travelDate) {
        this.travelDate = travelDate;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}