/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.repository;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Product;
import com.mycompany.jv40_ecommerce_boardgameshop.entity.Promotion;
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
public interface PromotionRepository extends CrudRepository<Promotion, Integer> {

    @Query(nativeQuery = true, value = "SELECT p.name\n"
            + "FROM product p \n"
            + "JOIN  product_promotion pp ON p.id = pp.product_id\n"
            + "JOiN promotion pr ON pr.id = pp.promotion_id\n"
            + "WHERE pr.id = ?1")
    List<String> findProduct(int id);

    @Query(nativeQuery = true, value = "SELECT p.id\n"
            + "FROM product p \n"
            + "JOIN  product_promotion pp ON p.id = pp.product_id\n"
            + "JOiN promotion pr ON pr.id = pp.promotion_id\n"
            + "WHERE pr.id = ?1")
    List<String> findListProductIdInPromotion(int id);

}
