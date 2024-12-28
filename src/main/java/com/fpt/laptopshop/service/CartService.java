package com.fpt.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.fpt.laptopshop.domain.Cart;
import com.fpt.laptopshop.domain.CartDetail;
import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.repository.CartDetailRepository;
import com.fpt.laptopshop.repository.CartRepository;
import com.fpt.laptopshop.repository.ProductRepository;
import com.fpt.laptopshop.repository.UserRepository;
import com.fpt.laptopshop.service.iservice.ICartService;

@Service
public class CartService implements ICartService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserRepository userRepository;

    public CartService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserRepository userRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userRepository = userRepository;
    }

    @Override
    public Cart addProductToCart(String email, long productId, int quantity) {
        User user = userRepository.findByEmail(email);
        Cart cart = null;
        if (user != null) {
            /* Check valid user */
            cart = cartRepository.findByUser(user);
            if (cart == null) {
                /* if cart not valid --> create cart for user */
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);
                cart = cartRepository.save(newCart);
            }
            // find product by id //
            Optional<Product> oProduct = productRepository.findById(productId);
            if (oProduct.isPresent()) {
                Product product = oProduct.get();
                CartDetail cartDetail = cartDetailRepository.findByCartAndProduct(cart, product);
                if (cartDetail == null) {
                    cart.setSum(cart.getSum() + 1);
                    cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(product);
                    cartDetail.setPrice(product.getPrice());
                    cartDetail.setQuantity(quantity);
                } else {
                    cartDetail.setQuantity(cartDetail.getQuantity() + 1);
                    cartDetail.setPrice(cartDetail.getPrice() * cartDetail.getQuantity());
                }
                cartDetailRepository.save(cartDetail);
            }
        }
        return cart;
    }

    @Override
    public Cart findByUser(String email) {
        User user = userRepository.findByEmail(email);
        if (email != null) {
            return cartRepository.findByUser(user);
        }
        return null;
    }

}
