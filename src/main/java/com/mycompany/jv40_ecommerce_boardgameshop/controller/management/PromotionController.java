/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.controller.management;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Cart;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.CartDetail;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.Product;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.Promotion;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.PromotionStatus;
import com.mycompany.jv40_ecommerce_boardgameshop.service.CartDetailService;
import com.mycompany.jv40_ecommerce_boardgameshop.service.CartService;
import com.mycompany.jv40_ecommerce_boardgameshop.service.ProductService;
import com.mycompany.jv40_ecommerce_boardgameshop.service.PromotionService;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.faces.annotation.RequestMap;
import javax.validation.Valid;
import static org.hibernate.bytecode.BytecodeLogger.LOGGER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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

    @Autowired
    private CartDetailService cartDetailService;

    @Autowired
    private CartService cartService;

    @RequestMapping(value = "/promotion", method = RequestMethod.GET)
    public String showPromotion(Model model) {
        model.addAttribute("promotion", promotionService.viewPromotion());
        model.addAttribute("promotionService", promotionService);
        return "admin/promotion/promotion-page";
    }

    @RequestMapping("/editpromotion/{id}")
    public String changeStatusPromotion(Model model, @PathVariable("id") int id) {
        model.addAttribute("promotion", promotionService.findPromotionById(id));
        model.addAttribute("product", productService.getProduct());
        model.addAttribute("promotionService", promotionService);
        model.addAttribute("promotionStatus", PromotionStatus.values());
        model.addAttribute("action", "edit");
        return "admin/promotion/promotion-edit";
    }

    @RequestMapping(value = "/addpromotion", method = RequestMethod.GET)
    public String AddPromotion(Model model) {
        model.addAttribute("product", productService.getProduct());
        model.addAttribute("promotion", new Promotion());
        model.addAttribute("promotionstatus", PromotionStatus.UNACTIVE);
        model.addAttribute("action", "add");
        return "admin/promotion/promotion-add";
    }

    @RequestMapping(value = "/promotion/edit", method = RequestMethod.POST)
    public String resultChangeStatusPromotion(Model model,
            @Valid @ModelAttribute("promotion") Promotion promotion,
            BindingResult bindingResult,
            @RequestParam(value = "listProductId", required = false) List<Integer> listProductId,
            @RequestParam(value = "discount", required = false) int discount
    ) {
        promotionService.save(promotion);

        // Set price then save product
        List<CartDetail> listCartDetail = cartDetailService.findListCartDetailByListId(productService.findListProductByListId(listProductId));

        List<Product> listProducts = productService.findListProductByListId(listProductId);
        promotion.setProduct(listProducts);
        promotionService.save(promotion);

        return "redirect:/admin/promotion";
    }

    @RequestMapping(value = "/promotion/add", method = RequestMethod.POST)
    public String resultAddNewPromotion(Model model,
            @Valid
            @ModelAttribute("promotion") Promotion promotion,
            BindingResult bindingResult,
            @RequestParam(value = "listProductId", required = false) List<Integer> listProductId,
            @RequestParam(value = "discount", required = false) int discount
    ) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("product", productService.getProduct());
            model.addAttribute("promotion", new Promotion());
            model.addAttribute("promotionstatus", PromotionStatus.values());
            model.addAttribute("action", "add");
            return "admin/promotion/promotion-add";
        } else {

            //Save Promotion
            promotion.setStatus(PromotionStatus.UNACTIVE);
            promotionService.save(promotion);

            // Set price then save product
            List<Product> listProducts = productService.findListProductByListId(listProductId);
            promotion.setProduct(listProducts);
            promotionService.save(promotion);
        }
        return "redirect:/admin/promotion";
    }

    //Delay 1000 = 1s
//    @Scheduled(fixedDelay = 300 * 1000)
    public void checkPromotionAutoRun() {
        List<Promotion> listpromotion = promotionService.viewPromotion();
      
        List<CartDetail> listCartDetail = cartDetailService.getAllCartDetail();
        ZoneId defaultZoneId = ZoneId.systemDefault();
        Date today = Date.from(LocalDate.now().atStartOfDay(defaultZoneId).toInstant());
        for (Promotion promotion : listpromotion) {
            for (CartDetail cartDetail : listCartDetail) {
                Date startDate = promotion.getStartDate();
                Date endDate = promotion.getEndDate();
                boolean checkDate = checkDateBetween(today, startDate, endDate);

                if (promotion.getStatus().toString().equals("ACTIVE") && checkDate == true && cartDetail.getDiscountPrice() == 0) {
                    double price = cartDetail.getPrice();
                    double discoutedPrice = Math.round(caculatePriceWhenDiscount(price, promotion.getDiscount()));
                    cartDetail.setPrice(discoutedPrice);
                    cartDetail.setDiscountPrice(promotion.getDiscount());
                    cartDetailService.save(cartDetail);
                }
                if (cartDetail.getDiscountPrice() != 0 && !promotion.getStatus().toString().equals("ACTIVE") || checkDate == false) {
                    double price = cartDetail.getPrice();
                    double discoutedPrice = Math.round(returnCaculatePriceWhenDiscount((float) price, (float) cartDetail.getDiscountPrice()));;
                    cartDetail.setPrice(discoutedPrice);
                    cartDetail.setDiscountPrice(0);
                    cartDetailService.save(cartDetail);
                }
            }
        }
    }

    @Scheduled(fixedDelay = 300 * 1000)
    public void checkPromotionStatus() {
        List<Promotion> listpromotion = promotionService.viewPromotion();
        ZoneId defaultZoneId = ZoneId.systemDefault();
        Date today = Date.from(LocalDate.now().atStartOfDay(defaultZoneId).toInstant());
        for (Promotion promotion : listpromotion) {
            Date startDate = promotion.getStartDate();
            Date endDate = promotion.getEndDate();
            if (today.after(startDate) && today.before(endDate)) {
                promotion.setStatus(PromotionStatus.ACTIVE);
                promotionService.save(promotion);
            }
            if (today.before(startDate)) {
                promotion.setStatus(PromotionStatus.INQUEUE);
                promotionService.save(promotion);
            }
            if (today.after(endDate)) {
                promotion.setStatus(PromotionStatus.OVERDUE);
                promotionService.save(promotion);
            }
        }
    }
    
    

    private float caculatePriceWhenDiscount(double price, int discount) {
        return (float) (price - (discount * price / 100));
    }

    private float returnCaculatePriceWhenDiscount(float discountedprice, float discount) {
        float discountNumber = 1 - (discount / 100);
        return (float) (discountedprice / discountNumber);
    }

    private boolean checkDateBetween(Date today, Date startDate, Date endDate) {
        if (today.after(startDate) && today.before(endDate)) {
            return true;
        } else {
            return false;
        }
    }

}
