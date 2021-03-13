/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.service;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Product;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.Promotion;
import com.mycompany.jv40_ecommerce_boardgameshop.repository.PromotionRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class PromotionService {
    
    @Autowired
    private PromotionRepository promotionRepository;
    
    public List<Promotion> viewPromotion(){
        return (List<Promotion>) promotionRepository.findAll();
    }
    
    public Promotion findPromotionById(int id){
        Optional<Promotion> opt = promotionRepository.findById(id);
        if(opt.isPresent()){
           return opt.get();
        }else{
            return new Promotion();
        }
    }
    
    public void save(Promotion promotion){
        promotionRepository.save(promotion);
    }
    
    
}
