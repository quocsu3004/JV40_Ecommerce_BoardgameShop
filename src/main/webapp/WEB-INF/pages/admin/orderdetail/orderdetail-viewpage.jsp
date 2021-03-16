<%-- 
    Document   : orderdetail-viewpage
    Created on : Mar 12, 2021, 11:10:01 AM
    Author     : Admin
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
        <jsp:include page="../../includeadmin/css.jsp" />
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">  
            <!-- start page container -->    
            <div class="page-container">
                <!-- start header + sidebar menu -->    
                <jsp:include page="../../includeadmin/header+sidebar-menu.jsp" />
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <div class="page-bar">
                            <div class="page-title-breadcrumb">
                                <div class=" pull-left">
                                    <div class="page-title">All Orders</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/admin/" />">Home</a>&nbsp;<i class="fa fa-angle-right"></i>     
                                    <li class="active"> Order Detail</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>Order Detail</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        <div class="row p-b-20">

                                            <div class="col-md-12 col-sm-12 col-12">
                                                <div class="btn-group pull-right">
                                                    <a class="btn deepPink-bgcolor  btn-outline dropdown-toggle" data-toggle="dropdown">Tools
                                                        <i class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">                 
                                                        <li>
                                                            <a href="<c:url value="/admin/exportcartdetail/${id}" />">
                                                                <i class="fa fa-file-excel-o"></i> Export to PDF </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="table-scrollable">

                                            <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                <thead>
                                                    <tr>

                                                        <th class="center"> Cart Id </th>
                                                        <th class="center"> Product </th>
                                                        <th class="center"> Price </th>
                                                        <th class="center"> Quantity </th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="c" items="${cart}">
                                                        <tr class="odd gradeX">
                                                            <td class="center">${c.cartId.id}</td>        
                                                            <td class="center">${c.productId.name}</td>
                                                            <td class="center">${c.price}</td>
                                                            <td class="center">${c.quantity}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
