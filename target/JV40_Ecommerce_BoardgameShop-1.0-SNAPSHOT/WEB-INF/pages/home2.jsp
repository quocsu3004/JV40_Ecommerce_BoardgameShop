<%-- 
    Document   : home2
    Created on : Feb 4, 2021, 8:04:47 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/fav.png">
        <!-- Author Meta -->
        <meta name="author" content="CodePixar">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <!-- Start Header Area -->
        
        <!-- End Header Area -->

        <!-- start banner Area -->
        <section class="banner-area relative" id="home">
            <div class="container-fluid">
                <div class="row fullscreen align-items-center justify-content-center">
                    <div class="col-lg-6 col-md-12 d-flex align-self-end img-right no-padding">
                        <img class="img-fluid" src="<c:url value="/resources/img/header-img.png"/>" alt="">
                    </div>
                    <div class="banner-content col-lg-6 col-md-12">
                        <h1 class="title-top"><span>Flat</span> 75%Off</h1>
                        <h1 class="text-uppercase">
                            It’s Happening <br>
                            this Season!
                        </h1>
                        <button class="primary-btn text-uppercase"><a href="#">Purchase Now</a></button>
                    </div>							
                </div>
            </div>
        </section>
        <!-- End banner Area -->

        <section class="men-product-area section-gap relative" id="men">
            <div class="overlay overlay-bg"></div>
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="menu-content pb-40">
                        <div class="title text-center">
                            <h1 class="text-white mb-10">New realeased Products for Men</h1>
                            <p class="text-white">Who are in extremely love with eco friendly system.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6 single-product">
                        <div class="content">
                            <div class="content-overlay"></div>
                            <img class="content-image img-fluid d-block mx-auto" src="<c:url value="/resources/img/l1.jpg"/>" alt="">
                            <div class="content-details fadeIn-bottom">
                                <div class="bottom d-flex align-items-center justify-content-center">
                                    <a href="#"><span class="lnr lnr-heart"></span></a>
                                    <a href="#"><span class="lnr lnr-layers"></span></a>
                                    <a href="#"><span class="lnr lnr-cart"></span></a>
                                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span class="lnr lnr-frame-expand"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="price">
                            <h5 class="text-white">Long Sleeve shirt</h5>
                            <h3 class="text-white">$150.00</h3>
                        </div>
                    </div>	
                    <div class="col-lg-3 col-md-6 single-product">
                        <div class="content">
                            <div class="content-overlay"></div>
                            <img class="content-image img-fluid d-block mx-auto" src="<c:url value="/resources/img/l2.jpg"/>" alt="">
                            <div class="content-details fadeIn-bottom">
                                <div class="bottom d-flex align-items-center justify-content-center">
                                    <a href="#"><span class="lnr lnr-heart"></span></a>
                                    <a href="#"><span class="lnr lnr-layers"></span></a>
                                    <a href="#"><span class="lnr lnr-cart"></span></a>
                                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span class="lnr lnr-frame-expand"></span></a>
                                </div>
                            </div>					      
                        </div>
                        <div class="price">
                            <h5 class="text-white">Long Sleeve shirt</h5>
                            <h3 class="text-white">$150.00</h3>
                        </div>							  
                    </div>	
                    <div class="col-lg-3 col-md-6 single-product">
                        <div class="content">
                            <div class="content-overlay"></div>
                            <img class="content-image img-fluid d-block mx-auto" src="<c:url value="/resources/img/l3.jpg"/>" alt="">
                            <div class="content-details fadeIn-bottom">
                                <div class="bottom d-flex align-items-center justify-content-center">
                                    <a href="#"><span class="lnr lnr-heart"></span></a>
                                    <a href="#"><span class="lnr lnr-layers"></span></a>
                                    <a href="#"><span class="lnr lnr-cart"></span></a>
                                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span class="lnr lnr-frame-expand"></span></a>
                                </div>
                            </div>					      
                        </div>
                        <div class="price">
                            <h5 class="text-white">Long Sleeve shirt</h5>
                            <h3 class="text-white">$150.00</h3>
                        </div>							  
                    </div>	
                    <div class="col-lg-3 col-md-6 single-product">
                        <div class="content">
                            <div class="content-overlay"></div>
                            <img class="content-image img-fluid d-block mx-auto" src="<c:url value="/resources/img/l4.jpg"/>" alt="">
                            <div class="content-details fadeIn-bottom">
                                <div class="bottom d-flex align-items-center justify-content-center">
                                    <a href="#"><span class="lnr lnr-heart"></span></a>
                                    <a href="#"><span class="lnr lnr-layers"></span></a>
                                    <a href="#"><span class="lnr lnr-cart"></span></a>
                                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span class="lnr lnr-frame-expand"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="price">
                            <h5 class="text-white">Long Sleeve shirt</h5>
                            <h3 class="text-white">$150.00</h3>
                        </div>							  					  
                    </div>																		
                </div>
            </div>
        </section>

        <!-- Start women-product Area -->
        <section class="women-product-area section-gap" id="women">
            <div class="container">
                <div class="countdown-content pb-40">
                    <div class="title text-center">
                        <h1 class="mb-10">New realeased Products for Women</h1>
                        <p>Who are in extremely love with eco friendly system.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6 single-product">
                        <div class="content">
                            <div class="content-overlay"></div>
                            <img class="content-image img-fluid d-block mx-auto" src="<c:url value="/resources/img/l5.jpg"/>" alt="">
                            <div class="content-details fadeIn-bottom">
                                <div class="bottom d-flex align-items-center justify-content-center">
                                    <a href="#"><span class="lnr lnr-heart"></span></a>
                                    <a href="#"><span class="lnr lnr-layers"></span></a>
                                    <a href="#"><span class="lnr lnr-cart"></span></a>
                                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span class="lnr lnr-frame-expand"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="price">
                            <h5>Long Sleeve shirt</h5>
                            <h3>$150.00</h3>
                        </div>						  
                    </div>	
                    <div class="col-lg-3 col-md-6 single-product">
                        <div class="content">
                            <div class="content-overlay"></div>
                            <img class="content-image img-fluid d-block mx-auto" src="<c:url value="/resources/img/l6.jpg"/>" alt="">
                            <div class="content-details fadeIn-bottom">
                                <div class="bottom d-flex align-items-center justify-content-center">
                                    <a href="#"><span class="lnr lnr-heart"></span></a>
                                    <a href="#"><span class="lnr lnr-layers"></span></a>
                                    <a href="#"><span class="lnr lnr-cart"></span></a>
                                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span class="lnr lnr-frame-expand"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="price">
                            <h5>Long Sleeve shirt</h5>
                            <h3>$150.00</h3>
                        </div>						  
                    </div>	
                    <div class="col-lg-3 col-md-6 single-product">
                        <div class="content">
                            <div class="content-overlay"></div>
                            <img class="content-image img-fluid d-block mx-auto" src="<c:url value="/resources/img/l7.jpg"/>" alt="">
                            <div class="content-details fadeIn-bottom">
                                <div class="bottom d-flex align-items-center justify-content-center">
                                    <a href="#"><span class="lnr lnr-heart"></span></a>
                                    <a href="#"><span class="lnr lnr-layers"></span></a>
                                    <a href="#"><span class="lnr lnr-cart"></span></a>
                                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span class="lnr lnr-frame-expand"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="price">
                            <h5>Long Sleeve shirt</h5>
                            <h3>$150.00</h3>
                        </div>						  
                    </div>	
                    <div class="col-lg-3 col-md-6 single-product">
                        <div class="content">
                            <div class="content-overlay"></div>
                            <img class="content-image img-fluid d-block mx-auto" src="<c:url value="/resources/img/l8.jpg"/>" alt="">
                            <div class="content-details fadeIn-bottom">
                                <div class="bottom d-flex align-items-center justify-content-center">
                                    <a href="#"><span class="lnr lnr-heart"></span></a>
                                    <a href="#"><span class="lnr lnr-layers"></span></a>
                                    <a href="#"><span class="lnr lnr-cart"></span></a>
                                    <a href="#" data-toggle="modal" data-target="#exampleModal"><span class="lnr lnr-frame-expand"></span></a>
                                </div>
                            </div>
                        </div>
                        <div class="price">
                            <h5>Long Sleeve shirt</h5>
                            <h3>$150.00</h3>
                        </div>						  
                    </div>																			
                </div>
            </div>	
        </section>

       
    </body>
</html>
