<%--
  Created by IntelliJ IDEA.
  User: ostsc
  Date: 2022-09-28
  Time: 오전 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" href="../css/coursecss.css">
<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/93e75e33a3.js" crossorigin="anonymous"></script>
<html>
<head>
    <title>Title</title>
</head>
<style>

    .paging {
        display: flex;
        justify-content: center;
    }


    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        background: #323c41;
    }

    .blog-card {
        width: 350px;
        height: 500px;
        position: relative;
        overflow: hidden;
        border-radius: 10px;
        box-shadow: 3px 3px 20px rgba(0, 0, 0, 0.5);
        text-align: center;

    }


    .blog-card .color-overlay {
        /* Rectangle 11: */
        background: rgba(84, 104, 110, 0.4);
        width: 350px;
        height: 500px;
        position: absolute;
        z-index: 10;
        top: 0;
        left: 0;
        transition: background 0.3s cubic-bezier(0.33, 0.66, 0.66, 1);
    }

    .blog-card .gradient-overlay {
        /* bg-gradient: */
        background-image: -webkit-linear-gradient(rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.6) 21%);
        background-image: -moz-linear-gradient(rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.6) 21%);
        background-image: -o-linear-gradient(rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.6) 21%);
        background-image: linear-gradient(rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.6) 21%);
        width: 350px;
        height: 500px;
        position: absolute;
        top: 350px;
        left: 0;
        z-index: 15;
    }

    .blog-card:hover .card-info {
        opacity: 1;
        bottom: 120px;
    }

    .blog-card:hover .color-overlay {
        background: rgba(84, 104, 110, 0.8);
    }

    .title-content {
        text-align: center;
        margin: 70px 0 0 0;
        position: absolute;
        z-index: 20;
        width: 100%;
        top: 0;
        left: 0;
    }

    h3 {
        font-size: 20px;
        font-weight: 500;
        letter-spacing: 2px;
        color: #9CC9E3;
        font-family: "Roboto", sans-serif;
        margin-bottom: 0;
    }

    hr {
        width: 50px;
        height: 3px;
        margin: 20px auto;
        border: 0;
        background: #D0BB57;
    }

    .intro {
        width: 170px;
        margin: 0 auto;
        color: #DCE3E7;
        font-family: "Droid Serif", serif;
        font-size: 13px;
        font-style: italic;
        line-height: 18px;
    }

    .card-info {
        width: 100%;
        position: absolute;
        bottom: 100px;
        left: 0;
        margin: 0 auto;
        padding: 0 50px;
        color: #DCE3E7;
        font-family: "Droid Serif", serif;
        line-height: 24px;
        z-index: 20;
        opacity: 0;
        transition: bottom 0.3s, opacity 0.3s cubic-bezier(0.33, 0.66, 0.66, 1);
    }

    .utility-info {
        position: absolute;
        bottom: 0px;
        left: 0;
        z-index: 20;
    }

    .utility-list {
        list-style-type: none;
        margin: 0 0 30px 20px;
        padding: 0;
        width: 100%;
    }

    .utility-list li {
        margin: 0 15px 0 0;
        padding: 0 0 0 22px;
        display: inline-block;
        color: #DCE3E7;
        font-family: "Roboto", sans-serif;
    }

    .utility-list li.comments {
        background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1765/icon-chat.svg) no-repeat 0 0.1em;
    }

    .utility-list li.date {
        background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1765/icon-calendar.svg) no-repeat 0 0.1em;
    }

    /*}*/
    /*---------------------------------------------------------------Footer*/
    #footer {
        padding: 8px 12px;
    }

    #footer .inner {
        padding: 50px 280px 0 0;
        box-sizing: border-box;
    }

    .inner {
        position: relative;
        width: 100%;
        margin: 0 auto;
    }

    .efLSbp {
        display: flex;
        position: relative;
        width: 100%;
        min-width: 1200px;
        box-sizing: border-box;
        border-top: 1px solid rgb(233, 233, 233);
        margin-top: 200px;
        padding-bottom: 49px;
        background: rgb(255, 255, 255);
    }

    h1 {
        display: block;
        font-size: 2em;
        margin-block-start: 0.67em;
        margin-block-end: 0.67em;
        margin-inline-start: 0px;
        margin-inline-end: 0px;
        font-weight: bold;
    }

    .bjBbfw {
        width: 146px;
        user-select: none;
        -webkit-user-drag: none;
        cursor: pointer;
    }

    .efLSbp {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        -webkit-box-align: center;
        align-items: center;
    }

    .efLSbp .info_wrap_horizontal {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        -webkit-box-align: center;
        align-items: center;
    }

    .efLSbp .big_gap {
        margin-top: 26px;
    }

    .efLSbp .grey_6A {
        color: rgb(106, 106, 106);
    }

    .efLSbp .info_wrap_horizontal > div {
        display: inline-flex;
        -webkit-box-align: center;
        align-items: center;
    }

    #footer .footer_info {
        /*position: relative;*/
        margin-top: 15px;
    }

    #footer .footer_info span, #footer .footer_info address, #footer .footer_info a {
        display: inline-block;
        font-size: 15px;
        line-height: 1.5em;
        color: #6a6a6a;
        vertical-align: top;
        margin: 0 24px 6px 0;
    }

    .efLSbp .info_regular {
        font-weight: 400;
        font-size: 15px;
        line-height: 22px;
    }

    .efLSbp .small_gap {
        margin-top: 16px;
    }

    .efLSbp .middle_gap {
        margin-top: 24px;
    }

    #footer .copyright {
        margin-top: 10px;
        font-size: 15px;
        color: lightgray;
    }

    .icons {
        color: #70D9F2;
    }

    #divgrid {
        width: 100%;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-auto-rows: minmax(200px, auto);
        gap: 20px;
        /*margin-left: auto;*/
        /*margin-right: auto;*/
        justify-content: space-between;
    }
    .item {

        /*justify-content: flex-start;*/
    }

    /*-----------------------------------------------------------------------*/

    /*-----------------------------------------------------------------------category,조회순 css부분*/
    .jgfRlo {
        position: relative;
        float: right;

    }

    div {
        display: block;
    }

    .fotqhs {
        font-weight: 350;
        font-size: 14px;
        line-height: 21px;
        color: rgb(37, 37, 37);
        padding: 8px 33px 8px 33px;
        border: unset;
        background-color: unset;
        appearance: none;

    }


    option {
        font-weight: normal;
        display: block;
        white-space: nowrap;
        min-height: 1.2em;
        padding: 0px 2px 1px;
    }


    .jgfRlo > svg:last-child {
        position: absolute;
        top: 40%;
        right: 10px;
    }

    svg:not(:root) {
        overflow: hidden;
    }

    /*-----------------------------------------------------------------------*/

    /*-----------------------------------------------------------------------card사이 공백*/
    .blog-card {
        margin-bottom: 50px;
    }

    /*-----------------------------------------------------------------------*/

    /*-----------------------------------------------------------------------검색창 css*/
    div.hj_search {
        height: 40px;
        width: 400px;
        border: 1px solid #1b5ac2;
        background: #ffffff;
    }

    input.hj_input {
        font-size: 16px;
        width: 99%;
        height: 99%;
        padding: 10px;
        border: 0px;
        outline: none;
        float: left;
    }

    button.hj_button {
        width: 50px;
        height: 100%;
        border: 0px;
        background: #1b5ac2;
        outline: none;
        float: right;
        color: #ffffff;
    }
    #divgrid {
        width: 100%;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-auto-rows: minmax(200px, auto);
        gap: 20px;
        /*margin-left: auto;*/
        /*margin-right: auto;*/
        justify-content: space-between;
    }
