/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.controller.management;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Account;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.AccountRole;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.AccountStatus;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.Gender;
import com.mycompany.jv40_ecommerce_boardgameshop.service.AccountRoleService;
import com.mycompany.jv40_ecommerce_boardgameshop.service.AccountService;
import java.util.List;
import java.util.Set;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping("/admin")
public class AccountController {
    
    @Autowired
    private AccountService accountService;
    
    @Autowired
    private AccountRoleService accountRoleService;
   
  @GetMapping("/account")
  public String AccountHome(Model model){
      model.addAttribute("account", accountService.view());
      model.addAttribute("accountService",  accountService);
      return "admin/account/accounthome";
  }
  
  @RequestMapping("/accountupdate/{id}")
  public String accountUppdate(Model model, @PathVariable("id") int id){
      model.addAttribute("account", accountService.findAccountById(id));
      model.addAttribute("accountrole", accountRoleService.findAll());
      model.addAttribute("accountstatus", AccountStatus.values());
       model.addAttribute("gender", Gender.values());
      model.addAttribute("accountService",  accountService);
      model.addAttribute("action", "update");
      
      return "admin/account/accountupdate";
  }
  
  @PostMapping("/accountupdate/update")
  public String resultActionUpdate(Model model,@Valid @ModelAttribute("account") Account account,
            BindingResult result,
            @RequestParam(value = "listaccountRoleId", required = false) List<Integer> listaccountRoleId ){    
      if(result.hasErrors()){
          return "/accountupdate/{id}";
      }else{
          Set<AccountRole> listAccountRole = accountRoleService.findListAccountRoleByListId(listaccountRoleId);
          account.setAccountRole(listAccountRole);
          accountService.save(account);
      }
      return "redirect:/admin/account";
  }
}
