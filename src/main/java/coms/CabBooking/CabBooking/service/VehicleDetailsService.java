package coms.CabBooking.CabBooking.service;

import java.util.List;

import coms.CabBooking.CabBooking.entities.Vehicle;

public interface VehicleDetailsService {

    String addVehicleDetails(Vehicle vehicle);

    List<Vehicle> getAllVehicles();

    String updateVehicle(Vehicle vehicle);

    void deleteVehicle(Long vid);
}
