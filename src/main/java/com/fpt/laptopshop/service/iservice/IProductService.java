package com.fpt.laptopshop.service.iservice;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.fpt.laptopshop.domain.Product;

public interface IProductService {

    Page<Product> findAll(String name, Pageable page);

    Product findById(long id);

    Product updateProduct(Product product);

    Product addProduct(Product product);

    void deleteProduct(long id);

    boolean checkQuantityProductById(long id, int quantity);

    long getCountProduct();
}
