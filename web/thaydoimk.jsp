<%-- 
    Document   : dangnhap
    Created on : Oct 17, 2024, 5:53:22 AM
    Author     : Administrator
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>

    <head>
        <title>Forgot Password</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/thaydoimk.css">
    </head>
    <style>

        .social-container a {
            border: 1px solid #DDDDDD;
            border-radius: 50%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin: 0 5px;
            height: 40px;
            width: 40px;
        }
    </style>
    <body>

        <div class="btn">
            <a href="home_dangnhap.jsp"><button class="ghost-btn">Quay Lại</button></a>
        </div>

        <div class="container forget-form" id="container">
            <div class="form-container">
                <form action="thaydoimatkhau" method="get">
                    <h1>Thay Đổi Mật Khẩu</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>


                    <input type="password" name="matkhaucu" value="${matkhaucu}" placeholder="Mật Khẩu Cũ" />
                    <input type="password" name="matkhau" value="${matkhau}" placeholder="Mật khẩu Mới" />
                    <input type="password" name="matkhaumoi" value="${again}" placeholder="Nhập lại Mật khẩu" />

                    <c:if test="${not empty error}">
                        <p style="color: red">${error}</p>
                    </c:if>


                    <c:if test="${not empty success}">
                        <p style="color: green">${success}</p>
                    </c:if>

                    <button type="submit"  >Xác Nhận</button>
                </form>
            </div>
        </div>
    </body>
</html>