package com.fpt.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.service.iservice.IProductService;

@Controller
public class HomePageController {
    private final IProductService productService;

    public HomePageController(IProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/home")
    public String getHomePage(Model model) {
        List<Product> products = productService.findAll();
        model.addAttribute("products", products);
        return "/client/homepage/Show";
    }

}
