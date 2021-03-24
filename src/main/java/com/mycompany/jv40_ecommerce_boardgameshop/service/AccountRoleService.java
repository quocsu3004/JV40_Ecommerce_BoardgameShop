/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.service;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.AccountRole;
import com.mycompany.jv40_ecommerce_boardgameshop.repository.AccountRoleRepository;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class AccountRoleService {
    
    @Autowired
    private AccountRoleRepository accountRoleRepository;
    
    public List<AccountRole> findAll(){
        return (List<AccountRole>) accountRoleRepository.findAll();
    }
    
    public Set<AccountRole> findListAccountRoleByListId(List<Integer> listaccountRoleId){
        return accountRoleRepository.findAllByIdIn(listaccountRoleId);
    }
}
