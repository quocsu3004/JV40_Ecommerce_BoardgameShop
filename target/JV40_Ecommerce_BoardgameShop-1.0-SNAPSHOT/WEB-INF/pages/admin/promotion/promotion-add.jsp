<%-- 
    Document   : promotion-edit
    Created on : Mar 8, 2021, 7:37:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta name="description" content="Responsive Admin Template" />
        <meta name="author" content="SmartUniversity" />
        <title>Hippo Meeple Store |Edit Promotion</title>
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
                                    <form:form  action="${pageContext.request.contextPath}/admin/promotion/${action}"
                                                method="POST" modelAttribute="promotion">                                 

                                        <div class="card-body row" >

                                            <div class="col-lg-6 p-t-20" hidden="">
                                                <c:if test="${action == 'edit'}">
                                                    <form:input path="id" value="${promotion.id}"  />
                                                </c:if>
                                            </div>



                                            <div class="col-lg-6 p-t-20"  > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <form:input path="name" class = "mdl-textfield__input" value="${promotion.name}" />
                                                    <form:errors path="name" cssStyle="color:red;" />
                                                    <label class = "mdl-textfield__label" for="name">Name</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20" > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <form:input path="description" type="textarea" class = "mdl-textfield__input"  value="${promotion.description}" />
                                                    <form:errors path="description" cssStyle="color:red;" />
                                                    <label class = "mdl-textfield__label" for="descriptione">Description</label>
                                                </div>
                                            </div>


                                            <div class="col-lg-6 p-t-20" > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <form:label  path="product">Choose Product</form:label>
                                                        <select name="product" multiple="multiple" >
                                                        <c:forEach var="p" items="${product}">                                
                                                            <c:if test="${promotion.product.id == p.id}">
                                                                <option value="${p.id}" selected="">${p.name}</option>
                                                            </c:if>
                                                            <c:if test="${promotion.product.id != p.id}">
                                                                <option value="${p.id}">${p.name}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>                                                                          
                                                    <form:errors path="product" cssStyle="color:red;" />

                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20" > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <label class = "form-group" for="discount">Discount(%)</label>
                                                    <input name="discount" type="number" value="${promotion.discount}" />
                                                    <form:errors path="discount" cssStyle="color:red;" />

                                                </div>
                                            </div>       


                                            <div class="col-lg-6 p-t-20"  > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <label class = "form-group" for="startDate">Start Date</label>
                                                    <input name="startDate" type="date"  value="${promotion.startDate}" />
                                                    <form:errors path="startDate" cssStyle="color:red;" />

                                                </div>
                                            </div>   

                                            <div class="col-lg-6 p-t-20" > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <label class = "form-group" for="endDate">End Date</label>
                                                    <input name="endDate" type="date"  value="${promotion.endDate}" />
                                                    <form:errors path="startDate" cssStyle="color:red;" />

                                                </div>
                                            </div> 

                                            <div class="col-lg-6 p-t-20">
                                                <div >
                                                    <form:label path="status">Promotion Status</form:label>
                                                    <form:select path="status" class="form-control">  
                                                        <c:forEach var="s" items="${promotionstatus}">

                                                            <form:option value="${s}"  > ${s} </form:option> 

                                                        </c:forEach> 
                                                    </form:select>
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
