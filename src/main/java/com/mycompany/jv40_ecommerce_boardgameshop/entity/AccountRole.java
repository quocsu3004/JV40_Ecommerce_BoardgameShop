/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.entity;

import com.mycompany.jv40_ecommerce_boardgameshop.enums.AccountRoleStatus;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Admin
 */
@Entity
@Table
public class AccountRole {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private String role;
    
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private AccountRoleStatus status;

    public AccountRole() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public AccountRoleStatus getStatus() {
        return status;
    }

    public void setStatus(AccountRoleStatus status) {
        this.status = status;
    }
       
}
