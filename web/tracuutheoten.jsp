<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="model.PassagerInfor" %>
<%
    List<PassagerInfor> pp = (List<PassagerInfor>)request.getAttribute("pp");
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

                <!-- Search Form -->
                <form class="form-inline search-bar" style="margin-top: 12px" method="get" action="tracuutheoten">
                    <input class="form-control mr-sm-2" type="search" name="search" placeholder="Tìm Kiếm Tên" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
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
                            <li><a href="tracuutheoten"> <span class="badge badge-success float-right">01</span><i class="fe-airplay"></i> Tra Cứu Theo Tên </a></li>
                            <li><a href="tracuukhachhang"> <span class="badge badge-success float-right">01</span><i class="fe-airplay"></i> Tất cứu KH </a></li>
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
                                    <h4 class="header-title" id="customerTable">Tra cứu Khách Hàng</h4>
                                    <div class="table-responsive mt-3">
                                        <table class="table table-hover table-centered mb-0">

                                            <c:choose>
                                                <c:when test="${not empty pp}">

                                                    <c:forEach items="${pp}" var="p">
                                                        <tr>
                                                            <td>${p.passengerId}</td>
                                                            <td>${p.passengerName}</td>
                                                            <td>${p.className}</td>
                                                            <td>${p.bookingDate}</td>
                                                            <td>${p.departureTime}</td>
                                                            <td>${p.arrivalTime}</td>
                                                            <td>${p.departureAirport}</td>
                                                            <td>${p.arrivalAirport}</td>
                                                            <td>${p.flightNumber}</td>
                                                            <td>${p.price}</td>
                                                            <td>${p.paymentStatus}</td>
                                                        </tr>
                                                    </c:forEach>

                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td colspan="11">${error}</td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                            </tbody>
                                        </table>
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
