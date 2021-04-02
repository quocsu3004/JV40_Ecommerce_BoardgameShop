/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.repository;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Account;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.AccountRole;
import java.util.List;
import java.util.Set;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public interface AccountRepository extends CrudRepository<Account, Integer> {

    @Query(nativeQuery = true, value = "SELECT ar.role\n"
            + "FROM accountrole ar\n"
            + "JOIN account_accountrole acar ON ar.id = acar.accountrole_id\n"
            + "JOIN account ac ON acar.account_id = ac.id\n"
            + "WHERE ac.id = ?1")
    List<String> findAccountRoleName(int id);
    
    @Query(nativeQuery = true, value = "SELECT ar.id\n"
            + "FROM accountrole ar\n"
            + "JOIN account_accountrole acar ON ar.id = acar.accountrole_id\n"
            + "JOIN account ac ON acar.account_id = ac.id\n"
            + "WHERE ac.id = ?1")
    List<Integer> findAccountRoleId(int id);
    
    Account findByEmail(String email);
    
    Set<AccountRole> findAllByEmail(String email);
}
