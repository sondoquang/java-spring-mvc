package com.fpt.laptopshop.service.iservice;

import java.util.List;

import com.fpt.laptopshop.domain.CartDetail;

import jakarta.servlet.http.HttpSession;

public interface ICartDetailService {
    List<CartDetail> findAll();

    void removeItemFromCartDetail(long productId, long cartId, HttpSession session);

    int updateQuantityProduct(List<CartDetail> cartDetails);
}
