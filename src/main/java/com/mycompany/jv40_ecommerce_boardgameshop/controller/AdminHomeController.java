/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.controller;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Cart;
import com.mycompany.jv40_ecommerce_boardgameshop.service.CartService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Maru
 */
@Controller
@RequestMapping("/admin")
public class AdminHomeController {

    @Autowired
    private CartService cartService;

    @RequestMapping("/")
    public String adminhomepage(Model model) {
        List<Cart> listCart = cartService.getListCartsOnly();
        model.addAttribute("totalCart", countTotalCart(listCart));
         model.addAttribute("totalEarning", countTotalEarning(listCart));
         model.addAttribute("newCustomer", countNewCustomer(listCart));
        return "admin/home/adminhomepage";
    }

    public int countTotalCart(List<Cart> listCart){
        int count = 0;
        for(int i = 0; i < listCart.size(); i++){
            count += 1;
        }
        return count;
    }
    
    public double countTotalEarning(List<Cart> listCart){
         int count = 0;
        for(int i = 0; i < listCart.size(); i++){
            count += listCart.get(i).getTotalPrice();
        }
        return count;
    }
    
    public int countNewCustomer(List<Cart> listCart){
        int count = 0;
        for(Cart cart: listCart){
            String customerName = cart.getFullName();
            String phoneNumber = cart.getPhoneNumber();
            for(Cart cartCheck: listCart){
                if(!cartCheck.getFullName().equalsIgnoreCase(customerName) || !cartCheck.getPhoneNumber().equalsIgnoreCase(phoneNumber) ){
                    count+=1;
                }
            }
        }
        return count;
    }
    
    
}
