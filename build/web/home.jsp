<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Flight - Travel and Tour</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple.jsp">
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/bootstrap2.css">
        <link rel="stylesheet" href="css/font.css">
        <link rel="stylesheet" href="css/hero.css">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/date.css">
        <link rel="stylesheet" href="css/home.css">
        <link rel="Shortcut Icon" href="img/logo-i.png" type="img/x-icon" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    </head>

    <style>
        .btn-head:hover {
            background: #ccc;
            color: black;
            cursor: pointer;
        }

        .navbar {
            position: fixed;
            top: 0;
            right: 0;
            width: 100%;
            background-color: #000;
            z-index: 1000;
        }

        #nav {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            margin-left: 85%;
        }

        .btn-head {
            margin-right: 20px;
        }

        #nav a {
            color: white;
            text-decoration: none;
            padding: 15px 20px;
            display: block;
            transition: background-color 0.3s;
        }

        #nav a:hover {
            background-color: #575757;
        }

        #account-menu {
            display: none;
            position: absolute;
            top: 60px;
            right: 20px;
            background-color: #333;
            border-radius: 5px;
            z-index: 999;
        }

        #account-menu ul {
            list-style: none;
            margin: 0;
            padding: 10px;
        }

        #account-menu li {
            margin: 10px 0;
        }

        #account-menu a {
            color: white;
            text-decoration: none;
            padding: 10px;
            display: block;
        }
        .menu-head {
            margin-left: 80%;
        }

        #account-menu a:hover {
            background: #ccc;
            color: black;
        }
    </style>

    <body>
        <div class="navbar">
            <ul id="nav">
                <li class="btn-head">
                    <a href="dangnhap.jsp">Đăng Nhập</a>
                </li>
                <li class="btn-head">
                    <a href="dangnhap.jsp">Đăng Ký</a>
                </li>
        </div>

        <section class="banner" id="top" style="margin-top: 50px">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <div class="left-side">
                            <div class="logo">
                                <img src="img/logo.png" alt="Flight Template" />
                            </div>
                            <div class="tabs-content">
                                <h4>Theo Dõi Chúng Tôi</h4>
                                <ul class="social-links">
                                    <li><a href="https://www.facebook.com/profile.php?id=100070408745241"><em>Facebook</em><i class="fab fa-facebook"></i></a></li>
                                    <li><a href="https://www.youtube.com/@hieuphamtrung7964"><em>YouTube</em><i class="fab fa-youtube"></i></a></li>
                                    <li><a href="https://www.instagram.com/phamtrunghieucr7/"><em>Instagram</em><i class="fab fa-instagram"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="page-direction-button">
                <a href="home.jsp" style="border-radius: 5px 5px 0 0;"><i style="font-family: 'Open Sans', arial, sans-serif;" class="fa "> Trang chủ</i></a>
                <a href="Vemaybay.jsp" style="border-radius: 5px 5px 0 0;"><i style="font-family: 'Open Sans', arial, sans-serif;" class="fa ">Vé Máy Bay</i></a>
                <a href="tracuu.jsp" style="border-radius: 5px 5px 0 0;"><i style="font-family: 'Open Sans', arial, sans-serif;" class="fa "> Tra cúu</i></a>
                <a href="gioithieu.jsp" style="border-radius: 5px 5px 0 0;"><i style="font-family: 'Open Sans', arial, sans-serif;" class="fa"> Giới thiệu</i></a>
                <a href="contact.jsp" style="border-radius: 5px 5px 0 0;"><i style="font-family: 'Open Sans', arial, sans-serif;" class="fa "> Liên Hệ Ngay</i></a>
            </div>
        </section>

        <!-- Corrected JavaScript -->
        <script>
            document.getElementById('menu-toggle').addEventListener('click', function () {
                var menu = document.getElementById('account-menu');
                if (menu.style.display === 'none' || menu.style.display === '') {
                    menu.style.display = 'block';
                } else {
                    menu.style.display = 'none';
                }
            });

            // Close menu if clicked outside
            window.onclick = function (event) {
                if (!event.target.matches('#menu-toggle')) {
                    var menu = document.getElementById('account-menu');
                    if (menu.style.display === 'block') {
                        menu.style.display = 'none';
                    }
                }
            }
        </script>


        <section class="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="service-item first-service">
                            <div class="service-icon"></div>
                            <h4>Dễ Dàng Với Tooplate</h4>
                            <p>Đa dạng hóa cách trình bày nội dung. Phát triển liên tục và sống động. Phù hợp với mọi nền tảng. Phát triển nội dung thông minh và dễ tiếp cận.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="service-item second-service">
                            <div class="service-icon"></div>
                            <h4>Ý Tưởng Độc Đáo</h4>
                            <p>Ý tưởng sáng tạo, kết hợp hài hòa với các yếu tố hiện đại. Sử dụng các thành phần đa dạng để tạo nên trải nghiệm thú vị. Chú trọng đến sự khác biệt và độc đáo.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="service-item third-service">
                            <div class="service-icon"></div>
                            <h4>Hỗ Trợ Tốt Nhất</h4>
                            <p>Đội ngũ hỗ trợ tận tình và chuyên nghiệp. Cung cấp dịch vụ chất lượng cao và phản hồi nhanh chóng. Chúng tôi luôn sẵn sàng hỗ trợ mọi lúc, mọi nơi.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="tabs-content" id="recommended-hotel">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>Khách Sạn Được Khuyến Nghị Cho Bạn</h2>
                        </div>
                    </div>
                    <div class="wrapper">
                        <div class="col-md-4">
                            <ul class="tabs clearfix" data-tabgroup="third-tab-group">
                                <li><a href="#livingroom" class="active">Phòng Khách <i class="fa fa-angle-right"></i></a></li>
                                <li><a href="#suitroom">Phòng Suite <i class="fa fa-angle-right"></i></a></li>
                                <li><a href="#swimingpool">Hồ Bơi <i class="fa fa-angle-right"></i></a></li>
                                <li><a href="#massage">Dịch Vụ Massage <i class="fa fa-angle-right"></i></a></li>
                                <li><a href="#fitness">Cuộc Sống Thể Dục <i class="fa fa-angle-right"></i></a></li>
                                <li><a href="#event">Sự Kiện Buổi Tối <i class="fa fa-angle-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <section id="third-tab-group" class="recommendedgroup">
                            <div id="livingroom">
                                <div class="text-content">
                                    <img src="img/Khach-san-Vinpearl-Tay-Ninh.jpg" alt="Phòng Khách" />
                                </div>
                            </div>
                            <div id="suitroom">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div id="owl-suiteroom" class="owl-carousel owl-theme">
                                            <div class="item">
                                                <div class="suiteroom-item">
                                                    <img src="img/suite-02.jpg" alt="Phòng Sạch Và Thư Giãn">
                                                    <div class="text-content">
                                                        <h4>Phòng Sạch Và Thư Giãn</h4>
                                                        <span>Khu Nghỉ Dưỡng Aurora</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="suiteroom-item">
                                                    <img src="img/suite-01.jpg" alt="Phòng Suite Đặc Biệt Có TV">
                                                    <div class="text-content">
                                                        <h4>Phòng Suite Đặc Biệt Có TV</h4>
                                                        <span>Khách Sạn Khao Yai</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="suiteroom-item">
                                                    <img src="img/suite-03.jpg" alt="Ghế Ngồi Tốt Nhất">
                                                    <div class="text-content">
                                                        <h4>Ghế Ngồi Tốt Nhất</h4>
                                                        <span>Khách Sạn Grand</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="swimingpool">
                                <img src="img/image001_XMHA.jpg" alt="Hồ Bơi Có View Tuyệt Đẹp">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="text-content">
                                            <h4>Hồ Bơi Có View Tuyệt Đẹp Dành Cho Khách Đặc Biệt</h4>
                                            <span>Khu Nghỉ Dưỡng</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="massage">
                                <img src="img/massage-service.jpg" alt="Dịch Vụ Massage">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="text-content">
                                            <h4>Nơi Lý Tưởng Để Thư Giãn</h4>
                                            <span>Bãi Biển</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="fitness">
                                <img src="img/fitness-service.jpg" alt="Cuộc Sống Thể Dục">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="text-content">
                                            <h4>Tập Luyện Đường Phố Đầy Thách Thức</h4>
                                            <span>Bãi Biển</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="event">
                                <img src="img/evening-event.jpg" alt="Sự Kiện Buổi Tối">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="text-content">
                                            <h4>Đêm Vang Rượu Tuyệt Nhất</h4>
                                            <span>Nhà Hàng Queen</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>

        <section id="most-visited">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <h2>ĐỊA ĐIỂM NỔI TIẾNG NHẤT</h2>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="owl-mostvisited" class="owl-carousel owl-theme">
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img src="img/du-lich-he-ho-hoan-kiem.jpg" alt="Hồ Hoàn Kiếm">
                                    <div class="text-content">
                                        <h4>Hồ Hoàn Kiếm</h4>
                                        <span>Còn được gọi là Hồ Gươm, là hồ nước ngọt tự nhiên của thành phố Hà Nội, hồ có diện 
                                            tích khoảng 12 hecta. Trước kia, hồ còn có các tên gọi là: hồ Lục Thủy, hồ Thủy Quân, 
                                            hồ Tả Vọng và Hữu Vọng, tên gọi Hoàn Kiếm xuất hiện vào đầu thế kỷ XV gắn với truyền 
                                            thuyết vua Lê Thái Tổ trả gươm báu cho Rùa thần.</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img src="img/du-lich-he-vinh-ha-long.jpg" alt="Vịnh Hạ Long">
                                    <div class="text-content">
                                        <h4>Vịnh Hạ Long</h4>
                                        <span>Nằm ở bờ Tây của Vịnh Bắc Bộ, bao gồm vùng biển đảo thuộc TP Hạ Long, 
                                            TP Cẩm Phả và một phần của huyện đảo Vân Đồn, tỉnh Quảng Ninh. Vịnh Hạ Long 
                                            có bờ biển dài 120 km, diện tích khoảng 1.553 km vuông bao gồm 1.969 hòn đảo 
                                            nhỏ, phần lớn là đảo đá vôi, trong đó vùng lõi của vịnh có diện tích 
                                            335 km vuông quần tụ dày đặc 775 hòn đảo lớn nhỏ.</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img src="img/du-lich-he-chua-thien-mu.jpg" alt="Chùa Thiên Nụ">
                                    <div class="text-content">
                                        <h4>Chùa Thiên Mụ</h4>
                                        <span>Còn gọi là chùa Linh Mụ, là ngôi chùa cổ nằm trên đồi Hà Khê, tả ngạn sông 
                                            Hương, cách trung tâm thành phố Huế khoảng 5km về phía tây. Chùa Thiên Mụ 
                                            chính thức được xây dựng vào năm Tân Sửu (năm 1601), đời chúa Tiên Nguyễn Hoàng
                                            , vị chúa Nguyễn đầu tiên ở Đàng Trong.</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img src="img/du-lich-he-hoi-an.jpg" alt="Phố Cổ Hội An">
                                    <div class="text-content">
                                        <h4>Phố Cổ Hội An</h4>
                                        <span>Thành phố Hội An nằm bên bờ Bắc hạ lưu sông Thu Bồn, cách thành phố Đà Nẵng khoảng 25km 
                                            về phía Đông Nam, cách thành phố Tam Kỳ khoảng 50km về phía Đông Bắc. Từ thế kỷ XVI, XVII 
                                            nơi đây đã nổi tiếng với tên gọi Faifoo, là nơi giao thương và là trung tâm buôn bán lớn 
                                            của các thương nhân Nhật Bản, Trung Quốc, Bồ Ðào Nha, Italia… ở Đông Nam Á.</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img src="img/du-lich-he-phu-quoc.jpg" alt="Đảo Phú Quốc">
                                    <div class="text-content">
                                        <h4>Đảo Phú Quốc</h4>
                                        <span>Hòn đảo này còn được mệnh danh là Đảo Ngọc, là hòn đảo lớn nhất Việt Nam, cũng là 
                                            đảo lớn nhất trong quần thể 22 đảo tại vùng vịnh Thái Lan. Đảo Phú Quốc cùng với các 
                                            đảo khác tạo thành huyện đảo Phú Quốc trực thuộc tỉnh Kiên Giang. Toàn bộ huyện đảo 
                                            có tổng diện tích 589,23 km vuông.</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img src="img/du-lich-he-sa-pa.jpg" alt="Ruộng bậc thang Sa Pa">
                                    <div class="text-content">
                                        <h4>Ruộng bậc thang Sa Pa</h4>
                                        <span>Sa Pa là một thị trấn vùng cao ở phía Tây Bắc Việt Nam, nơi có các thửa ruộng bậc 
                                            thang tuyệt đẹp, trải dài như là những nấc thang vươn lên tận lưng trời. Với cảnh quang
                                            thiên nhiên hùng vĩ, thơ mộng, những phiên chợ tình bí ẩn và ẩm thực phong phú, đặc sắc,
                                            Sa Pa đã “mê hoặc” hầu hết những du khách khi đặt chân đến đây.</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img src="img/du-lich-he-mui-ne.jpg" alt="Mũi Né">
                                    <div class="text-content">
                                        <h4>Mũi Né</h4>
                                        <span>Là một trung tâm du lịch nổi tiếng vùng Nam Trung Bộ, cách trung tâm thành phố Phan Thiết 
                                            (tỉnh Bình Thuận) 22km về hướng Đông Bắc, nơi đây là một dải bờ biển xanh hoang vu với các đồi 
                                            cát đỏ trải dài như sa mạc và những làng chài xứ biển thuần chất Việt Nam.</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item col-md-12">
                                <div class="visited-item">
                                    <img src="img/du-lich-he-DBSCL.jpg" alt="Đồng bằng sông Cửu Long">
                                    <div class="text-content">
                                        <h4>Đồng bằng sông Cửu Long</h4>
                                        <span>Là một bộ phận của châu thổ sông Mê Kông, còn được gọi là đồng bằng Nam Bộ hoặc miền Tây 
                                            Nam Bộ, tổng diện tích là 40.548,2km vuông. Do có bờ biển dài và sông Mê Kông chia thành nhiều
                                            nhánh sông, kênh rạch, cù lao, đảo và quần đảo lớn nhỏ, nơi đây thích hợp cho các loại hình du 
                                            lịch sinh thái, trải nghiệm và khám phá.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>
            // Lấy tất cả các phần tử <a> trong danh sách
            const tabLinks = document.querySelectorAll('.tabs a');
            // Lấy tất cả các section (nội dung của từng tab)
            const tabContents = document.querySelectorAll('.recommendedgroup > div');
            // Thêm sự kiện 'click' cho từng liên kết
            tabLinks.forEach(link => {
                link.addEventListener('click', function (event) {
                    event.preventDefault(); // Ngăn hành vi mặc định của thẻ <a>

                    // Loại bỏ class 'active' khỏi tất cả các tab và ẩn nội dung tương ứng
                    tabLinks.forEach(link => link.classList.remove('active'));
                    tabContents.forEach(content => content.style.display = 'none');
                    // Thêm class 'active' vào tab được chọn
                    this.classList.add('active');
                    // Hiển thị nội dung tương ứng với tab được chọn
                    const tabID = this.getAttribute('href'); // Lấy giá trị của thuộc tính href (ví dụ: #livingroom)
                    document.querySelector(tabID).style.display = 'block';
                });
            });
            // Hiển thị tab đầu tiên mặc định khi trang tải lên
            document.querySelector('.tabs a.active').click();
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#owl-mostvisited').owlCarousel({
                    items: 3, // Số lượng item hiển thị cùng lúc
                    loop: true,
                    margin: 10,
                    nav: true, // Hiển thị nút điều hướng
                    autoplay: true, // Tự động chạy carousel
                    autoplayTimeout: 3000, // Thời gian chạy tự động
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 2
                        },
                        1000: {
                            items: 3
                        }
                    }
                });
            });

        </script>
    </body>
</html>