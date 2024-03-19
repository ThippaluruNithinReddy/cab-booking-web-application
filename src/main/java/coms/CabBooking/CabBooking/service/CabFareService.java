package coms.CabBooking.CabBooking.service;

import java.util.List;

import coms.CabBooking.CabBooking.entities.CabFare;

public interface CabFareService {

    public String addFares(CabFare cbf);

    public List<CabFare> getAllCabFares();

    String updateCabFare(CabFare cabFare);

    void deleteCabFare(Long id);

	public CabFare getFareByLocations(String fromLocation, String toLocation);
	

}
