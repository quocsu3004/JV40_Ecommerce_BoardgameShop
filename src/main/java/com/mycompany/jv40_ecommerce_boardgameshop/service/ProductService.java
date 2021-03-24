/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.service;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.CartDetail;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.Product;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.Promotion;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.jv40_ecommerce_boardgameshop.repository.ProductReposity;
import java.util.Optional;
import java.util.Set;

/**
 *
 * @author Admin
 */
@Service
public class ProductService {

    @Autowired
    private ProductReposity productReposity;

    public List<Product> getProduct() {
        return (List<Product>) productReposity.findAll();
    }

    public void saveProduct(Product product) {
        productReposity.save(product);
    }

    public Product findProductById(int id) {
        Optional<Product> opt = productReposity.findById(id);
        if (opt.isPresent()) {
            return opt.get();
        } else {
            return new Product();
        }
    }

    public List<Product> findListProductByListId(List<Integer> listProductId) {
        return productReposity.findAllByIdIn(listProductId);
    }

 
 
    
}
