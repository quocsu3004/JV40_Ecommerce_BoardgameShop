/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv40_ecommerce_boardgameshop.service;

import com.mycompany.jv40_ecommerce_boardgameshop.entity.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mycompany.jv40_ecommerce_boardgameshop.repository.ImageRepository;
import java.util.List;

/**
 *
 * @author Admin
 */
@Service
public class ImageService {
    
    @Autowired
    private ImageRepository imageRepository;
    
    public void save(Image image){
        imageRepository.save(image);
    }
    
    public List<Image> getListImageName(String name){
        return imageRepository.findByNameLike(name);
    }
    
    public void deleteSingleImage(Image image){
        imageRepository.delete(image);
    }
}
