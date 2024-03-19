package coms.CabBooking.CabBooking.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coms.CabBooking.CabBooking.Repo.cabFareRepository;
import coms.CabBooking.CabBooking.entities.CabFare;

@Service
public class CabFareServiceImpl implements CabFareService {

    @Autowired
    private cabFareRepository cfr;

    @Override
    public String addFares(CabFare cbf) {
        CabFare cb = cfr.save(cbf);
        if (cb != null) {
            return "success";
        }
        return "Err";
    }

    @Override
    public List<CabFare> getAllCabFares() {
        return cfr.findAll();
    }

    @Override
    public String updateCabFare(CabFare cabFare) {
        Optional<CabFare> existingCabFare = cfr.findById(cabFare.getId());
        if (existingCabFare.isPresent()) {
            CabFare updatedCabFare = existingCabFare.get();
            updatedCabFare.setFromLocation(cabFare.getFromLocation());
            updatedCabFare.setToLocation(cabFare.getToLocation());
            updatedCabFare.setFare(cabFare.getFare());
            cfr.save(updatedCabFare);
            return "success";
        }
        return "failure";
    }

    @Override
    public void deleteCabFare(Long id) {
        cfr.deleteById(id);
    }
    
    
    
    @Override
    public CabFare getFareByLocations(String fromLocation, String toLocation) {
        return cfr.findByFromLocationAndToLocation(fromLocation, toLocation);
    }

}
