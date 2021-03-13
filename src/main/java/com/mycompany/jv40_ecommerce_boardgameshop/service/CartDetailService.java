/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.service;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Cart;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.CartDetail;
import com.mycompany.jv40_ecommerce_boardgameshop.repository.CartDetailRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class CartDetailService {
    
    @Autowired
    private CartDetailRepository cartDetailRepository;
    
    public List<CartDetail> getAllCartDetail(){
        return (List<CartDetail>) cartDetailRepository.findAll();
    }
    
    public CartDetail getCartDetailInCart(int id){
        Optional<CartDetail> opt = cartDetailRepository.findById(id);
        if(opt.isPresent()){
           return opt.get();
        }else{
            return new CartDetail();
        }
    }
    
     public List<CartDetail> getCardDetailInCart(Cart cart){
        return cartDetailRepository.findByCartIdLike(cart);
    }
}
