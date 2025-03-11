<%-- 
    Document   : dangnhap
    Created on : Oct 17, 2024, 5:53:22 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>

    <head>
        <title>Forgot Password</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/forget.css">
    </head>
    <body>
        <div class="btn">
            <a href="dangnhap.jsp"><button class="ghost-btn">Quay Lại</button></a>
        </div>

        <div class="container forget-form" id="container">
            <div class="form-container">
                <form action="forget" method="post">
                    <h1>Forgot password</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <input type="text" name="tendangnhap" value="${ten}" placeholder="Tên đăng nhập" required="" />
                    <input type="text" name="email" value="${email}" placeholder="Email liên kết" required=""/>
                    <input type="password" name="matkhau" value="${matkhau}" placeholder="Mật khẩu" required=""/>
                    <input type="password" name="matkhaulai" value="${again}" placeholder="Nhập lại Mật khẩu" required=""/>

                    <c:if test="${not empty error}">
                        <p class="error-message">${error}</p>
                    </c:if>
                    <c:if test="${not empty success}">
                        <p class="success-message">${success}</p>
                    </c:if>

                    <button type="submit" style="padding-bottom: 10px; margin-top: -30px" >Xác Nhận</button>
                </form>
            </div>
        </div>
    </body>
</html>