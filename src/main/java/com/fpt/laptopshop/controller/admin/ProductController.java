package com.fpt.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {

    @GetMapping("/admin/products")
    public String getDashboard() {
        return "/admin/product/Show";
    }

}
