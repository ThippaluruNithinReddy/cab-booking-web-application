package coms.CabBooking.CabBooking.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import coms.CabBooking.CabBooking.entities.BookCab;
import coms.CabBooking.CabBooking.entities.CabFare;

@Repository
public interface cabFareRepository extends JpaRepository<CabFare, Long>{

	List<BookCab> findByCustomerName(String customerName);

	CabFare findByFromLocationAndToLocation(String fromLocation, String toLocation) ;

}
