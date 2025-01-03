package com.fpt.laptopshop.controller.client;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
        Pageable pageable = PageRequest.of(0, 8);
        Page<Product> list = productService.findAll(pageable);
        List<Product> products = list.getContent();
        model.addAttribute("products", products);
        return "client/homepage/Show";
    }

    @GetMapping("/access-deny")
    public String getDenyPage() {
        return "client/auth/Deny";
    }

}
