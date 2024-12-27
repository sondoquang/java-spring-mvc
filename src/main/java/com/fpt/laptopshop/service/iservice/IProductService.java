package com.fpt.laptopshop.service.iservice;

import java.util.List;

import com.fpt.laptopshop.domain.Product;

public interface IProductService {
    List<Product> findAll();

    Product findById(long id);

    Product updateProduct(Product product);

    Product addProduct(Product product);

    void deleteProduct(long id);

    boolean checkQuantityProductById(long id, int quantity);

    long getCountProduct();
}
