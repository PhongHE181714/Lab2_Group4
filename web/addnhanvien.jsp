<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="model.PassagerInfor" %>
<%
    PassagerInfor pp = (PassagerInfor) request.getAttribute("pp");
%>
<%
    List<PassagerInfor> list = (List<PassagerInfor>) session.getAttribute("list");
%>

<!DOCTYPE html>
<html lang="vn">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
        <meta content="Coderthemes" name="author">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- App css -->
        <link href="css/bootstrapadmin.css" rel="stylesheet" type="text/css">
        <link href="css/admin.css" rel="stylesheet" type="text/css">

        <title>Admin Dashboard</title>
    </head>

    <body>
        <div id="wrapper">
            <div class="navbar-custom">
                <ul class="list-unstyled topnav-menu float-right mb-0">
                    <li>
                        <a class="nav-link nav-user mr-0 waves-effect waves-light admin-btn" href="#" role="button">
                            <span class="pro-user-name ml-1">ADMIN <i class="mdi mdi-chevron-down"></i></span>
                        </a>
                    </li>
                </ul>


            </div>

            <!-- Left Sidebar -->
            <div class="left-side-menu">
                <div class="slimscroll-menu">
                    <!-- LOGO -->
                    <a href="dangnhap.jsp" class="logo text-center mb-4">
                        <span class="logo-lg">
                            <img src="img/logo.png" alt="" height="50">
                        </span>
                    </a>

                    <!-- Sidebar Menu -->
                    <div id="sidebar-menu">
                        <ul class="metismenu" id="side-menu">
                            <li class="menu-title">Menu</li>
                            <li><a href="admin"><i class="fe-airplay"> </i> <span class="badge badge-success float-right">01</span>Trang Chủ </a></li>
                            <li><a href="thongtinkhachhang"> <span class="badge badge-success float-right">01</span><i class="fe-airplay"></i> Khách Hàng </a></li>
                            <li><a href="tracuutheoma"><i class="fe-airplay"> </i> <span class="badge badge-success float-right">01</span>Tra Cứu Theo ID </a></li>
                            <li><a href="tracuutheoten"><i class="fe-airplay"> </i> <span class="badge badge-success float-right">01</span>Tra Cứu Theo Tên </a></li>


                            <li><a href="tracuukhachhang"> <span class="badge badge-success float-right">01</span><i class="fe-airplay"></i> Tra cứu KH </a></li>
                            <li><a href="tracuuchuyenbay"> <span class="badge badge-success float-right">01</span><i class="fe-airplay"></i> Tra cứu CB </a></li>
                        </ul>
                    </div>

                    <div class="logout-container" style="margin-top:580px; margin-left: 25.5px; position: absolute">
                        <button class="logout-button" style="background-color: #e74c3c; padding: 10px 70px; border: none; border-radius: 5px;">
                            <a href="dangnhap.jsp" style="color: white;">Log out</a>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Page Content -->
            <div class="content-page">
                <div class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h2 class="header-title" id="customerTable">Tuyển Nhân Viên</h2>
                                    <div class="table-responsive mt-3">
                                        <form action="addnhanvien" method="post">
                                            <table class="table table-hover table-centered mb-0">


                                                <tbody>
                                                    <tr>
                                                        <td>Nhập Tên:</td>
                                                        <td><input type="text" name="name" value="${name}" required/></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Nhập Số Điện Thoại:</td>
                                                        <td><input type="number" name="number" value="${number}" required/></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Nhập Email:</td>
                                                        <td><input type="text" name="email" value="${email}" required/></td>
                                                    </tr>
                                                    <tr>

                                                        <td><h4>Cấp Tài Khoản</h4></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>

                                                        <td>Tên Đăng Nhập:</td>
                                                        <td><input type="text" name="username" value="${username}" required/></td>
                                                    </tr>

                                                    <tr>
                                                        <td>Nhập Mật Khẩu:</td>
                                                        <td><input type="password" name="password" value="${password}" required/></td>
                                                    </tr>

                                                    <tr>

                                                        <td><input type="submit" style="background: #FFE165"  value="Tuyển Nhân Viên" /></td>
                                                        <td>${error}</td>
                                                    </tr>

                                                </tbody>

                                            </table>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- container-fluid -->
            </div> <!-- content -->

            <!-- Footer -->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6"></div>
                        <div class="col-md-6">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="trangchu.jsp">About Us</a>
                                <a href="contact.jsp">Help</a>
                                <a href="contact.jsp">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>
