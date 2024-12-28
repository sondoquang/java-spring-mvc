package com.fpt.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.fpt.laptopshop.domain.Cart;
import com.fpt.laptopshop.domain.CartDetail;
import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.service.iservice.ICartDetailService;
import com.fpt.laptopshop.service.iservice.ICartService;
import com.fpt.laptopshop.service.iservice.IOrderService;
import com.fpt.laptopshop.service.iservice.IProductService;
import com.fpt.laptopshop.service.iservice.IUserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.server.PathParam;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {

    private final IProductService productService;
    private final ICartService cartService;
    private final ICartDetailService cartDetailService;
    private final IUserService userService;
    private final IOrderService orderService;

    public ItemController(IProductService productService, ICartService cartService,
            ICartDetailService cartDetailService, IUserService userService, IOrderService orderService) {
        this.productService = productService;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
        this.userService = userService;
        this.orderService = orderService;
    }

    @GetMapping("/products")
    public String getProducts(Model model,
            @RequestParam("page") Optional<String> pageNo,
            @RequestParam("name") Optional<String> nameOptional) {
        int limit = 6;
        int page = 1;
        try {
            page = Integer.parseInt(pageNo.get());
        } catch (Exception e) {
            // TODO: handle exception
        }

        String name = nameOptional.get();

        Pageable pageable = PageRequest.of(page - 1, limit);
        Page<Product> list = productService.findAll(name, pageable);
        List<Product> products = list.getContent();
        model.addAttribute("products", products);
        model.addAttribute("size", list.getTotalPages());
        model.addAttribute("pageNo", page);
        return "client/product/Products";
    }

    @GetMapping("/products/{productId}/detail")
    public String getDetailProductPage(Model model, @PathVariable long productId) {
        Product product = productService.findById(productId);
        model.addAttribute("product", product);
        return "client/product/Detail";
    }

    @PostMapping("/product/{productId}/add")
    public String postAddProduct(@PathVariable long productId, HttpServletRequest request,
            @PathParam("quantity") String quantity) {
        HttpSession session = request.getSession(false);
        String email = session.getAttribute("email").toString();
        if (quantity == null) {
            Cart cart = cartService.addProductToCart(email, productId, 1);
            session.setAttribute("sumCart", cart.getSum());
            return "redirect:/home";
        }
        Cart cart = cartService.addProductToCart(email, productId, Integer.parseInt(quantity));
        session.setAttribute("sumCart", cart.getSum());
        return "redirect:/products/" + productId + "/detail";

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

    @PostMapping("/place-order")
    public String postPlaceOrder(HttpServletRequest request,
            @RequestParam("receiverName") String name,
            @RequestParam("receiverAddress") String address,
            @RequestParam("receiverPhone") String phone) {

        HttpSession session = request.getSession(false);
        String email = session.getAttribute("email").toString();
        User user = userService.findByEmail(email);
        Map<String, String> values = new HashMap<>();
        values.put("receiverName", name);
        values.put("receiverAddress", name);
        values.put("receiverPhone", name);

        // add order for user //
        orderService.createPlaceOrder(user, values, session);
        return "client/cart/PaymentSuccess";
    }

}
