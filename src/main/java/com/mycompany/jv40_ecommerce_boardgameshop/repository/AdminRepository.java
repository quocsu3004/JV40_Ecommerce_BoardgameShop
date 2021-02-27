/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.repository;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Account;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.AccountStatus;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author Admin
 */
public interface AdminRepository extends CrudRepository<Account, Integer>{
    
//    Account findByEmaillLikeAndStatusLike(String email, AccountStatus status);
}
