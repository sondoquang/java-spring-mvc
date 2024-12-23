package com.fpt.laptopshop.domain;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name = "Products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @NotBlank(message = "Tên sản phẩm không được để trống !")
    private String name;
    private double price;
    private String image;

    @NotNull
    @NotBlank(message = "DetailDesc không được để trống !")
    @Column(columnDefinition = "MEDIUMTEXT")
    private String detailDesc;

    @NotNull
    @NotBlank(message = "ShortDesc không được để trống !")
    @Column(columnDefinition = "MEDIUMTEXT")
    private String shortDesc;

    @NotNull
    @DecimalMin(value = "0", message = "Số lượng cần lớn hơn hoặc bằng 1")
    private long quantity;
    private long sold;
    private String factory;
    private String target;

    @OneToMany(mappedBy = "product")
    private List<OrderDetail> orderDetails;

    public Product() {
    }

    public Product(String name, double price, String image, String detailDesc, String shortDesc,
            long quantity, long sold, String factory, String target, List<OrderDetail> orderDetails) {
        this.name = name;
        this.price = price;
        this.image = image;
        this.detailDesc = detailDesc;
        this.shortDesc = shortDesc;
        this.quantity = quantity;
        this.sold = sold;
        this.factory = factory;
        this.target = target;
        this.orderDetails = orderDetails;
    }

    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", price=" + price + ", image=" + image + ", detailDesc="
                + detailDesc + ", shortDesc=" + shortDesc + ", quantity=" + quantity + ", sold=" + sold + ", factory="
                + factory + ", target=" + target + ", orderDetails=" + orderDetails + "]";
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

}
