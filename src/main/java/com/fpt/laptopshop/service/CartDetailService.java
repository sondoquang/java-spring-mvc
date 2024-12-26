package com.fpt.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.fpt.laptopshop.domain.Cart;
import com.fpt.laptopshop.domain.CartDetail;
import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.repository.CartDetailRepository;
import com.fpt.laptopshop.repository.CartRepository;
import com.fpt.laptopshop.repository.ProductRepository;
import com.fpt.laptopshop.service.iservice.ICartDetailService;

import jakarta.servlet.http.HttpSession;

@Service
public class CartDetailService implements ICartDetailService {

    private final CartDetailRepository cartDetailRepository;
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final ProductService productService;

    public CartDetailService(CartDetailRepository cartDetailRepository, ProductRepository productRepository,
            CartRepository cartRepository, ProductService productService) {
        this.cartDetailRepository = cartDetailRepository;
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.productService = productService;
    }

    @Override
    public List<CartDetail> findAll() {
        return cartDetailRepository.findAll();
    }

    @Override
    public void removeItemFromCartDetail(long productId, long cartId, HttpSession session) {
        Product product = productRepository.findById(productId).get();
        Cart cart = cartRepository.findById(cartId).get();
        CartDetail cartDetail = cartDetailRepository.findByCartAndProduct(cart, product);
        if (cartDetail != null) {
            cartDetailRepository.deleteById(cartDetail.getId());
            if (cart.getSum() == 1) {
                cartRepository.deleteById(cartId);
                session.setAttribute("sumCart", 0);
            } else {
                cart.setSum(cart.getSum() - 1);
                cart = cartRepository.save(cart);
                session.setAttribute("sumCart", cart.getSum());
            }
        } else
            throw new RuntimeException("Not found !");
    }

    @Override
    public int updateQuantityProduct(List<CartDetail> cartDetails) {
        int result = -1;
        for (CartDetail cd : cartDetails) {
            Optional<CartDetail> cdOptional = cartDetailRepository.findById(cd.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                if (productService.checkQuantityProductById(currentCartDetail.getProduct().getId(),
                        (int) cd.getQuantity())) {
                    currentCartDetail.setQuantity(cd.getQuantity());
                    currentCartDetail.setPrice(currentCartDetail.getProduct().getPrice() * cd.getQuantity());
                    cartDetailRepository.save(currentCartDetail);
                    result = 1;
                } else {
                    return Integer.parseInt(currentCartDetail.getProduct().getId() + "");
                }
            }
        }
        return result;
    }

}
