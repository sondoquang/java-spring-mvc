package com.fpt.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fpt.laptopshop.service.iservice.IOrderService;
import com.fpt.laptopshop.service.iservice.IProductService;
import com.fpt.laptopshop.service.iservice.IUserService;

@Controller
public class DashBoardController {

    private final IUserService userService;
    private final IProductService productService;
    private final IOrderService orderService;

    public DashBoardController(IUserService userService, IProductService productService, IOrderService orderService) {
        this.userService = userService;
        this.productService = productService;
        this.orderService = orderService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUser", userService.getCountUser());
        model.addAttribute("countProduct", productService.getCountProduct());
        model.addAttribute("countOrder", orderService.getCountOrder());
        return "admin/dashboard/Show";
    }

}
