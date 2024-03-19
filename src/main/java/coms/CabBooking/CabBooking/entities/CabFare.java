package coms.CabBooking.CabBooking.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;

@Entity
public class CabFare {
    @Id
    @GeneratedValue
    private Long id;
    private String fromLocation;
    private String toLocation;
    private double fare;
    private String customerName;  // Add this property

    public CabFare() {
        super();
    }

    public CabFare(Long id, String fromLocation, String toLocation, double fare, String customerName) {
        super();
        this.id = id;
        this.fromLocation = fromLocation;
        this.toLocation = toLocation;
        this.fare = fare;
        this.customerName = customerName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @Override
    public String toString() {
        return "CabFare [id=" + id + ", fromLocation=" + fromLocation + ", toLocation=" + toLocation + ", fare=" + fare + ", customerName=" + customerName + "]";
    }
}
