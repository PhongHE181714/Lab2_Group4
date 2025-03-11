<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>403 Forbidden</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap" rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Poppins', sans-serif;
            }
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background: #f8f9fa;
                color: #333;
            }
            .error-container {
                text-align: center;
                padding: 2rem;
                max-width: 600px;
            }
            .error-title {
                font-size: 7rem;
                color: #FFC107; /* Màu vàng */
                margin-bottom: 1rem;
                font-weight: bold;
                text-shadow: 2px 2px 8px rgba(255, 193, 7, 0.5); /* Bóng mờ màu vàng */
            }
            .error-message {
                font-size: 1.5rem;
                color: #495057;
                margin-bottom: 2rem;
            }
            .error-buttons a {
                text-decoration: none;
                padding: 0.75rem 2rem;
                margin: 0.5rem;
                font-size: 1rem;
                color: #fff;
                background-color: #FFC107; /* Nút màu vàng */
                border-radius: 25px;
                transition: all 0.3s ease;
            }
            .error-buttons a:hover {
                background-color: #FFA000; /* Màu vàng đậm hơn khi hover */
            }
            .social-icons {
                margin-top: 2rem;
            }
            .social-icons a {
                color: #FFC107; /* Màu vàng cho icon */
                font-size: 1.5rem;
                margin: 0 0.5rem;
                transition: color 0.3s ease;
            }
            .social-icons a:hover {
                color: #FFA000; /* Màu vàng đậm hơn khi hover */
            }
        </style>
    </head>
    <body>
       

        <div class="error-container">
            <div class="error-title">403</div>
            <div class="error-message">Lỗi Quyền Truy Cập! Bạn Không Có Quyền Truy Cập Trang Này</div>
            <div class="error-buttons">
                <a href="home.jsp">Go Home</a>

                <a href="contact.jsp">Contact Us</a>
            </div>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-pinterest"></i></a>
                <a href="#"><i class="fab fa-google-plus"></i></a>
            </div>
        </div>
    </body>
</html>
