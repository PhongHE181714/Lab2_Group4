<%-- 
    Document   : admin.jsp
    Created on : Oct 18, 2024, 10:55:48 AM
    Author     : Administrator
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description">
        <meta content="Coderthemes" name="author">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- App favicon -->

        <!-- App css -->
        <link href="css/bootstrapadmin.css" rel="stylesheet" type="text/css">
        <link href="css/admin.css" rel="stylesheet" type="text/css">

    </head>

    <body>

        <!-- Begin page --> 
        <div id="wrapper">

            <!-- Topbar Start -->
            <div class="navbar-custom">
                <ul class="list-unstyled topnav-menu float-right mb-0">
                    <a class="nav-link nav-user mr-0 waves-effect waves-light admin-btn" href="#" role="button">
                        <span class="pro-user-name ml-1">
                            ADMIN <i class="mdi mdi-chevron-down"></i>
                        </span>
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
                                <a href="admin">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span> Trang Chủ </span>
                                </a>
                            </li>
                            <li>
                                <a href="thongtinkhachhang">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span> Khách Hàng </span>
                                </a>
                            </li>
                            <li>
                                <a href="tracuutheoma">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span> Tra Cứu Theo ID </span>
                                </a>
                            </li>
                            <li>
                                <a href="tracuutheoten">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span> Tra Cứu Theo Tên </span>
                                </a>
                            </li>
                            <li>
                                <a href="tracuukhachhang">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span> Tất Cả KH </span> 
                                </a>
                            </li>
                            <li>
                                <a href="tracuuchuyenbay">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span> Tra cứu CB </span> 
                                </a>
                            </li>



                    </div>
                    <!-- End Sidebar -->

                    <div class="clearfix"></div>


                </div >

                <div class="logout-container" style="margin-top:580px; margin-left: 25.5px; position: absolute">
                    <button class="logout-button" style="background-color: #e74c3c; /* Màu nền cho nút */
                            padding: 10px 70px; /* Khoảng cách bên trong nút */
                            border: none; /* Không có viền */
                            border-radius: 5px; /* Bo góc */
                            cursor: pointer; /* Con trỏ khi hover */
                            transition: background-color 0.3s; /* Hiệu ứng chuyển màu */"><a href="dangnhap.jsp" style="color: white;">Log out</a></button>
                </div>


            </div>
            <!-- Left Sidebar End -->

            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title" style="font-weight: 600;">Quản lí nhân viên</h4>
                                    <div class="table-responsive mt-3">

                                        <table class="table table-hover table-centered mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Mã Khách Hàng</th>
                                                    <th>Tên Khách Hàng</th>
                                                    <th>Số Điện Thoại</th>
                                                    <th>CCCD</th>
                                                    <th>Email</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>


                                            <tbody>

                                                <c:forEach  items="${p}" var="p">
                                                    <tr>
                                                        <th scope="row">${p.id}</th>
                                                        <td>
                                                            <div class="overflow-hidden">
                                                                <p class="mb-0 font-weight-medium"><a href="tracuukhachhang?id=${p.id}"><p>${p.name}</p></a></p>

                                                            </div>
                                                        </td>

                                                        <td>
                                                            ${p.tel}
                                                        </td>

                                                        <td>
                                                            ${p.card}
                                                        </td>
                                                        <td>
                                                            ${p.email}
                                                        </td>
                                                        <td>
                                                            <button style="background-color: #2ac14c; padding: 5px 20px; border: 0.5px solid #000; border-radius: 5px;"><a style="color: white;" href="tracuukhachhang?id=${p.id}">Tra cứu KH</a></button>                      
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End     -->

                </div> <!-- container-fluid -->

            </div> <!-- content -->

            <script>
                document.querySelector('.dropdown button').addEventListener('click', function () {
                    var dropdownContent = this.nextElementSibling;
                    dropdownContent.style.display = dropdownContent.style.display === 'block' ? 'none' : 'block';
                });
                document.querySelector('.admin-btn').addEventListener('click', function (event) {
                    event.preventDefault(); // Ng?n ch?n h�nh ??ng m?c ??nh
                    var dropdownMenu = document.getElementById('profile-dropdown');

                    // Ki?m tra tr?ng th�i hi?n th? c?a dropdown
                    if (dropdownMenu.style.display === 'block') {
                        dropdownMenu.style.display = 'none';
                    } else {
                        dropdownMenu.style.display = 'block';
                    }
                });

                // ?�ng menu khi b?m ra ngo�i
                window.onclick = function (event) {
                    if (!event.target.matches('.admin-btn')) {
                        var dropdownMenu = document.getElementById('profile-dropdown');
                        if (dropdownMenu.style.display === 'block') {
                            dropdownMenu.style.display = 'none';
                        }
                    }
                };

            </script>



            <!-- Footer Start -->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                        </div>
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
            <!-- end Footer -->

        </div>

        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->


    </div>
    <!-- END wrapper -->

    <!-- Right Sidebar -->

</body>

</html>
