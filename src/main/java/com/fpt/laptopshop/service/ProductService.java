package com.fpt.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.repository.ProductRepository;
import com.fpt.laptopshop.service.iservice.IProductService;

@Service
public class ProductService implements IProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Product findById(long id) {
        Product product = productRepository.findById(id).get();
        if (product == null)
            throw new RuntimeException("Not found product with id: " + id);
        return product;
    }

    @Override
    public Product updateProduct(Product product) {
        Product saveProduct = findById(product.getId());
        if (product.getImage() == null) {
            product.setImage(saveProduct.getImage());
        }
        if (saveProduct != null) {
            return productRepository.save(product);
        }
        throw new RuntimeException("Not found product with id: " + product.getId());
    }

    @Override
    public void deleteProduct(long id) {
        Product product = findById(id);
        if (product == null) {
            throw new RuntimeException("Not found product with id: " + id);
        }
        productRepository.delete(product);
    }

    @Override
    public Product addProduct(Product product) {
        Product addProduct = productRepository.save(product);
        if (addProduct != null) {
            return product;
        }
        throw new RuntimeException("Add product don't successfully !");
    }

    @Override
    public boolean checkQuantityProductById(long id, int quantity) {
        Optional<Product> oProduct = productRepository.findById(id);
        if (oProduct.isPresent()) {
            int inventory = (int) oProduct.get().getQuantity();
            if (quantity > inventory) {
                return false;
            }
        }
        return true;
    }

    @Override
    public long getCountProduct() {
        return productRepository.count();
    }
}
