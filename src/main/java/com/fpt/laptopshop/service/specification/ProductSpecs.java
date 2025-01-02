package com.fpt.laptopshop.service.specification;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.domain.Product_;

public class ProductSpecs {

    public static Specification<Product> factoryEqual(List<String> factory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder
                .in(root.get(Product_.FACTORY)).value(factory);
    }

    public static Specification<Product> targetEqual(List<String> target) {
        return (root, query, criteriaBuilder) -> criteriaBuilder
                .in(root.get(Product_.TARGET)).value(target);
    }

    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder
                .like(root.get(Product_.NAME), "%" + name + "%");

    }

    public static Specification<Product> minPrice(Double minPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder
                .ge(root.get(Product_.PRICE), minPrice);
    }

    public static Specification<Product> maxPrice(Double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder
                .le(root.get(Product_.PRICE), maxPrice);
    }

    public static Specification<Product> matchPrice(Double minPrice, Double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder
                .and(
                        criteriaBuilder.ge(root.get(Product_.PRICE), minPrice),
                        criteriaBuilder.le(root.get(Product_.PRICE), maxPrice));

    }

    public static Specification<Product> matchPriceWithBetween(Double minPrice, Double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder
                .between(root.get(Product_.PRICE), minPrice, maxPrice);
    }

    public static Specification<Product> findAllSpecByLandPriceRange(List<String> price, Pageable pageable) {
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
        return combinedSpec;
    }

}
