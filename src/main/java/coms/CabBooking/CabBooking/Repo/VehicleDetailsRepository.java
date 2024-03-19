package coms.CabBooking.CabBooking.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import coms.CabBooking.CabBooking.entities.Vehicle;

@Repository
public interface VehicleDetailsRepository extends JpaRepository<Vehicle, Long> {
	
}
