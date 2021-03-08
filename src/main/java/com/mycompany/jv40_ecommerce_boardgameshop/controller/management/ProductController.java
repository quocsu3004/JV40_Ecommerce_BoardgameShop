/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.controller.management;

import ch.qos.logback.core.joran.action.ActionUtil;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.Image;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.Product;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.ProductStatus;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.PromotionStatus;
import com.mycompany.jv40_ecommerce_boardgameshop.service.CategoryService;
import com.mycompany.jv40_ecommerce_boardgameshop.service.ImageService;
import com.mycompany.jv40_ecommerce_boardgameshop.service.ProductService;
import com.mycompany.jv40_ecommerce_boardgameshop.service.PublisherService;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/admin")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private PublisherService publisherService;

    @Autowired
    private ImageService imageService;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        StringTrimmerEditor stringTrimerEditor = new StringTrimmerEditor(true);
        webDataBinder.registerCustomEditor(String.class, stringTrimerEditor);
    }

    @RequestMapping(value = "/viewproduct", method = RequestMethod.GET)
    public String productViewPage(Model model) {
        model.addAttribute("product", productService.getProduct());
        return "admin/viewproduct";
    }

    @RequestMapping("/addproduct")
    public String addNewProduct(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("category", categoryService.getListCategory());
        model.addAttribute("publisher", publisherService.getListPublisher());
        model.addAttribute("productStatus", ProductStatus.values());
        model.addAttribute("action", "add");
        return "admin/addproduct-page";
    }

    @RequestMapping("/editproduct/{id}")
    public String editOldProduct(Model model, @PathVariable("id") int id) {
        model.addAttribute("product", productService.findProductById(id));
        model.addAttribute("category", categoryService.getListCategory());
        model.addAttribute("publisher", publisherService.getListPublisher());
        model.addAttribute("productStatus", ProductStatus.values());
        model.addAttribute("action", "edit");
        return "admin/addproduct-page";
    }

    @RequestMapping(value = "/product/{action}", method = RequestMethod.POST)
    public String resultaction(Model model, @Valid
            @ModelAttribute("product") Product product, BindingResult bindingResult,
            @RequestParam("file") List<MultipartFile> files,
            HttpServletRequest servletRequest) {
        //Check Valid
        if (bindingResult.hasErrors()) {
             model.addAttribute("product", productService.findProductById(product.getId()));
            model.addAttribute("category", categoryService.getListCategory());
            model.addAttribute("publisher", publisherService.getListPublisher());
            model.addAttribute("action", "add");
            return "admin/addproduct-page";
        } else {
            //Save some parts product
            // set default status is active  
            
            product.setStatus(ProductStatus.ACTIVE);
            product.setCreateDate(Date.from(Instant.now()));           
            productService.saveProduct(product);

            //Upload and save image to database
            String pathImageInProject = "C:\\Project\\JV40_Ecommerce_BoardgameShop\\src\\main\\webapp\\resources-management\\img\\product-img";
            String pathImageInSnapshot = servletRequest.getServletContext().getRealPath("/resources-management/img/product-img");

            for (MultipartFile file : files) {
                Image image = new Image();
                image.setName(file.getOriginalFilename());
                image.setProductId(product);
                imageService.save(image);

                Path sourcesPath = Paths.get(pathImageInSnapshot + file.getOriginalFilename());
                Path targetsPath = Paths.get(pathImageInProject + file.getOriginalFilename());
                try {
                    Files.copy(sourcesPath, targetsPath);
                } catch (IOException ex) {
                    Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return "redirect:/admin/viewproduct";
    }

}
