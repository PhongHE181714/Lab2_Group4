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
                            NHÂN VIÊN <i class="mdi mdi-chevron-down"></i>
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
                                <a href="nhanvien">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span> Trang Chủ </span>
                                </a>
                            </li>

                            <li>
                                <a href="nhanvienphanhoi">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span>Phản Hồi </span>
                                </a>
                            </li>
                            <li>
                                <a href="profilenhanvien">
                                    <i class="fe-airplay"></i>
                                    <span class="badge badge-success float-right">01</span>
                                    <span>Profile </span>
                                </a>
                            </li>
                        </ul>

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

                    <!-- Start Content-->
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">Dashboard</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-xl-3 col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body p-0">
                                        <div class="p-3 pb-0">
                                            <div class="float-right">
                                                <i class="mdi mdi-eye-outline text-danger widget-icon"></i>
                                            </div>
                                            <h5 class="text-muted font-weight-normal mt-0">Doanh Thu</h5>
                                            <h3 class="mt-2">${doanhthu}</h3>
                                        </div>
                                        <div id="sparkline1"></div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col-->

                            <div class="col-xl-3 col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body p-0">
                                        <div class="p-3 pb-0">
                                            <div class="float-right">
                                                <i class="mdi mdi-currency-usd text-danger widget-icon"></i>
                                            </div>
                                            <h5 class="text-muted font-weight-normal mt-0">Lợi Nhuận</h5>
                                            <h3 class="mt-2">${loinhuan}</h3>
                                        </div>
                                        <div id="sparkline2"></div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col-->

                            <div class="col-xl-3 col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body p-0">
                                        <div class="p-3 pb-0">
                                            <div class="float-right">
                                                <i class="mdi mdi-eye-outline text-danger widget-icon"></i>
                                            </div>
                                            <h5 class="text-muted font-weight-normal mt-0">Tiền Chưa Nhận</h5>
                                            <h3 class="mt-2">${chuatra}</h3>
                                        </div>
                                        <div id="sparkline3"></div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end -->
                            <div class="col-xl-3 col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body p-0">
                                        <div class="p-3 pb-0 red">
                                            <div class="float-right">
                                                <i class="mdi mdi-cart text-primary widget-icon"></i>
                                            </div>
                                            <h5 class="text-muted font-weight-normal mt-0">Tổng Vé</h5>
                                            <h3 class="mt-2">${ticket}</h3>
                                        </div>
                                        <div id="sparkline4"></div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col-->


                            <div class="col-xl-3 col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body p-0">
                                        <div class="p-3 pb-0">
                                            <div class="float-right">
                                                <i class="mdi mdi-account-multiple text-primary widget-icon"></i>
                                            </div>
                                            <h5 class="text-muted font-weight-normal mt-0">Tổng số người dùng</h5>
                                            <h3 class="mt-2">${user}</h3>
                                        </div>
                                        <div id="sparkline5"></div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col-->

                            <div class="col-xl-3 col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body p-0">
                                        <div class="p-3 pb-0">
                                            <div class="float-right">
                                                <i class="mdi mdi-eye-outline text-danger widget-icon"></i>
                                            </div>
                                            <h5 class="text-muted font-weight-normal mt-0">Tổng Nhân Viên</h5>
                                            <h3 class="mt-2">${nhanvien}</h3>
                                        </div>
                                        <div id="sparkline6"></div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> 
                            <div class="col-xl-3 col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body p-0">
                                        <div class="p-3 pb-0">
                                            <div class="float-right">
                                                <i class="mdi mdi-eye-outline text-danger widget-icon"></i>
                                            </div>
                                            <h5 class="text-muted font-weight-normal mt-0">Tổng Ghế Thương Gia</h5>
                                            <h3 class="mt-2">${ghe}</h3>
                                        </div>
                                        <div id="sparkline7"></div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col-->

                            <div class="col-xl-3 col-lg-6">
                                <div class="card widget-flat">
                                    <div class="card-body p-0">
                                        <div class="p-3 pb-0">
                                            <div class="float-right">
                                                <i class="mdi mdi-eye-outline text-danger widget-icon"></i>
                                            </div>
                                            <h5 class="text-muted font-weight-normal mt-0">Tổng Số Chuyến Bay</h5>
                                            <h3 class="mt-2">${sochuyenbay}</h3>
                                        </div>
                                        <div id="sparkline8"></div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end 
                            <!-- end row --><!-- end col-->
                        </div>

                        <div class="row">
                            <div class="col-12">

                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title" style="font-weight: 600;">Đánh Giá Khách Hàng</h4>
                                        <div class="table-responsive mt-3">
                                            <table class="table table-hover table-centered mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>STT</th>
                                                        <th>Mã Khách Hàng</th>
                                                        <th>Tên Tài Khoản</th>

                                                        <th>Phản Hồi </th>
                                                        <th>Đánh Giá</th>
                                                      
                                                       
                                                        <th>Trả Lời</th>
                                                       
                                                        <th>Kiểm Tra </th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>


                                                <tbody>

                                                    <c:forEach items="${list}" var="l" varStatus="status">
                                                        <tr>
                                                            <td scope="row">${status.index + 1}</td> <!-- Dùng biến index để hiển thị số thứ tự -->

                                                            <td>

                                                                ${l.passsagerid}

                                                            </td>
                                                            <td>${l.username}</td>
                                                            <td>${l.feedbackText}</td>
                                                            <td>${l.rating}</td>



                                                            <td>${l.phanhoinv}</td>

                                                            <td>${l.checkResponseStatus()}</td>

                                                            <td>
                                                                <div class="dropdown">
                                                                    <button style="background-color: #FFE165; padding: 5px 20px; border: 1px solid white; border-radius: 5px; color: black;">Tùy Chọn</button>
                                                                    <div class="dropdown-content" style="background-color: #e7e6e6; border-radius: 1px;">
                                                                        <a href="deletefeedback?id=${l.feedbackId}">Xóa</a>
                                                                        <a href="nhanvien_ph.jsp?feedbackId=${l.feedbackId}">Phản Hồi</a>
                                                                    </div>
                                                                </div>
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
                                    <a href="gioithieu.jsp">About Us</a>
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
