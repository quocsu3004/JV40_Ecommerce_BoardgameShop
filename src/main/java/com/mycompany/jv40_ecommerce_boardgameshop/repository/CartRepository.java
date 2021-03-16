/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.repository;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Cart;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.CartDetail;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Admin
 */
@Repository
public interface CartRepository extends CrudRepository<Cart, Integer> {

    @Query(nativeQuery = true, value = "SELECT * \n"
            + "FROM cart\n"
            + "WHERE order_Date BETWEEN ?1 AND ?2")
    List<Cart> findCartByDateBetween(String startDate, String endDate);

}
