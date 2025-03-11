<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vn">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
        <meta content="Coderthemes" name="author">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="css/bootstrapadmin.css" rel="stylesheet" type="text/css">
        <link href="css/admin.css" rel="stylesheet" type="text/css">
        <title>Quản Trị</title>
        <style>
            .message-content{
                display: flex;
            }
            .message-date{
                margin-left: 5%;
            }
        </style>
    </head>

    <body>
        <div id="wrapper">
            <!-- Topbar Start -->
            <div class="navbar-custom">
                <ul class="list-unstyled topnav-menu float-right mb-0">
                    <a class="nav-link nav-user mr-0 waves-effect waves-light admin-btn" href="#" role="button">
                        <span class="pro-user-name ml-1">Khách Hàng<i class="mdi mdi-chevron-down"></i></span>
                    </a>
                </ul>
                <ul class="list-unstyled menu-left mb-0">
                    <li class="float-left">
                        <button class="button-menu-mobile open-left disable-btn">
                            <i class="fe-menu"></i>
                        </button>
                    </li>
                </ul>
            </div>
            <!-- end Topbar -->

            <!-- ========== Left Sidebar Start ========== -->
            <div class="left-side-menu">
                <div class="slimscroll-menu">
                    <!-- LOGO -->
                    <a href="dangnhap.jsp" class="logo text-center mb-4">
                        <span class="logo-lg">
                            <img src="img/logo.png" alt="" height="50">
                        </span>
                    </a>

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">

                        <ul class="metismenu" id="side-menu">

                            <li class="menu-title">Menu</li>

                            <li>
                                <a href="home_dangnhap.jsp">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span> Trang Chủ </span>
                                </a>
                            </li>

                            <li>
                                <a href="Vemaybay.jsp">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span>Vé Máy Bay </span>
                                </a>
                            </li>
                            <li>
                                <a href="tracuu.jsp">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span>Tra Cứu </span>
                                </a>
                            </li>
                              <li>
                                <a href="gioithieu.jsp">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span>Giới Thiệu </span>
                                </a>
                            </li>
                            <li>
                                <a href="contact.jsp">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span>Contact </span>
                                </a>
                            </li>
                            <li>
                                <a href="homthu">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span>Tin Nhắn </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span>Profile </span>
                                </a>
                            </li>
                        </ul>

                    </div>
                    <div class="clearfix"></div>
                </div>

                <div class="logout-container" style="margin-top:580px; margin-left: 25.5px; position: absolute">
                    <button class="logout-button" style="background-color: #e74c3c; padding: 10px 70px; border: none; border-radius: 5px; cursor: pointer;">
                        <a href="dangnhap.jsp" style="color: white;">Log out</a>
                    </button>
                </div>
            </div>
            <!-- Left Sidebar End -->

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <div class="content">
                    <!-- Start Content-->
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">Thông Tin Tin Nhắn</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h2 class="header-title">Danh Sách Tin Nhắn</h2>
                                        <div class="message-list">
                                            <!-- Ví dụ: hiển thị các tin nhắn -->
                                            <ul class="list-unstyled">
                                                <c:forEach var="l" items="${list}">
                                                    <li class="message-item">
                                                        <div class="message-content">
                                                            <strong>${l.phanhoinv}</strong>
                                                            <span class="message-date">${l.datefeddback}</span>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div> <!-- container -->
                </div> <!-- content -->
            </div> <!-- content-page -->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                        </div>
                        <div class="col-md-6">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="gioithieu.jsp">About Us</a>
                                <a href="contact.jsp">Help</a>
                                <a href="contact.jsp">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div> <!-- wrapper -->

        <script src="jquery.min.js"></script>
        <script src="bootstrap.bundle.min.js"></script>
        <script src="admin.js"></script>
    </body>

</html>