</style>
<body>
<div class="dg_container">
    <div class="dg_searcharea">
        <%--        <form action="searchlist">--%>
        <div class="input-group">
            <select name="findcolumn" class="form-control" style="text-align: center;" id="findcolumn">
                <option value="subject" selected>제목</option>
                <option value="content">내용</option>
                <option value="subcon">제목+내용</option>
                <option value="nickname">닉네임</option>
            </select>

            <input type="text" name="findword" class="form-control" placeholder="검색 단어" value="${param.findword}"
                   id="findword">

            <button type="submit" class="btn btn-outline-dark" id="searchbtn">검색</button>
            <c:if test="${sessionScope.loginok!=null}">
                <a class="page-link" findcolumn="nickname" findword="${sessionScope.nickname}">내가 쓴 글</a>
            </c:if>
            <script>
                var root = "${root}";
                $(document).on("keyup", "#findword", function (e) {
                    if (e.keyCode == 13) {
                        $("#searchbtn").trigger("click");
                    }
                });

                $(document).on("click", "#searchbtn", function () {
                    var findcolumn = $("#findcolumn option:selected").val();
                    var findword = $("#findword").val();
                    var currentPage = "${currentPage}";
                    var s = "";
                    var p = "";
                    $.ajax({
                        type: "get",
                        url: root + "/findboard/searchlist",
                        dataType: "json",
                        data: {"findcolumn": findcolumn, "findword": findword},
                        //, "currentPage": currentPage
                        success: function (res) {
                            if (res.totalCount == 0) {
                                $("#uc").text("등록된 글이 없습니다");
                            } else {
                                $("#uc").text("총 " + res.totalCount + "개의 글이 있습니다");
                                $.each(res.list, function (i, elt) {
                                    s += '<div class="griditem">';
                                    s += '<a href="' + root + '/findboard/finddetail?find_num=' + elt.find_num + '&currentPage=' + res.currentPage + '" style="color:black;text-decoration:none;">';
                                    if (elt.find1photo != null) {
                                        s += '<img src="' + elt.find1photo + '" class="img-thumbnail" style="margin-bottom:7px;width:300px;aspect-ratio: 1/1;">';
                                    } else {
                                        s += '<img src="' + root + '/upload/' + elt.photo + '" class="img-thumbnail" style="margin-bottom:7px;width:300px;aspect-ratio: 1/1;">';
                                    }
                                    s += '<p>제목 : ' + elt.subject + '</p>';
                                    s += '<p>내용 : ' + elt.content + '</p>';
                                    s += '<p>닉네임 : ' + elt.nickname + '</p>';
                                    s += '<p style="color: darkgray;">';
                                    s += '<span class="fr">';
                                    s += '<i class="bi bi-eye"></i>&nbsp;' + elt.readcount + '&nbsp;';
                                    s += '<i class="bi bi-chat"></i>&nbsp;' + elt.answercount + '&nbsp;';
                                    s += '</span>';
                                    s += '</p>';
                                    s += '</div>';
                                });
                                p += '<ul class="pagination">';
                                if (res.startPage > 1) {
                                    // p += '<li class="page-item"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + (res.startPage - 1) + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+(res.startPage - 1)+'">이전</a></li>';
                                    p += '<li class="page-item"><a class="page-link" findcolumn="' + res.findcolumn + '" findword="' + res.findword + '" currentPage="' + (res.startPage - 1) + '">이전</a></li>';
                                }
                                for (var pp = res.startPage; pp <= res.endPage; pp++) {
                                    if (pp == res.currentPage) {
                                        // p += '<li class="page-item active"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + pp + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+pp+'">' + pp + '</a></li>';
                                        p += '<li class="page-item active"><a class="page-link" findcolumn="' + res.findcolumn + '" findcolumn="' + res.findcolumn + '" findword="' + res.findword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                                    } else {
                                        // p += '<li class="page-item"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + pp + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+pp+'">' + pp + '</a></li>';
                                        p += '<li class="page-item"><a class="page-link" findcolumn="' + res.findcolumn + '" findword="' + res.findword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                                    }
                                }
                                if (res.totalPage > res.endPage) {
                                    // p += '<li class="page-item"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + (res.endPage + 1) + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+(res.endPage + 1)+'">다음</a></li>';
                                    p += '<li class="page-item"><a class="page-link" findcolumn="' + res.findcolumn + '" findword="' + res.findword + '" currentPage="' + (res.endPage + 1) + '">다음</a></li>';

                                }
                                p += '</ul>';
                                $("#divgrid").html(s);
                                $("#paging").html(p);
                            }


                        }
                    });
                });

                $(document).on("click", ".page-link", function () {
                    var findcolumn = $(this).attr("findcolumn");
                    var findword = $(this).attr("findword");
                    var currentPage = $(this).attr("currentPage");
                    var s = "";
                    var p = "";
                    $.ajax({
                        type: "get",
                        url: root + "/findboard/searchlist",
                        dataType: "json",
                        data: {"findcolumn": findcolumn, "findword": findword, "currentPage": currentPage},
                        success: function (res) {
                            if (res.totalCount == 0) {
                                $("#uc").text("등록된 글이 없습니다");
                            } else {
                                $("#uc").text("총 " + res.totalCount + "개의 글이 있습니다");
                                $.each(res.list, function (i, elt) {
                                    s += '<div class="griditem">';
                                    s += '<a href="' + root + '/findboard/finddetail?find_num=' + elt.find_num + '&currentPage=' + res.currentPage + '" style="color:black;text-decoration:none;">';
                                    if (elt.find1photo != null) {
                                        s += '<img src="' + elt.find1photo + '" class="img-thumbnail" style="margin-bottom:7px;width:300px;aspect-ratio: 1/1;">';
                                    } else {
                                        s += '<img src="' + root + '/upload/' + elt.photo + '" class="img-thumbnail" style="margin-bottom:7px;width:300px;aspect-ratio: 1/1;">';
                                    }
                                    s += '<p>제목 : ' + elt.subject + '</p>';
                                    s += '<p>내용 : ' + elt.content + '</p>';
                                    s += '<p>닉네임 : ' + elt.nickname + '</p>';
                                    s += '<p style="color: darkgray;">';
                                    s += '<span class="fr">';
                                    s += '<i class="bi bi-eye"></i>&nbsp;' + elt.readcount + '&nbsp;';
                                    s += '<i class="bi bi-chat"></i>&nbsp;' + elt.answercount + '&nbsp;';
                                    s += '</span>';
                                    s += '</p>';
                                    s += '</div>';
                                });
                                p += '<ul class="pagination">';
                                if (res.startPage > 1) {
                                    // p += '<li class="page-item"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + (res.startPage - 1) + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+(res.startPage - 1)+'">이전</a></li>';
                                    p += '<li class="page-item"><a class="page-link" findcolumn="' + res.findcolumn + '" findword="' + res.findword + '" currentPage="' + (res.startPage - 1) + '">이전</a></li>';
                                }

                                for (var pp = res.startPage; pp <= res.endPage; pp++) {
                                    if (pp == res.currentPage) {
                                        // p += '<li class="page-item active"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + pp + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+pp+'">' + pp + '</a></li>';
                                        p += '<li class="page-item active"><a class="page-link" findcolumn="' + res.findcolumn + '" findword="' + res.findword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                                    } else {
                                        // p += '<li class="page-item"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + pp + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+pp+'">' + pp + '</a></li>';
                                        p += '<li class="page-item"><a class="page-link" findcolumn="' + res.findcolumn + '" findword="' + res.findword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                                    }
                                }
                                if (res.totalPage > res.endPage) {
                                    // p += '<li class="page-item"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + (res.endPage + 1) + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+(res.endPage + 1)+'">다음</a></li>';
                                    p += '<li class="page-item"><a class="page-link" findcolumn="' + res.findcolumn + '" findword="' + res.findword + '" currentPage="' + (res.endPage + 1) + '">다음</a></li>';

                                }
                                p += '</ul>';
                                $("#divgrid").html(s);
                                $("#paging").html(p);
                            }


                        }
                    });
                });
            </script>

            <%--        </form>--%>

        </div>

        <script>
            $(document).on("click", "#dg_loginbtn", function () {
                var root = "${root}";
                console.log("root" + root);
                $.ajax({
                    type: "get",
                    url: root + "/findboard/login",
                    dataType: "text",
                    data: {
                        "user_num": "2", "loginid": "angel", "password": "1234",
                        "name": "천사", "nickname": "악마", "email": "gotothehell@naver.com",
                        "hp": "010-7272-9573", "profile": "나는 정지훈이다", "interest": "infp", "profilephoto": "user.png",
                        "alarm": "없음", "isadmin": "user", "gaipday": "2022-09-29 09:42:44"
                    },
                    success: function (res) {
                        location.reload();
                    },
                });
            });
            </script>
            <br>
            <c:if test="${sessionScope.loginok!=null}">
                <button type="button" class="btn btn-outline-dark"
                        onclick="location.href='${root}/findboard/findform'">글쓰기
                </button>
            </c:if>
            <br>
        </div>
    </div>
