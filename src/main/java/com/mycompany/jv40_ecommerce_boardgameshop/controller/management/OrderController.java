/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.controller.management;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Cart;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.CartDetail;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.CartStatus;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.Gender;
import com.mycompany.jv40_ecommerce_boardgameshop.service.CartDetailService;
import com.mycompany.jv40_ecommerce_boardgameshop.service.CartService;
import com.mycompany.jv40_ecommerce_boardgameshop.utils.OrderDetailPDFExporter;
import com.mycompany.jv40_ecommerce_boardgameshop.utils.OrderExcelExporter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    }

    @Autowired
    private CartDetailService cartDetailService;

    @Autowired
    private CartService cartService;

    @RequestMapping(value = "/vieworder", method = RequestMethod.GET)
    public String cartView(Model model, @Param("startDate") String startDate,
            @Param("endDate") String endDate, HttpSession session) {
        model.addAttribute("cart", cartService.getListCarts(startDate, endDate));
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        session.setAttribute("startDate", startDate);
        session.setAttribute("endDate", endDate);
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
            @Valid @ModelAttribute("cart") Cart cart, 
            BindingResult result
    ) {
        
        cartService.save(cart);
        return "redirect:/admin/vieworder";
    }

    @RequestMapping("/export/excel")
    public void exportToExcel(HttpServletResponse response, HttpSession session
    ) throws IOException {
        response.setContentType("application/octet-stream");
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDate = dateFormat.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=orders_" + currentDate + ".xlsx";
        response.setHeader(headerKey, headerValue);

        String startDate = (String) session.getAttribute("startDate");
        String endDate = (String) session.getAttribute("endDate");
        
        OrderExcelExporter excelExporter = new OrderExcelExporter(cartService.getListCarts(startDate, endDate));

        excelExporter.export(response);
        session.setMaxInactiveInterval(0);
    }

    @RequestMapping(value = "/vieworderdetail/{id}")
    public String viewOrderDetail(Model model, @PathVariable("id") int id) {
        model.addAttribute("cart", cartService.findCartById(id));
        model.addAttribute("cartdetail", cartDetailService.getCardDetailInCart(cartService.findCartById(id)));
        return "admin/orderdetail/orderdetail-viewpage";
    }

    @RequestMapping("/exportcartdetail/{id}")
    public void exportCartDetailToPDF(HttpServletResponse response, @PathVariable("id") int id) throws IOException {
        response.setContentType("application/pdf");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        String currentDate = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=Invoice_" + currentDate + ".pdf";
        response.setHeader(headerKey, headerValue);
        
        Cart cart = cartService.findCartById(id);
        List<CartDetail> listCartDetail = cartDetailService.getCardDetailInCart(cartService.findCartById(id));
        OrderDetailPDFExporter exporter = new OrderDetailPDFExporter(listCartDetail, cart);

        exporter.export(response);

    }

}
