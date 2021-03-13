/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.service;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Cart;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.CartDetail;
import com.mycompany.jv40_ecommerce_boardgameshop.repository.CartRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class CartService  {
    
    @Autowired
    private CartRepository cartRepository;
    
    public List<Cart> getListCarts(){
        return (List<Cart>) cartRepository.findAll();
    }
    
    public Cart findCartById(int id){
        Optional<Cart> opt = cartRepository.findById(id);
        if(opt.isPresent()){
          return  opt.get();
        }else{
            return new Cart();
        }
    }
    
    
    public void save(Cart cart){
        cartRepository.save(cart);
    }

   
    
}
