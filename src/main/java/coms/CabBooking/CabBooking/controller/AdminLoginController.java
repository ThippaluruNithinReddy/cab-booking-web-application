package coms.CabBooking.CabBooking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminLoginController {
	
	@GetMapping("/adminlogin")
    public String showHomePage() {
        return "adminlogin";
    }

    @PostMapping("/adminlogin")
    public String adminLogin(@RequestParam(name = "username") String username,
                             @RequestParam(name = "password") String password) {
        
        if ("admin@gmail.com".equals(username) && "tnr@123".equals(password)) {
    
            return "redirect:/addfares";
        } else {
           
            return "redirect:/adminlogin.jsp?error=1";
        }
    }
}
