package coms.CabBooking.CabBooking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import coms.CabBooking.CabBooking.Repo.BookCabRepository;
import coms.CabBooking.CabBooking.entities.BookCab;
import coms.CabBooking.CabBooking.entities.User;

@Service
public class BookCabServiceImpl implements BookCabService {

    @Autowired
    private BookCabRepository bookCabRepository;

    @Override
    public List<BookCab> getAllBookedCabs() {
        return bookCabRepository.findAll();
    }

    @Override
    public BookCab getBookedCabById(Long id) {
        return bookCabRepository.findById(id).orElse(null);
    }

    @Override
    public BookCab createBookedCab(BookCab bookedCab) {
        return bookCabRepository.save(bookedCab);
    }

    @Override
    public BookCab updateBookedCab(Long id, BookCab updatedBookedCab) {
        BookCab existingBookedCab = getBookedCabById(id);
        if (existingBookedCab != null) {
            existingBookedCab.setDate(updatedBookedCab.getDate());
            existingBookedCab.setFromLocation(updatedBookedCab.getFromLocation());
            existingBookedCab.setToLocation(updatedBookedCab.getToLocation());
            existingBookedCab.setVehicleNumber(updatedBookedCab.getVehicleNumber());
            existingBookedCab.setCustomerName(updatedBookedCab.getCustomerName());
            existingBookedCab.setPhone(updatedBookedCab.getPhone());
            return bookCabRepository.save(existingBookedCab);
        }
        return null;
    }

    @Override
    public void deleteBookedCab(Long id) {
        bookCabRepository.deleteById(id);
    }

    @Override
    public List<BookCab> getBookingsByUser(User user) {
        return bookCabRepository.findByCustomerName(user.getUsername());
    }
}
