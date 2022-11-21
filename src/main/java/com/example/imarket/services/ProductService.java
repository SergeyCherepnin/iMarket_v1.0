package com.example.imarket.services;

import com.example.imarket.models.Image;
import com.example.imarket.models.Product;
import com.example.imarket.models.User;
import com.example.imarket.repositories.ProductRepository;
import com.example.imarket.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public List<Product> products(String title) {
        if (title != null) return productRepository.findByTitleContainingIgnoreCase(title);
        return productRepository.findAll();
    }

    public void saveProduct(Principal principal,
                            Product product,
                            MultipartFile file1,
                            MultipartFile file2,
                            MultipartFile file3) throws IOException {
        product.setUser(getUserByPrincipal(principal));

        Image image1, image2, image3;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            product.addImageToProduct(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            product.addImageToProduct(image3);
        }

        log.info("Saving new Product... Title: {}; Author: {}", product.getTitle(), product.getUser().getName());
        Product productFromDB = productRepository.save(product);
        productFromDB.setPreviewImageId(productFromDB.getImages().get(0).getId());
        productRepository.save(product);
    }

    public void deleteProduct(User user, Long id) {
        if (user != null) {
            if (getProductById(id).getUser().getId().equals(user.getId())) {
                productRepository.deleteById(id);
                log.info("Product with id = {} was deleted", id);
            } else {
                log.info("User {} haven`t product with id = {}", user.getEmail(), id);
            }
        } else {
            log.info("Product with id = {} not found", id);
        }
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public List<Product> userProducts(User user) {
        return productRepository.findAllByUserId(user.getId());
    }


    public void updateProduct(User user, Long id, MultipartFile file1,
                              MultipartFile file2, MultipartFile file3,
                              String title, String description,
                              int price, String city) throws IOException {
        Product product = getProductById(id);
        product.setTitle(title);
        product.setDescription(description);
        product.setPrice(price);
        product.setCity(city);

        if (product.getUser().getId().equals(user.getId())) {
            Image image1, image2, image3;
            if (file1.getSize() != 0) {
                image1 = toImageEntity(file1);
                image1.setPreviewImage(true);
                product.setProductImage(0, image1);
            }
            if (file2.getSize() != 0) {
                image2 = toImageEntity(file2);
                if (product.getImages().size() >= 2) {
                    product.setProductImage(1, image2);
                } else product.addImageToProduct(image2);
            }
            if (file3.getSize() != 0) {
                image3 = toImageEntity(file3);
                if (product.getImages().size() == 3) {
                    product.setProductImage(2, image3);
                } else product.addImageToProduct(image3);
            }

            log.info("Updating Product... Title: {}; Author: {}", product.getTitle(), product.getUser().getName());
            Product productFromDB = productRepository.save(product);
            productFromDB.setPreviewImageId(productFromDB.getImages().get(0).getId());
            productRepository.save(product);
        }
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setSize(file.getSize());
        image.setContentType(file.getContentType());
        image.setBytes(file.getBytes());
        return image;
    }
}