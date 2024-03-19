package coms.CabBooking.CabBooking.entities;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class BookCab {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long bookId;
    private LocalDate date;
    private String fromLocation;
    private String toLocation;
    private double fare;
    private String vehicleNumber;
    private String customerName;
    private String phone;

    public BookCab(Long bookId, LocalDate date, String fromLocation, String toLocation, double fare, String vehicleNumber,
            String customerName, String phone) {
        super();
        this.bookId = bookId;
        this.date = date;
        this.fromLocation = fromLocation;
        this.toLocation = toLocation;
        this.fare = fare;
        this.vehicleNumber = vehicleNumber;
        this.customerName = customerName;
        this.phone = phone;
    }

    public BookCab() {
        
    }

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getFromLocation() {
        return fromLocation;
    }

    public void setFromLocation(String fromLocation) {
        this.fromLocation = fromLocation;
    }

    public String getToLocation() {
        return toLocation;
    }

    public void setToLocation(String toLocation) {
        this.toLocation = toLocation;
    }

    public double getFare() {
        return fare;
    }

    public void setFare(double fare) {
        this.fare = fare;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "BookedCab [bookId=" + bookId + ", date=" + date + ", fromLocation=" + fromLocation + ", toLocation="
                + toLocation + ", fare=" + fare + ", vehicleNumber=" + vehicleNumber + ", customerName=" + customerName
                + ", phone=" + phone + "]";
    }
}