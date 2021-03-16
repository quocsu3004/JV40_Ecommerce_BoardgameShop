/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.controller;


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
    
    
    @RequestMapping("/")
    public String adminhomepage(){
        return "admin/home/adminhomepage";
    }
    


}
