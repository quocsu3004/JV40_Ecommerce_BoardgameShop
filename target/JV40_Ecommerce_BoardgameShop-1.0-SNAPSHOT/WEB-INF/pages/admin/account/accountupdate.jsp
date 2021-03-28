<%-- 
    Document   : accountupdate
    Created on : Mar 24, 2021, 4:20:42 PM
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
                                    <div class="page-title">Account Update</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="<c:url value="/admin/" />">Home</a>&nbsp;<i class="fa fa-angle-right"></i>     
                                    <li class="active"> Accounts Update</li>
                                </ol>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>Accounts Update</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <form:form  action="${pageContext.request.contextPath}/admin/accountupdate/${action}"
                                                method="POST" modelAttribute="account">                                 

                                        <div class="card-body row" >

                                            <div class="col-lg-6 p-t-20" hidden="">
                                                <c:if test="${action == 'update'}">
                                                    <form:input path="id" value="${promotion.id}"  />
                                                </c:if>
                                            </div>



                                            <div class="col-lg-6 p-t-20"   > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <form:input path="email" class = "mdl-textfield__input" value="${account.email}" />
                                                    <form:errors path="email" cssStyle="color:red;" />
                                                    <label class = "mdl-textfield__label" for="email">Email</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20"> 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <form:input path="password" type="textarea" class = "mdl-textfield__input"  value="${account.password}" />
                                                    <form:errors path="password" cssStyle="color:red;" />
                                                    <label class = "mdl-textfield__label" for="password">Password</label>
                                                </div>
                                            </div>

                                            <% boolean exist = false;%> 
                                            <div class="col-lg-6 p-t-20" > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <form:label  path="accountRole">Choose Roles</form:label>    
                                                        <select name="listaccountRoleId" multiple="multiple" id="multiple" class="form-control select2-multiple" >
                                                        <c:forEach var="acr" items="${accountrole}">  
                                                            <c:forEach items="${accountService.findListAccountRoleid(account.id)}" var="ac">
                                                                <c:if test="${ac == acr.id}">
                                                                    <% exist = true;%>
                                                                </c:if>   
                                                            </c:forEach>

                                                            <% if (exist == true) {%>
                                                            <option value="${acr.id}" selected>${acr.role}</option>
                                                            <% } %>
                                                            <% if (exist == false) {%>
                                                            <option value="${acr.id}">${acr.role}</option>
                                                            <%}%>
                                                            <% exist = false;%>
                                                        </c:forEach>
                                                    </select>                                                                                                        
                                                </div>
                                            </div>



                                            <div class="col-lg-6 p-t-20">
                                                <div >
                                                    <form:label path="status">Account Status</form:label>
                                                    <form:select path="status" class="form-control">  
                                                        <c:forEach var="acs" items="${accountstatus}">

                                                            <form:option value="${acs}"  > ${acs} </form:option> 

                                                        </c:forEach> 
                                                    </form:select>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20" >
                                                <div >
                                                    <form:label path="gender" >Gender</form:label>
                                                        <select name="gender"  multiple="multiple" id="multiple" class="form-control select2-multiple">  
                                                        <c:forEach var="g" items="${gender}">
                                                            <c:if test="${account.gender == g}" >
                                                                <option value="${g}" selected=""  > ${g} </option> 
                                                            </c:if>
                                                        </c:forEach> 
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20"  > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <input name="fullName" type="text" class = "mdl-textfield__input" value="${account.fullName}" />
                                                    <label class = "mdl-textfield__label" for="name">Customer Name</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20" > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <input name="phoneNumber" type="text" class = "mdl-textfield__input" value="${account.phoneNumber}" />
                                                    <label class = "mdl-textfield__label" for="name">Customer Phone</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20" > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <input name="address" type="text" class = "mdl-textfield__input" value="${account.address}" />
                                                    <label class = "mdl-textfield__label" for="address">Address</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20"  > 
                                                <div class = "mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">              
                                                    <input name="birthDate" type="date" class = "mdl-textfield__input" value="${account.birthDate}" />
                                                    <label class = "mdl-textfield__label" for="birthDate">Birth Date</label>
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
