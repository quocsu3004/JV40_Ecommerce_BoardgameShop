/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.service;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.CartDetail;
import com.mycompany.jv40_ecommerce_boardgameshop.repository.CartDetailRepository;
import java.util.List;
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
}
