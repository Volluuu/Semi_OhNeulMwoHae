<%--
  Created by IntelliJ IDEA.
  User: ostsc
  Date: 2022-10-12
  Time: 오후 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>title</title>
    <link href="../css/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <!-- Custom styles for this template-->
    <link rel="stylesheet" href="../resources/css/admin.css">
    <link href="../css/sb-admin-02.css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="https://kit.fontawesome.com/93e75e33a3.js" crossorigin="anonymous"></script>

</head>

<style>
    :before,
    :after {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }
    ol{
        color: #FFFFFF;
        padding: 4px 20px;
        font-size: 12px;
    }
    .button {
        width: 200px;
        display: inline-block;
        position: relative;
        margin: 1em;
        padding: 0.67em;
        border: 1px solid #44A3F7;
        overflow: hidden;
        text-decoration: none;
        font-size: 2em;
        outline: none;
        color: #44A3F7;
        background: transparent;
        font-weight: bold;
        border-radius: 30px;

    }
    .button:hover{
        box-shadow: 5px 5px 10px #44A3F7;
    }

    .button span {
        -webkit-transition: 0.6s;
        -moz-transition: 0.6s;
        -o-transition: 0.6s;
        transition: 0.6s;
        -webkit-transition-delay: 0.2s;
        -moz-transition-delay: 0.2s;
        -o-transition-delay: 0.2s;
        transition-delay: 0.2s;
    }

    .button:before,
    .button:after {
        content: '';
        position: absolute;
        top: 0.67em;
        left: 0;
        width: 100%;
        text-align: center;
        opacity: 0;
        -webkit-transition: .4s,opacity .6s;
        -moz-transition: .4s,opacity .6s;
        -o-transition: .4s,opacity .6s;
        transition: .4s,opacity .6s;
    }

    /* :before */

    .button:before {
        content: attr(data-hover);
        -webkit-transform: translate(-150%,0);
        -moz-transform: translate(-150%,0);
        -ms-transform: translate(-150%,0);
        -o-transform: translate(-150%,0);
        transform: translate(-150%,0);
    }

    /* :after */

    .button:after {
        content: attr(data-active);
        -webkit-transform: translate(150%,0);
        -moz-transform: translate(150%,0);
        -ms-transform: translate(150%,0);
        -o-transform: translate(150%,0);
        transform: translate(150%,0);
    }

    /* Span on :hover and :active */

    .button:hover span,
    .button:active span {
        opacity: 0;
        -webkit-transform: scale(0.3);
        -moz-transform: scale(0.3);
        -ms-transform: scale(0.3);
        -o-transform: scale(0.3);
        transform: scale(0.3);

    }

    /*
        We show :before pseudo-element on :hover
        and :after pseudo-element on :active
    */

    .button:hover:before,
    .button:active:after {
        opacity: 1;
        -webkit-transform: translate(0,0);
        -moz-transform: translate(0,0);
        -ms-transform: translate(0,0);
        -o-transform: translate(0,0);
        transform: translate(0,0);
        -webkit-transition-delay: .4s;
        -moz-transition-delay: .4s;
        -o-transition-delay: .4s;
        transition-delay: .4s;
    }

    /*
      We hide :before pseudo-element on :active
    */

    .button:active:before {
        -webkit-transform: translate(-150%,0);
        -moz-transform: translate(-150%,0);
        -ms-transform: translate(-150%,0);
        -o-transform: translate(-150%,0);
        transform: translate(-150%,0);
        -webkit-transition-delay: 0s;
        -moz-transition-delay: 0s;
        -o-transition-delay: 0s;
        transition-delay: 0s;
    }
</style>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: #38B6FF">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${root}/home">
            <img src="${root}/image/logo1.jpg" style="width: 80px;height: 80px">
            <%--<div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">오늘 뭐해 <sup>!?</sup></div>--%>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="${root}/admin/list">
                <i class="fa-solid fa-table-columns"></i>
                <span>Dashboard</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            Menu
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="${root}/admin/userinfo" data-target="#collapseTwo"
               aria-expanded="true" aria-controls="collapseTwo">
                <i class="fa-solid fa-user"></i>
                <span>회원관리</span>
            </a>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="${root}/admin/cafecourse" data-target="#collapseUtilities"
               aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fa-solid fa-mug-hot"></i>
                <span>카페코스</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="${root}/admin/foodcourse" data-target="#collapseUtilities"
               aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fa-solid fa-bowl-food"></i>
                <span>푸드코스</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="${root}/admin/tripcourse" data-target="#collapseUtilities"
               aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fa-solid fa-plane"></i>
                <span>트립코스</span>
            </a>
        </li>


        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="${root}/qna/qnalist" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fa-solid fa-question"></i>
                <span>문의사항</span>
            </a>
        </li>


    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light topbar mb-4 static-top shadow"
                 style="background-color: #38B6FF">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <ul class="navbar-nav ml-auto">
                    <!-- Dropdown - Alerts -->
                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa-solid fa-address-card"></i>&nbsp;
                            <span class="mr-2 d-none d-lg-inline text-gray-600 large">관리자</span>
                        </a>
                    </li>

                </ul>

            </nav>
            <br>
            <div class="container-fluid">
                <div class="row">
                    <div style="width: 1100px;margin: 0 auto;">
                        <div style="background-color: white; width: 80%; margin: 0 auto;padding: 5%;box-shadow: 5px 5px 10px gray">
                            <h1 style="color: #44A3F7">${dto.title} 수정</h1>
                            <form action="foodupdact" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="food_num" value="${dto.food_num}">
                                <input type="hidden" name="currentPage" value="${currentPage}">
                                <div>이름<input type="text" name="title" class="form-control" required="required" value="${dto.title}"></div>
                                <div>주소<input type="text" name="addr" class="form-control" required="required" value="${dto.addr}"></div>
                                <div>카테고리<input type="text" name="category" class="form-control" required="required" value="${dto.category}"></div>
                                <div>대표메뉴<input type="text" name="menu" class="form-control" required="required" value="${dto.menu}"></div>
                                <div>전화번호<input type="text" name="tel" class="form-control" required="required" value="${dto.tel}"></div>
                                <div>위도<input type="text" name="lat" class="form-control" required="required" value="${dto.lat}"></div>
                                <div>경도<input type="text" name="lon" class="form-control" required="required" value="${dto.lon}"></div>
                                <div>구
                                    <div class="input-group">
                                        <input type="text" name="gu" class="form-control rounded-pill" required="required" value="${dto.gu}">
                                        <input type="file" name="upload" class="form-control rounded-pill">
                                    </div>
                                    사진 선택을 안하면 기존 사진이 유지됩니다
                                </div>
                                <div style="text-align: center">
                                <button type="submit"  class="button" data-hover="CLICK ME!!" data-active="I'M ACTIVE"><span>푸드수정</span></button>
                                <button type="button" class="button" data-hover="BACK!!" data-active="I'M ACTIVE" onclick="location.href='${root}/admin/cafecourse'"><span>목록으로</span></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>
