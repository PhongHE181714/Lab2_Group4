<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Passager" %>
<%@ page import="dal.DAOPASSAGER" %>
<%
    Passager currentUser = (Passager) request.getAttribute("user");
%>  
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thông Tin Người Dùng</title>
        <link rel="stylesheet" type="text/css" href="css/ttng.css">
    </head>
    <style>
        .btn {
            margin-bottom: 735px;
            position: absolute;
            z-index: 1;
        }

        .ghost-btn {
            background-color: #FFE165;
            border-color: #FFFFFF;
            color: black;
            padding: 15px 200px;
            border-radius: 15px;
        }

        .ghost-btn:hover {
            background-color: #ccc;
            color: black;
        }

        table tr:hover {
            background-color: #f1f1f1;
        }


        .user-info>div>input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            box-sizing: border-box;
            font-size: 14px;
            color: #333;
        }

        div {
            margin-bottom: 15px;
        }
        .btn-cn {
            background-color: #FF4B4B; /* Màu nền đỏ */
            color: #fff; /* Màu chữ trắng */
            padding: 10px 20px; /* Khoảng cách trong nút */
            border: none; /* Bỏ viền mặc định */
            border-radius: 25px; /* Bo tròn nút */
            font-size: 16px; /* Kích thước chữ */
            font-weight: bold; /* Chữ đậm */
            cursor: pointer; /* Con trỏ thay đổi khi hover */
            display: inline-block;
            text-align: center;
            transition: background-color 0.3s ease; /* Hiệu ứng khi hover */
            margin-left: 315px;
        }

        .btn-cn:hover {
            background-color: #D94343; /* Màu nền khi hover */
        }

    </style>
    <body>
        <div class="btn">
            <a href="home_dangnhap.jsp"><button class="ghost-btn">Quay Lại</button></a> 
        </div>

        <!-- ttng.jsp -->
        <div class="container">
            <div class="content-container">
                <h1>Thông Tin Người Dùng</h1>
                <ul class="user-info">
                    <table>
                        <form action="thongtincanhan" method="post">
                            <div>
                                Mã Khách Hàng: <input type="text" name="id" value="${id}" readonly>
                            </div>
                            <div>
                                Tên Khách Hàng: <input type="text" name="name" value="${name}">
                            </div>
                            <div>
                                Số Điện Thoại: <input type="text" name="tel" value="${tel}">
                            </div>
                            <div>
                                CCCD: <input type="text" name="cardid" value="${cardid}">
                            </div>
                            <div>
                                Email: <input type="text" name="email" value="${email}">
                            </div>
                            <input class="btn-cn" type="submit" value="Cập Nhật"/>
                        </form>
                    </table>
                </ul>
            </div>
        </div>
    </body>
</html>