<%-----------------------------카드변경--%>
    <div id="divgrid">
            <c:if test="${totalCount>0}">
            <c:forEach var="dto" items="${list}" varStatus="i">
        <div class="griditem">
            <a href="${root}/findboard/finddetail?find_num=${dto.find_num}&currentPage=${currentPage}"
               style="color:black;text-decoration:none;">
                <c:set var="photo" value="${dto.photo}"/>
                <div class="item">
                    <div class="blog-card spring-fever">
                        <c:if test="${dto.find1photo!=null}">
                            <img alt="" src="${dto.find1photo}" class="img-thumbnail"
                                 style="width:100%; height: 100%;">
                        </c:if>
                        <c:if test="${dto.find1photo==null}">
                            <img alt="" src="${root}/upload/${fn:split(photo, ',')[0]}" class="img-thumbnail"
                                 style="width:100%; height: 100%;">
                        </c:if>
                        <div class="title-content">
                            <h3>제목 : ${dto.subject}</h3>
                            <hr/>
                            <div class="intro">닉네임 : ${dto.nickname}</div>
                        </div>
                        <div class="card-info">
                            내용 : ${dto.content}
                        </div>
                        <div class="utility-info">
                            <ul class="utility-list">
                                <li class="comments">${dto.readcount}</li>
                                <li class="date"><fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/></li>
                            </ul>
                        </div>
                        <div class="gradient-overlay"></div>
                        <div class="color-overlay"></div>
                    </div>
                    <div class="card-info">
                        <div class="gradient-overlay"></div>
                        <div class="color-overlay"></div>
                    </div>
                    <div class="card-info">
                    </div>
                    <div class="gradient-overlay"></div>
                    <div class="color-overlay"></div>
                </div>
            </a>
        </div>
    </c:forEach>
        </c:if>
        </div>
    <%------------------------------%>

        <div class="paging" id="paging">
            <ul class="pagination">
                <c:if test="${startPage>1}">
                    <li class="page-item"><a class="page-link" href="${root}/findboard/list?currentPage=${startPage-1}">이전</a>
                    </li>
                </c:if>
                <!-- 페이지 번호 -->
                <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                    <c:if test="${pp==currentPage}">
                        <li class="page-item active"><a class="page-link"
                                                        href="${root}/findboard/list?currentPage=${pp}">${pp}</a></li>
                    </c:if>
                    <c:if test="${pp!=currentPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${root}/findboard/list?currentPage=${pp}">${pp}</a>
                        </li>
                    </c:if>

                </c:forEach>

                <c:if test="${totalPage>endPage}">
                    <li class="page-item">
                        <a class="page-link" href="${root}/findboard/list?currentPage=${endPage+1}">다음</a>
                    </li>
                </c:if>
            </ul>
        </div>
        <footer id="footer" class="efLSbp">
            <div class="inner">
                <%------------------logo--%>
                <h6 class="h_logo bjBbfw"><i class="fa-sharp fa-solid fa-car-side icons"></i> 오늘뭐해?</h6>
                <%------------------------------info start--%>
                <div class="finfo info_wrap_horizontal big_gap grey_6A">
                    <div>
                        <p class="info_bold info_large grey_6A_only">
                            고객센터: 070-8835-2626

                        </p>
                    </div>
                    <p class="info_regular grey_6A_only">
                        <em>상담가능시간: 매일 9:00~24:00</em>
                    </p>
                </div>
                <%--            -----------------------주식회사 Start--%>
                <div class="Footer__FoldWrapper-sc-190uiip-1 dRbhKq footer_info grey_6A">
                    <span>
                        <em>주식회사: 오늘뭐해</em>
                    </span>
                    <span>
                        <em>대표: 이동건</em>
                    </span>
                    <span>
                        <em>개인정보보호책임자: 이동건</em>
                    </span>
                    <span>
                        <em>사업자 등록번호: 010-4154-8185</em>
                    </span>
                </div>

                <%--            ----------------------------------------------개인정보Start--%>
                <div class="info_wrap_horizontal vertical_line info_regular grey_6A small_gap font_fix_320">
                    <p class="info_bold">개인정보 처리방침</p>
                    <p> | 이용약관</p>
                    <p> | 취소 및 환불정책</p>
                    <p> | 파트너 입점</p>
                </div>

                <%--            ------------------------------copyright--%>
                <div class="middle_gap">
                    <p class="copyright">Copyright © 오늘뭐해 Inc. All Rights Reserved.</p>
                </div>
            </div>
        </footer>
    </div>

</body>
</html>