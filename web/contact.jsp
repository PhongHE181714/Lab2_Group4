<%-- 
    Document   : contact.jsp
    Created on : Oct 16, 2024, 3:08:50 PM
    Author     : Administrator
--%>
<a href="url"></a><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <!-- Mirrored from www.tooplate.com/templates/2093_flight/contact.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 28 May 2018 11:20:22 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <!--
        
        Template 2093 Flight
        
        http://www.tooplate.com/view/2093-flight
        
        -->
        <title>Flight - Contact Page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple.jsp" >

        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap2.css">
        <link rel="stylesheet" href="css/font.css">
        <link rel="stylesheet" href="css/hero.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
        <style>
            #rating {
                display: flex;
                align-items: center; /* Căn giữa theo chiều dọc */
            }
            #rating label {
                font-size: 24px; /* Kích thước sao */
                color: gray;
                cursor: pointer;
                margin: 0 2px; /* Khoảng cách giữa các sao */
            }
            #rating input[type="radio"] {
                display: none; /* Ẩn radio button */
            }
            #rating label:hover,
            #rating label:hover ~ label,
            #rating input:checked ~ label {
                color: gold; /* Màu vàng khi hover hoặc đã chọn */
            }

            .page-direction-button a {
                background-color: #ffe165;
                color: black;
                padding: 5px 15px;
                border-radius: 4px;
                text-decoration: none;
                font-size: 14px;
                display: inline-block;
            }
            .page-heading .logo {
                padding:  0px 0px;
                text-align: left;
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

    <body>


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



        <section class="contact-us">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Thông Tin Liên Hệ</h2>
                            <p>Hãy liên hệ với chúng tôi khi cần, chúng tôi luôn sẵn sàng hỗ trợ bạn với các dịch vụ tốt nhất.</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <img src="<%=request.getContextPath()%>/img/ba-na-hill.jpeg" alt="">
                    </div>
                    <div class="col-md-6">
                        <img src="<%=request.getContextPath()%>/img/dao-Phu-Quoc.jpg" alt="">
                    </div>
                    <div class="col-md-4">
                        <h6>Sự sang trọng và tinh tế</h6>
                        <p> Mô tả về sự sang trọng và thiết kế tinh tế trong các dịch vụ được cung cấp.</p>
                    </div>
                    <div class="col-md-4">
                        <h6>Dịch vụ chuyên nghiệp và tinh tế</h6>
                        <p> Giới thiệu về việc cung cấp dịch vụ với sự chuyên nghiệp và tinh tế.</p>
                    </div>
                    <div class="col-md-4">
                        <h6>Sự thuận tiện và tính thẩm mỹ cao</h6>
                        <p>Nói về sự thuận tiện và tính thẩm mỹ cao của các sản phẩm và dịch vụ.</p>
                    </div>
                </div>
            </div>
        </section>



        <section class="contact-form">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2 style="color:white">Hãy Để Lại Cho Chúng Tôi 1 Lời Nhắn</h2>
                        </div>
                    </div>
                    <div class="col-md-6 col-md-offset-3">
                        <form id="contact" action="phanhoi" method="get">
                            <div class="row">
                                <div class="col-md-12" >
                                    <fieldset>
                                        <legend style="color: white; margin-right:10px">Đánh Giá Dịch Vụ:</legend>
                                        <div id="rating" >
                                            <br>
                                            <input type="radio" name="rating" value="1" id="star1">
                                            <label for="star1">&#9733;</label>
                                            <input type="radio" name="rating" value="2" id="star2">
                                            <label for="star2">&#9733;</label>
                                            <input type="radio" name="rating" value="3" id="star3">
                                            <label for="star3">&#9733;</label>
                                            <input type="radio" name="rating" value="4" id="star4">
                                            <label for="star4">&#9733;</label>
                                            <input type="radio" name="rating" value="5" id="star5">
                                            <label for="star5">&#9733;</label>
                                        </div>
                                    </fieldset>
                                </div>



                                <div class="col-md-12">
                                    <fieldset>
                                        <textarea name="message" rows="6" class="form-control" id="message" placeholder="Lời Nhắn Của Bạn..." required=""></textarea>
                                    </fieldset>
                                </div>
                                <div class="col-md-12">
                                    <fieldset>
                                        <h4 style="color: green">${success}</h4>  
                                        <h4 style="color: red">${error}</h4> 
                                        <button type="submit" id="form-submit" class="btn">Gửi</button>
                                    </fieldset>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>



        <section class="map">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div id="map">
                            <!-- How to change your own map point
                                1. Go to Google Maps
                                2. Click on your location point
                                3. Click "Share" and choose "Embed map" tab
                                4. Copy only URL and paste it within the src="" field below
                            -->
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.4982266981415!2d105.52350832584094!3d21.01274168832742!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1729038498615!5m2!1svi!2s" width="1100px" height="600px" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

                        </div>
                    </div>
                </div>
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
