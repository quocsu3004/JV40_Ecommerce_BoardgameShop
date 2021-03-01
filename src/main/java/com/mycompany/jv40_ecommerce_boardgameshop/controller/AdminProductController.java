/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.controller;

import com.mycompany.jv40_ecommerce_boardgameshop.repository.ProductReposity;
import com.mycompany.jv40_ecommerce_boardgameshop.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/admin")
public class AdminProductController {
    
    @Autowired
    private ProductService productService;
    
    @RequestMapping(value = "/viewproduct", method = RequestMethod.GET)
    public String productViewPage(Model model){
        model.addAttribute("product", productService.getProduct());
                return "admin/viewproduct";
    }
    
}
