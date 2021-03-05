<%-- 
    Document   : addproduct-page
    Created on : Mar 2, 2021, 5:05:48 PM
    Author     : Admin
--%>

<%@page import="com.mycompany.jv40_ecommerce_boardgameshop.enums.ProductStatus"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta name="description" content="Responsive Admin Template" />
        <meta name="author" content="SmartUniversity" />
        <title>Hippo Meeple Store |Add New Product</title>
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
                                    <div class="page-title">Add New Product</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="/admin/">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="/JV40_Ecommerce_BoardgameShop/admin/viewproduct">View Product</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">Add New Product</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card-box">
                                    <div class="card-head">
                                        <header>Add New Product</header>
                                    </div>
                                    <mvc:form enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/${action} "
                                              method="POST" modelAttribute="product">                                 

                                        <div class="card-body row">

                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <input name="name"  class = "mdl-textfield__input" type = "text" name = "name" value="${product.name}" />
                                                    <label class = "mdl-textfield__label" for="name">Name</label>
                                                </div>
                                            </div>



                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <input name="totalPlayer"  class = "mdl-textfield__input" type = "text" id = "totalPlayer" value="${product.totalPlayer}">
                                                    <label class = "mdl-textfield__label" for="totalPlayer">Total Player</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20">
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" name="price"
                                                           pattern = "-?[0-9]*(\.[0-9]+)?" id = "price" value="${product.price}">
                                                    <label class = "mdl-textfield__label" for = "price">Price</label>
                                                    <span class = "mdl-textfield__error">Price is required!</span>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20">
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text"  name="quantity"
                                                           pattern = "-?[0-9]*(\.[0-9]+)?" id = "quantity" value="${product.quantity}">
                                                    <label class = "mdl-textfield__label" for = "quantity">Quantity</label>
                                                    <span class = "mdl-textfield__error">Quantity is required!</span>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class = "mdl-textfield__input" type = "text" name="age" id = "age" value="${product.age}">
                                                    <label class = "mdl-textfield__label">Age</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="form-group">
                                                    <label for="file">Product Images: </label> 
                                                    <input type="file" name="file" accept="image/png, image/jpg" multiple class="form-control"/>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="form-group">
                                                    <label>Category</label>
                                                    <select name="categoryId.id" class="form-control">
                                                        <c:forEach var="c" items="${category}">                                
                                                            <option value="${c.id}">${c.name}</option> 
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20">
                                                <div class="form-group">
                                                    <label for="publisherId">Publisher</label>
                                                    <select name="publisherId" class="form-control">
                                                        <c:forEach var="p" items="${publisher}">                                
                                                            <option value="${p.id}">${p.name}</option> 
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-12 p-t-20 text-center"> 
                                                <button type="submit"  class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
                                                <button type="reset" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Reset</button>
                                            </div> 
                                        </div>
                                    </mvc:form>
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
