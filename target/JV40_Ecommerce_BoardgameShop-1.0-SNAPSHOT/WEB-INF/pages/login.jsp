<%-- 
    Document   : login
    Created on : Jun 20, 2019, 8:17:26 PM
    Author     : AnhLe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../pages/includeadmin/css.jsp" />
    </head>
    <body>
        <!-- /login?error=true -->
        <c:if test="${message != null && message != ''}">
            <p style="color: red">${message}</p>
        </c:if>
        
            <div class="limiter">
                <div class="container-login100 page-background">
                    <div class="wrap-login100">
                        <form class="login100-form validate-form" action="j_spring_security_check" method="post">
                            <span class="login100-form-logo">
                                <i class="zmdi zmdi-flower"></i>
                            </span>
                            <span class="login100-form-title p-b-34 p-t-27">
                                Log in
                            </span>
                            <div class="wrap-input100 validate-input" data-validate = "Enter username">
                                <input class="input100" type="text" name="username">
                                <span class="focus-input100" data-placeholder="&#xf207;"></span>
                            </div>
                            <div class="wrap-input100 validate-input" data-validate="Enter password">
                                <input class="input100" type="password" name="password" >
                                <span class="focus-input100" data-placeholder="&#xf191;"></span>
                            </div>
                            <div class="contact100-form-checkbox">
                                <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                                <label class="label-checkbox100" for="ckb1">
                                    Remember me
                                </label>
                            </div>
                            <div class="container-login100-form-btn">
                                <button class="login100-form-btn">
                                    Login
                                </button>
                            </div>
                            <div class="text-center p-t-90">
                                <a class="txt1" href="#">
                                    Forgot Password?
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
       
        <jsp:include page="../pages/includeadmin/js.jsp" />
    </body>
</html>
