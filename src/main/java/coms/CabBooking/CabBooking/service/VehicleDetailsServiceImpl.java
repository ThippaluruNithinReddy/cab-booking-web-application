package coms.CabBooking.CabBooking.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coms.CabBooking.CabBooking.Repo.VehicleDetailsRepository;
import coms.CabBooking.CabBooking.entities.Vehicle;

@Service
public class VehicleDetailsServiceImpl implements VehicleDetailsService {

    @Autowired
    VehicleDetailsRepository vdr;

    @Override
    public String addVehicleDetails(Vehicle vehicle) {
        Vehicle savedVehicle = vdr.save(vehicle);
        return (savedVehicle != null) ? "success" : "error";
    }

    @Override
    public List<Vehicle> getAllVehicles() {
        return vdr.findAll();
    }

    @Override
    public String updateVehicle(Vehicle vehicle) {
        Optional<Vehicle> existingVehicle = vdr.findById(vehicle.getVid());
        if (existingVehicle.isPresent()) {
            Vehicle updatedVehicle = existingVehicle.get();
            updatedVehicle.setVehicleName(vehicle.getVehicleName());
            updatedVehicle.setVehicleNumber(vehicle.getVehicleNumber());
            updatedVehicle.setOwnerName(vehicle.getOwnerName());
            updatedVehicle.setSeatingCapacity(vehicle.getSeatingCapacity());
            updatedVehicle.setPhone(vehicle.getPhone());
            vdr.save(updatedVehicle);
            return "success";
        }
        return "failure";
    }

    @Override
    public void deleteVehicle(Long vid) {
        vdr.deleteById(vid);
    }
}
