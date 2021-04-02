/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.service;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Account;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.AccountRole;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.UserEntity;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.UserRoleEntity;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.AccountStatus;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.Role;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.UserStatus;
import com.mycompany.jv40_ecommerce_boardgameshop.repository.AccountRepository;
import com.mycompany.jv40_ecommerce_boardgameshop.repository.AccountRoleRepository;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private AccountRoleRepository accountRoleRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Account account = accountRepository.findByEmail(email);
       
        if (account == null || account.getStatus() != AccountStatus.ACTIVE) {
            throw new UsernameNotFoundException("User not found");
        }
        
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        Set<AccountRole> roles = accountRoleRepository.findAllByAccount(account);
        for (AccountRole role : roles) {
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getRole().toString()));
        }

        return new User(account.getEmail(), account.getPassword(), grantedAuthorities);
        
    }
}

