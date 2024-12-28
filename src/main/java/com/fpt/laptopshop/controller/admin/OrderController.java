package com.fpt.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.fpt.laptopshop.domain.Order;
import com.fpt.laptopshop.domain.OrderDetail;
import com.fpt.laptopshop.service.iservice.IOrderService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderController {

    private final IOrderService orderService;

    public OrderController(IOrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/orders")
    public String getDashboard(Model model, @RequestParam("page") Optional<String> pageNo) {
        int limit = 6;
        int page = 1;
        try {
            page = Integer.parseInt(pageNo.get());
        } catch (Exception e) {
            // TODO: handle exception
        }
        Pageable pageable = PageRequest.of(page - 1, limit);
        Page<Order> list = orderService.findAll(pageable);
        List<Order> orders = list.getContent();
        model.addAttribute("orders", orders);
        model.addAttribute("size", list.getTotalPages());
        model.addAttribute("pageNo", page);
        return "admin/order/Show";
    }

    @GetMapping("/admin/order/{orderId}/view")
    public String getOrderDetailByUserId(Model model, @PathVariable long orderId) {
        Order order = orderService.findById(orderId);
        List<OrderDetail> orderDetails = order.getOrderDetails();
        model.addAttribute("orderDetails", orderDetails);
        return "admin/order/View";
    }

    @GetMapping("/admin/order/{orderId}/update")
    public String getMethodName(Model model, @PathVariable long orderId) {
        Order order = orderService.findById(orderId);
        model.addAttribute("order", order);
        return "admin/order/Update";
    }

    @PostMapping("/admin/order/update")
    public String postUpdateOrder(Model model, @ModelAttribute("order") Order order) {
        order = orderService.update(order.getId(), order.getStatus());
        return "redirect:/admin/orders";
    }

}
