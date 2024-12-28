package com.fpt.laptopshop.service.iservice;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.fpt.laptopshop.domain.Order;
import com.fpt.laptopshop.domain.User;

import jakarta.servlet.http.HttpSession;

public interface IOrderService {
    void createPlaceOrder(User user, Map<String, String> maps, HttpSession session);

    Page<Order> findAll(Pageable pageable);

    Order findById(long id);

    List<Order> findByUser(User user);

    Order update(long id, boolean status);

    long getCountOrder();

}
