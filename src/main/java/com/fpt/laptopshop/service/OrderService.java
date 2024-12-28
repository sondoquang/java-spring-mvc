package com.fpt.laptopshop.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.fpt.laptopshop.domain.Cart;
import com.fpt.laptopshop.domain.CartDetail;
import com.fpt.laptopshop.domain.Order;
import com.fpt.laptopshop.domain.OrderDetail;
import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.domain.User;
import com.fpt.laptopshop.repository.CartDetailRepository;
import com.fpt.laptopshop.repository.CartRepository;
import com.fpt.laptopshop.repository.OrderDetailRepository;
import com.fpt.laptopshop.repository.OrderRepository;
import com.fpt.laptopshop.repository.ProductRepository;
import com.fpt.laptopshop.service.iservice.IOrderService;

import jakarta.servlet.http.HttpSession;

@Service
public class OrderService implements IOrderService {

    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final ProductRepository productRepository;

    public OrderService(CartRepository cartRepository, CartDetailRepository cartDetailRepository,
            OrderRepository orderRepository, OrderDetailRepository orderDetailRepository,
            ProductRepository productRepository) {
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.productRepository = productRepository;
    }

    @Override
    public void createPlaceOrder(User user, Map<String, String> maps, HttpSession session) {

        // step 1: get cart - cart Details
        List<CartDetail> cartDetails = null;
        Double totalPrice = 0.0;
        Cart cart = cartRepository.findByUser(user);
        if (cart != null) {
            cartDetails = cart.getCartDetails();
            if (!cartDetails.isEmpty()) {
                for (CartDetail cd : cartDetails) {
                    totalPrice += cd.getPrice();
                }
            }
        }
        // step 2: create order
        // create order //
        Order order = new Order();
        order.setUser(user);
        order.setReceiverName(maps.get("receiverName"));
        order.setReceiverAddress("receiverAddress");
        order.setReceiverPhone("receiverPhone");
        order.setTotalPrice(totalPrice);
        order.setStatus(true);
        order = orderRepository.save(order);
        // step 3: create order - detail and delete cartDetail and update inventory
        // product
        for (CartDetail cd : cartDetails) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setOrder(order);
            orderDetail.setProduct(cd.getProduct());
            orderDetail.setQuantity(cd.getQuantity());
            orderDetail.setPrice(cd.getPrice());
            orderDetailRepository.save(orderDetail);
            // update inventory product //
            Product product = productRepository.findById(cd.getProduct().getId()).get();
            product.setQuantity(product.getQuantity() - cd.getQuantity());
            productRepository.save(product);
            // delete cartDetail //
            cartDetailRepository.deleteById(cd.getId());
        }
        // step 4: remove cart
        cartRepository.deleteById(cart.getId());

        // step 5: update session
        session.setAttribute("sumCart", 0);
    }

    @Override
    public Page<Order> findAll(Pageable pageable) {
        return orderRepository.findAll(pageable);
    }

    @Override
    public Order findById(long id) {
        Optional<Order> oOrder = orderRepository.findById(id);
        if (oOrder.isPresent()) {
            return oOrder.get();
        }
        return null;
    }

    @Override
    public Order update(long id, boolean status) {
        Optional<Order> saveOrder = orderRepository.findById(id);
        if (saveOrder.isPresent()) {
            Order order = saveOrder.get();
            order.setStatus(status);
            return orderRepository.save(order);
        }
        return null;
    }

    @Override
    public long getCountOrder() {
        return orderRepository.count();
    }

    @Override
    public List<Order> findByUser(User user) {
        return orderRepository.findByUser(user);
    }

}
