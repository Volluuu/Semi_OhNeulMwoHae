<%--
  Created by IntelliJ IDEA.
  User: hyeongjoon
  Date: 2022/10/06
  Time: 10:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<html>
<head>
    <!-- Custom fonts for this template-->
    <link href="../css/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <!-- Custom styles for this template-->
    <link rel="stylesheet" href="../resources/css/admin.css">
    <link href="../css/sb-admin-02.css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/admin.css">
    <script src="https://kit.fontawesome.com/93e75e33a3.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>

    <title>AdminPage</title>
</head>

<style>
    ol {
        color: #FFFFFF;
        padding: 4px 20px;
        font-size: 12px;
    }

    table {
        border: 1px #a39485 solid;
        font-size: .9em;
        box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
        width: 100%;
        border-collapse: collapse;
        border-radius: 5px;
        overflow: hidden;
    }

    th {

    }

    thead {
        font-weight: bold;
        color: #fff;
        background: #00E1E3;
    }

    td, th {
        padding: 1em .5em;
        vertical-align: middle;

    }

    td {
        border-bottom: 1px solid rgba(0, 0, 0, .1);
        background: #fff;
    }

    a {
        color: #73685d;
    }

    @media all and (max-width: 768px) {

        table, thead, tbody, th, td, tr {
            display: block;
        }

        th {
            text-align: right;
        }

        table {
            position: relative;
            padding-bottom: 0;
            border: none;
            box-shadow: 0 0 10px rgba(0, 0, 0, .2);
        }

        thead {
            float: left;
            white-space: nowrap;
        }

        tbody {
            overflow-x: auto;
            overflow-y: hidden;
            position: relative;
            white-space: nowrap;
        }

        tr {
            display: inline-block;
            vertical-align: top;
            text-align: center;
        }

        th {
            border-bottom: 1px solid #a39485;
        }

        td {
            border-bottom: 1px solid #e5e5e5;

        }
    }
    button {
        margin: 8px;
    }

    .w-btn {
        position: relative;
        border: none;
        display: inline-block;;
        padding: 10px 20px;
        border-radius: 15px;
        font-family: "paybooc-Light", sans-serif;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        text-decoration: none;
        font-weight: 600;
        transition: 0.25s;
    }

    .w-btn-green {
        background-color: #77af9c;
        color: #d7fff1;
    }

    .w-btn-blue {
        background-color: #6aafe6;
        color: #d4dfe6;
    }

    .w-btn-red {
        background-color: red;
        color: #d4dfe6;
    }

    .btndiv {
        float: right;
    }
</style>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: #38B6FF">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${root}/admin/mainhome">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">오늘 뭐해 <sup>!?</sup></div>
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
            <div class="searcharea" style="width:100%;text-align:center;">
                <!-- 검색창 -->
                <form action="${root}/admin/foodcourse">
                    <div class="input-group" style="width:450px;">
                        <select class="form-select" name="searchcolumn">
                            <option value="title">이름</option>
                            <option value="addr">주소</option>
                            <option value="category">종류</option>
                            <option value="menu">메뉴</option>
                            <option value="tel">전화번호</option>
                            <option value="gu">구</option>
                        </select>
                        &nbsp;&nbsp;&nbsp;
                        <input type="text" name="searchword" class="form-control" style="width:140px;" placeholder="검색 단어" value="${param.searchword}">

                        <button type="submit" class="btn btn-success" style="margin-left:10px;">검색</button>
                        <button type="button" class="btn btn-primary" style="margin-left:10px;" onclick="location.href='${root}/admin/foodcourse'">전체보기</button>
                    </div>
                </form>
            </div>
            <div class="container-fluid">


                <%--테이블 시작은 여기부터입니다~~~~~~~~~~~~~~~~~~~~~~~~!--%>
                <div class="row">
                    <h7>총 ${totalCount}개 검색되었습니다</h7>
                    <table>
                        <thead>
                        <tr>
                            <th>이름</th>
                            <th>주소</th>
                            <th>종류</th>
                            <th>메뉴</th>
                            <th>전화번호</th>
                            <th>위도</th>
                            <%--lat--%>
                            <th>경도</th>
                            <%--lon--%>
                            <th>구</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="dto" items="${list}" varStatus="i">
                            <tr>
                                <td>${dto.title}</td>
                                <td>${dto.addr}</td>
                                <td>${dto.category}</td>
                                <td>${dto.menu}</td>
                                <td>${dto.tel}</td>
                                <td>${dto.lat}</td>
                                <td>${dto.lon}</td>
                                <td>${dto.gu}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="paging">
                        <ul class="pagination">
                            <c:if test="${startPage>1}">
                                <li class="page-item"><a href="${root}/admin/foodcourse?currentPage=${startPage-1}&searchcolumn=${searchcolumn}&searchword=${searchword}" class="page-link">이전</a></li>
                            </c:if>
                            <!-- 페이지 번호 -->
                            <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                                <c:if test="${pp==currentPage}">
                                    <li class="page-item active"><a class="page-link" href="${root}/admin/foodcourse?currentPage=${pp}&searchcolumn=${searchcolumn}&searchword=${searchword}">${pp}</a></li>
                                </c:if>
                                <c:if test="${pp!=currentPage}">
                                    <li class="page-item"><a class="page-link" href="${root}/admin/foodcourse?currentPage=${pp}&searchcolumn=${searchcolumn}&searchword=${searchword}">${pp}</a></li>
                                </c:if>

                            </c:forEach>

                            <c:if test="${totalPage>endPage}">
                                <li class="page-item"><a href="${root}/admin/foodcourse?currentPage=${endPage+1}&searchcolumn=${searchcolumn}&searchword=${searchword}" class="page-link">다음</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div class="btndiv">
                    <button class="w-btn w-btn-green" type="button">추가</button>
                    <button class="w-btn w-btn-blue" type="button">수정</button>
                    <button class="w-btn w-btn-red" type="button">삭제</button>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
