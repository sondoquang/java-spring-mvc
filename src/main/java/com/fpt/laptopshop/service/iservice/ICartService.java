package com.fpt.laptopshop.service.iservice;

import com.fpt.laptopshop.domain.Cart;

public interface ICartService {
    Cart addProductToCart(String email, long productId);

    Cart findByUser(String email);

}
