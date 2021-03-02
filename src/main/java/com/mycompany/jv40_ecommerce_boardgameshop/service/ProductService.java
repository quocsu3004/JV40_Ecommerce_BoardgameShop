/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.service;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.jv40_ecommerce_boardgameshop.repository.ProductReposity;

/**
 *
 * @author Admin
 */
@Service
public class ProductService {
    
    @Autowired
    private ProductReposity productReposity;
    
    public List<Product> getProduct(){
        return (List<Product>) productReposity.findAll();
    }
    
    public void saveProduct(Product product){
        productReposity.save(product);
    }
}
