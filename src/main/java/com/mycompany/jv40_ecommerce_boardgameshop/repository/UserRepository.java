/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.repository;



import com.mycompany.jv40_ecommerce_boardgameshop.entities.UserEntity;
import com.mycompany.jv40_ecommerce_boardgameshop.enums.UserStatus;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<UserEntity, Integer> {

    UserEntity findByEmailLikeAndStatusLike(String email,
            UserStatus status);
}
