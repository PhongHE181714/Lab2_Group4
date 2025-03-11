<a href="url"></a><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
  Integer sessionPassengerId = (Integer) session.getAttribute("passengerId");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Công ty ABC - Giới thiệu</title>
        <link rel="apple-touch-icon" href="apple.jsp">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap2.css">
        <link rel="stylesheet" href="css/font.css">
        <link rel="stylesheet" href="css/hero.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/date.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="Shortcut Icon" href="img/logo-i.png" type="img/x-icon" /> 
        <link rel="stylesheet" href="css/gioithieu.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <style>
            #customer-id-input {
                display: flex;
                align-items: center;
            }
            .makhachhang {
                margin-left: 30%;
                display: flex;
                align-items: center;
            }
            h2 {
                margin: 0;
            }
            input[type="text"] {
                margin-left: 10px;
                padding: 5px;
            }
            button {
                margin-left: 20px;
                background-color: yellow;
                border: none;
                padding: 5px 10px;
                cursor: pointer;
            }
            button:hover {
                background-color: gold;
            }
            .rated span {
                color: #FFD700;
                font-size: 20px;
            }
            .edit-button,
            .delete-button {
                background-color: yellow;
                color: black;
                border: none;
                padding: 10px 15px;
                cursor: pointer;
                border-radius: 5px;
                margin: 5px;
                transition: background-color 0.3s;
            }
            .edit-button:hover,
            .delete-button:hover {
                background-color: orange;
            }
            /* Thiết lập cho bảng chỉnh sửa */
            .edit-table-container {
                display: none;
                position: absolute;
                top: 0;
                left: 100%;
                margin-left: 20px;
                background-color: #f9f9f9;
                border: 1px solid #ddd;
                padding: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                width: 250px;
                z-index: 100;
                border-radius: 8px;
            }

            .edit-table-container h3 {
                margin-top: 0;
                font-size: 1.1em;
                color: #333;
            }

            .close-edit-table {
                background-color: transparent;
                color: #777;
                border: none;
                font-size: 18px;
                font-weight: bold;
                cursor: pointer;
                float: right;
            }

            .close-edit-table:hover {
                color: #333;
            }

            .edit-table-container input[type="text"] {
                width: 100%;
                padding: 8px;
                margin-top: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .edit-table-container button {
                background-color: #28a745;
                color: #fff;
                border: none;
                padding: 8px 12px;
                cursor: pointer;
                border-radius: 4px;
                margin-top: 10px;
            }

            .edit-table-container button:hover {
                background-color: #218838;
            }
            /* Kiểu dáng bảng */
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                font-size: 16px;
                text-align: left;
            }

            th, td {
                padding: 12px 15px;
                border: 1px solid #ddd;
            }

            th {
                background-color: #f4f4f4;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            .star-rating {
                display: flex;
                justify-content: center;
            }

            .star-rating input {
                display: none;
            }

            .star-rating label {
                color: gold;
                font-size: 1.5em;
                cursor: pointer;
            }

            .star-rating input:checked ~ label {
                color: gold;
            }
            .table-dg {
                border: 3px solid;
                border-radius: 10px;
                margin-top: 20px;
                width: 96%;
                margin-left: 2%;
                margin-right: 2%;
            }
            .binhluan{
                margin-top: 2%;
                margin-left: 20%;
            }
            .delete{
                background: yellow;
                width: 15%;
            }

            .footer {
                margin-top: 20px;
                background-color: #333; /* Thay đổi màu nền thành tối hơn */
                color: #f5f5f5; /* Chỉnh màu chữ để dễ đọc hơn */
                text-align: center;
                padding: 15px 0; /* Giảm padding để footer nhỏ hơn */
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                position: relative; /* Giữ footer ở cuối trang nhưng không cố định */
                bottom: 0;
                left: 0;
                right: 0;
                width: 100%; /* Đảm bảo footer chiếm toàn bộ chiều rộng */
            }

            .footer-content {
                max-width: 1000px; /* Giảm chiều rộng tối đa của nội dung */
                margin: 0 auto;
                padding: 0 15px; /* Thêm padding để căn chỉnh */
            }

            .footer-links {
                list-style: none;
                padding: 0;
                margin: 10px 0; /* Thêm khoảng cách trên dưới */
                display: flex;
                justify-content: center; /* Căn giữa các liên kết */
                flex-wrap: wrap; /* Cho phép các liên kết xuống dòng nếu quá dài */
            }

            .footer-links li {
                display: inline;
                margin: 0 10px; /* Giảm khoảng cách giữa các liên kết */
            }

            .footer-links a {
                color: #f5f5f5; /* Giữ màu chữ trắng */
                text-decoration: none;
                font-size: 14px; /* Giảm kích thước chữ cho gọn */
            }

            .footer-links a:hover {
                text-decoration: underline;
                color: #ffce54; /* Thêm hiệu ứng hover với màu vàng nhạt */
            }

            .footer small {
                display: block;
                margin-top: 10px; /* Thêm khoảng cách giữa liên kết và text nhỏ */
                font-size: 12px; /* Kích thước chữ nhỏ hơn */
                color: #ccc; /* Màu xám nhạt cho chữ nhỏ */
            }
        </style>
    </head>
        <section class="page-heading" id="top">
            <div class="container">
                <div class="logo">
                    <img src="img/logo.png" alt="Flight Template">
                    <span class="logo-text"></span>
                    <div class="page-direction-button">
                        <c:choose>
                            <c:when test="${not empty sessionScope.account}">
                                <a href="home_dangnhap.jsp"><i class="fa fa-home"></i> Đi Đến Trang Chủ</a>
                            </c:when>
                            <c:otherwise>
                                <a href="home.jsp"><i class="fa fa-home"></i> Đi Đến Trang Chủ</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </section>

        <section id="about-container">
            <div class="about-left">
                <img src="img/nhom1.jpg" alt="Hình ảnh công ty ABC">
            </div>
            <div class="about-right" id="about">
                <p>Công ty ABC được thành lập với sứ mệnh mang đến cho khách hàng những trải nghiệm tốt nhất khi đặt vé máy bay...</p>
            </div>
        </section>

        <section id="images">
            <h2></h2>
            <div class="image-gallery">
                <img src="img/P1.png" alt="Hình ảnh 1" class="image">
                <img src="img/P2.jpg" alt="Hình ảnh 2" class="image">
                <img src="img/P3.jpg" alt="Hình ảnh 3" class="image">
            </div>
        </section>

        <h2 class="binhluan">Đánh giá của khách hàng</h2>
        <form action="comment" method="get">
            <section id="reviews">
                <ul class="fb-comments">
                    <h2 style="color: red">${error}</h2>
                    <c:forEach items="${list}" var="l">
                        <li>
                            <div class="comment-avatar">
                                <img src="img/xmt2.jpg" alt="Avatar">
                            </div>
                            <div class="comment-content">
                                <strong>${l.username}</strong>
                                <div class="rated">
                                    <c:forEach var="i" begin="1" end="5">
                                        <span>${i <= l.rating ? '★' : '☆'}</span>
                                    </c:forEach>
                                </div>
                                <p class="feedback-text">${l.feedbackText}</p>
                                <span class="comment-time">${l.feedbackDate}</span>
                                <div class="comment-actions">


                                    <a href="comment?id=${l.feedbackId}" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>


                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </section>




        </form>




        <!-- Footer -->
        <footer class="footer">
            <div class="footer-content">
                <p>2024 Bay Nè. All rights reserved.</p>
                <ul class="footer-links">
                    <li><a href="#">Điều khoản dịch vụ</a></li><li><a href="#">Chính sách bảo mật</a></li>
                    <li><a href="#">Liên hệ</a></li>
                </ul>
            </div>
        </footer>
    </body>
</html>
