package coms.CabBooking.CabBooking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import coms.CabBooking.CabBooking.entities.Vehicle;
import coms.CabBooking.CabBooking.service.VehicleDetailsService;

import java.util.List;

@Controller
public class VehicleDetailsController {

    @Autowired
    VehicleDetailsService vds;

    @GetMapping("/addvehicle")
    public String addVehicleForm(Model model) {
        model.addAttribute("ve", new Vehicle());
        return "AddVehicle";
    }

    @PostMapping("/newvehicleinfo")
    public String addVehicle(@ModelAttribute Vehicle ve, Model model) {
        String result = vds.addVehicleDetails(ve);
        if ("success".equals(result)) {
            model.addAttribute("info", "Vehicle Details added successfully");
            model.addAttribute("ve", new Vehicle());
            return "redirect:/allVehicles"; // Redirect to the updated vehicle list
        }
        model.addAttribute("error", "Failed to add Vehicle");
        return "AddVehicle";
    }

    @GetMapping("/allVehicles")
    public String getAllVehicles(Model model) {
        List<Vehicle> vehicles = vds.getAllVehicles();
        model.addAttribute("vehicleList", vehicles);
        model.addAttribute("updateVehicle", new Vehicle());
        return "allVehicles";
    }

    @PostMapping("/updateVehicle")
    public String updateVehicle(@ModelAttribute Vehicle updateVehicle, Model model) {
        String result = vds.updateVehicle(updateVehicle);
        if ("success".equals(result)) {
            model.addAttribute("info", "Vehicle updated successfully");
        } else {
            model.addAttribute("error", "Failed to update Vehicle");
        }
        return "redirect:/allVehicles"; // Redirect to the updated vehicle list
    }

    @GetMapping("/deleteVehicle/{vid}")
    public String deleteVehicle(@PathVariable Long vid, Model model) {
        vds.deleteVehicle(vid);
        model.addAttribute("info", "Vehicle deleted successfully");
        return "redirect:/allVehicles"; // Redirect to the updated vehicle list
    }
}
