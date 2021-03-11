/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.controller.management;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Cart;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.CartStatus;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.Gender;
import com.mycompany.jv40_ecommerce_boardgameshop.service.CartDetailService;
import com.mycompany.jv40_ecommerce_boardgameshop.service.CartService;
import com.mycompany.jv40_ecommerce_boardgameshop.utils.OrderExcelExporter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/admin")
public class OrderController {

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringTrimerEditor = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringTrimerEditor);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

    @Autowired
    private CartDetailService cartDetailService;

    @Autowired
    private CartService cartService;

    @RequestMapping(value = "/vieworder", method = RequestMethod.GET)
    public String cartView(Model model) {
        model.addAttribute("cart", cartService.getListCarts());
        return "admin/order/vieworder-page";
    }

    @RequestMapping(value = "/changestatusorder/{id}")
    public String changeOrderStatus(Model model, @PathVariable("id") int id) {
        model.addAttribute("cart", cartService.findCartById(id));
        model.addAttribute("cartStatus", CartStatus.values());
        model.addAttribute("gender", Gender.values());
        model.addAttribute("action", "changestatus");
        return "admin/order/changeorder-page";
    }

    @RequestMapping(value = "/order/changestatus", method = RequestMethod.POST)
    public String resultChangeOrderStatus(Model model,
            @ModelAttribute("cart") Cart cart
    ) {
        cart.setStatus(CartStatus.valueOf(cart.getStatus().toString().toUpperCase()));
        cart.setGender(Gender.valueOf(cart.getGender().toString().toUpperCase()));
        cartService.save(cart);
        return "redirect:/admin/vieworder";
    }
    
    @RequestMapping("/export/excel")
    public void exportToExcel(HttpServletResponse response) throws IOException{
        response.setContentType("application/octet-stream");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDate = dateFormat.format(new Date());
        
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=orders_" + currentDate + ".xlsx";
        response.setHeader(headerKey, headerValue);
        
        List<Cart> listCarts = cartService.getListCarts();
        
        OrderExcelExporter excelExporter = new OrderExcelExporter(listCarts);
        
        excelExporter.export(response);
        
    }

}
