<%--
  Created by IntelliJ IDEA.
  User: hyeongjoon
  Date: 2022/10/06
  Time: 10:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../css/admin.css">
    <title>AdminPage</title>
</head>
<body>
<div class="header" id="header">
    <div class="hdcontainer" id="hdcontainer">
        <!-- header_Wrapper -->
        <div class="header_wrapper" id="header_wrapper">
            <!-- 메뉴 -->
            <div class="left_menu">
                <div class="left_menu_sun">
                    <div class="menu_item">
                            <span class="menu_link">
                                <span class="menu-title">대쉬보드</span>
                                <span class="menu-arrow"></span>
                            </span>
                    </div>

                    <div class="menu_item">
                            <span class="menu_link">
                                <span class="menu-title">회원관리</span>
                                <span class="menu-arrow"></span>
                            </span>
                    </div>

                    <div class="menu_item">
                            <span class="menu_link">
                                <span class="menu-title">추천코스</span>
                                <span class="menu-arrow"></span>
                            </span>
                    </div>

                    <div class="menu_item">
                            <span class="menu_link">
                                <span class="menu-title">문의사항</span>
                                <span class="menu-arrow"></span>
                            </span>
                    </div>

                    <div class="menu_item">
                            <span class="menu_link">
                                <span class="menu-title-lo" style="color: red;">로그아웃</span>
                                <span class="menu-arrow"></span>
                            </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 바디시작 -->
<div class="container">
    <div class="item" style="color: mediumpurple;">총 회원수</div>
    <div class="item" style="color: mediumpurple;">총 코스수</div>
    <div class="item" style="color: mediumpurple;">최근 리뷰</div>
    <div class="item" style="color: mediumpurple;">문의 사항</div>
</div>
</body>
</html>
