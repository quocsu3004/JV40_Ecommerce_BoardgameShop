/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.service;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Publisher;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.jv40_ecommerce_boardgameshop.repository.PublisherRepository;

/**
 *
 * @author Admin
 */
@Service
public class PublisherService {
    
    @Autowired
    private PublisherRepository publisherRepository;
    
    public List<Publisher> getListPublisher(){
        return (List<Publisher>) publisherRepository.findAll();
    }
}
