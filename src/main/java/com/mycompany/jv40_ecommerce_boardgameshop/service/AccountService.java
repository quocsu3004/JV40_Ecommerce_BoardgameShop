/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.service;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Account;
import com.mycompany.jv40_ecommerce_boardgameshop.repository.AccountRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



/**
 *
 * @author Admin
 */
@Service
public class AccountService {
    
    @Autowired
    private AccountRepository accountRepository;
    
    public List<Account> view(){
        return (List<Account>) accountRepository.findAll();
    }
    
    public List<String> findListAccountRoleName(int id){
        return accountRepository.findAccountRoleName(id);
    }
    
    public Account findAccountById(int id){
        Optional<Account> opt =  accountRepository.findById(id);
        if(opt.isPresent()){
           return opt.get();
        }else{
            return new Account();
        }
    }
    
     public List<Integer> findListAccountRoleid(int id){
        return accountRepository.findAccountRoleId(id);
    }
     
     public void save(Account account){
         accountRepository.save(account);
     }
    
}
