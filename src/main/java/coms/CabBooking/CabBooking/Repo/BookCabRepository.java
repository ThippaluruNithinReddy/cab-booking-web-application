package coms.CabBooking.CabBooking.Repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import coms.CabBooking.CabBooking.entities.BookCab;

@Repository
public interface BookCabRepository extends JpaRepository<BookCab, Long>{

	List<BookCab> findByCustomerName(String username);

}
