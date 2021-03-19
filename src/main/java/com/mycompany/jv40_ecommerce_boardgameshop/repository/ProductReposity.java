/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.repository;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Image;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.Product;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.Promotion;
import java.util.List;
import java.util.Set;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public interface ProductReposity extends CrudRepository<Product, Integer>{
    
    List<Product> findAllByIdIn(List<Integer> listProductId);
   
    
}
