package com.fpt.laptopshop.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fpt.laptopshop.domain.Product;
import com.fpt.laptopshop.service.ProductService;
import com.fpt.laptopshop.service.UploadFileService;
import com.fpt.laptopshop.service.iservice.IProductService;

import jakarta.validation.Valid;

@Controller
public class ProductController {
    private final IProductService productService;
    private final UploadFileService uploadFileService;

    public ProductController(ProductService productService, UploadFileService uploadFileService) {
        this.productService = productService;
        this.uploadFileService = uploadFileService;
    }

    @GetMapping("/admin/products")
    public String getDashboard(Model model, @RequestParam(value = "page") Optional<String> pageNo) {
        // int limit = 6;
        // int page = 1;
        // try {
        // page = Integer.parseInt(pageNo.get());
        // } catch (Exception e) {
        // // TODO: handle exception
        // }
        // Pageable pageable = PageRequest.of(page - 1, limit);
        // Page<Product> list = productService.findAll(pageable);
        // List<Product> products = list.getContent();
        // model.addAttribute("products", products);
        // model.addAttribute("size", list.getTotalPages());
        // model.addAttribute("pageNo", page);
        return "admin/product/Show";
    }

    @GetMapping(value = "/admin/products/{productId}/view")
    public String getUserDetailById(Model model, @PathVariable long productId) {
        Product product = productService.findById(productId);
        String urlImage = "/images/product/" + product.getImage();
        model.addAttribute("urlImage", urlImage);
        model.addAttribute("product", product);
        return "admin/product/Detail";
    }

    @GetMapping("/admin/products/create")
    public String forwardProductCreate(Model model, @ModelAttribute("product") Product product) {
        model.addAttribute("product", new Product());
        return "admin/product/Create";
    }

    @PostMapping("/admin/products/create")
    public String createProduct(Model model,
            @ModelAttribute("product") @Valid Product product,
            BindingResult result,
            @RequestParam(name = "photoImage") MultipartFile file) throws IOException {
        if (result.hasErrors()) {
            return "admin/product/Create";
        }
        String fileName = uploadFileService.uploadFile(file, "product");
        product.setImage(fileName);
        productService.addProduct(product);
        return "redirect:/admin/products";
    }

    @GetMapping(value = "/admin/products/{productId}/update")
    public String handleForwardUpdateProduct(Model model, @PathVariable long productId) {
        Product product = productService.findById(productId);
        model.addAttribute("product", product);
        return "admin/product/Update";
    }

    @PostMapping(value = "/admin/products/update")
    public String handleUpdateProduct(Model model,
            @ModelAttribute("product") @Valid Product product,
            BindingResult result,
            @RequestParam(name = "photoImage") MultipartFile file) throws IOException {
        if (result.hasErrors()) {
            Product pr = productService.findById(product.getId());
            product.setImage(pr.getImage());
            model.addAttribute("product", product);
            return "admin/product/Update";
        }
        if (!file.isEmpty()) {
            String fileName = uploadFileService.uploadFile(file, "product");
            product.setImage(fileName);
        }
        Product saveProduct = productService.updateProduct(product);
        if (saveProduct == null) {
            model.addAttribute("message", "Update product failed !");
        } else
            model.addAttribute("message", "Update product success");
        return "redirect:/admin/products";
    }

    @GetMapping(value = "/admin/products/{productId}/delete")
    public String forwardDeleteUser(Model model, @PathVariable long productId) {
        model.addAttribute("productId", productId);
        return "admin/product/Delete";
    }

    @PostMapping(value = "/admin/products/{productId}/delete")
    public String deleteUser(Model model, @PathVariable long productId) {
        productService.deleteProduct(productId);
        model.addAttribute("message", "Delete success");
        return "redirect:admin/products";
    }

}
