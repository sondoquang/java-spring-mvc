package com.fpt.laptopshop;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
public class HelloController {

    @GetMapping("/hello")
    public String index() {
        return "Hello Java Spring Boot with SonDoItNow";
    }

}
