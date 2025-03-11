<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="model.Acount" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap2.css">
        <link rel="stylesheet" href="css/font.css">
        <link rel="stylesheet" href="css/hero.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/vemaybay.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

        <title>Bán vé máy bay</title>
    </head>

    <style>
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
    <body>

        <div id="main">
            <section class="page-heading" id="top">
                <div class="container">
                    <div class="logo">
                        <img src="img/logo.png" alt="Flight Template">
                        <div class="page-direction-button">
                            <a href="home_dangnhap.jsp"><i class="fa fa-home"></i> Đi Đến Trang Chủ</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- Container chứa phần mua vé -->
        <div class="container">
            <div class="content-container">
                <h2>Vé máy bay</h2>
                <form class="flight-form" action="datve" method="get">
                    <h4>Lựa Chọn Chuyến Đi Của Bạn:</h4>
                    <div class="trip-type">
                        <input type="radio" id="oneway" name="trip" value="oneway" checked="" ${trip == 'oneway' ? 'checked' : ''}>
                        <label for="oneway">Một chiều</label>

                        <input type="radio" id="roundtrip" name="trip" value="roundtrip" ${trip == 'roundtrip' ? 'checked' : ''}>
                        <label for="roundtrip">Khứ hồi</label>
                    </div>

                    <div class="form-group">
                        <label for="from">Từ:</label><select required name='from'>
                            <option value="">Lựa chọn địa điểm...</option>
                            <option value="Hà Nội" <c:if test="${from == 'Hà Nội'}">selected</c:if> >Hà Nội</option>
                            <option value="Hồ Chí Minh" <c:if test="${from == 'Hồ Chí Minh'}">selected</c:if>>Hồ Chí Minh</option>
                            <option value="Đà Nẵng" <c:if test="${from == 'Đà Nẵng'}">selected</c:if>>Đà Nẵng</option>
                            <option value="Hải Phòng"<c:if test="${from == 'Hải Phòng'}">selected</c:if> >Hải Phòng</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="to">Đến:</label>
                            <select required name='to'>
                                <option value="">Lựa chọn địa điểm...</option>
                                <option value="Hà Nội" <c:if test="${to == 'Hà Nội'}">selected</c:if> >Hà Nội</option>
                            <option value="Hồ Chí Minh" <c:if test="${to == 'Hồ Chí Minh'}">selected</c:if>>Hồ Chí Minh</option>
                            <option value="Đà Nẵng" <c:if test="${to == 'Đà Nẵng'}">selected</c:if> >Đà Nẵng</option>
                            <option value="Hải Phòng" <c:if test="${to == 'Hải Phòng'}">selected</c:if>>Hải Phòng</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="departure">Ngày Bắt Đầu:</label>
                            <input name="departure" value="${departure}" type="date" class="form-control" id="departure" placeholder="Lựa Chọn Ngày..." required>
                    </div>

                    <div class="form-group">
                        <label for="return">Ngày Trở về:</label>
                        <input name="return" value="${returnDate}" type="date" class="form-control" id="return" placeholder="Lựa Chọn Ngày..." <c:if test="${trip == 'roundtrip'}">required</c:if>>
                        </div>
                        <div class="form-group">
                            <label for="departure">Hạng vé</label>
                            <select required name="tclass">
                                <option value="thuong" <c:if test="${tclass == 'thuong'}">selected</c:if>>Thường</option>
                            <option value="thuonggia" <c:if test="${tclass == 'thuonggia'}">selected</c:if>>Thương gia</option>
                            </select>
                        </div>


                        <div class="form-group">
                            <label for="soluong">Số lượng vé</label>
                            <input type="number" name="soluongdat" class="form-control" value="${soluongdat}" required></div>
                    <div class="form-group">
                        <button type="submit" class="btn">Đặt Ngay Bây Giờ</button>
                        <p style="color:red;">${error}</p>
                    </div>
                </form>
                <table class="flight-list">
                    <thead>
                        <tr>
                            <th>Khởi Hành</th>
                            <th>Kết Thúc</th>
                            <th>Giá (VNĐ)</th>
                            <th>Giờ Khởi Hành</th>
                            <th>Mã máy bay</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <!-- Danh sách chuyến bay đi (dlist) -->
                    <tbody class="dlist">
                        <c:forEach items="${dlist}" var="l">
                            <tr>
                                <td>${l.getDepartureAirport()}</td>
                                <td>${l.getArrivalAirport()}</td>
                                <td>${l.getPrice()}</td>
                                <td>${l.getDepartureTime()}</td>
                                <td>${l.getFlightNumber()}</td>
                                <td>
                                    <form action="datve" method="post" style="display: inline;">
                                        <input type="hidden" name="listType" value="dlist">
                                        <input type="hidden" name="flightId" value="${l.getIdFlighttime()}">
                                        <button type="button" class="btn choose-ticket-btn"
                                                data-flight-id-d="${l.getFlightNumber()}"
                                                onclick="chooseDepartureTicket(this)"
                                                <c:if test="${sessionScope.chosenDepartureFlightId != null }">disabled</c:if>>
                                            <c:choose>
                                                <c:when test="${sessionScope.chosenDepartureFlightId == l.getIdFlighttime().toString()}">
                                                    Đặt vé thành công
                                                </c:when>
                                                <c:otherwise>
                                                    Chọn Vé
                                                </c:otherwise>
                                            </c:choose>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                    <!-- Danh sách chuyến bay về (rlist) -->
                    <tbody class="rlist">
                        <c:forEach items="${rlist}" var="r">
                            <tr>
                                <td>${r.getDepartureAirport()}</td>
                                <td>${r.getArrivalAirport()}</td>
                                <td>${r.getPrice()}</td>
                                <td>${r.getDepartureTime()}</td>
                                <td>${r.getFlightNumber()}</td>
                                <td>
                                    <form action="datve" method="post" style="display: inline;">
                                        <input type="hidden" name="listType" value="rlist">
                                        <input type="hidden" name="flightId" value="${r.getIdFlighttime()}">
                                        <button type="button" class="btn choose-ticket-btn"
                                                data-flight-id-r="${r.getFlightNumber()}"
                                                onclick="chooseReturnTicket(this)"
                                                <c:if test="${sessionScope.chosenReturnFlightId != null}">disabled</c:if>>
                                            <c:choose>
                                                <c:when test="${sessionScope.chosenReturnFlightId == r.getIdFlighttime().toString()}">
                                                    Đặt vé thành công
                                                </c:when>
                                                <c:otherwise>
                                                    Chọn Vé
                                                </c:otherwise>
                                            </c:choose>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
                <!-- Danh sách chuyến bay về (rlist) -->



                <a href="thanhtoan" class="btn">Thanh toán Chuyến Bay</a>
            </div>
        </div>



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
        <script>
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('departure').setAttribute('min', today);
            document.getElementById('return').setAttribute('min', today);
        </script>
        <script>
            function toggleReturnDate() {
                const returnDateField = document.getElementById('return');
                const roundTrip = document.getElementById('roundtrip').checked;

                // Nếu chọn vé khứ hồi, kích hoạt trường ngày về
                if (roundTrip) {
                    returnDateField.removeAttribute('disabled');  // Bỏ thuộc tính disabled
                    returnDateField.setAttribute('required', true);  // Yêu cầu người dùng phải nhập ngày về
                }
                // Nếu chọn vé một chiều, vô hiệu hóa trường ngày về
                else {
                    returnDateField.setAttribute('disabled', true);  // Vô hiệu hóa trường ngày về
                    returnDateField.removeAttribute('required');  // Loại bỏ yêu cầu bắt buộc nhập ngày về
                }
            }

            // Gọi hàm khi trang được load và khi người dùng thay đổi lựa chọn
            document.addEventListener('DOMContentLoaded', toggleReturnDate);
            document.getElementById('oneway').addEventListener('change', toggleReturnDate);
            document.getElementById('roundtrip').addEventListener('change', toggleReturnDate);
        </script>
        <script>
            let chosenDepartureFlightId = null; // Thay đổi biến để quản lý ID chuyến bay khởi hành
            let chosenReturnFlightId = null; // Thêm biến để quản lý ID chuyến bay trở về

            function chooseDepartureTicket(button) {
                const flightId = button.getAttribute('data-flight-id-d');

                // Xác nhận người dùng muốn chọn vé
                if (!confirm("Bạn có chắc chắn muốn chọn vé này không?")) {
                    return; // Nếu không xác nhận, dừng lại
                }

                // Nếu đã chọn vé trước đó, thì bỏ chọn
                if (chosenDepartureFlightId === flightId) {
                    chosenDepartureFlightId = null;
                    button.innerText = 'Chọn Vé';
                    enableAllButtons('.dlist'); // Kích hoạt lại tất cả các nút
                    return;
                }

                // Cập nhật ID chuyến bay đã chọn
                chosenDepartureFlightId = flightId;

                // Đổi nội dung nút thành "Đặt vé thành công"
                button.innerText = 'Đặt vé thành công';

                // Vô hiệu hóa các nút khác ngoại trừ nút hiện tại
                disableAllButtons('.dlist', button);
                button.closest('form').submit();
            }
            function chooseReturnTicket(button) {
                const flightId = button.getAttribute('data-flight-id-r');

                // Xác nhận người dùng muốn chọn vé
                if (!confirm("Bạn có chắc chắn muốn chọn vé này không?")) {
                    return; // Nếu không xác nhận, dừng lại
                }

                // Nếu đã chọn vé trước đó, thì bỏ chọn
                if (chosenReturnFlightId === flightId) {
                    chosenReturnFlightId = null;
                    button.innerText = 'Chọn Vé';
                    enableAllButtons('.rlist'); // Kích hoạt lại tất cả các nút
                    return;
                }

                // Cập nhật ID chuyến bay đã chọn
                chosenReturnFlightId = flightId;

                // Đổi nội dung nút thành "Đặt vé thành công"
                button.innerText = 'Đặt vé thành công';

                // Vô hiệu hóa các nút khác ngoại trừ nút hiện tại
                disableAllButtons('.rlist', button);
                button.closest('form').submit();
            }

            // Vô hiệu hóa tất cả các nút trừ nút đã chọn
            function disableAllButtons(listSelector, selectedButton) {
                const buttons = document.querySelectorAll(listSelector + ' .choose-ticket-btn');
                buttons.forEach(btn => {
                    if (btn !== selectedButton) {
                        btn.disabled = true; // Vô hiệu hóa các nút khác
                    } else {
                        btn.disabled = false; // Giữ nút đã chọn hoạt động
                    }
                });
            }

            // Kích hoạt lại tất cả các nút trong danh sách
            function enableAllButtons(listSelector) {
                const buttons = document.querySelectorAll(listSelector + ' .choose-ticket-btn');
                buttons.forEach(btn => {
                    btn.disabled = false; // Kích hoạt lại tất cả các nút
                    btn.innerText = 'Chọn Vé'; // Đặt lại nội dung nút
                });
            }


        </script>
    </body>
</html>