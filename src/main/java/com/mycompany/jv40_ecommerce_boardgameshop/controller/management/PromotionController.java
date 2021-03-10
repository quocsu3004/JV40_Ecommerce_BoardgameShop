/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.controller.management;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Promotion;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.PromotionStatus;
import com.mycompany.jv40_ecommerce_boardgameshop.service.ProductService;
import com.mycompany.jv40_ecommerce_boardgameshop.service.PromotionService;
import javax.faces.annotation.RequestMap;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/admin")
public class PromotionController {

    @Autowired
    private PromotionService promotionService;
    
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/promotion", method = RequestMethod.GET)
    public String showPromotion(Model model) {
        model.addAttribute("promotion", promotionService.viewPromotion());
        return "admin/promotion/promotion-page";
    }

    @RequestMapping("/editpromotion/{id}")
    public String changeStatusPromotion(Model model, @PathVariable("id") int id) {
        model.addAttribute("promotion", promotionService.findPromotionById(id));
        model.addAttribute("promotionStatus", PromotionStatus.values());
        model.addAttribute("action", "edit");
        return "admin/promotion/promotion-edit";
    }
    
    @RequestMapping(value= "/addpromotion", method = RequestMethod.POST )
    public String AddPromotion(Model model){
        model.addAttribute("product", productService.getProduct());
        model.addAttribute("promotion", new Promotion());
        model.addAttribute("action", "add");
        return "admin/promotion/promotion-add";
    }

    @RequestMapping(value = "promotion/{action}", method = RequestMethod.POST)
    public String resultChangeStatusPromotion(Model model,
            @Valid @ModelAttribute("promotion") Promotion promotion,
            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("promotion", promotionService.findPromotionById(promotion.getId()));
            model.addAttribute("promotionStatus", PromotionStatus.values());
            model.addAttribute("action", "{action}");
            return "admin/promotion-edit";
        } else {

            promotion.setStatus(PromotionStatus.valueOf(promotion.getStatus().toString().toUpperCase()));
            promotionService.save(promotion);
        }
        return "redirect:/admin/promotion";
    }

}
