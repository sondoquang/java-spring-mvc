package com.fpt.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderCustomerController {

    @GetMapping("/payment")
    public String getPayment() {
        return "client/cart/PaymentSuccess";
    }

}
