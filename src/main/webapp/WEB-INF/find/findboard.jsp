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
<link rel="stylesheet" href="${root}/resources/css/findboard.css">
<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
        integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
        crossorigin="anonymous"/>
<script src="https://kit.fontawesome.com/93e75e33a3.js" crossorigin="anonymous"></script>
<html>
<head>
    <title>Title</title>
</head>
<style>

</style>
<div>
<div class="dg_container">
    <div class="dg_searcharea">
        <%--        <form action="searchlist">--%>
        <div class="input-group">



<%-----------------------------------------------------------%>

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
        </div>
    </div>
<%-----------------------------카드변경--%>
<div class="container">
    <div class="search_hj" style="display: flex; float: right;">
    <select name="findcolumn" class="sle" style="text-align: center; width: 100px; border: 1px solid #44a8fd; font-size: 12px" id="findcolumn">
        <option value="subject" selected>제목</option>
        <option value="content">내용</option>
        <option value="subcon">제목+내용</option>
        <option value="nickname">닉네임</option>
    </select>

    <div class="search">
        <form>
            <input type="text" name="findword" placeholder="검색해주세요~!" value="${param.findword}" id="findword">
            <button type="button" id="searchbtn">
                <i></i>
            </button>
        </form>

        <div class="open-button"></div>
    </div>

    <div class="overlay hidden"></div>
    </div>
    <br><br>

    <%--            --------------------검색script--%>
    <script>
        $('.open-button').click(function(){
            $('.search').addClass('active');
            $('.overlay').removeClass('hidden');
            $('input').focus(); // If there are multiple inputs on the page you might want to use an ID
        });

        $('.overlay').click(function() {
            $('.search').removeClass('active');
            $(this).addClass('hidden');
        });
    </script>
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
                                <li class="comments">${dto.answercount}</li>
                                <li class="view"><i class="fa-regular fa-eye"></i> ${dto.readcount}</li>
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
        <c:if test="${sessionScope.loginok!=null}">
            <button type="button" class="btn btn-outline-dark"
                    onclick="location.href='${root}/findboard/findform'">글쓰기
            </button>
        </c:if>

    <%------------------------------%>
        <br>
    <br>
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