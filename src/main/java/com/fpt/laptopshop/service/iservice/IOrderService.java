package com.fpt.laptopshop.service.iservice;

import java.util.List;
import java.util.Map;

import com.fpt.laptopshop.domain.Order;
import com.fpt.laptopshop.domain.User;

import jakarta.servlet.http.HttpSession;

public interface IOrderService {
    void createPlaceOrder(User user, Map<String, String> maps, HttpSession session);

    List<Order> findAll();

    Order findById(long id);

    Order update(long id, boolean status);

    long getCountOrder();
}
