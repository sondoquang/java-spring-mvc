package com.fpt.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.fpt.laptopshop.domain.Cart;
import com.fpt.laptopshop.domain.CartDetail;
import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.service.iservice.ICartDetailService;
import com.fpt.laptopshop.service.iservice.ICartService;
import com.fpt.laptopshop.service.iservice.IProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ItemController {

    private final IProductService productService;
    private final ICartService cartService;
    private final ICartDetailService cartDetailService;

    public ItemController(IProductService productService, ICartService cartService,
            ICartDetailService cartDetailService) {
        this.productService = productService;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
    }

    @GetMapping("/products/{productId}/detail")
    public String getDetailProductPage(Model model, @PathVariable long productId) {
        Product product = productService.findById(productId);
        model.addAttribute("product", product);
        return "client/product/Detail";
    }

    @PostMapping("/product/{productId}/add")
    public String postAddProduct(@PathVariable long productId, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = session.getAttribute("email").toString();
        Cart cart = cartService.addProductToCart(email, productId);
        session.setAttribute("sumCart", cart.getSum());
        return "redirect:/home";
    }

    @GetMapping("/carts")
    public String getMethodName(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = session.getAttribute("email").toString();
        Cart cart = cartService.findByUser(email);
        List<CartDetail> list = null;
        if (cart != null) {
            list = cart.getCartDetails();
        }
        long total = 0;
        if (list != null) {
            for (CartDetail cd : list) {
                total += cd.getPrice();
            }
        }
        model.addAttribute("totalPrice", total);
        model.addAttribute("list", list);
        model.addAttribute("cart", cart);
        return "client/cart/Show";
    }

    @PostMapping("/carts/{cartId}/cart/{productId}/product/delete")
    public String postMethodName(@PathVariable long cartId, @PathVariable long productId, HttpServletRequest request) {
        HttpSession session = request.getSession();
        cartDetailService.removeItemFromCartDetail(productId, cartId, session);
        return "redirect:/carts";
    }

    @PostMapping("/confirm-checkout")
    public String postMethodName(Model model, @ModelAttribute("cart") Cart cart, HttpServletRequest request) {
        List<CartDetail> list = cart == null ? new ArrayList<>() : cart.getCartDetails();
        int result = cartDetailService.updateQuantityProduct(list);
        if (result != 1) {
            Product product = productService.findById(result);
            model.addAttribute("message", "Sản phẩm: " + product.getName() + " hiện tại không đủ hàng (Max:"
                    + product.getQuantity() + " )");
            return "redirect:/carts";
        }
        // if update product success //

        HttpSession session = request.getSession(false);
        String email = session.getAttribute("email").toString();
        Cart cartShow = cartService.findByUser(email);
        if (cartShow != null) {
            list = cartShow.getCartDetails();
        }
        long total = 0;
        if (list != null) {
            for (CartDetail cd : list) {
                total += cd.getPrice();
            }
        }
        model.addAttribute("totalPrice", total);
        model.addAttribute("list", list);
        model.addAttribute("cart", cartShow);
        return "client/cart/Payment";

    }

}
