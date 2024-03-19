package coms.CabBooking.CabBooking.entities;



import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Vehicle {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long vid;
    private String vehicleName;
    private String vehicleNumber;
    private String ownerName;
    private int seatingCapacity;
    private String phone;
	public Vehicle(Long vid, String vehicleName, String vehicleNumber, String ownerName, int seatingCapacity,
			String phone) {
		super();
		this.vid = vid;
		this.vehicleName = vehicleName;
		this.vehicleNumber = vehicleNumber;
		this.ownerName = ownerName;
		this.seatingCapacity = seatingCapacity;
		this.phone = phone;
	}
	public Vehicle() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getVid() {
		return vid;
	}
	public void setVid(Long vid) {
		this.vid = vid;
	}
	public String getVehicleName() {
		return vehicleName;
	}
	public void setVehicleName(String vehicleName) {
		this.vehicleName = vehicleName;
	}
	public String getVehicleNumber() {
		return vehicleNumber;
	}
	public void setVehicleNumber(String vehicleNumber) {
		this.vehicleNumber = vehicleNumber;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public int getSeatingCapacity() {
		return seatingCapacity;
	}
	public void setSeatingCapacity(int seatingCapacity) {
		this.seatingCapacity = seatingCapacity;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "Vehicle [vid=" + vid + ", vehicleName=" + vehicleName + ", vehicleNumber=" + vehicleNumber
				+ ", ownerName=" + ownerName + ", seatingCapacity=" + seatingCapacity + ", phone=" + phone + "]";
	}

    
}
