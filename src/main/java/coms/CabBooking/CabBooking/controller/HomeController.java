package coms.CabBooking.CabBooking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @GetMapping("/home")
    public String showHomePage() {
        return "home";
    }

    @RequestMapping(value = "/redirect", method = {RequestMethod.GET, RequestMethod.POST})
    public String redirect(@RequestParam(name = "loginType", required = false) String loginType) {
        System.out.println("Received loginType: " + loginType);

        if ("user".equals(loginType)) {
            return "redirect:/register";
        } else if ("admin".equals(loginType)) {
            return "redirect:/adminlogin";
        } else {
            return "redirect:/default.jsp";
        }
    }
}
