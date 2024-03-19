package coms.CabBooking.CabBooking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import coms.CabBooking.CabBooking.entities.BookCab;
import coms.CabBooking.CabBooking.entities.CabFare;
import coms.CabBooking.CabBooking.entities.User;
import coms.CabBooking.CabBooking.entities.Vehicle;
import coms.CabBooking.CabBooking.service.BookCabService;
import coms.CabBooking.CabBooking.service.CabFareService;
import coms.CabBooking.CabBooking.service.UserService;
import coms.CabBooking.CabBooking.service.VehicleDetailsService;
import jakarta.servlet.http.HttpSession;

import java.util.List;

@Controller
public class BookCabController {

    @Autowired
    private BookCabService bookCabService;

    @Autowired
    private CabFareService cabFareService;

    @Autowired
    private VehicleDetailsService vehicleService;

    @Autowired
    private UserService userService; // Inject the UserService

    @GetMapping("/bookcab")
    public String showBookCabPage(Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            List<BookCab> userBookings = bookCabService.getBookingsByUser(loggedInUser);
            model.addAttribute("userBookings", userBookings);
        } else {
            return "redirect:/login";
        }

        List<CabFare> cabFares = cabFareService.getAllCabFares();
        List<Vehicle> vehicles = vehicleService.getAllVehicles();

        model.addAttribute("bookCab", new BookCab());
        model.addAttribute("cabFares", cabFares);
        model.addAttribute("vehicles", vehicles);

        return "BookCab";
    }

    @PostMapping("/newcabbookinginfo")
    public String saveCabBooking(@ModelAttribute("bookCab") BookCab bookCab, Model model, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            // Set the logged-in user's name for the cab booking
            bookCab.setCustomerName(loggedInUser.getUsername());

            // Add any additional logic or validation before saving
            bookCabService.createBookedCab(bookCab);
            model.addAttribute("info", "Cab Booking successful!");
            List<BookCab> userBookings = bookCabService.getBookingsByUser(loggedInUser);
            model.addAttribute("userBookings", userBookings);
            return "BookCab";
        } else {
            return "redirect:/login";
        }
    }
    


    @GetMapping("/viewBookings")
    public String viewAllBookings(Model model) {
        List<BookCab> bookingList = bookCabService.getAllBookedCabs();
        model.addAttribute("bookingList", bookingList);
        return "viewBookings"; // Return the name of your JSP file
    }
    
    @GetMapping("/fetchFare")
    @ResponseBody
    public Double fetchFare(@RequestParam String fromLocation, @RequestParam String toLocation) {
        CabFare cabFare = cabFareService.getFareByLocations(fromLocation, toLocation);
        return cabFare != null ? cabFare.getFare() : null;
    }
}
