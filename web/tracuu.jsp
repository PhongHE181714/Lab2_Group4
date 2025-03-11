<%-- Document : tracuu --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ hàng - Vé máy bay</title>
        <link rel="apple-touch-icon" href="apple.jsp">
        <link rel="stylesheet" href="css/tracuu.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap2.css">
        <link rel="stylesheet" href="css/font.css">
        <link rel="stylesheet" href="css/hero.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/date.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="Shortcut Icon" href="img/logo-i.png" type="img/x-icon" />
        <link rel="stylesheet" href="css/gioithieu.css">
        <link href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>
    <style>
        .footer {
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
    <body>
        <div id="main">
            <section class="page-heading" id="top">
                <div class="container">
                    <div class="logo">
                        <img src="img/logo.png" alt="Flight Template">
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
        </div>

        <section class="cart-container">
            <div class="cart-item">
                <div class="flight-info">
                    <c:if test="${not empty ticketList}">
                        <div class="ticket-container">
                            <c:forEach var="ticket" items="${ticketList}">
                                <h3>Vé ID: ${ticket.getTicketID()}</h3>
                                <p><span>Hạng vé:</span>
                                    <c:choose>
                                        <c:when test="${ticket.getTicketclass() == 1}">
                                            Thường
                                        </c:when>
                                        <c:when test="${ticket.getTicketclass() == 2}">
                                            Thương gia
                                        </c:when>
                                    </c:choose>
                                </p>
                                <p><span>Số hiệu chuyến bay:</span> ${ticket.getFlightNumber()}</p>
                                <p><span>Khởi hành:</span>${ticket.getDeparTime()} ${ticket.getDepart()}</p>
                                <p><span>Đến:</span> ${ticket.getArrivalTime()} ${ticket.getArrival()}</p>
                                <p><span>Giá vé:</span> ${ticket.getPrice()}</p>
                                <form action="thanhtoan" method="post">
                                    <input type="hidden" name="tickettId" value="${ticket.getTicketID()}">
                                    <button class="remove-btn">Xóa</button>
                                </form>
                            </c:forEach>
                        </div>
                    </c:if>
                    <c:if test="${empty ticketList}">
                        <div class="no-orders-message">
                            <h3>Bạn không có đơn hàng nào.</h3>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="cart-total">
                <form action="thanhtoan" method="post">
                    <input type="hidden" name="action" value="pay">
                    <button class="checkout-btn">Thanh toán</button>
                </form>
            </div>
        </section>

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
