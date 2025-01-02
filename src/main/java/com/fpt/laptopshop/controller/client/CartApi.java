package com.fpt.laptopshop.controller.client;

import org.springframework.web.bind.annotation.RestController;

import com.fpt.laptopshop.domain.Cart;
import com.fpt.laptopshop.service.CartService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

class CartRequest {
    private long quantity;
    private long productId;

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }
}

@RestController
public class CartApi {
    private final CartService cartService;

    public CartApi(CartService cartService) {
        this.cartService = cartService;
    }

    @PostMapping("/api/v1/product/add")
    public ResponseEntity<Integer> addProductToCart(@RequestBody CartRequest cartRequest,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        cartRequest.setQuantity(cartRequest.getQuantity() == 0 ? 1 : cartRequest.getQuantity());
        Cart cart = cartService.addProductToCart(email, cartRequest.getProductId(), (int) cartRequest.getQuantity());
        request.getSession().setAttribute("sumCart", cart.getSum());
        return ResponseEntity.ok().body(cart.getSum());
    }

}
