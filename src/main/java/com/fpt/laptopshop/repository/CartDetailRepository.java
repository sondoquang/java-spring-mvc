package com.fpt.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fpt.laptopshop.domain.Cart;
import com.fpt.laptopshop.domain.CartDetail;
import com.fpt.laptopshop.domain.Product;

public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByCartAndProduct(Cart cart, Product product);
}
