<%-- 
    Document   : changeorder-page
    Created on : Mar 10, 2021, 11:01:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                                    <div class="page-title">Change Status Order</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/admin/" />">Home</a>&nbsp;<i class="fa fa-angle-right"></i>     
                                    <li class="active">Change Status Order</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>Change Status Order</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <form:form  action="${pageContext.request.contextPath}/admin/order/${action}"
                                                method="POST" modelAttribute="cart">                                 

                                        <div class="card-body row" >

                                            <div class="col-lg-6 p-t-20" hidden="" >
                                                <c:if test="${action == 'changestatus'}">
                                                    <form:input path="id" value="${cart.id}"   />
                                                </c:if>
                                                
                                            </div>

                                            <div class="col-lg-6 p-t-20">
                                                <div >
                                                    <form:label path="status">Order Status</form:label>
                                                    <form:select path="status" class="form-control">  
                                                        <c:forEach var="c" items="${cartStatus}">
                                                            <c:if test="${cart.status == c}" >
                                                                <form:option value="${c}" selected="" > ${c} </form:option> 
                                                            </c:if>
                                                            <c:if test="${cart.status != c}" >
                                                                <form:option value="${c}" selected="" > ${c} </form:option> 
                                                            </c:if>
                                                        </c:forEach> 
                                                    </form:select>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20" hidden="">
                                                <div >
                                                    <form:label path="gender" >Gender</form:label>
                                                    <form:select path="gender" class="form-control">  
                                                        <c:forEach var="g" items="${gender}">
                                                            <c:if test="${cart.gender == g}" >
                                                                <form:option value="${g}" selected=""  > ${g} </form:option> 
                                                            </c:if>
                                                        </c:forEach> 
                                                    </form:select>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20" hidden="" > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <form:input path="fullName" type="text" class = "mdl-textfield__input" value="${cart.fullName}" />
                                                    <label class = "mdl-textfield__label" for="name">Customer Name</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20" hidden=""> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <form:input path="phoneNumber" type="text" class = "mdl-textfield__input" value="${cart.phoneNumber}" />
                                                    <label class = "mdl-textfield__label" for="name">Customer Phone</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20" hidden="" > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <form:input path="address" type="text" class = "mdl-textfield__input" value="${cart.address}" />
                                                    <label class = "mdl-textfield__label" for="address">Address</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20"  hidden=""> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <form:input path="birthDate" type="date" class = "mdl-textfield__input" value="${cart.birthDate}" />
                                                    <label class = "mdl-textfield__label" for="birthDate">Birth Date</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20" hidden="" > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <form:input path="orderDate" type="date" class = "mdl-textfield__input" value="${cart.orderDate}" />
                                                    <label class = "mdl-textfield__label" for="orderDate">Order Date</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20" hidden=""> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                     <form:input path="totalPrice" type="number"  class = "mdl-textfield__input"  value="${cart.totalPrice}" /> 
                                                    <label class = "mdl-textfield__label" for="totalPrice">Total Price</label>
                                                </div>
                                            </div>       


                                            <div class="col-lg-12 p-t-20 text-center"> 
                                                <button type="submit"  class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
                                                <button type="reset" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Reset</button>
                                            </div> 

                                        </div>
                                    </form:form> 
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


