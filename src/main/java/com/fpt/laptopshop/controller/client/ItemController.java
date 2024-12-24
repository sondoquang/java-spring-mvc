package com.fpt.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.service.iservice.IProductService;

@Controller
public class ItemController {

    private final IProductService productService;

    public ItemController(IProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/products/{productId}/detail")
    public String getDetailProductPage(Model model, @PathVariable long productId) {
        Product product = productService.findById(productId);
        model.addAttribute("product", product);
        return "client/product/Detail";
    }

}
