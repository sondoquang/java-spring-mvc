package com.fpt.laptopshop.controller.client;

import java.net.http.HttpRequest;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fpt.laptopshop.domain.Order;
import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.service.iservice.IOrderService;
import com.fpt.laptopshop.service.iservice.IUserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ManagerOrderHistoryController {

    private final IOrderService orderService;
    private final IUserService userService;

    public ManagerOrderHistoryController(IOrderService orderService, IUserService userService) {
        this.orderService = orderService;
        this.userService = userService;
    }

    @GetMapping("/order-history")
    public String getOrderHistory(Model model, HttpServletRequest request) {
        User user = userService.findByEmail(request.getSession().getAttribute("email").toString());
        List<Order> orders = orderService.findByUser(user);
        model.addAttribute("orders", orders);
        return "client/order/Show";
    }

}
