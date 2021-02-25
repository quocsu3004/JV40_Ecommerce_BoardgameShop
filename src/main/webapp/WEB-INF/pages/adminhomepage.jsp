<%-- 
    Document   : adminhomepage
    Created on : 24 Feb 2021, 01:02:26
    Author     : Maru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta name="description" content="Ivietech final project" />
        <meta name="author" content="Maru" />
        <title>Board game Shop</title>
        <jsp:include page="include/css.jsp" />
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">  
            <!-- start page container -->    
            <div class="page-container">
                <!-- start header + sidebar menu -->    
                <jsp:include page="include/header+sidebar-menu.jsp" />
                <!-- end header + sidebar menu --> 
                <!-- start page content -->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <div class="page-bar">
                            <div class="page-title-breadcrumb">
                                <div class=" pull-left">
                                    <div class="page-title">Dashboard</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">Dashboard</li>
                                </ol>
                            </div>
                        </div>
                        <!-- start widget -->
                        <div class="state-overview">
                            <div class="row">
                                <div class="col-xl-3 col-md-6 col-12">
                                    <div class="info-box bg-blue">
                                        <span class="info-box-icon push-bottom"><i class="material-icons">style</i></span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Orders</span>
                                            <span class="info-box-number">450</span>
                                            <div class="progress">
                                                <div class="progress-bar width-60"></div>
                                            </div>
                                            <span class="progress-description">
                                                20% Increase in 28 Days
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                                <div class="col-xl-3 col-md-6 col-12">
                                    <div class="info-box bg-orange">
                                        <span class="info-box-icon push-bottom"><i class="material-icons">card_travel</i></span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Bounce Rate</span>
                                            <span class="info-box-number">155</span>
                                            <div class="progress">
                                                <div class="progress-bar width-40"></div>
                                            </div>
                                            <span class="progress-description">
                                                40% Increase in 28 Days
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                                <div class="col-xl-3 col-md-6 col-12">
                                    <div class="info-box bg-purple">
                                        <span class="info-box-icon push-bottom"><i class="material-icons">phone_in_talk</i></span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Response</span>
                                            <span class="info-box-number">52</span>
                                            <div class="progress">
                                                <div class="progress-bar width-80"></div>
                                            </div>
                                            <span class="progress-description">
                                                80% Increase in 28 Days
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                                <div class="col-xl-3 col-md-6 col-12">
                                    <div class="info-box bg-success">
                                        <span class="info-box-icon push-bottom"><i class="material-icons">monetization_on</i></span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Earning</span>
                                            <span class="info-box-number">13,921</span><span>$</span>
                                            <div class="progress">
                                                <div class="progress-bar width-60"></div>
                                            </div>
                                            <span class="progress-description">
                                                60% Increase in 28 Days
                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->
                            </div>
                        </div>
                        <!-- end widget -->

                    </div>
                </div>           
                <!-- start footer -->
                <jsp:include page="include/footer.jsp" />
                     <!-- end footer -->
            </div>
        </div>


        <!-- end page container -->
        <!-- start js include path -->
        <jsp:include page="include/js.jsp" />
        <!-- end js include path -->
    </body>
</html>
