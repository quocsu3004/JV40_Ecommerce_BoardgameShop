<%-- 
    Document   : orderdetail-viewpage
    Created on : Mar 12, 2021, 11:10:01 AM
    Author     : Admin
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
                <!-- start page content -->
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <div class="page-bar">
                            <div class="page-title-breadcrumb">
                                <div class=" pull-left">
                                    <div class="page-title">Invoice</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    <li><a class="parent-item" href="">Extra</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">Invoice</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="white-box">
                                    <h3><b>INVOICE</b> <span class="pull-right">#${cart.code}</span></h3>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="pull-left">
                                                <address>
                                                    <img src="<c:url value="/resources-management/img/logo.png" />" alt="logo" class="logo-default" />
                                                    <p class="text-muted m-l-5">
                                                        Hippo Meeple <br> 59 Loseby <br>
                                                        0982.06.7777   <br> Đa Nang 
                                                    </p>
                                                </address>
                                            </div>
                                            <div class="pull-right text-right">
                                                <address>
                                                    <p class="addr-font-h3">To,</p>
                                                    <p class="font-bold addr-font-h4">${cart.fullName}</p>
                                                    <p class="text-muted m-l-30">
                                                        ${cart.address} <br> ${cart.phoneNumber} <br>
                                                        ${cart.gender} <br> Status: ${cart.status}
                                                    </p>
                                                    <p class="m-t-30">
                                                        <b>Order Date :</b> <i class="fa fa-calendar"></i> ${cart.orderDate}
                                                    </p>
                                                </address>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="table-responsive m-t-40">
                                                <table class="table table-hover">
                                                    <thead>

                                                        <tr>                           
                                                            <th class="center"> Product </th>
                                                            <th class="center"> Image </th>
                                                            <th class="center"> Quantity </th>
                                                            <th class="center"> Discounted On Each </th>
                                                            <th class="text-right"> Price Each </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="c" items="${cartdetail}">
                                                            <tr>
                                                                <td class="center">${c.productId.name}</td>
                                                                <td class="center">
                                                                    <c:forEach items="${c.productId.image}" var="i">
                                                                        <img width="150" a src="<c:url value="/resources-management/img/product-img/${i.name}"/>" >

                                                                    </c:forEach>
                                                                </td>
                                                                <td class="center">${c.quantity}</td>
                                                                <td class="center"> <fmt:formatNumber value="${c.discount}"    minFractionDigits="0" /> % </td>

                                                                <td class="text-right"><fmt:formatNumber value="${c.price}"  type="currency" currencySymbol="$" minFractionDigits="0" /></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="pull-right m-t-30 text-right">

                                                <h3><b>Total Price: </b><fmt:formatNumber value="${cart.totalPrice}"  type="currency" currencySymbol="$" minFractionDigits="0" /></h3> </div>
                                            <div class="clearfix"></div>
                                            <hr>
                                            <div class="text-right">

                                                <button onclick="javascript:window.print();" class="btn btn-default btn-outline" type="button"> <span><i class="fa fa-print"></i> Print</span> </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end page content -->
                <!-- start chat sidebar -->

                <!-- Start Doctor Chat --> 

                <!-- End Doctor Chat --> 

                <!-- end page container -->
                <!-- start footer -->
                <jsp:include page="../../includeadmin/footer.jsp" />
                <!-- end footer -->
            </div>
            <!-- end page content -->


            <!-- start js include path -->
            <jsp:include page="../../includeadmin/js.jsp" />
            <!-- end js include path -->
    </body>
</html>
