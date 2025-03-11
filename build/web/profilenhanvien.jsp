<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Employee" %>
<%
    Employee pp = (Employee) request.getAttribute("pp");
    String editMode = request.getParameter("editMode");
%>
<!DOCTYPE html>
<html lang="vn">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrapadmin.css" rel="stylesheet" type="text/css">
        <link href="css/admin.css" rel="stylesheet" type="text/css">
        <title>Nhân Viên Dashboard</title>
        <style>
            .name{
                display: flex;
            }
            .table2{
                margin-left: 10%;
            }
            .lua{
                border: 1px solid black;
                width: 100%;
                height: 100%;

            }
            .lua a{
                padding: 5%;

            }
        </style>
    </head>

    <body>
        <div id="wrapper">
            <div class="navbar-custom">
                <ul class="list-unstyled topnav-menu float-right mb-0">
                    <li>
                        <a class="nav-link nav-user mr-0 waves-effect waves-light admin-btn" href="#" role="button">
                            <span class="pro-user-name ml-1">Nhân Viên <i class="mdi mdi-chevron-down"></i></span>
                        </a>
                    </li>
                </ul>
            </div>

            <div class="left-side-menu">
                <div class="slimscroll-menu">
                    <a href="dangnhap.jsp" class="logo text-center mb-4">
                        <span class="logo-lg">
                            <img src="img/logo.png" alt="" height="50">
                        </span>
                    </a>

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

                    <div class="logout-container" style="margin-top:580px; margin-left: 25.5px; position: absolute">
                        <button class="logout-button" style="background-color: #e74c3c; padding: 10px 70px; border: none; border-radius: 5px;">
                            <a href="dangnhap.jsp" style="color: white;">Log out</a>
                        </button>
                    </div>
                </div>
            </div>

            <div class="content-page">
                <div class="content">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h2 class="header-title" id="customerTable">Thông Tin Cá Nhân</h2>
                                    <div class="table-responsive mt-3">
                                        <div class="name">

                                            <table class="table1">
                                                <tr>
                                                    <td>Tên Nhân Viên:</td>
                                                    <td><input type="text"  value="${pp.employeeName}"  readonly/></td>
                                                </tr>
                                                <tr>
                                                    <td>Số Điện Thoại:</td>
                                                    <td><input type="number"   value="${pp.tel}" readonly /></td>
                                                </tr>
                                                <tr>
                                                    <td>Email:</td>
                                                    <td><input type="text"   value="${pp.email}"   readonly/></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td>

                                                        <a class="lua" style="background: #008A9B"  href="profilenhanvien?id=${pp.employeeid}">Chỉnh Sửa</a>

                                                    </td>
                                                </tr>
                                            </table>


                                            <form action="profilenhanvien" method="post" class="table2">
                                                <table >
                                                    <tr>
                                                        <td>Tên Nhân Viên:</td>
                                                        <td><input type="text" name="name" value="${e.employeeName}"   /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Số Điện Thoại:</td>
                                                        <td><input type="number"  name="number"  value="${e.tel}" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Email:</td>
                                                        <td><input type="text"  name="email" value="${e.email}" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>

                                                            <input  style="background: #008A9B" type="submit" value="Lưu"/>

                                                        </td>

                                                    </tr>
                                                    <tr><td>  

                                                            <div>${error}</div>
                                                        </td>
                                                </table>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- container-fluid -->
            </div> <!-- content -->

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
