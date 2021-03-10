<%-- 
    Document   : promotion-page
    Created on : Mar 8, 2021, 1:35:27 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta name="description" content="Ivietech final project" />
        <meta name="author" content="Maru" />
        <title>Board game Shop</title>
        <jsp:include page="../includeadmin/css.jsp" />
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">  
            <!-- start page container -->    
            <div class="page-container">
                <!-- start header + sidebar menu -->    
                <jsp:include page="../includeadmin/header+sidebar-menu.jsp" />
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <div class="page-bar">
                            <div class="page-title-breadcrumb">
                                <div class=" pull-left">
                                    <div class="page-title">View Promotion</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/admin/" />">Home</a>&nbsp;<i class="fa fa-angle-right"></i>     
                                    <li class="active">All Promotions</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>All Promotions</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        <div class="row p-b-20">
                                            <div class="col-md-6 col-sm-6 col-6">
                                                <div class="btn-group">
                                                    <a href="<c:url value="/admin/addpromotion" />"" id="addRow" class="btn btn-info">
                                                        Add New Promotion <i class="fa fa-plus"></i>
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-6">
                                                <div class="btn-group pull-right">
                                                    <a class="btn deepPink-bgcolor  btn-outline dropdown-toggle" data-toggle="dropdown">Tools
                                                        <i class="fa fa-angle-down"></i>
                                                    </a>
                                                    <ul class="dropdown-menu pull-right">
                                                        <li>
                                                            <a href="javascript:;">
                                                                <i class="fa fa-print"></i> Print </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">
                                                                <i class="fa fa-file-pdf-o"></i> Save as PDF </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:;">
                                                                <i class="fa fa-file-excel-o"></i> Export to Excel </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="table-scrollable">

                                            <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                <thead>
                                                    <tr>
                                                        
                                                        <th class="center"> Name </th>
<!--                                                        <th class="center"> Product Apply </th>-->
                                                        <th class="center"> Discount </th>
                                                        <th class="center"> Start Date </th>
                                                        <th class="center"> End Date </th>
                                                        <th class="center"> Description </th>
                                                        <th class="center"> Status </th>
                                                        <th class="center"> Action </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${promotion}" var="pr">
                                                        <tr class="odd gradeX">
                                                            
                                                            <td class="center">${pr.name}</td>
<!--                                                            <td class="center"></td>-->
                                                            <td class="center">${pr.discount}%</td>                                                                                   
                                                            <td class="center">${pr.startDate}</td>
                                                            <td class="center">${pr.endDate}</td>                 
                                                             <td class="center">${pr.description}</td>
                                                            <td class="center"><b>${pr.status}</b></td>
                                                            <td class="center">
                                                                <a href="<c:url value="/admin/editpromotion/${pr.id}" />"" class="btn btn-tbl-edit btn-xs">
                                                                    <i class="fa fa-pencil"></i>
                                                                </a>                                  
                                                            </td>
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
                <jsp:include page="../includeadmin/footer.jsp" />
                <!-- end footer -->
            </div>
            <!-- end page content -->


            <!-- start js include path -->
            <jsp:include page="../includeadmin/js.jsp" />
            <!-- end js include path -->
    </body>
</html>
