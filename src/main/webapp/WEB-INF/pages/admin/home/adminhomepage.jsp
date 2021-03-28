<%-- 
    Document   : adminhomepage
    Created on : 24 Feb 2021, 01:02:26
    Author     : Maru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta name="description" content="Ivietech final project" />
        <meta name="author" content="Maru" />
        <title>Board game Shop</title>
        <jsp:include page="../../includeadmin/css.jsp" />
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">  
            <!-- start page container -->    
            <div class="page-container">
                <!-- start header + sidebar menu -->    
                <jsp:include page="../../includeadmin/header+sidebar-menu.jsp" />
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
                                        <span class="info-box-icon push-bottom"><i class="material-icons">shopping_cart</i></span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Orders</span>
                                            <span class="info-box-number">${totalCart}</span>
                                            <div class="progress">
                                                <div class="progress-bar "></div>
                                            </div>
                                            <span class="progress-description">

                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>
                                <!-- /.col -->

                                <!-- /.col -->

                                <!-- /.col -->
                                <div class="col-xl-3 col-md-6 col-12">
                                    <div class="info-box bg-success">
                                        <span class="info-box-icon push-bottom"><i class="material-icons">monetization_on</i></span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">Total Earning</span>
                                            <span class="info-box-number"><fmt:formatNumber type="currency" value="${totalEarning}" currencySymbol="$" minFractionDigits="0"/></span><span></span>

                                            </span>
                                            <div class="progress">
                                                <div class="progress-bar "></div>
                                            </div>
                                            <span class="progress-description">

                                            </span>
                                        </div>
                                        <!-- /.info-box-content -->
                                    </div>
                                    <!-- /.info-box -->
                                </div>

                                <div class="col-xl-4 col-md-6 col-12">
                                    <div class="info-box bg-b-pink">
                                        <span class="info-box-icon push-bottom"><i class="material-icons">fiber_new</i></span>
                                        <div class="info-box-content">
                                            <span class="info-box-text">New Customers</span>
                                            <span class="info-box-number"><fmt:formatNumber  value="${newCustomer}"  minFractionDigits="0"/></span><span></span>

                                            </span>
                                            <div class="progress">
                                                <div class="progress-bar "></div>
                                            </div>
                                            <span class="progress-description">

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
                <jsp:include page="../../includeadmin/footer.jsp" />
                <!-- end footer -->
            </div>
        </div>


        <!-- end page container -->
        <!-- start js include path -->
        <jsp:include page="../../includeadmin/js.jsp" />
        <!-- end js include path -->
    </body>
</html>
