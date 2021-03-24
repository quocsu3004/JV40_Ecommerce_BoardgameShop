<%-- 
    Document   : accounthome
    Created on : Mar 24, 2021, 3:00:50 PM
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
                                    <div class="page-title">All Accounts</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/admin/" />">Home</a>&nbsp;<i class="fa fa-angle-right"></i>     
                                    <li class="active">All Accounts</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>All Accounts</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        <div class="row p-b-20">
                                            <div class="col-md-6 col-sm-6 col-6">
                                                <div class="btn-group">
                                                    <a href="<c:url value="/admin/addnewaccount" />"" id="addRow" class="btn btn-info">
                                                        Add New Account <i class="fa fa-plus"></i>
                                                    </a>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="table-scrollable">

                                            <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                <thead>
                                                    <tr>
                                                        <th class="center"> Name </th>
                                                        <th class="center"> Email </th>
                                                        <th class="center"> Role </th>
                                                        <th class="center"> Status </th>
                                                        <th class="center"> Action </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="a" items="${account}">
                                                    <td class="center">${a.fullName}</td>
                                                    <td class="center">${a.email}</td>
                                                    <td class="center">
                                                        <c:forEach items="${accountService.findListAccountRoleName(a.id)}" var="ac">
                                                            <br>${ac}
                                                        </c:forEach>
                                                    </td>
                                                    <td class="center"><b>${a.status}</b></td>
                                                    <td class="center">
                                                        <a href="<c:url value="/admin/accountupdate/${a.id}" />"" class="btn btn-tbl-edit btn-xs">
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
            <!-- end js include path -->
    </body>
</html>
