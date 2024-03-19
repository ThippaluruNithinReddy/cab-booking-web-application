package coms.CabBooking.CabBooking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import coms.CabBooking.CabBooking.entities.CabFare;
import coms.CabBooking.CabBooking.service.CabFareService;

import java.util.List;

@Controller
public class CabFareController {

    @Autowired
    private CabFareService cabFareService;

    @GetMapping("/addfares")
    public String addFaresForm(Model model) {
        model.addAttribute("cbf", new CabFare());
        return "AddFares";
    }

    @PostMapping("/newcabfareinfo")
    public String addFares(@ModelAttribute CabFare cbf, Model model) {
        String res = cabFareService.addFares(cbf);
        if ("success".equals(res)) {
            model.addAttribute("info", "Fare is added");
            model.addAttribute("cbf", new CabFare());
            return "AddFares"; // Redirect to the form page or another page
        }
        return "error"; // Handle errors appropriately
    }

    @GetMapping("/allCabFares")
    public String getAllCabFares(Model model) {
        List<CabFare> cabFares = cabFareService.getAllCabFares();
        model.addAttribute("cbflist", cabFares);
        model.addAttribute("updateCbf", new CabFare());
        return "allCabFares";
    }

    @PostMapping("/updateCabFare")
    public String updateCabFare(@ModelAttribute CabFare updateCbf, Model model) {
        String result = cabFareService.updateCabFare(updateCbf);
        if ("success".equals(result)) {
            model.addAttribute("info", "Cab Fare updated successfully");
        } else {
            model.addAttribute("error", "Failed to update Cab Fare");
        }

        // Get the updated list of Cab Fares
        List<CabFare> cabFares = cabFareService.getAllCabFares();
        model.addAttribute("cbflist", cabFares);
        model.addAttribute("updateCbf", new CabFare());

        return "allCabFares"; // Return the JSP page to display the updated data
    }

    @GetMapping("/delcbf/{id}")
    public String deleteCabFare(@PathVariable Long id, Model model) {
        cabFareService.deleteCabFare(id);
        model.addAttribute("info", "Cab Fare deleted successfully");
        return "redirect:/allCabFares";
    }

}
