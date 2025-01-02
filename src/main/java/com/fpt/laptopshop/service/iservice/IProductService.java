package com.fpt.laptopshop.service.iservice;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.domain.dto.ProductCriteriaDto;

public interface IProductService {

    Page<Product> findAll(Pageable page);

    Page<Product> findAllSpecByName(String name, Pageable page);

    Page<Product> findAllWithSpec(Pageable page, ProductCriteriaDto productCriteriaDto);

    Page<Product> findAllSpecByFactory(List<String> name, Pageable page);

    Page<Product> findAllSpecByMinPrice(Double minPrice, Pageable page);

    Page<Product> findAllSpecByMaxPrice(Double maxPrice, Pageable page);

    Page<Product> findAllSpecByLandPriceRange(List<String> price, Pageable pageable);

    Product findById(long id);

    Product updateProduct(Product product);

    Product addProduct(Product product);

    void deleteProduct(long id);

    boolean checkQuantityProductById(long id, int quantity);

    long getCountProduct();
}
