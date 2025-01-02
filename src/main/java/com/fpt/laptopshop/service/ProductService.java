package com.fpt.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.domain.dto.ProductCriteriaDto;
import com.fpt.laptopshop.repository.ProductRepository;
import com.fpt.laptopshop.service.iservice.IProductService;
import com.fpt.laptopshop.service.specification.ProductSpecs;

@Service
public class ProductService implements IProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public Page<Product> findAll(Pageable page) {
        return productRepository.findAll(page);
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

    @Override
    public Page<Product> findAllSpecByFactory(List<String> factory, Pageable page) {
        return productRepository.findAll(ProductSpecs.factoryEqual(factory), page);
    }

    @Override
    public Page<Product> findAllSpecByMinPrice(Double minPrice, Pageable page) {
        return productRepository.findAll(ProductSpecs.minPrice(minPrice), page);
    }

    @Override
    public Page<Product> findAllSpecByMaxPrice(Double maxPrice, Pageable page) {
        return productRepository.findAll(ProductSpecs.maxPrice(maxPrice), page);
    }

    @Override
    public Page<Product> findAllSpecByLandPriceRange(List<String> price, Pageable pageable) {
        Specification<Product> combinedSpec = (root, query, criteriaBuilder) -> criteriaBuilder.disjunction();
        int count = 0;
        for (String p : price) {
            double min = 0.0;
            double max = 0.0;
            switch (p) {
                case "duoi-10-trieu":
                    min = 0;
                    max = 10000000;
                    count++;
                    break;
                case "tu-10-15-trieu":
                    min = 10000000;
                    max = 15000000;
                    count++;
                    break;
                case "tu-15-20-trieu":
                    min = 15000000;
                    max = 20000000;
                    count++;
                    break;
                case "tren-20-trieu":
                    min = 20000000;
                    max = 10e10;
                    count++;
                    break;
            }

            if (min != 0 && max != 0) {
                Specification<Product> rageSpec = ProductSpecs.matchPriceWithBetween(min, max);
                combinedSpec = combinedSpec.or(rageSpec);
            }
        }

        if (count == 0) {
            return productRepository.findAll(pageable);
        }
        return productRepository.findAll(combinedSpec, pageable);
    }

    @Override
    public Page<Product> findAllSpecByName(String name, Pageable page) {
        return productRepository.findAll(ProductSpecs.nameLike(name), page);
    }

    @Override
    public Page<Product> findAllWithSpec(Pageable page, ProductCriteriaDto productCriteriaDto) {
        if (productCriteriaDto.getTarget() == null
                && productCriteriaDto.getFactory() == null
                && productCriteriaDto.getPrice() == null) {
            return this.productRepository.findAll(page);
        }

        Specification<Product> combinedSpec = Specification.where(null);

        if (productCriteriaDto.getTarget() != null && productCriteriaDto.getTarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.targetEqual(productCriteriaDto.getTarget().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDto.getFactory() != null && productCriteriaDto.getFactory().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs.factoryEqual(productCriteriaDto.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        if (productCriteriaDto.getPrice() != null &&
                productCriteriaDto.getPrice().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecs
                    .findAllSpecByLandPriceRange(productCriteriaDto.getPrice().get(), page);
            combinedSpec = combinedSpec.and(currentSpecs);
        }

        return this.productRepository.findAll(combinedSpec, page);
    }

}
