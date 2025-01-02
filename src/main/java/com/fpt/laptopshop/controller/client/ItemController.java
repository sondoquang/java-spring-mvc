package com.fpt.laptopshop.controller.client;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.fpt.laptopshop.domain.Cart;
import com.fpt.laptopshop.domain.CartDetail;
import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.domain.Product_;
import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.domain.dto.ProductCriteriaDto;
import com.fpt.laptopshop.service.VNpayService;
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
    private final VNpayService vNpayService;

    public ItemController(IProductService productService, ICartService cartService,
            ICartDetailService cartDetailService, IUserService userService, IOrderService orderService,
            VNpayService vNpayService) {
        this.productService = productService;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
        this.userService = userService;
        this.orderService = orderService;
        this.vNpayService = vNpayService;
    }

    @GetMapping("/products")
    public String getProducts(Model model, ProductCriteriaDto productCriteriaDto, HttpServletRequest request) {
        int limit = 6;
        int page = 1;
        try {
            page = Integer.parseInt(productCriteriaDto.getPage().get());
        } catch (Exception e) {
            // TODO: handle exception
        }

        String qs = request.getQueryString();
        if (qs != null && !qs.isBlank()) {
            qs = qs.replace("page=" + page, "");
        }

        Pageable pageable = PageRequest.of(page - 1, limit);
        if (productCriteriaDto.getSort() != null && productCriteriaDto.getSort().isPresent()) {
            String sort = productCriteriaDto.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(page - 1, limit, Sort.by(Product_.PRICE).ascending());
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(page - 1, limit, Sort.by(Product_.PRICE).descending());
            }
        }
        Page<Product> list = productService.findAllWithSpec(pageable, productCriteriaDto);
        List<Product> products = list.getContent();
        model.addAttribute("products", products);
        model.addAttribute("size", list.getTotalPages());
        model.addAttribute("pageNo", page);
        model.addAttribute("queryString", qs);
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
            @RequestParam("receiverPhone") String phone,
            @RequestParam("paymentMethod") String paymentMethod,
            @RequestParam("totalPrice") String totalPrice) throws NumberFormatException, UnsupportedEncodingException {

        HttpSession session = request.getSession(false);
        String email = session.getAttribute("email").toString();
        User user = userService.findByEmail(email);
        Map<String, String> values = new HashMap<>();
        values.put("receiverName", name);
        values.put("receiverAddress", name);
        values.put("receiverPhone", name);
        values.put("paymentMethod", paymentMethod);

        final String uuid = UUID.randomUUID().toString().replace("-", "");
        values.put("uuid", uuid);
        // add order for user //
        orderService.createPlaceOrder(user, values, session);

        if (!paymentMethod.equals("COD")) {
            // to do: redirect to vnPay
            String ip = vNpayService.getIpAddress(request);
            String vnpUrl = vNpayService.generateVNPayURL(Double.parseDouble(totalPrice), uuid, ip);
            return "redirect:" + vnpUrl;
        }
        return "redirect:/thanks";
    }

    @GetMapping("/thanks")
    public String getPaymentSuccess(Model model,
            @RequestParam("vnp_TxnRef") Optional<String> paymentRef,
            @RequestParam("vnp_ResponseCode") Optional<String> vnpayResponseCode) {
        if (vnpayResponseCode.isPresent() && paymentRef.isPresent()) {
            // check trạng thái thanh toán //
            String paymentStatus = vnpayResponseCode.get().equals("00") ? "PAYMENT_SUCCESS" : "PAYMENT_FAILED";
            orderService.updatePaymentRef(paymentRef.get(), paymentStatus);
        }
        return "client/cart/PaymentSuccess";
    }

}
