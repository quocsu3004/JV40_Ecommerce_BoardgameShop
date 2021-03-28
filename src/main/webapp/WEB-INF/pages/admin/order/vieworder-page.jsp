<%-- 
   Document   : vieworder-page
   Created on : Mar 10, 2021, 10:20:27 PM
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
                <div class="page-content-wrapper">
                    <div class="page-content">
                        <div class="page-bar">
                            <div class="page-title-breadcrumb">
                                <div class=" pull-left">
                                    <div class="page-title">All Orders</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/admin/" />">Home</a>&nbsp;<i class="fa fa-angle-right"></i>     
                                    <li class="active"> All Orders</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>All Orders</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        <div class="row p-b-20">
                                            <div class="col-md-6 col-sm-6 col-6">
                                                <div class="btn-group">
                                                    <a href="<c:url value="/admin/addproduct" />" id="addRow" class="btn btn-info">
                                                        Add New Product <i class="fa fa-plus"></i>
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
                                                            <a href="<c:url value="/admin/export/excel" />">
                                                                <i class="fa fa-file-excel-o"></i> Export to Excel </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row p-b-20">
                                            <div class="col-md-6 col-sm-6 col-6">
                                                <form action="${pageContext.request.contextPath}/admin/vieworder">
                                                    <div class="col-lg-6" >  
                                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                            <input  name="startDate" type="date" class = "mdl-textfield__input" value="${startDate}"  />
                                                            <label class = "mdl-textfield__label" for="startDate">From</label>
                                                        </div> 
                                                    </div>
                                                    <div class="col-lg-6" > 
                                                        <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                            <input  name="endDate" type="date" class = "mdl-textfield__input" value="${endDate}"  />
                                                            <label class = "mdl-textfield__label" for="endDate">To</label>
                                                        </div>   
                                                    </div>


                                                    <div class="col-lg-3"> 
                                                        <button type="submit"  class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Search</button>
                                                    </div> 
                                                </form> 
                                            </div>
                                        </div>  
                                        <div class="table-scrollable">

                                            <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                <thead>

                                                    <tr>

                                                        <th class="center"> Cart Number </th>
                                                        <th class="center"> Customer Name </th>
                                                        <th class="center"> Phone </th>
                                                        <th class="center"> Order Date </th>
                                                        <th class="center"> Total Price </th>
                                                        <th class="center"> Status </th>
                                                        <th class="center"> View Details </th>
                                                        <th class="center"> Action </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${cart}" var="c">
                                                        <tr class="odd gradeX">

                                                            <td class="center">${c.code}</td>
                                                            <td class="center">${c.fullName}</td>
                                                            <td class="center">${c.phoneNumber}</td>
                                                            <td class="center">${c.orderDate}</td>
                                                            <td class="center"><fmt:formatNumber value="${c.totalPrice}"  type="currency" currencySymbol="$" minFractionDigits="0" /></td>
                                                            <td class="center"><b>${c.status}</b></td>
                                                            <td class="center">
                                                                <a href="<c:url value="/admin/vieworderdetail/${c.id}" />"" class="btn btn-tbl-edit btn-xs">
                                                                    <i class="fa fa-plus-square"></i>
                                                            </td>
                                                            <td class="center">
                                                                <a href="<c:url value="/admin/changestatusorder/${c.id}" />"" class="btn btn-tbl-edit btn-xs">
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
                <jsp:include page="../../includeadmin/footer.jsp" />
                <!-- end footer -->
            </div>
            <!-- end page content -->


            <!-- start js include path -->
            <jsp:include page="../../includeadmin/js.jsp" />
            <jsp:include page="../../includeadmin/datepicker.jsp" />

            <!-- end js include path -->
    </body>
</html>
