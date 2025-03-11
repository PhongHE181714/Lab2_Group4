<%-- 
    Document   : dangnhap
    Created on : Oct 17, 2024, 5:53:22 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!------ Include the above in your HEAD tag ---------->
<%
    String action = request.getParameter("action");
    if ("logout".equals(action)) {
        if (session != null) {
            session.invalidate(); // Xóa session
        }
        response.sendRedirect("dangnhap.jsp"); // Chuyển hướng lại về chính trang đăng nhập
        return;
    }
%>
<!DOCTYPE html>
<html>

    <head>
        <title>My Awesome Login Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/dangnhap.css">
    </head>

    <style>
        .form-group1 {
            display: flex;
            gap: 10px;
        }
        .form-group1 input {
            width: 100%;
            padding: 8px;
        }
        .container {
            width: 875px;
            max-width: 100%;
            min-height: 608px;
        }
    </style>
    <body>
        <div class="btn">
            <a href="home.jsp"><button class="ghost-btn">Quay Lại</button></a>
        </div>

        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="login" method="post">
                    <h1>Tạo Tài Khoản</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>

                    <div class="form-group1">
                        <input type="text" name="hoten" value="${name}" placeholder="Họ Và Tên" required=""/>
                        <input type="tel" name="sdt" value="${phone}" placeholder="Số Điện Thoại" required=""/>
                    </div>
                    <input type="email" name="email" value="${email}" placeholder="Nhập Email" required=""/>
                    <input type="text" name="idcard" value="${idcard}" placeholder="Nhập CCCD" required=""/>
                    <input type="text" name="tendangnhap" value="${ten}" placeholder="Tên đăng nhập" required=""/>
                    <input type="password" name="matkhau" value="${matkhau}" placeholder="Mật khẩu" required=""/>
                    <input type="password" name="matkhaulai" value="${again}" placeholder="Nhập lại Mật khẩu" required=""/>

                    <p style="color: red">${error}</p>

                    <button type="submit" name="action" value="register">Đăng Ký</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Sign in</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>

                    <input type="text" name="username" value="${username}" placeholder="Tên đăng nhập" />
                    <input type="password" name="password" value="${password}" placeholder="Mật khẩu" />
                    <a href="forget.jsp">Forgot your password?</a>
                    <p style="color: red">${error}</p>
                    <button type="submit" name="action" value="login">Đăng Nhập</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <img src="img/logo.png" alt="alt"/>
                        <p>Để giữ kết nối với chúng tôi, vui lòng đăng nhập bằng thông tin cá nhân của bạn</p>
                        <button class="ghost" id="signIn" type="submit" name="action" value="login">Đăng Nhập</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <img src="img/logo.png" alt="alt"/>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Đăng ký</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const signUpButton = document.getElementById('signUp');
            const signInButton = document.getElementById('signIn');
            const container = document.getElementById('container');

            signUpButton.addEventListener('click', () => {
                container.classList.add('right-panel-active');
            });

            signInButton.addEventListener('click', () => {
                container.classList.remove('right-panel-active');
            });
        </script>
    </body>
</html>

