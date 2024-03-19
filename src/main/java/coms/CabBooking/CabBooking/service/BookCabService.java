package coms.CabBooking.CabBooking.service;

import java.util.List;

import coms.CabBooking.CabBooking.entities.BookCab;
import coms.CabBooking.CabBooking.entities.User;

public interface BookCabService {
	
	List<BookCab> getAllBookedCabs();

    BookCab getBookedCabById(Long id);

    BookCab createBookedCab(BookCab bookedCab);

    BookCab updateBookedCab(Long id, BookCab updatedBookedCab);

    void deleteBookedCab(Long id);
    
    List<BookCab> getBookingsByUser(User user);

}
