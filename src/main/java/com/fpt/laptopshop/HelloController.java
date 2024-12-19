package com.fpt.laptopshop;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
public class HelloController {

    @GetMapping("/")
    public String index() {
        return "Hello Java Spring Boot Update";
    }

    @GetMapping("/user")
    public String userPage() {
        return "User Page";
    }

    @GetMapping("/admin")
    public String adminPage() {
        return "Admin Page";
    }

}
