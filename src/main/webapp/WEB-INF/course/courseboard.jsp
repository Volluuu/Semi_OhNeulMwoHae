<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" href="../css/coursecss.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/93e75e33a3.js" crossorigin="anonymous"></script>
<style>
    /*-----------------------------------------------------------------------card 감싸고있는 div태그*/
    .container {
        /*justify-content: flex-start;*/
        /* justify-content: flex-end; */
        /* justify-content: center;*/
        /* justify-content: space-between;*/
        /*justify-content: space-around;*/
        /*display: flex;*/
        /*flex-wrap: wrap;*/
        /*justify-content: space-between;*/
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

    /*-----------------------------------------------------------------------*/
    .paging {
        display: flex;
        justify-content: center;
    }

    #divgrid {
        width: 100%;
        display: grid;
        padding:8px 12px;
        grid-template-columns: repeat(4, 25%);
        grid-auto-rows: minmax(200px, auto);
        gap: 50px;

        /*margin-left: auto;*/
        /*margin-right: auto;*/
        justify-content: space-evenly;
    }

    #svgdiv {
        position: relative;
        top: 100px;
        left: 50px;
    }

    /*.page-link{*/
    /*    cursor: pointer;*/
    /*}*/

    .contentdot {
        display: -webkit-box;
        display: -ms-flexbox;
        margin-top: 1px;
        max-height: 120px;
        overflow: hidden;
        vertical-align: top;
        text-overflow: ellipsis;
        word-break: break-all;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 5;
    }

</style>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%---------------------------------------------------------------------검색창--%>
<%--<div class="hj_search">--%>
<%--    <form action="list" method="get">--%>
<%--        <input type="text" placeholder="검색어를 입력해주세요" class="hj_input" value="${param.cafeword}">--%>
<%--        <button type="submit" class="hj_button">검색</button>--%>
<%--        위치수정필요--%>
<%--    </form>--%>
<%--</div>--%>
<%--<br>--%>
<%--<br>--%>
<%--<br>--%>
<%-----------------------------------------------------------%>

<%-------------------------------------------------------------------------category,조회순--%>
<div class="jgfRlo" style=" height: 37px; padding:0px 7px;
        margin: 0px 10px 0px 0px;">
    <select class="fotqhs" id="categorysel">
        <option value="cafe" class="gEkCOT" id="cafe-sel">카페</option>
        <option value="food" class="gEkCOT" id="food-sel">맛집</option>
        <option value="trip" class="gEkCOT" id="trip-sel">여행</option>
    </select>
    <svg width="12" height="7" viewBox="0 0 12 7" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M1 1L6 6L11 1" stroke="#6a6a6a" stroke-width="1" stroke-linecap="square"></path>
    </svg>
<%--    <select class="fotqhs">--%>
<%--        <option value="cafe" class="gEkCOT">최신순</option>--%>
<%--        <option value="food" class="gEkCOT">인기순</option>--%>
<%--    </select>--%>
<%--    <svg width="12" height="7" viewBox="0 0 12 7" fill="none" xmlns="http://www.w3.org/2000/svg">--%>
<%--        <path d="M1 1L6 6L11 1" stroke="#6a6a6a" stroke-width="1" stroke-linecap="square"></path>--%>
<%--    </svg>--%>
    <%-----------------------------------------------------------%>
</div>
<div class="paging" id="paging">
    <ul class="pagination">
        <c:if test="${startPage>1}">
            <li class="page-item"><a href="list?currentPage=${startPage-1}" class="page-link">&lt;</a></li>
        </c:if>

        <!-- 페이지 번호 -->
        <c:forEach var="pp" begin="${startPage}" end="${endPage}">
            <c:if test="${pp==currentPage}">
                <li class="page-item active"><a href="list?currentPage=${pp}" class="page-link">${pp}</a></li>
            </c:if>
            <c:if test="${pp!=currentPage}">
                <li class="page-item"><a href="list?currentPage=${pp}" class="page-link">${pp}</a></li>
            </c:if>
        </c:forEach>

        <c:if test="${endPage<totalPage}">
            <li class="page-item"><a href="list?currentPage=${endPage+1}" class="page-link">&gt;</a></li>
        </c:if>
    </ul>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<%-------------------------------------------------------------------------card시작--%>
<%--기본 카드에 주소가 나와있으면 사진 색깔에 따라서 주소식별이 어려움 hover하면 안에 넣을지 선택하기--%>
<script>
    var root = "${root}";
    $(document).on("change", "#categorysel", function () {
        var catesel = $("#categorysel option:selected").val();
        // console.log(catesel);
        var gucode=$("#gucode").val();
        // $("#divgrid").empty();
        // $(".paging").empty();

        if (catesel == "cafe") {
            var c = "";
            var p = "";
            $.ajax({
                type: "get",
                url: root + "/courseboard/cafelist",
                dataType: "json",
                data: {"gu":gucode,"currentPage": 1},
                success: function (suc) {
                    if (suc.totalCount == 0) {
                        c += '<div class="griditem">';
                        c += '<h2>등록된 곳이 없습니다</h2>';
                        c += '</div>';
                        c += '<input type="hidden" id="gucode" value="' + suc.gu + '">';
                    } else {
                        $.each(suc.list, function (i, res) {
                            c += '<div class="griditem">';
                            <%--c+='<c:forEach var="dto" items="${res}" varStatus="i">';--%>
                            c += '<a href="' + root + '/course/cafedetail?cafe_num=' + res.cafe_num + '&currentPage=' + suc.currentPage + '">';
                            c += '<div class="item">';
                            c += '<div class="blog-card spring-fever">';
                            <%--c+='<c:set var="photo" value="'+res.photo+'"/>';--%>
                            c += '<img src="' + res.photo + '" style="width:100%; height: 100%;">';
                            c += '<div class="title-content">';
                            c += '<h3>' + res.title + '</h3>';
                            c += '<hr/>';
                            c += '<div class="intro">' + res.addr + '</div>';
                            c += '</div>';
                            c += '<div class="card-info">';
                            c += '대표메뉴: ' + res.menu + '<br>';
                            c += '전화번호: ' + res.tel;
                            c += '</div>';
                            c += '<div class="utility-info">';
                            c += '<ul class="utility-list">';
                            c += '<li class="comments">' + res.answercount + '</li>';
                            c += '<li class="date">' + res.readcount + '</li>';
                            c += '<li class="staravg"><i class="fa-solid fa-star"></i>' + res.staravg + '</li>';
                            c += '</ul>';
                            c += ' </div>';
                            c += '<div class="gradient-overlay"></div>';
                            c += '<div class="color-overlay"></div>';
                            c += '</div>';
                            c += ' <div class="card-info">';
                            c += '</div>';
                            c += '<div class="gradient-overlay"></div>';
                            c += '<div class="color-overlay"></div>';
                            c += '</div>';
                            c += '</a>';
                            <%--c+='</c:forEach>';--%>
                            c += '</div>';
                            c += '<input type="hidden" id="gucode" value="' + suc.gu + '">';

                        })
                        p += '<ul class="pagination">';
                        if (suc.startPage > 1) {
                            p += '<li class="page-item"><a class="page-link" cafecolumn="' + suc.cafecolumn + '" cafeword="' + suc.cafeword + '" currentPage="' + (suc.startPage - 1) + '">이전</a></li>';
                            // p += '<li class="page-item"><a href="list?currentPage='+(suc.startPage-1)+'" class="page-link">&lt;</a></li>';
                        }
                        for (var pp = suc.startPage; pp <= suc.endPage; pp++) {
                            if (pp == suc.currentPage) {
                                p += '<li class="page-item active"><a class="page-link" cafecolumn="' + suc.cafecolumn + '" cafeword="' + suc.cafeword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                                // p += '<li class="page-item active"><a href="list?currentPage='+pp+'" class="page-link">'+pp+'</a></li>';
                            } else if (pp != suc.currentPage) {
                                p += '<li class="page-item"><a class="page-link" cafecolumn="' + suc.cafecolumn + '" cafeword="' + suc.cafeword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                                // p += '<li class="page-item"><a href="list?currentPage='+pp+'" class="page-link">'+pp+'</a></li>';
                            }
                        }
                        if (suc.endPage < suc.totalPage) {
                            p += '<li class="page-item"><a class="page-link" cafecolumn="' + suc.cafecolumn + '" cafeword="' + suc.cafeword + '" currentPage="' + (suc.endPage + 1) + '">다음</a></li>';
                            // p += '<li class="page-item"><a href="list?currentPage='+(suc.endPage+1)+'" class="page-link">&gt;</a></li>';
                        }
                        p += '</ul>';

                    }
                    $("#divgrid").html(c);
                    $(".paging").html(p);
                }
            });

        } else if (catesel == "food") {
            var f = "";
            var p = "";
            $.ajax({
                type: "get",
                url: root + "/courseboard/foodlist",
                dataType: "json",
                data: {"gu":gucode,"currentPage": 1},
                success: function (suc) {
                    if (suc.totalCount == 0) {
                        f += '<div class="griditem">';
                        f += '<h2>등록된 곳이 없습니다</h2>';
                        f += '</div>';
                        f += '<input type="hidden" id="gucode" value="' + suc.gu + '">';
                    } else {
                    $.each(suc.list, function (i, res) {
                        f += '<div class="griditem">';
                        <%--c+='<c:forEach var="dto" items="${res}" varStatus="i">';--%>
                        f += '<a href="' + root + '/course/fooddetail?food_num=' + res.food_num + '&currentPage=' + suc.currentPage + '">';
                        f += '<div class="item">';
                        f += '<div class="blog-card spring-fever">';
                        <%--c+='<c:set var="photo" value="'+res.photo+'"/>';--%>
                        f += '<img src="' + res.photo + '" style="width:100%; height: 100%;">';
                        f += '<div class="title-content">';
                        f += '<h3>' + res.title + '</h3>';
                        f += '<hr/>';
                        f += '<div class="intro">' + res.addr + '</div>';
                        f += '</div>';
                        f += '<div class="card-info">';
                        f += '대표메뉴: ' + res.menu + '<br>';
                        f += '전화번호: ' + res.tel;
                        f += '</div>';
                        f += '<div class="utility-info">';
                        f += '<ul class="utility-list">';
                        f += '<li class="comments">' + res.answercount + '</li>';
                        f += '<li class="date">' + res.readcount + '</li>';
                        f += '<li class="staravg"><i class="fa-solid fa-star"></i>' + res.staravg + '</li>';
                        f += '</ul>';
                        f += ' </div>';
                        f += '<div class="gradient-overlay"></div>';
                        f += '<div class="color-overlay"></div>';
                        f += '</div>';
                        f += ' <div class="card-info">';
                        f += '</div>';
                        f += '<div class="gradient-overlay"></div>';
                        f += '<div class="color-overlay"></div>';
                        f += '</div>';
                        f += '</a>';
                        <%--c+='</c:forEach>';--%>
                        f += '</div>';
                        f+='<input type="hidden" id="gucode" value="'+suc.gu+'">';

                    })
                    p += '<ul class="pagination">';
                    if (suc.startPage > 1) {
                        p += '<li class="page-item"><a class="page-link" foodcolumn="' + suc.foodcolumn + '" foodword="' + suc.foodword + '" currentPage="' + (suc.startPage - 1) + '">이전</a></li>';
                        // p += '<li class="page-item"><a href="list?currentPage='+(suc.startPage-1)+'" class="page-link">&lt;</a></li>';
                    }
                    for (var pp = suc.startPage; pp <= suc.endPage; pp++) {
                        if (pp == suc.currentPage) {
                            p += '<li class="page-item active"><a class="page-link" foodcolumn="' + suc.foodcolumn + '" foodword="' + suc.foodword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                            // p += '<li class="page-item active"><a href="list?currentPage='+pp+'" class="page-link">'+pp+'</a></li>';
                        } else if (pp != suc.currentPage) {
                            p += '<li class="page-item"><a class="page-link" foodcolumn="' + suc.foodcolumn + '" foodword="' + suc.foodword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                            // p += '<li class="page-item"><a href="list?currentPage='+pp+'" class="page-link">'+pp+'</a></li>';
                        }
                    }
                    if (suc.endPage < suc.totalPage) {
                        p += '<li class="page-item"><a class="page-link" foodcolumn="' + suc.foodcolumn + '" foodword="' + suc.foodword + '" currentPage="' + (suc.endPage + 1) + '">다음</a></li>';
                        // p += '<li class="page-item"><a href="list?currentPage='+(suc.endPage+1)+'" class="page-link">&gt;</a></li>';
                    }
                    p += '</ul>';

                }
                    $("#divgrid").html(f);
                    $(".paging").html(p);
                }

            });
        } else if (catesel == "trip") {
            var t = "";
            var p = "";
            $.ajax({
                type: "get",
                url: root + "/courseboard/triplist",
                dataType: "json",
                data: {"gu": gucode, "currentPage": 1},
                success: function (suc) {
                    if (suc.totalCount == 0) {
                        t += '<div class="griditem">';
                        t += '<h2>등록된 곳이 없습니다</h2>';
                        t += '</div>';
                        t += '<input type="hidden" id="gucode" value="' + suc.gu + '">';
                    } else {
                    $.each(suc.list, function (i, res) {
                        t += '<div class="griditem">';
                        <%--c+='<c:forEach var="dto" items="${res}" varStatus="i">';--%>
                        t += '<a href="' + root + '/course/tripdetail?trip_num=' + res.trip_num + '&currentPage=' + suc.currentPage + '">';
                        t += '<div class="item">';
                        t += '<div class="blog-card spring-fever">';
                        <%--c+='<c:set var="photo" value="'+res.photo+'"/>';--%>
                        t += '<img src="' + res.photo + '" style="width:100%; height: 100%;">';
                        t += '<div class="title-content">';
                        t += '<h3>' + res.title + '</h3>';
                        t += '<hr/>';
                        t += '<div class="intro">' + res.addr + '</div>';
                        t += '</div>';
                        t += '<div class="card-info">';
                        t += '<span class="contentdot">' + res.content + '</span>';
                        t += '</div>';
                        t += '<div class="utility-info">';
                        t += '<ul class="utility-list">';
                        t += '<li class="comments">' + res.answercount + '</li>';
                        t += '<li class="date">' + res.readcount + '</li>';
                        t += '<li class="staravg"><i class="fa-solid fa-star"></i>' + res.staravg + '</li>';
                        t += '</ul>';
                        t += ' </div>';
                        t += '<div class="gradient-overlay"></div>';
                        t += '<div class="color-overlay"></div>';
                        t += '</div>';
                        t += ' <div class="card-info">';
                        t += '</div>';
                        t += '<div class="gradient-overlay"></div>';
                        t += '<div class="color-overlay"></div>';
                        t += '</div>';
                        t += '</a>';
                        <%--c+='</c:forEach>';--%>
                        t += '</div>';
                        t += '<input type="hidden" id="gucode" value="' + suc.gu + '">';

                    })
                    p += '<ul class="pagination">';
                    if (suc.startPage > 1) {
                        p += '<li class="page-item"><a class="page-link" tripcolumn="' + suc.tripcolumn + '" tripword="' + suc.tripword + '" currentPage="' + (suc.startPage - 1) + '">이전</a></li>';
                        // p += '<li class="page-item"><a href="list?currentPage='+(suc.startPage-1)+'" class="page-link">&lt;</a></li>';
                    }
                    for (var pp = suc.startPage; pp <= suc.endPage; pp++) {
                        if (pp == suc.currentPage) {
                            p += '<li class="page-item active"><a class="page-link" tripcolumn="' + suc.tripcolumn + '" tripword="' + suc.tripword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                            // p += '<li class="page-item active"><a href="list?currentPage='+pp+'" class="page-link">'+pp+'</a></li>';
                        } else if (pp != suc.currentPage) {
                            p += '<li class="page-item"><a class="page-link" tripcolumn="' + suc.tripcolumn + '" tripword="' + suc.tripword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                            // p += '<li class="page-item"><a href="list?currentPage='+pp+'" class="page-link">'+pp+'</a></li>';
                        }
                    }
                    if (suc.endPage < suc.totalPage) {
                        p += '<li class="page-item"><a class="page-link" tripcolumn="' + suc.tripcolumn + '" tripword="' + suc.tripword + '" currentPage="' + (suc.endPage + 1) + '">다음</a></li>';
                        // p += '<li class="page-item"><a href="list?currentPage='+(suc.endPage+1)+'" class="page-link">&gt;</a></li>';
                    }
                    p += '</ul>';

                }
                $("#divgrid").html(t);
            $(".paging").html(p);
        }

            });
        }
    });

</script>

<%---------------------------------------------------------------------------카페list--%>

<div class="container Cafe" style="width:100%; height: 60%;" id="divgrid">
    <%--글 갯수가 0이 아닐시--%>
    <%--        <c:if test="${totalCount>0}">--%>
    <c:forEach var="dto" items="${list}" varStatus="i">
        <a href="${root}/course/cafedetail?cafe_num=${dto.cafe_num}&currentPage=${currentPage}">
            <div class="item">
                <div class="blog-card spring-fever">
                    <c:set var="photo" value="${dto.photo}"/>
                    <img src="${dto.photo}" style="width:100%; height: 100%;">
                    <div class="title-content">
                        <h3>${dto.title}</h3>
                        <hr/>
                        <div class="intro">${dto.addr}</div>
                    </div><!-- /.title-content -->
                    <div class="card-info">
                        대표메뉴: ${dto.menu}<br>
                        전화번호: ${dto.tel}
                    </div><!-- /.card-info -->
                    <div class="utility-info">
                        <ul class="utility-list">
                            <li class="comments">${dto.answercount}</li>
                            <li class="date">${dto.readcount}</li>
                            <li class="staravg"><i class="fa-solid fa-star"></i>${dto.staravg}</li>
                        </ul>
                    </div><!-- /.utility-info -->
                    <!-- overlays -->
                    <div class="gradient-overlay"></div>
                    <div class="color-overlay"></div>
                </div>

                <div class="card-info">

                </div><!-- /.card-info -->

                <!-- overlays -->
                <div class="gradient-overlay"></div>
                <div class="color-overlay"></div>
                    <%--        card =========================================================================================--%>
            </div>
        </a>
    </c:forEach>

</div>


</body>
</html>
<script>

    $(document).on("mouseenter", ".hanriver", function () {
        $(".hanriver").css({"fill": "#6476fd", "cursor": "pointer"});

    });
    $(document).on("mouseleave", ".hanriver", function () {
        $(".hanriver").css({"fill": "", "cursor": ""});

    });

    $(document).on("mouseenter", ".gu1", function () {
        $(".gu1").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu1").css({"fill": "red", "stroke": "red"});
        $(".sd1").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu1", function () {
        $(".gu1").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu1").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu2", function () {
        $(".gu2").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu2").css({"fill": "red", "stroke": "red"});
        $(".sd2").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu2", function () {
        $(".gu2").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu2").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu3", function () {
        $(".gu3").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu3").css({"fill": "red", "stroke": "red"});

    });
    $(document).on("mouseleave", ".gu3", function () {
        $(".gu3").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu3").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu4", function () {
        $(".gu4").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu4").css({"fill": "red", "stroke": "red"});
        $(".sd4").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu4", function () {
        $(".gu4").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu4").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu5", function () {
        $(".gu5").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu5").css({"fill": "red", "stroke": "red"});
        $(".sd5").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu5", function () {
        $(".gu5").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu5").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu6", function () {
        $(".gu6").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu6").css({"fill": "red", "stroke": "red"});
        $(".sd6").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu6", function () {
        $(".gu6").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu6").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu7", function () {
        $(".gu7").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu7").css({"fill": "red", "stroke": "red"});
        $(".sd7").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu7", function () {
        $(".gu7").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu7").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu8", function () {
        $(".gu8").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu8").css({"fill": "red", "stroke": "red"});
        $(".sd8").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu8", function () {
        $(".gu8").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu8").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu9", function () {
        $(".gu9").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu9").css({"fill": "red", "stroke": "red"});
        $(".sd9").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu9", function () {
        $(".gu9").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu9").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu10", function () {
        $(".gu10").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu10").css({"fill": "red", "stroke": "red"});
        $(".sd10").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu10", function () {
        $(".gu10").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu10").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu11", function () {
        $(".gu11").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu11").css({"fill": "red", "stroke": "red"});

    });
    $(document).on("mouseleave", ".gu11", function () {
        $(".gu11").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu11").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu12", function () {
        $(".gu12").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu12").css({"fill": "red", "stroke": "red"});

    });
    $(document).on("mouseleave", ".gu12", function () {
        $(".gu12").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu12").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu13", function () {
        $(".gu13").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu13").css({"fill": "red", "stroke": "red"});

    });
    $(document).on("mouseleave", ".gu13", function () {
        $(".gu13").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu13").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu14", function () {
        $(".gu14").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu14").css({"fill": "red", "stroke": "red"});

    });
    $(document).on("mouseleave", ".gu14", function () {
        $(".gu14").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu14").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu15", function () {
        $(".gu15").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu15").css({"fill": "red", "stroke": "red"});
        $(".sd15").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu15", function () {
        $(".gu15").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu15").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu16", function () {
        $(".gu16").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu16").css({"fill": "red", "stroke": "red"});

    });
    $(document).on("mouseleave", ".gu16", function () {
        $(".gu16").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu16").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu17", function () {
        $(".gu17").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu17").css({"fill": "red", "stroke": "red"});

    });
    $(document).on("mouseleave", ".gu17", function () {
        $(".gu17").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu17").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu18", function () {
        $(".gu18").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu18").css({"fill": "red", "stroke": "red"});
        $(".sd18").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu18", function () {
        $(".gu18").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu18").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu19", function () {
        $(".gu19").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu19").css({"fill": "red", "stroke": "red"});

    });
    $(document).on("mouseleave", ".gu19", function () {
        $(".gu19").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu19").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu20", function () {
        $(".gu20").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu20").css({"fill": "red", "stroke": "red"});

    });
    $(document).on("mouseleave", ".gu20", function () {
        $(".gu20").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu20").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu21", function () {
        $(".gu21").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu21").css({"fill": "red", "stroke": "red"});

    });
    $(document).on("mouseleave", ".gu21", function () {
        $(".gu21").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu21").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu22", function () {
        $(".gu22").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu22").css({"fill": "red", "stroke": "red"});
        $(".sd22").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu22", function () {
        $(".gu22").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu22").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu23", function () {
        $(".gu23").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu23").css({"fill": "red", "stroke": "red"});

    });
    $(document).on("mouseleave", ".gu23", function () {
        $(".gu23").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu23").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu24", function () {
        $(".gu24").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu24").css({"fill": "red", "stroke": "red"});

    });
    $(document).on("mouseleave", ".gu24", function () {
        $(".gu24").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu24").css({"fill": "", "stroke": ""});

    });

    $(document).on("mouseenter", ".gu25", function () {
        $(".gu25").css({"fill": "mediumpurple", "opacity": "0.8", "cursor": "pointer"});
        $("text.gu25").css({"fill": "red", "stroke": "red"});
        $(".sd25").css("fill", "#6b6b6b");

    });
    $(document).on("mouseleave", ".gu25", function () {
        $(".gu25").css({"fill": "", "opacity": "", "cursor": ""});
        $("text.gu25").css({"fill": "", "stroke": ""});

    });


</script>

    <svg version="1.1" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
         y="0px" viewBox="100 100 2551.2 1236" xml:space="preserve">

        <style type="text/css">
            text.gu1:hover, text.gu2:hover, text.gu3:hover, text.gu4:hover, text.gu5:hover, text.gu6:hover, text.gu7:hover, text.gu8:hover, text.gu9:hover, text.gu10:hover, text.gu11:hover, text.gu12:hover, text.gu13:hover, text.gu14:hover, text.gu15:hover, text.gu16:hover, text.gu17:hover, text.gu18:hover, text.gu19:hover, text.gu20:hover, text.gu21:hover, text.gu22:hover, text.gu23:hover, text.gu24:hover, text.gu25:hover {
                fill: red;
                cursor: pointer;
                stroke: red;
                background: purple;

            }

            .st39:hover, .st40:hover {
                color: #70D9F2;
                background-color: #70D9F2;
            }

            .st0 {
                fill: #FFFFFF;
            }

            .st1 {
                fill: #64DBFD;
            }

            .st2 {
                fill: #FAF8F0;
            }

            .st3 {
                fill: #FAF5E3;
            }

            .st4 {
                fill: #FAE8EE;
            }

            .st5 {
                fill: #C1F5E5;
            }

            .st6 {
                fill: #E1E1E2;
            }

            .st7 {
                fill: #F7DDE5;
            }

            .st8 {
                fill: #70D9F2;
            }

            .st9 {
                fill: #E1E2E3;
            }

            .st10 {
                fill: #F7D2DB;
            }

            .st11 {
                fill: #E5E2E4;
            }

            .st12 {
                fill: #DEF9F0;
            }

            .st13 {
                fill: #FAF1CC;
            }

            .st14 {
                fill: #FBF5DC;
            }


            .st22 {
                fill: #B8ECF3;
            }

            .st23 {
                fill: #E2F8F9;
            }

            .st24 {
                fill: #F4F9D2;
            }

            .st25 {
                fill: #E8F2B6;
            }

            .st26 {
                fill: #73ECD1;
            }

            .st27 {
                fill: #72EBD5;
            }

            .st30 {
                fill: #FBEBB1;
            }

            .st31 {
                fill: #8FE0F3;
            }

            .st32 {
                fill: #DBEC94;
            }


            .st34 {
                fill: #D0F3F5;
            }

            .st35 {
                fill: #CCE779;
            }

            .st36 {
                fill: #96F2DC;
            }

            .st37 {
                fill: #F7C2CE;
            }

            .st38 {
                fill: #A3E7F1;
            }

            .st39 {
                font-family: 'HanSantteutDotumRegular';
            }

            .st40 {
                font-size: 25.59px;
            }

            .st41 {
                fill: #ACF4E0;
            }

            .st42 {
                fill: #F8B1BF;
            }

            .st43 {
                fill: #F7F9E1;
            }
        </style>
        <%--    전체--%>
        <path class="st0" d="M1466.9,1237c-320,0-639.5,0-959,0c0-412,0-824,0-1236c513.3,0,1026.7,0,1540,0c0,412,0,824,0,1236
	C1854.4,1237,1660.9,1237,1466.9,1237 M761.3,847.3c-0.5,1.6-0.9,3.1-1.4,5.2c0,0,0,0.5-0.7,0.6c-6.7,6.4-7.2,12.3-1.6,19.1
	c2.6,3.2,4.1,6.3,2,10.9c-6.1,13.7-11.7,27.7-17.5,41.6c-2.8,6.7-3.5,13.4-0.8,20.2c1.8,4.6,4.6,8.8,6.2,13.4
	c4.5,12.7,3.4,24.9-3.6,36.5c-2.6,4.4-4.9,9-6.8,13.7c-2.2,5.6-3.5,11.6-5.5,17.3c-0.9,2.7-0.3,3.8,3.1,4.2c5,1.1,9.9,2.7,15,3.3
	c10.4,1.4,20.9,2.8,31.4,3.3c14.5,0.8,29.1,0.6,43.6,1.2c6.3,0.3,12.3,0,17.2-4.4c9.1-8.2,17.9-16.9,27.1-24.9
	c10.4-9,18.1-19.6,22.2-32.8c1.7-5.4,3.8-10.6,10.4-12.4c0.4,1.5,1,3,1.3,4.6c1.1,5.8,1.7,11.7,3.3,17.3
	c3.2,10.8,7.1,21.5,10.6,32.2c4.2,13.3,8,26.7,12.6,39.8c1.4,3.9,3.6,8.1,9.1,9c3.4,0.6,6.8,2.6,7.9,6.7c1.1,4.4,2.5,8.8,3.6,13.3
	c1.5,6.4,2.7,12.8,4.4,19.2c3.5,13,7.4,25.8,10.8,38.8c1.7,6.6,2.2,13.6,4.4,20c1.2,3.5,1.3,8.6,6.5,10.5c4.4,2.4,8.5,6.5,13.1,7
	c13.6,1.5,27.4,2.5,41.1,2c15.3-0.6,25.8-9.5,31.6-23.5c2.2-5.3,5-9.6,10.7-12.5c0.5-0.3,0.9-0.5,1.5,0c0.9,2.5,1.8,4.9,2.8,7.4
	c3.5,8.5,13,17.2,22.2,16.7c1.3,0.1,2.6,0.2,4.6,0.3c0.4,0,0.9,0,1.3,0.7c0,0.4,0,0.9,0.3,2c8.9,6.5,19.2,6.5,29.4,6.3
	c10.6-0.2,21.2-0.3,31.8-1.1c6.7-0.5,13.6-0.1,19.7-5.1c7.1-5.8,15.5-10,22.9-15.4c13.1-9.5,27.2-17.5,38.7-29.4
	c12.9-13.4,24.9-28.1,42.6-37.1c0.5-0.3,1-0.5,1.7-0.2c0.3,0.8,0.5,1.6,0.8,3.1c0.7,0.8,1.3,1.6,2,3c0.3,1.1,0.7,2.2,1,4
	c-0.2,1.6-0.4,3.2-0.7,5.9c5.3,1.1,10.5,2.2,16.5,3.4c5.8,1,11.6,2.6,17.4,2.7c7.9,0.2,15.3-0.9,20.6-8.7
	c7.7-11.3,17.9-20.2,31.6-24.7c0.5,0.9,1,1.8,1.6,3.4c0.3,1.1,0.6,2.2,0.3,3.8c0.9,4.2,1.7,8.3,2.7,13.2c0.3,1.4,0.6,2.8,0.3,4.8
	c0.9,4.5,1.8,9,2.6,14.3c0,1.1,0,2.1,0,4c0.3,2.2,0.5,4.5,1.1,6.7c0.7,2.3,1.8,4.4,2.8,7.4c0,1,0,2.1-0.5,3.7
	c0.5,3.7,0.9,7.4,1.6,11.1c0.2,1.2,1.3,2.3,1.9,4.3c0,1.4,0,2.7-0.6,4.7c-0.3,5.2-1.1,10.5,4,15c1.2,0.8,2.4,1.6,3.7,3.1
	c2,1.4,4,2.8,6.5,4.5c1.1,0.6,2.2,1.2,3.4,2.6c1.2,2,1.9,4.9,3.7,5.9c12,6.3,24.2,12.2,37.1,18.4c15,4.9,30.4,6.6,46.1,5.9
	c7.8-0.4,12.4-4.9,13.1-12.9c0.3-3.1,0.3-6.4,1.1-9.3c1.9-7.1,3.9-14.4,11.9-17.1c4-1.4,8.3-1.8,12.5-2.6
	c12.2-2.3,22.3-7.2,26.6-20.1c0.5-1.7,3-3.3,4.9-3.8c4.6-1.1,10.3-0.7,12.7-5.6c2.8-5.5,4.6-11.5,6.2-17.4
	c1.3-4.9,2.1-10.3,7.7-11.7c10.1-2.5,20.4-4.4,30.6-6.4c6.6-1.3,13.5-1.9,19.9-3.8c8.2-2.4,14.2-8.2,19-15.3c2.3-3.4,4.7-7.3,10.1-7
	c12.6,0.8,17.3-6.2,20.6-16.2c3.8-11.6,8.6-15.5,20.8-15.8c13.4-0.3,17.5-4.2,20.3-18.9c1.6-8.4,3.5-16.3,12.6-20.4
	c4.2-1.9,8.3-5.1,11.2-8.7c6.7-8.3,7.4-18.9,9.1-29c1.5-8.6,3.9-16.4,12.2-21c7.6-4.2,10.5-10.8,8.1-19.3c-0.7-2.4-2.4-5.6-4.5-6.5
	c-5-2-10.4-2.9-15.8-4.9c-10.6-6.9-23.4-7.2-34.9-12.1c-2.2-7.9-1.4-16.5-6.5-23.7c-0.7-1,0.1-3.6,1-5
	c10.1-16.7,20.2-33.4,30.6-49.9c7.7-12.3,14-25,12.8-40c-0.7-8,3.9-10.2,10.2-12.4c1.2-0.4,2.6-0.3,3.9-0.7
	c18.3-5.8,36.5-11.8,54.8-17.5c14.5-4.5,19.1-15.7,17.9-27.9c-0.9-8.5-3.5-16.8-5.2-25.2c-1.7-8.8-3-18.1,0.6-26.5
	c3.7-8.8,3.4-17.4,1.7-26.2c-0.7-3.7-1.9-8-4.4-10.5c-2.9-2.9-7.6-3.9-11.2-6.1c-3.5-2.2-8-3.4-8.2-9c-0.3-6.5,1-11.5,7.1-15.2
	c4.2-2.5,7.6-6.5,11.9-10.4c-2.1-1.1-3.1-1.5-4-2.1c-2.7-1.9-5.3-3.9-7.9-6.7c-2.3-5.2-4.4-10.6-7-15.7c-3.2-6.3-3.5-6.3-9.7-2.8
	c-25.7,14.3-51.4,28.4-76.9,43.1c-10.4,6-20.8,10.6-33.2,9.8c-6.5-0.4-13.2,0.8-19.7,2.2c-12.9,2.7-23.3,10.1-33.2,18.4
	c-5.7,4.8-12,8.8-18.8,13.1c-0.8,1-1.7,1.9-2.8,3.5c-3,2.5-5.9,4.9-9.6,7.4c-0.7,0-1.4,0-2.4-0.6c-7.2-6.2-6.7-16.6-2.3-23.1
	c6.6-9.6,7.4-20.2,5.9-31.4c-0.4-2.7-0.1-6.3,1.4-8.4c5.9-8.4,12.4-16.2,18.6-24.4c5.7-7.5,11.7-15,12.7-24.8
	c1.3-12.5,2.9-25.1,2.7-37.6c-0.2-11.1,2.5-20.1,9.5-28.8c6.3-7.9,8-17.5,3.1-27.5c-3.3-6.6-5.5-13.8-9.1-20.3
	c-1.7-3-5.1-5.7-8.4-6.9c-5.8-2.2-11.4-4.2-15.5-9.2c-6.2-7.6-5.8-16.8,1.3-20.7c3.3-1.8,6.7-3.7,10-5.6
	c8.5-4.9,13.1-15.7,10.6-25.2c-1.8-6.9-4-13.6-5.7-20.5c-1.2-4.8-1.5-9.8-2.7-14.6c-1.3-5-1.2-11.3-6.5-13.9
	c-5.4-2.6-11.5-3.7-17.8-6c-2.3-1.4-4.5-3.4-7.1-4.2c-6.1-2-12.3-3.5-18.5-6.1c-0.3-4-1.1-7.9-0.9-11.9c0.4-9.3,1.4-18.5,1.8-27.8
	c0.3-5.7,1.2-11.3,6.4-14.2c10.4-5.9,11.9-15.1,10.6-25.6c0-0.2,0-0.3,0-0.5c-1.1-11-4-21-13.9-27.9c-6.2-4.3-6.8-14.4-2.3-20.7
	c3.7-5.2,7.4-10.5,10.4-16.1c4.2-7.8,1.9-17.1-4.4-20.8c-6.4-3.8-13.9-5.9-21-9.4c-3.3-1.8-6.6-3.5-10.3-5.8
	c-7-5.2-14.1-10.3-21.1-15.5c-9.2-6.8-18.4-13.5-30.6-14.7c-0.7-0.4-1.4-1.2-2-1.1c-5.1,1.1-10.7,1.3-15.1,3.8
	c-11.8,6.6-22.9,14.3-34.5,21.3c-4.3,2.6-8.8,6-13.5,6.6c-13.5,1.6-25.7-3.9-37.9-9.5c-0.8-1.6-1.3-3.3-2.3-4.8
	c-6.3-9.7-14.8-16.1-27.2-18c-15,0.2-30.1,0-45.1,0.9c-6.1,0.4-12.7,2.7-16.3,8.4c-3.1,4.9-6,10.4-7,16c-1.4,7.6-0.8,15.5-1.1,24
	c-0.3,1.1-0.6,2.2-1.4,3.7c-2.8,2.2-5.7,4.4-9.3,6.6c-7.9,2.9-15.8,5.7-23.7,8.6c-0.3,0.1-0.3,0.9-1.1,1.4c-0.8,0.3-1.5,0.7-3,1.1
	c-0.5,0.6-0.9,1.3-1.6,2.4c-0.6,0.5-1.2,1-2.5,1.5c-4.4,2-4.2,6-4.3,10.7c0,0.7,0,1.5-0.6,2.7c-1.5,5.2-3,10.4-4.5,16.3
	c-0.3,1.4-0.6,2.8-1.6,4.4c-2.5,5-5,9.9-7.4,14.9c-1.6,3.3-3.3,6.7-4.9,10.7c0,0.4,0,0.9-0.7,1.4c-0.8,1-1.5,2-2.3,3.6
	c0,0.4,0,0.9-0.7,1.4c-2.4,4.3-4.9,8.6-7.3,13.6c0,0.4,0,0.9-0.7,1.4c-0.4,1-0.9,1.9-1.3,3.7c0,1.4,0,2.8-0.6,4.7
	c-0.1,15.6-0.2,31.2-0.3,46.7c0,0.6,0.6,1.1,0.9,2.6c0,8,0,16-0.6,24.4c-1.1,3.4-2.4,6.7-3.3,10.1c-2.9,11.1-10.9,13.9-19.5,15.3
	c-1.7,0.3-3.7-1.2-5.6-2.8c0.3-6.5,1-12.9,0.9-19.4c-0.1-7,2-14.6-2.9-20.8c-4.1-5.3-8.6-10.4-13.6-14.8
	c-13.7-12.1-27.5-24-41.6-35.6c-6.7-5.6-13.2-12-22.3-13.6c-2-0.3-4.3,1.4-7.2,2.1c-4.8,1.9-11.5,12.9-11.6,19.4
	c-0.2,0.3-0.4,0.5-1.5,0.6c-1.7,2-3.5,4-5.5,6.6c-1.8,0.9-3.7,1.9-5.8,2.2c-1.3,0.7-2.6,1.4-4.8,2.1c-6,0-12,0-18.5-0.4
	c-4.7,0.3-7.8,2.6-8.6,8.1c0,0.4-0.1,0.8-0.7,1.6c-2.4,1-4.8,2.1-7.7,2.4c-3.3-0.2-6.8-2.3-10.5,1.3c-1.7-0.1-3.4-0.2-5.3-1
	c-7.2-0.2-14.5-0.4-21.7-0.6c-0.4,0-0.8,0.9-1.6,1.6c0,0-0.4,0.1-1.2,0.1c-1.4,2.3-3.8,4.5-4,7c-0.8,7.7-0.7,15.6-1.3,23.3
	c-1.5,19.9-3.4,39.8-4.8,59.8c-0.5,7-2.8,13.1-7.1,18.6c-1.7,2.1-2.9,5.2-2.9,7.9c-0.2,23.2-0.1,46.3-0.1,69.5
	c0,9.4-1.4,18.4-6.4,26.5c-4.3,7-10.4,11.6-18.7,13.6c-10.4,2.5-20-0.5-29.7-3.6c-6.3-2-11.1-0.5-14.9,4.8
	c-6.6,9.3-13.1,18.8-20.3,27.7c-2.5,3.1-6.7,6.4-10.4,6.7c-16,1.5-30.6,6-43.3,16.2c-3.5,2.8-7.7,4.3-12.1,2
	c-9.8-5.2-19.4-10.4-25.8-20.3c-4.6-7.1-10.6-13.5-16.9-19.3c-9-8.3-18.4-16.2-25.5-26.4c-4.7-6.8-9.6-13.7-15.6-19.3
	c-5.7-5.3-13-9-19.7-13.2c-10.8-6.7-21.8-13-32.5-19.7c-11.5-7.2-22.8-14.7-34.3-21.8c-1.3-0.8-4.6-0.7-5.3,0.2
	c-2,2.6-3.2,5.9-4.8,8.8c0,0,0,0-0.7,0c-3,2.4-5.8,4.8-5.1,9.6c0,0-0.1,0.4-0.7,0.4c-0.3,0.4-0.6,0.8-0.9,1.2
	c0.5,0.2,1.1,0.4,1.5,0.7c0,0,0.1-0.1,0.1,0.6c4.5,3.1,9.1,6.2,13.5,9.4c3.9,2.9,7.6,6,11,9.5c-7.2,4.5-10.1,11.8-7.1,22.6
	c2.9,10.3,5.6,20.5,4.4,31.3c-0.7,5.9-2.7,10.8-8.2,14.4c-6.9,4.4-12.9,10.5-15.1,18.5c-2.1,7.4-3,15.2-3.5,22.9
	c-0.6,9.6-4.6,15.6-14,17.7c-12.6,2.9-21.3,9.8-24.2,22.8c-1.1,5-2,10-3,15.1c-1.4,7.1-1.8,14.5-9.5,18.5c-8.8,4.6-9.9,7.9-6.7,17.3
	c2,5.9,5.3,11.8,5.9,17.8c0.6,6.7,3.5,10.4,9.2,12.7c8.6,3.4,17.2,6.9,26,9.9c17.4,6.1,27.9,17.8,31.3,36.7c1.6,2.4,3.2,4.8,5.2,7.9
	c6.4,7.6,26.1,6.2,30.9-2.7c1.8-3.4,5-6.1,7.8-8.9c8.3-8.2,18.5-11.1,30.7-10.1c1.1-0.4,2.2-0.7,3.9-0.9c0.8,0.7,1.6,1.3,2.4,2.7
	c0.7,0.8,1.3,1.5,2,2.8c0,0,0,0.5,0,1.2c0.3,0.8,0.7,1.5,1,3.1c0,0.7,0,1.5,0,3.2c0,22,0,44.1,0,66.9c0,1.1,0,2.1-0.6,3.6
	c-0.1,1.2-0.3,2.4-0.4,4.2c0,0.4,0,0.9-0.6,1.8C762.9,842,762.4,844.5,761.3,847.3z"/>
        <%--    한강--%>
        <path class="st1 hanriver" d="M1257.4,879.8c0,0-0.5,0.1-1,0.1c-0.9,0.4-1.4,0.8-1.8,1.1c-0.5,0-0.9,0.1-2.1,0.1c-4.1,1-7.5,1.9-10.9,2.9
	c-10.7,0-21.4,0.1-32.9,0.1c-1.6,0-2.4,0.1-3.6,0.1c-1.5-0.1-2.5-0.1-3.8-0.4c-11.5-1.7-20.8-6.7-28.6-15
	c-7.7-8.2-15.8-16.1-23.9-23.9c-1.7-1.6-4.6-2.9-6.9-2.7c-3.5,0.2-6.9,1.8-10.7,2.8c-1.5,0.1-2.5,0.2-4,0.1c-9.2-0.1-17.9,0-27,0
	c-1.1-0.1-1.9-0.1-2.8-0.4c-2.7-1-5.3-1.7-8.2-2.5c-0.8-0.1-1.2-0.2-1.8-0.5c-3-1.4-5.8-2.5-8.8-3.9c-19.5-15.6-30.2-35.3-29.8-60.2
	c0.1-6-2.5-8.6-7.4-10.6c-9.6-4-19.1-8-28.4-12.5c-9.5-4.6-18.8-9.7-28.1-14.9c-6.2-3.5-12.7-6.7-18.1-11.2
	c-8.9-7.2-16.9-15.5-25.5-23.1c-3-2.7-6.5-4.9-9.9-7.7c-7.3-6.8-14.5-13.3-21.6-19.8c0,0-0.1,0.1-0.1-0.3c-1.2-1.8-2.2-3.4-3.5-4.5
	c-10.9-8.8-19.6-19.2-25.8-32.1c-2.6-5.5-8.3-9.5-12.5-14.2c0,0-0.1,0.1-0.1-0.3c-2.2-2.9-4.1-6-6.8-7.9c-5.7-3.9-12-6.9-17.9-10.6
	c-9.6-6.1-21.4-9.2-27.9-19.8c-0.2-0.3-0.9-0.3-1.4-0.5c0,0-0.1,0.1-0.1-0.3c-3-4.2-5.9-7.9-8.9-11.7c0,0-0.1,0.1-0.1-0.3
	c-2.9-7.3-8.5-11.4-15-14.7c0,0-0.1,0.1-0.1-0.3c-10.4-8.4-17.4-19.3-25.4-29.3c-3.7-4.6-7.2-9.8-11.9-13.1
	c-9.5-6.8-19.7-12.7-29.8-18.8c-6.2-3.7-12.5-7-18.8-10.5c0,0,0,0-0.1-0.3c-1.4-1.1-2.7-1.9-4.2-2.7c-0.2,0-0.5,0-0.6-0.4
	c-0.8-1.1-1.3-2-2.1-2.5c-7.6-4.9-15.2-9.8-22.9-14.6c-1.2-0.8-2.8-0.9-4.2-1.4c0,0-0.1,0.1,0-0.3c0-0.8,0-1.2,0-1.6
	c0,0,0.1-0.4,0.5-0.7c2.1-3.3,3.8-6.3,5.5-9.3c0,0,0,0,0.3-0.1c1.4-1.6,2.8-2.9,3.6-4.5c1.6-3.3,3.4-3.6,6.6-1.6
	c25.8,16.3,51.5,32.6,77.6,48.3c8,4.8,12.6,12.2,18.3,19c7.8,9.3,14.2,19.8,24.5,27.1c6.7,4.7,11.6,11.9,17.4,18
	c6.4,6.7,10.2,15.8,19.3,20.1c8.6,4.1,16.9,8.9,25.5,13.7c0.7,0.5,1.3,0.7,2,1.1c1,0.7,2,1.2,3,1.9c0.7,0.4,1.3,0.6,2,1.1
	c2,1.5,3.9,2.7,5.8,4.2c0.7,1.1,1.4,1.8,2.1,2.9c2,2.4,3.9,4.5,5.9,6.7c0,0,0,0,0.1,0.3c2.3,2.8,4.6,5.2,7.1,7.9
	c3.3,5.7,6.5,11.2,9.8,16.6c1.8,2.9,3.6,6.1,6,8.4c8.4,7.8,17.1,15.2,25.6,22.9c11.3,10.2,22.5,20.6,34,30.8
	c5.3,4.7,10.7,9.5,16.7,13.2c10.2,6.1,20.7,11.7,31.4,16.9c15.9,7.6,31.8,15.3,48.3,21.7c19.3,7.5,38,15.5,52,31.6
	c1,1.2,2.6,1.9,4,3.2c0.4,0.9,0.7,1.5,1.1,2c22.7,22.4,45.4,44.9,68.3,67.1c2.4,2.3,6.5,3.9,9.9,4.1c9.4,0.6,18.9,0.4,28.3,0.1
	c8.4-0.3,16.5-1.6,23-7.8c19.1-18.5,38.3-36.9,57.5-55.3c2.2-2.1,4.4-4,6.6-6c5.5-4.9,11.1-9.8,16.7-14.8c0-0.1,0-0.4,0.4-0.5
	c8.7-2.1,16.7-5,25.4-6c14-1.6,27.8-0.5,41.6,1.1c16.3,1.9,31.1,8.6,45.4,16.5c5,2.8,10.4,4.9,15.7,7.6c13,12.1,29.3,14.8,45.6,15.8
	c11.9,0.7,23.9-1.1,35.8-1.5c6-0.2,11.1-2.1,15-6.7c3.6-4.2,7.1-8.4,10.6-12.6c6.8-8.2,14.7-15.7,20-24.8
	c9.3-16,19.5-31.8,22.7-50.7c1.4-8.4,3.7-16.7,5.8-25.2c0.5-0.5,0.7-0.8,0.9-1.3c0.1-0.1,0-0.3,0.3-0.5c1.7-2.6,3-4.9,4.6-7.5
	c0.4-0.5,0.7-0.7,1.2-1c1-1,1.8-1.9,2.5-2.8c3-2.5,5.9-4.9,9.4-7.7c1.3-1.3,2.2-2.2,3.1-3.1c6-4.3,12.4-8.3,18-13.1
	c9.9-8.3,20.3-15.7,33.2-18.4c6.4-1.4,13.2-2.6,19.7-2.2c12.5,0.8,22.8-3.8,33.2-9.8c25.4-14.7,51.2-28.8,76.9-43.1
	c6.2-3.4,6.4-3.4,9.7,2.8c2.6,5.1,4.7,10.4,6.6,16.1c-3.5,2.3-6.6,4.1-9.8,5.9c-6,3.4-12,6.9-18.3,10.4c-5.1,2.7-9.8,5.4-14.8,8.1
	c-0.5,0.3-0.7,0.6-1.2,0.9c-12.7,6.9-25.4,13.1-37.3,20.7c-13.8,8.8-28.2,13.6-44.7,12.6c-9.7-0.5-19.4,1.5-27.4,7.4
	c-10.6,7.7-20.5,16.3-31.3,23.7c-7.9,5.4-11.5,12.9-13.6,21.7c-2.8,11.2-5.7,22.5-8.9,33.8c-4.6,7.5-8.9,14.8-13.2,22.1
	c-3.1,5.2-5.5,11-9.2,15.7c-8.7,11.2-18.2,21.9-27,33.1c-7.8,9.9-17.5,17.3-30.1,18.2c-18,1.3-36.1,0.9-54.1,1.1
	c-2.6,0-5.2-0.1-7.9-0.2c-0.2,0-0.6,0.1-0.9,0c-0.5,0-0.6,0-0.9-0.4c-2.7-1-5.3-1.8-8-2.4c-2.4-0.5-5.2-0.3-7.2-1.4
	c-8.6-4.8-17-10.1-25.6-14.9c-12.2-6.8-24.4-13.7-38.1-17.3c-14.2-3.8-28.6-3.6-43-3.2c-10.1,0.3-19.5,2.5-26.8,10.3
	c-5.4,5.8-10.9,11.5-16.5,17.3c-0.2,0.1-0.6,0.3-1,0.3c-1,0.4-1.8,0.7-2.4,1.3c-14.5,14-29,28.1-43.5,42.1
	c-4.5,4.3-9.2,8.3-13.8,12.5c0,0,0,0-0.4,0.1C1260.3,877.9,1258.9,878.9,1257.4,879.8 M1112.1,809c-11.2-11.3-21.8-23.5-37.6-28.6
	c-2.1-0.7-4.6-1.2-6.4-0.6c-1,0.3-1.6,3.6-1.3,5.3c2.1,10.2,4.7,20.4,11.9,28.4c6.3,6.9,12.9,13.5,23,14c8.1,0.4,16.3,0.4,24.4,0.4
	c0.8,0,1.5-0.9,3.3-2.1C1123.5,820.1,1118,814.8,1112.1,809z"/>
        <%--    성북구17--%>
        <path class="st2 seongbukgu gu17" lon="127.0203" lat="37.5863" gu="17" d="M1223.6,365c1.9,0.7,3.9,2.2,5.6,1.9c8.6-1.5,16.6-4.2,19.5-15.3c0.9-3.4,2.2-6.8,3.9-10.1
	c0.5,0.7,0.6,1.3,0.4,1.9c-4.3,14.4,2,24.7,16.5,29c6.7,2,13.3,5.2,19,9.3c12.6,9.1,24.7,18.9,36.8,28.7c2.5,2.1,5.1,5,6,8
	c3.4,11.2,6.2,22.7,9.2,34.1c2.2,8.4,6.4,11.7,15.1,11.6c3.5-0.1,6.9-0.8,10.4-0.9c12.8-0.4,25.6-0.5,38.4-1.2c3-0.1,6.2-1.4,8.7-3
	c6.5-4.2,11.4-9.6,14.8-16.9c4.1-8.5,9.7-16.1,14.5-24.3c1.7-2.8,2.9-5.9,4.6-8.8c1.5,0.3,2.6,0.7,3.7,1.3c1.7,2.5,3.3,4.6,5,7
	c3,4.4,6,8.5,9,13c1,1.8,2,3.2,3,5c1.6,2.1,3.3,3.9,4.9,6c0.7,1.7,1.4,3.1,2.1,4.9c1.4,1.5,2.7,3.2,4.3,3.7c5.4,1.6,10.9,2.9,16.5,4
	c3,0.6,6.1,0.7,9.4,1.1c0.8,0,1.2,0,1.7,0.3c1.4,1.4,2.7,2.5,4,4c-1,11-1.9,21.5-3,32c-0.1,0.9-1,2.3-1.8,2.5
	c-4.9,1.2-10,2.1-14.9,3.2c-3.5,0.8-6.9,2-10.6,3.1c-0.7,0-1.2,0-2,0c-4.2,1-7.9,2-12,3c-0.7,0-1.2,0.1-1.9,0.1
	c-4.1,1.7-7.8,3.7-11.6,5.2c-13.2,5.1-20.8,15.3-26.4,27.8c-2.2,5-4.9,10.5-8.9,13.9c-5,4.3-11.6,6.8-17.6,10s-12.1,6.2-18,9.5
	c-6,3.4-6.2,9.4-6.2,15.2c0,4-1,6.9-3.9,9.7c-3.1,3.1-5.5,7-8.6,10.5c-0.5,0.1-0.7,0.1-1.2,0.1c-0.7-0.1-1.1-0.2-1.6-0.5
	c-1-0.4-2-0.5-3.4-0.6c-2.5-0.1-4.5-0.1-6.6-0.5s-4-0.5-6.4-0.6c-5.8-0.4-11.1-0.7-16.6-1.4c-1-0.7-2-1.1-3.2-1.7
	c-3.4-4.8-7.1-9.2-9.6-14.2c-6.7-13.2-12.9-26.6-19.3-39.9c-0.7-1.5-1.6-3.4-2.9-3.9c-8-3.1-16-7.3-24.4-8.2s-16.2-2.7-24-5.4
	c-9.4-3.3-7.6-3.2-7.5-10.8c0.1-12.7-1.7-11.4,11.3-16c2.3-0.8,5.1-2.3,6.3-4.3c6.9-11.3,6.2-23.4,1.3-34.8
	c-10.6-24.5-17-50.2-22.8-76.3c0.1-0.8-0.1-1.4-0.2-2.4c-0.6-1.5-0.9-2.7-1.7-3.6c-3-3.3-6.1-6.6-9.2-10.2c0-1.2,0-2,0.1-3
	C1222.4,365.9,1223,365.5,1223.6,365z"/>
        <%--    강북구3--%>
        <path class="st3 gangbukgu gu3" lon="127.0277" lat="37.6369" gu="3" d="M1446.6,409c-1.4,2.9-2.6,6-4.3,8.8c-4.8,8.1-10.4,15.8-14.5,24.3c-3.5,7.2-8.4,12.7-14.8,16.9
	c-2.5,1.6-5.7,2.8-8.7,3c-12.8,0.6-25.6,0.7-38.4,1.2c-3.5,0.1-6.9,0.9-10.4,0.9c-8.7,0.1-12.9-3.2-15.1-11.6
	c-3-11.4-5.7-22.8-9.2-34.1c-0.9-3-3.5-5.9-6-8c-12.1-9.8-24.2-19.6-36.8-28.7c-5.7-4.1-12.3-7.3-19-9.3
	c-14.5-4.3-20.8-14.6-16.5-29c0.2-0.6,0.1-1.3-0.1-2.1c-0.3-8.2-0.3-16.3,0-25c0.4-16.3,0.5-31.9,0.6-47.5c0-0.6-0.6-1.1-0.9-1.7
	c0-1.4,0-2.8,0.4-4.6c0.8-1.4,1.2-2.4,1.6-3.4c0-0.4,0-0.9,0.4-1.7c2.8-4.7,5.2-9,7.6-13.3c0-0.4,0-0.9,0.4-1.7
	c1.1-1.3,1.9-2.3,2.6-3.3c0-0.4,0-0.9,0.4-1.7c4.5-8.7,8.5-17,12.6-25.3c0.3-1.4,0.6-2.8,1.3-4.7c1.8-5.7,3.2-11,4.7-16.3
	c0-0.7,0-1.5,0.4-2.7c1.8-3.7,3.2-7,4.6-10.3c0.6-0.5,1.2-1,2.2-1.8c0.9-0.9,1.4-1.6,1.8-2.2c0.8-0.3,1.5-0.7,3-1
	c5.6-1.9,10.4-3.9,15.4-5.5c2.8-0.9,5.9-2.3,8.6,1c1.1,5.7,2.2,11.1,3.4,16.3c1.8,7.7,4.5,15.2,3.4,23.4c-1.2,9.2-2.1,18.4-2.8,27.6
	c-0.4,5.5,0.1,11-0.1,16.5c-0.1,2.6-0.5,5.3-1.4,7.7c-3.7,9.9-3.4,18.4,5.5,25.8c6.8,5.6,13.1,12,18.7,18.7
	c4.3,5.2,9.1,6.8,15.5,6.6c4.3-0.1,8.4,1.1,11.4,4.9c5.6,7.2,11.6,14.1,17.2,21.2c17.1,21.7,34.1,43.4,51.1,65.1
	C1444,404.4,1445.2,406.8,1446.6,409z"/>
        <%--    동작구12--%>
        <path class="st4 gu12" lon="126.9415" lat="37.5096" gu="12" d="M1232,1008c-3.5,1.6-6.2,3.2-9.2,4.1c-11.4,3.6-22.6,4.2-32.9-3.7c-3.9-3-8.4-5.4-12.2-8.6
	c-2-1.6-3.9-4.1-4.4-6.5c-2.7-12.1-5-24.3-7.1-36.5c-0.9-5-3.5-7.2-8.3-8.4c-6.2-1.6-12.1-4.4-18.2-6.2c-3.9-1.1-8-2-12.1-2
	c-20.2-0.2-40.3,0-60.5-0.2c-3.7,0-6.5,1.1-7.4,4.4c-2.8,10.6-11.2,12.4-20.2,13.7c-10,1.5-19.6,4.3-27.8,10.7
	c-2.7,2.1-6,3.5-9.3,4.8c0.3-6.8,1.3-13.2,1.5-19.6c0.1-3.6,1.5-5.8,3.9-8.1c6.6-6.6,15.1-8,23.6-9.9c4.9-1.1,11.4-1.9,13.8-5.2
	c4.8-6.8,8.3-15,10.5-23.1c2-7.5,1.2-15.7,2.5-23.4c1-5.7,2.7-11.5,5.2-16.8c2.8-6.1,6.4-12,10.5-17.2c2.8-3.6,4.1-11.4,12-7.2
	c0.2,0.1,0.8-0.5,1.1-0.8c0.4,0,0.9,0.1,1.7,0.6c2.3,3.8,5,4.4,8.3,2.5c0.7,0,1.5,0,2.7,0.5c7.4,0.9,14.4,1.6,21.3,1.8
	c2,0.1,4-1.3,6.1-2.1c1.1-0.1,2.1-0.2,3.8,0c2.8,0.4,5.5,1.3,7,0.3c5-3.1,8,0.1,11.1,2.9c2.2,2,4.1,4.3,6.4,6.3
	c11.5,10.2,19.9,24.2,35.8,28.7c3.6,0.6,7.1,0.2,10.3,0.3c1.1,0,2.1,0,3.7,0.3c1.4,0.4,2.4,0.5,3.4,0.6c0.4,2.1,0.6,4.3,1.1,6.3
	c1.7,6.9,2.6,7.4,9.9,7.6c3.5,0.1,7,0.4,10.3,1.1c1.4,0.3,3,1.5,3.6,2.8c2.8,5,5.3,10.3,7.9,15.4c3.8,7.4,0.3,14.6-0.6,21.8
	c-1.3,10-3.6,19.8-5.3,29.7c-1.2,7.5-2.1,15-3,22.5c-0.1,1.1-0.3,2.5,0.2,3.5c1.9,3.4,2.5,6.8,2.7,10.4L1232,1008z"/>
        <%--    양천구19--%>
        <path class="st5 gu19" lon="126.8687" lat="37.5142" gu="19" d="M762.6,839c0-0.4,0-0.9,0.3-1.7c0.4-1.7,0.5-3,0.6-4.3c0-1.1,0-2.1,0.4-3.7c0.8-1.5,1.5-2.5,1.5-3.5
	c0.1-20.1,0.1-40.3,0-60.4c0-1.2-1.2-2.3-1.8-3.4c0-0.7,0-1.5,0.2-2.8c-0.3-1.4-0.8-2.3-1.3-3.2c0,0,0-0.5,0-1
	c-0.7-1.4-1.3-2.1-2-2.9c-0.8-0.7-1.6-1.3-2.7-2.4c-0.6-3.6-2.1-7.5-0.8-9.7c2.8-4.9,5.8-9.6,6.9-15.3c0.1-0.5,0.9-1,1.4-1.3
	c9.4-4.9,21.7-0.5,26.1,9.2c2.4,5.3,4.7,10.6,7,16c3.2,7.5,6.5,15,9.5,22.6c1.2,3,2.1,5.8,5.8,6.7c2.6,0.6,5.1,1.8,7.5,3.1
	c10.6,5.5,21,11,33.5,5.8c2.5-1,5-2.9,7-3.4c5.6-1.3,9.7-2.8,12.3-8.8c3-6.7,8.4-12.3,11.3-19.1c2.1-4.9,1.7-10.9,2.2-16.4
	c0.9-9.4,0.2-19.5,11.2-24.7c6.2,5.3,13.5,7.1,22,5.5c3.1-0.6,7-0.6,9,3.8c3.5,7.6,7.2,15,11.4,22.3c4.6,8,10,15.6,8.5,25.6
	c-0.1,0.5,0.4,1,0.3,1.4c-0.5,2.1-0.6,4.7-1.9,6c-5.5,5.2-11.5,9.8-17,15.1c-2.1,2-3.9,5-4.3,7.7c-0.7,4.1-0.2,8.5-0.2,12.7
	c0,10,0,20,0,30c0,6.1,0.6,12.2-3.7,17.6c-1.8,2.3-1.9,6-3.7,8.4c-2.8,3.7-3.4,9.8-10,9.8c-8.2-0.1-16.3,0.2-24.5-0.1
	c-3.9-0.2-7.9-1-9.3-5.9c-1.5-5.3-3.4-10.4-4.9-15.7c-0.8-2.9-1.9-4.5-5.4-4.4c-6.5,0.3-13-0.1-19.5,0.2c-2.3,0.1-5.1,0.8-6.8,2.3
	c-7.4,6.3-14.4,13.2-21.8,19.5c-2.3,1.9-5.3,3.4-8.2,3.9c-4.1,0.7-8.3,0.5-12.5,0.1c-3.7-0.4-7-1.3-8.1-6.4
	c-0.8-3.5-3.9-7.6-7.1-9.2c-3.6-1.8-8.5-0.8-12.7-1.4c-3.4-0.5-7-1.3-9.7-3.1c-1.1-0.7-0.1-4.5-0.1-6.9c0,0,0-0.5,0.4-0.8
	c1.1-1.9,1.9-3.6,2.8-5.5C762.1,843.9,762.4,841.4,762.6,839z"/>
        <%--    <path class="st6" d="M1580.1,1109.5c0.3-0.1,0.7-0.1,1-0.2"/>--%>
        <%--    관악구5--%>
        <g>
            <path class="st7 gu5" lon="126.9538" lat="37.4753" gu="5" d="M1103.6,1172c-0.4,0-0.9,0-1.9-0.3c-1.8-0.4-2.9-0.6-4.1-0.7c-9,1.2-18.5-7.5-22.1-16c-1-2.4-1.9-4.9-2.9-8.1
		c-2.8-11.1-11.6-10.8-20-11.3c0.2-1.3,0.2-2,0.5-2.6c3.9-9.3,2.3-18.4-0.6-27.5c-0.9-3-2.3-5.3-6-5.6c-3-0.3-7.5-0.6-8.6-2.6
		c-3.8-6.3-7-13-9.1-20c-1.7-5.6-1.8-11.7-2.4-17.6c-1.3-12.3-2.8-24.6-3.6-37c-0.6-8.3-0.3-16.7,0-25c0.2-4.6-1.5-7.4-5.5-9.5
		c-6.2-3.2-11.9-7.2-14.2-14.2c3.4-1.8,6.6-3.2,9.3-5.3c8.2-6.4,17.7-9.2,27.8-10.7c9-1.3,17.4-3.1,20.2-13.7
		c0.9-3.3,3.6-4.4,7.4-4.4c20.2,0.2,40.3,0,60.5,0.2c4,0,8.2,0.9,12.1,2c6.2,1.8,12,4.6,18.2,6.2c4.7,1.2,7.4,3.4,8.3,8.4
		c2.1,12.2,4.5,24.4,7.1,36.5c0.5,2.4,2.4,4.9,4.4,6.5c3.8,3.2,8.2,5.5,12.2,8.6c10.3,7.9,21.4,7.3,32.9,3.7c3-0.9,5.8-2.6,9.3-4.1
		c0,3.1,0.5,5.2-0.1,7c-2.1,5.9,0.4,10.7,3,15.5c0.6,1,1.3,2,1.8,3c5.6,11.6,11.2,23.2,16.8,34.7c3,6.2,6,12.3,8.2,16.9
		c-9.1,8.4-17.3,15.8-25.3,23.3c-7.6,7.2-14.4,15.4-22.7,21.7c-15.4,11.7-31.5,22.5-47.6,33.3c-4.5,3-10,6-15.2,6.4
		C1135.4,1171.1,1119.5,1171.3,1103.6,1172z"/>
            <path class="st6 gu5 sd5" lon="126.9538" lat="37.4753" gu="5" d="M1103.8,1174.3c15.6-0.7,31.4-0.7,47.1-1.5c4.2-0.2,8.8-1.9,12.5-4.3c10.1-6.5,19.6-14.1,29.8-20.4
		c15.6-9.7,29.8-20.9,42.2-34.4c5.4-5.8,10.7-12,16.9-16.7c6.9-5.1,14.8-8.8,22.4-13.1c0.6-0.3,1.3-0.4,1.9-0.5
		c2.8-0.8,6.4-3,8.1-2.1c1.9,1.1,2.2,5.2,3.1,7.9c0.3,0.9,0.5,1.9,0.8,3.3c-17.1,9.1-29.1,23.8-42.1,37.2
		c-11.5,11.9-25.6,19.9-38.7,29.4c-7.5,5.4-15.8,9.6-22.9,15.4c-6.1,5-13,4.6-19.7,5.1c-10.6,0.9-21.2,0.9-31.8,1.1
		C1123.1,1181.1,1112.8,1181.1,1103.8,1174.3z"/>
        </g>
        <%--    은평구22--%>
        <g>
            <path class="st8 gu22" lon="126.9312" lat="37.5999" gu="22" d="M1112.7,291.4c1.8-0.9,3.7-1.9,6.1-3.1c2.3-2.3,4-4.3,5.7-6.4c0.3-0.1,0.6-0.3,1.2-0.8c2.9-4.4,5.1-8.7,8-12.5
		c1.2-1.6,3.5-2.7,5.6-3.3c1.6-0.4,3.5,0.4,5.3,0.7c0,0,0,0,0,0.4c3.4,3.4,6.8,6.4,10.4,9.6c2.4,1.8,4.5,3.4,6.9,5
		c0.2,0.1,0.7,0.2,0.7,0.4c0.4,0.6,0.7,1,1.2,1.7c1.7,1.7,3.3,3.2,5.2,4.8c1.9,2,3.5,4,5.3,5.7c6.7,6.2,13.5,12.3,20.3,18.4
		c4.5,4,6.3,9,6.2,15.1c-0.2,11.3-0.3,22.7,0,34c0.1,5.1-1.8,8.1-6.1,10.3c-8.6,4.5-15.2,11.1-21.9,18.2c-14.7,15.6-18,34.1-18.1,54
		c-0.1,11.3,0,22.7,0,34c0,5.1-0.9,5.7-6,4.8c-1.4-0.2-3.1-0.3-4.3,0.2c-13.8,5.9-23.1,15.5-25.9,30.8c-0.4,2-2.4,4.4-4.3,5.3
		c-6.9,3.1-14,5.8-21.1,8.4c-3.5,1.3-5.4,2.7-5.6,7c-0.3,8.9-8.1,15.7-17,15.8c-11.5,0.2-22.9,0.6-34.4,0.9c-1.3,0-2.9,0.2-3.7,1
		c-9.1,8.8-20.1,16.4-18.9,31.4c0.1,1.2-1.9,2.5-3.3,3.7c-0.7-0.2-1.2-0.3-1.7-0.6c-0.7-0.7-1.3-1.2-2-1.9
		c-8.3-6.5-16.7-12.5-24.6-19c-2.9-2.4-5.3-5.6-7.5-8.8c-2.9-4.3-4.1-10.6-11.7-8.9c-0.9,0.2-2.7-1.2-3.4-2.3
		c-2.7-4.4-5.2-9.1-7.7-13.6c0.2-0.4,0.4-0.8,0.7-1.3c2.4,0.6,4.9,0.9,7.1,1.7c10.4,3.9,20.5,6.3,31.7,1.7
		c13.5-5.5,20.5-15.6,22.2-29.2c1.3-10.4,0.3-21,0.3-31.6c0-16.5-0.1-33,0-49.5c0-1.7,0.5-3.8,1.6-5c4.9-5.7,8.5-12.1,9.3-19.5
		c1.7-17,2.6-34,4.1-51c1.2-14.2,2.7-28.3,4.1-42.4c0,0,0.4-0.1,1.1-0.1c6.9,0.3,13.2,0.7,19.4,0.8c1.1,0,2.3-0.7,3.5-1.1
		c1.7,0.1,3.4,0.2,5.9,0.4c3.9-0.2,7-0.4,10.1-0.7c2.4-1,4.8-2.1,7.9-3.3c1.1-1.1,1.7-2,2.5-3c2.4-1.5,4.5-2.9,7-4.2
		c6.5-0.3,12.5-0.6,18.9-0.9C1110.4,293.1,1111.6,292.2,1112.7,291.4z"/>
            <path class="st9 gu22 sd22" lon="126.9312" lat="37.5999" gu="22" d="M1223.6,364.5c-0.6,1-1.2,1.4-2.2,2.2c-1.3,0.3-2,0.3-3.2,0.3c-4.4,0.3-8.4,0.7-12.3,0.7
		c-0.9,0-2.6-1.5-2.6-2.4c0-12.8,0.3-25.6,0.5-38.4c0.1-6.9-2.1-13-7.4-17.8c-6.1-5.6-12.3-11.1-18.6-16.5c-2.5-2.1-5.3-3.8-8.1-6
		c-2.1-1.4-4-2.5-6-3.6c-0.3-0.4-0.7-0.8-1-1.6c-0.3-0.4-0.6-0.3-0.9-0.3c-2.2-1.6-4.4-3.1-6.7-5.3c-2-5.4-5.4-8.4-10.3-9.6
		c0,0,0,0-0.1-0.3c-2.3-1.5-4.5-2.6-6.7-3.8c2.2-0.8,4.5-2.5,6.5-2.1c9.1,1.6,15.6,8,22.3,13.6c14.1,11.6,27.9,23.5,41.6,35.6
		c5,4.4,9.5,9.6,13.6,14.8c4.8,6.2,2.8,13.8,2.9,20.8C1224.5,351.1,1223.9,357.6,1223.6,364.5z"/>
        </g>
        <%--    서초구15--%>
        <g>
            <path class="st10 gu15" lon="127.0348" lat="37.4807" gu="15" d="M1294.3,1095c-0.3-0.8-0.5-1.6-0.9-3.1c-1.3-5-2.3-9.3-3.6-13.5c-0.9-2.8-2.7-2.8-5.1-1.4
		c-4,2.3-8.2,4.2-12.2,6.4c-3.1,1.7-4.7,0.5-6.1-2.4c-7.7-15.7-15.7-31.3-23.3-47c-2-4.1-4-8.5-4.6-12.9c-1.1-8.4,1.5-17.3-3-25.4
		c-0.5-0.9-0.3-2.3-0.2-3.5c1-7.5,1.8-15.1,3-22.5c1.6-9.9,3.9-19.8,5.3-29.7c1-7.2,4.4-14.4,0.6-21.8c-2.6-5.1-5.1-10.4-7.9-15.4
		c-0.7-1.2-2.3-2.5-3.6-2.8c-3.4-0.7-6.9-1-10.3-1.1c-7.3-0.2-8.2-0.7-9.9-7.6c-0.5-2.1-0.8-4.2-1.1-6.5c0-0.2,0-0.6,0.5-0.7
		c11.2-0.1,21.9-0.1,32.8,0.1c4.3,0.9,8,0.7,11-3.1c0.8-0.1,1.2-0.2,1.9,0c0.7-0.3,1.2-0.8,1.9-1.3c0.2-0.1,0.7-0.1,1.1-0.1
		c1.8-0.9,3.2-1.9,4.7-2.9c0,0,0,0,0.4,0c5-3.3,10-6.2,14.1-10.1c14.2-13.2,28.1-26.7,42.2-40c0.9-0.9,2.2-1.3,3.6-1.8
		c10.6,13.5,17.8,28.4,18.4,45.3c0.4,11.1,3.6,19.8,12.6,26.4c0.8,0.6,1.5,1.3,2.1,2.1c0.6,0.9,1.4,2,1.5,3c0.8,8.2,1.5,16.5,2,24.7
		c0.5,7.8,0.6,15.6,1.2,23.4c0.1,1.8,1.4,3.6,2.6,5c4.2,4.7,8.3,9.5,12.9,13.9c3.9,3.7,7.8,8,12.5,10c15.4,6.5,15.6,6.1,26.8,19.6
		c1.1,1.3,1.7,3.1,2,4.8c1,6.5,1.7,13.1,2.6,19.6c0.5,3.9,0.6,8,1.7,11.8c2,7.5,4.7,14.7,6.9,22.1c1.9,6.4,4.1,7,10.5,4.8
		c7.6-2.5,15.5-4.5,23.4-5.6c8.7-1.1,17-1.5,20.1-12.1c2.8-9.6,11.4-12.5,19.9-13.9c7.8-1.3,15.9-1,23.8-1.1
		c3.9,0,11.9,7.8,11.8,10.8c-0.2,5.1-0.4,10.3-0.5,15.4c0,2.1-0.5,5,0.6,6.3c4.9,5.6,10,11.1,15.6,15.9c5,4.3,12.1,5.8,14.9,13
		c2.1,5.6,5.4,10.7,8.5,16.6c-7.5,1.6-10.9,6-12.6,12c-1.3,4.9-2.1,9.9-3.6,14.8c-1.6,5.4-5.5,8-11.1,8.2c-6.2,0.2-8.6,2.1-10.4,7.8
		c-2,6.3-5.9,11.2-12.4,13.1c-5.3,1.6-10.7,3-16.2,4c-9.7,1.8-17.4,5.9-19.9,16.2c-1.2,4.8-1.9,9.7-2.4,14.6
		c-0.6,5.6-3.4,10-7.5,10.3c-20.4,1.5-39.7-1.2-56.8-13.5c-4-2.9-8.5-5-12.8-7.5c-1.1-0.6-2.2-1.2-3.7-2.3c-2.3-1.9-4.3-3.3-6.3-4.7
		c-1.2-0.8-2.4-1.6-3.9-3.1c-1.2-5.4-2.2-10.1-3.2-14.9c0-1.4,0-2.7,0-5c-1-5.6-2-10.3-3-15c0-1,0-2.1,0-4
		c-1.3-5.2-2.6-9.7-3.9-14.1c0-1.1,0-2.1,0.2-3.8c-0.6-5.1-1.5-9.6-2.4-14.1c-0.3-1.4-0.6-2.8-0.6-4.9c-0.6-4.8-1.5-8.9-2.4-13.1
		c-0.3-1.1-0.6-2.2-0.6-3.9c1.2-8.8-0.9-12.4-8.1-13.7c-7.9-1.5-15.6,0.1-22.6,3.7c-12.4,6.3-20.9,17-29.4,27.6
		c-4.3,5.4-9.5,6.9-16.2,6.1c-4.6-0.6-7.5-3.7-11.1-5.7c-0.3-1.1-0.7-2.2-1.1-4C1295.5,1096.5,1294.9,1095.7,1294.3,1095z"/>
            <path class="st6 gu15 sd15" lon="127.0348" lat="37.4807" gu="15" d="M1590,1121.8c-1.2,2.2-1.7,4.9-2.4,7.4c-1.6,6-3.4,12-6.2,17.4c-2.4,4.8-8.1,4.4-12.7,5.6
		c-1.9,0.5-4.4,2.1-4.9,3.8c-4.2,13-14.4,17.8-26.6,20.1c-4.2,0.8-8.5,1.3-12.5,2.6c-8,2.7-10,10.1-11.9,17.1
		c-0.8,3-0.8,6.2-1.1,9.3c-0.7,8-5.2,12.5-13.1,12.9c-15.7,0.7-31.1-1.1-46.4-6.4c1-0.8,2.4-1.5,3.7-1.5c7.5,0.2,14.9,1.2,22.3,0.7
		c8.3-0.5,11.2-1.2,12.6-10.7c0.7-4.9,1.5-9.8,2.6-14.6c1.9-8.1,6.5-13.5,15.1-15c4.4-0.7,8.8-1.6,13.1-2.5
		c9.8-2.1,16.7-7.7,20.4-17c1.5-3.8,3.3-5.9,7.8-6.1c6.5-0.3,11.9-2.9,13.9-9.9c0.9-3.3,1.9-6.6,2.9-9.9c1.6-5.9,1.4-13,9.4-14.7
		c1.4-0.3,2.7-0.6,4.1-0.9"/>
            <path class="st11 gu15 sd15" lon="127.0348" lat="37.4807" gu="15" d="M1379.6,1080.9c-13.2,4.9-23.4,13.8-31.1,25.1c-5.4,7.9-12.7,8.9-20.6,8.7c-5.8-0.1-11.6-1.8-17.6-3
		c6.1-2.3,11.6-5.4,15.8-10.7c4-5,8.1-10,12.7-14.6c9-8.9,19.5-14.6,32.8-13.6C1377.6,1073.4,1379.1,1074.5,1379.6,1080.9z"/>
        </g>
        <%--    강서구 4--%>
        <g>
            <path class="st12 gu4" lon="126.8516" lat="37.5481" gu="4" d="M679.7,764c-3.3-18.2-13.9-30-31.3-36c-8.7-3-17.3-6.5-26-9.9c-5.7-2.3-8.6-5.9-9.2-12.7
		c-0.6-6.1-3.9-11.9-5.9-17.8c-3.2-9.4-2.1-12.7,6.7-17.3c7.7-4,8.1-11.5,9.5-18.5c1-5,1.9-10.1,3-15.1c2.9-13,11.5-19.9,24.2-22.8
		c9.4-2.1,13.4-8.1,14-17.7c0.5-7.7,1.4-15.5,3.5-22.9c2.3-8,8.2-14.1,15.1-18.5c5.5-3.5,7.6-8.5,8.2-14.4
		c1.2-10.8-1.5-21.1-4.4-31.3c-3.1-10.8-0.1-18.1,7.7-22.9c1.3-0.3,2-0.2,2.8,0.1c1,1.1,2,1.9,3.4,2.6c1.2,0,2-0.1,2.7-0.1
		c0,0,0,0,0,0.4c7,5.1,14,10,21.1,14.6c3.1,2,7.7,2.4,6.4,7.6c1.9-0.4,4-1.5,4.8-0.9c6.9,4.8,13.8,9.7,20.2,15.2
		c2.6,2.2,3.6,6.1,5.8,8.8c2.9,3.7,6.3,7,9.5,10.5c4.4,4.8,8.6,9.8,13.2,14.5c1.1,1.1,3.3,1,4.9,1.5c-0.1,0.1,0-0.1,0,0.3
		c3.8,4.8,7.5,9.3,11.4,13.6c0.7,0.8,2.4,0.7,3.6,1.1c0,0.1,0-0.1,0,0.3c1.5,5.3,3,10.3,9,11.7c-0.1,0.1,0-0.1,0,0.3
		c-0.8,4.2,1.5,6.5,4.2,8.2c4.7,3.1,9.7,5.7,14.4,8.7c11.2,7.1,22.3,14.4,33.5,21.6c0.5,0.3,1.3,0.1,1.9,0.2c-0.1,0.1,0-0.1,0,0.3
		c0.5,1.5,0.8,2.9,1.6,3.8c8,8.5,13.5,18.4,18,29.1c0.5,1.1,1.7,1.9,2.6,2.8c3.6,3.3,7.1,6.7,10.9,9.7c2.7,2.1,6,3.5,8.9,5.3
		c-0.1,0.1,0.1-0.1,0,0.3c0.9,1.8,1.6,3.5,2.9,4.6c4.6,4.3,9.3,8.3,13.9,12.6c0.6,0.6,1.1,1.8,1.1,2.7c0.1,4.5,0.4,9.1-0.2,13.5
		c-0.2,1.6-2.6,3.9-4.3,4.2c-8.3,1.5-16.3,1.2-23.3-4.9c-2.6-2.2-5.3-1.2-7,1.8c-0.9,1.6-1.8,3.1-2.9,4.6
		c-3.7,4.9-5.3,10.2-5.5,16.6c-0.3,9.6,0.9,19.8-6.5,27.8c-1.4,1.5-2.3,3.6-3.2,5.5c-5.3,12.4-16.7,15.4-28.1,17.5
		c-8.7,1.6-16.6-3-24.5-6.4c-6.5-2.8-10.9-7.1-13.4-13.6c-4.4-11.2-8.4-22.6-13.6-33.4c-3.6-7.4-8.8-14.4-19.2-12.4
		c-1.9,0.4-4,0.1-6,0c-4.6-0.2-7.3,1.8-9.2,6c-2.9,6.5-6.4,12.7-9.7,19.1c-4.3-1.1-8.2-2.8-12.2-3c-5.5-0.3-11.2-0.1-16.6,1
		c-5.2,1-11,2.3-15.1,5.4c-6.4,4.9-11.8,11.1-17.1,17.2c-2.5,2.8-4.5,2.8-7.2,0.8C681.8,765,680.7,764.6,679.7,764z"/>
            <path class="st6 gu4 sd4" lon="126.8516" lat="37.5481" gu="4" d="M684.7,772.3c7.7-3.4,11.2-11,16.6-16.6c10.3-10.7,22.7-13.5,36.8-11c4.6,0.9,9.2,2.1,13.8,3.3
		c0.7,0.2,1.1,1.4,1.7,2.5c-11.5-0.6-21.7,2.3-30,10.5c-2.8,2.8-6,5.5-7.8,8.9C711,778.8,691.3,780.2,684.7,772.3z"/>
        </g>
        <%--    도봉구10--%>
        <g>
            <path class="st13 gu10" lon="127.0495" lat="37.6658" gu="10" d="M1330.7,156c0.3-1.1,0.6-2.2,1.2-3.9c0.8-3.1,1.4-5.7,1.7-8.2c0.8-6.4,0.3-13.2,2.5-19.1
		c4.4-11.8,14.1-17.7,26.5-18.7c8.3-0.7,16.6-1.2,24.8-1c11.7,0.3,15.4,3.5,18.3,14.6c2.3,8.8,4.9,10.8,12.4,8.3
		c2.1,0,3.8,0,5.6,0.4c6,2.1,11.8,3.9,17.8,5.4c6.2,1.6,12.4,2.7,18.6,4.4c1.1,0.3,2.5,2.1,2.5,3.2c0.2,11.3,0.1,22.7,0.1,34
		c0,1.1-0.5,2.3-0.9,3.3c-1.6,4.4-3.2,8.8-5,13.2c-1.2,3.1-3.5,5.9-4,9c-1.1,7.3-1.5,14.7-2.2,22.1c-0.1,1.5-0.6,2.9-0.7,4.4
		c-0.2,2.4-0.8,5-0.1,7.1c1.7,4.7,4.3,9,6.1,13.6c2.4,6.1,5.4,12.1,6.4,18.5c1.1,6.8,1.6,14.4-0.1,20.9c-3.4,12.4-2,24.8-2.7,37.2
		c-0.2,3.9-1.4,7.7-2.4,11.5c-1.4,5.2-3.5,10.3-4.4,15.5c-1.2,6.8-1.5,13.7-2.1,20.6c-0.4,3.9-3.8,6.9-7.6,7.9
		c-8,2-12.9-3.3-17.5-7.8c-6.5-6.4-11.9-13.8-17.8-20.8c-4-4.8-8.1-9.7-11.9-14.7c-5.5-7.3-10.4-14.9-16-22c-3.7-4.7-8.7-7.1-15.2-7
		c-3.8,0.1-8.7-1-11.4-3.4c-8.3-7.4-15.5-16-23.6-23.6c-4.3-4.1-5-8.7-4.3-13.9c0.8-5.8,2.9-11.5,3.2-17.4
		c0.4-7.4-0.8-14.9-0.7-22.4c0.1-3.5,2-6.9,2.3-10.5c0.5-7.8,1.3-15.8,0.4-23.6c-1-8.8-4-17.3-5.6-26c-0.3-1.5,1.8-4.5,3.3-4.9
		C1332.2,161,1332.4,159.1,1330.7,156z"/>
            <path class="st14 gu10 sd10" lon="127.0495" lat="37.6658" gu="10" d="M1417.6,128c-7,2.5-9.7,0.5-11.9-8.3c-2.8-11.1-6.6-14.3-18.3-14.6c-8.3-0.2-16.6,0.3-24.8,1
		c-12.4,1.1-22.1,6.9-26.5,18.7c-2.2,5.9-1.7,12.7-2.5,19.1c-0.3,2.6-0.9,5.1-1.7,7.9c-0.1-7.6-0.6-15.5,0.7-23.1
		c1-5.6,3.9-11.1,7-16c3.6-5.7,10.1-8,16.3-8.4c15-0.9,30.1-0.7,45.5-0.3c6.8,6.1,7.4,14.3,9.5,20.6
		C1413.7,126,1415.6,127,1417.6,128z"/>
            <path class="st9 gu10 sd10" lon="127.0495" lat="37.6658" gu="10" d="M1418,128c-2.4-1-4.4-2-7-3.3c-2.2-6.3-2.7-14.5-9.2-20.3c11.7,1,20.2,7.4,26.5,17.1c1,1.5,1.5,3.2,2.3,5.1
		c-2.1,0.7-4.1,1-6.6,1.4C1421.9,128,1420.2,128,1418,128z"/>
        </g>

        <%--    마포구13--%>
        <path class="st22 gu13" lon="126.9105" lat="37.5607" gu="13" d="M1006.2,587c0.5,0.4,0.7,0.6,1.1,0.9c2,1.7,3.9,3.2,5.5,4.9c8,8.4,15.7,17.1,23.9,25.3c5.2,5.3,11,10,16.6,15
	c8.8,7.8,17.6,15.6,26.3,23.4c5.3,4.8,9.9,10.6,15.8,14.3c4.3,2.7,10.2,3.3,15.5,4c12.6,1.6,25.3,2.3,37.9,4.1
	c9.2,1.4,15.1-3,20.8-9.5c4,9.5,7.5,19.1,10.9,28.7c0.9,2.5,1.8,5.5,1.2,7.9c-1.1,5-3.7,9.6-4.9,14.6c-3,12.3-9.7,22-18.9,30.7
	c-11.7,11-22.4,23.1-33.6,34.7c-1.3-0.9-2.9-1.7-3.9-2.9c-14-16.1-32.6-24.2-52-31.6c-16.4-6.4-32.4-14.1-48.3-21.7
	c-10.7-5.1-21.2-10.7-31.4-16.9c-6-3.6-11.4-8.5-16.7-13.2c-11.4-10.1-22.6-20.5-34-30.8c-8.5-7.7-17.2-15.1-25.6-22.9
	c-2.5-2.3-4.2-5.5-6-8.4c-3.3-5.4-6.4-10.8-9.8-16.9c-2.5-3.1-4.8-5.5-7.1-7.9c0,0,0,0-0.1-0.4c-2-2.5-3.9-4.6-5.9-6.6
	c-0.7-0.8-1.4-1.5-2.1-2.9c-2-1.8-4-3-5.9-4.1c-0.6-0.2-1.1-0.4-1.9-1.1c-1.2-1-2.1-1.5-3.1-1.9c-0.6-0.2-1.2-0.4-1.9-0.8
	c-1.7-1.8-3.2-3.3-5.5-5.7c6.5-4.1,12.7-8.9,19.5-12.2c8.8-4.2,18.2-6.3,28.2-6.4c7.9-0.1,11.5-7.2,15.8-12.4
	c3.5-4.2,6.6-8.6,9.8-13c2-2.8,3.7-5.8,5.8-8.6c3-3.9,5-3.7,7.5,0.6c2,3.4,3.6,7.1,6.2,10c1.9,2.1,5,3.1,7.6,4.5
	c1.3,0.7,3.7,0.8,4.1,1.9c5.1,12,15.9,18.2,25.8,25.1C997.6,581.8,1001.8,584.3,1006.2,587z"/>
        <%--    용산구21--%>
        <path class="st23 gu21" lon="126.9675" lat="37.5360" gu="21" d="M1124.5,786.5c11.1-11.9,21.7-24.1,33.5-35c9.3-8.7,15.9-18.3,18.9-30.7c1.2-5,3.7-9.6,4.9-14.6
	c0.6-2.4-0.3-5.4-1.2-7.9c-3.3-9.7-6.9-19.2-10.7-29c-0.3-1-0.3-1.7-0.1-2.9c0.2-0.4,0.6-0.4,1-0.4c1.2,0.1,2,0.1,2.8,0.5
	c0.3,1.7,0.4,3,0.8,4.2c2.6,7.8,5.5,15.5,7.9,23.3c2.3,7.5,2.3,7.7,9.7,7.1c2.1-0.2,4.3,0,6.5,0c5,0,10,0.1,14.9-0.2
	c12.8-0.8,25.7-1.9,38.5-2.7c1.6-0.1,3.6,0.8,4.8,1.8c4.1,3.4,7.7,7.3,11.9,10.6c1.6,1.3,4,2.3,6.1,2.4c8.5,0.3,17-0.1,25.4,0.2
	c2.8,0.1,5.7,1.2,8.3,2.4c4.4,2,8.7,4.3,12.9,6.8c-0.6,1.3-1.6,2.4-1.4,3.3c1.5,6.9,3.1,13.7,4.8,20.5c1.8,7.3,3.6,14.6,5.8,21.8
	c0.9,3,0.7,7.2,5.1,8.2c-5.6,4.9-11.1,9.7-16.7,14.6c-2.2,2-4.5,3.9-6.6,6c-19.2,18.4-38.4,36.9-57.5,55.3c-6.4,6.2-14.6,7.6-23,7.8
	c-9.4,0.3-18.9,0.4-28.3-0.1c-3.4-0.2-7.4-1.8-9.9-4.1c-22.9-22.2-45.6-44.7-68.3-67.1C1125.1,788,1124.9,787.4,1124.5,786.5z"/>
        <%--    광진구6--%>
        <g>
            <path class="st6 gu6 sd6" lon="127.0651" lat="37.5340" gu="6" d="M1610.3,622.2l19.3-1.7c0,0.2,0,0.3,0.1,0.5c1.6,11.2,0.7,21.7-5.9,31.4c-4.4,6.5-4.9,16.9,2.4,23.8
		c0.4,1.2,0.4,2,0.4,2.7c-0.3,0.3-0.5,0.5-1.3,1c-5.2,1.2-9.8,2.8-14.5,2.8c-2,0-5-2.5-6-4.6c-1.6-3.3-2.1-7.3-2.7-11
		c-1.2-8.3-2.2-16.2,2.6-24.3c3.4-5.7,3.9-13.1,5.7-20.2C1610.4,622.5,1610.3,622.3,1610.3,622.2"/>
            <path class="st24 gu6" lon="127.0651" lat="37.5340" gu="6" d="M1620.8,687.5c0,0,0.1,0.2-0.2,0.5c-0.5,0.6-0.7,0.9-0.9,1.3c-1.9,8.3-4.2,16.6-5.6,25
		c-3.1,18.9-13.3,34.7-22.7,50.7c-5.3,9.1-13.2,16.6-20,24.8c-3.5,4.2-7,8.4-10.6,12.6c-3.9,4.6-9,6.5-15,6.7
		c-12,0.5-24,2.3-35.8,1.5c-16.4-1-32.6-3.8-45.4-16.2c1.1-4.9,2.7-9,2.9-13.2c0.8-15.8,7.5-29,17.3-41.1c2.9-3.6,6-7.5,7.3-11.7
		c2.8-9,4.3-18.3,6.6-27.4c0.7-2.8,2.5-5.4,4.2-8.1c2.3-1.7,2.4-3-0.3-4.2c0-1.8,0-3.2,0.3-4.9c0.4-1.7,0.6-3.3,0.7-5
		c-0.3-0.5-0.6-0.7-1-1.1c-0.4-1-0.7-1.7-1.3-2.9c4.4,1,6.6-1,7.2-5.2c0-0.7,0-1.1,0.3-1.8c0.5-1.1,0.6-1.9,0.8-3.1
		c0-0.2,0.1-0.7,0.4-0.8c0.7-0.7,1.1-1.4,1.5-2.4c0-0.7,0-1.1,0.3-1.8c0.5-1.4,0.7-2.6,1-4.1c0.4-1.4,0.7-2.6,1.3-3.8
		c1.4-2.1,2.4-4.1,3.4-6.4c0-0.7,0-1.1,0.3-1.8c0.4-1.1,0.6-1.9,0.8-2.8c0,0,0,0,0.4,0c2.5,0,4-0.4,3.3-3.2c-1.3-5.2,0-6.8,5.4-6.8
		c9.8,0,19.6,0.2,29.4-0.1c3-0.1,6.1-1.3,8.7-2.7c6.4-3.4,12.5-7.3,20.4-6.2c6.8,0.9,13.6,1.4,20.5,2.5c-0.8,4.8-1,9.4-2.6,13.5
		c-2.6,6.9-7.9,12.9-6.4,20.9c1,5.5,2.2,11,3.6,16.4c2.7,9.7,2.8,9.7,13,9.7c1.3,0,2.8-0.3,4,0.1
		C1619.2,685.5,1620,686.7,1620.8,687.5z"/>
        </g>
        <%--    성동구16--%>
        <path class="st25 gu16" lon="127.0368" lat="37.5634" gu="16" d="M1502.6,692.9c-1.3,2.7-3.1,5.2-3.8,8.1c-2.3,9.1-3.8,18.4-6.6,27.4c-1.3,4.3-4.4,8.2-7.3,11.7
	c-9.8,12-16.5,25.2-17.3,41.1c-0.2,4.2-1.8,8.3-3,12.9c-5.4-2-10.8-4.1-15.8-6.9c-14.3-7.9-29.1-14.5-45.4-16.5
	c-13.8-1.6-27.5-2.7-41.6-1.1c-8.7,1-16.7,3.9-25.5,5.5c-2.8-9.2-5.1-18-7.4-26.8c-1.7-6.5-3.5-13-5-19.5c-0.4-1.6,0.2-3.6,0.8-5.2
	c2.2-5.3,5-10.4,7-15.8c3.3-8.5,8.1-15.5,15.5-21.2c8.7-6.7,14-16.1,17.8-26.6c1-0.5,1.7-1.1,2.4-1.6c-0.9-0.5-1.9-0.9-2.8-1.9
	c0-5.5,0-10.5,0.3-15.6c3.7-1.9,5,1,6.8,2.7c5,4.9,9.7,3.9,13.3-2.6c1.5,0,2.5,0,3.8,0.2c1.1-0.6,1.9-1.4,2.8-2.5
	c0-0.2,0-0.7,0.4-0.8c4.1-1.8,5.9-4.8,6.1-8.9c3.5,0,6.5,0,9.5,0.4c0.5,3.7,1.8,6.3,5.7,5.4c3.1-0.7,6.2-1.9,9.7-2.8
	c2.5,0,4.5,0,6.6,0.4c1,1.1,2,1.8,3,2.9c0,0.8,0,1.2,0,2.1c1,3.8,2.4,7.1,2.9,10.5c0.6,4.5,2.6,7.2,7.1,8.1c0,0,0,0,0.1,0.4
	c1,3.2,2.4,5.4,6.4,3.6c1.5,0,2.5,0,3.6,0.4c0.8,1.8,1.6,3.1,2.4,4.5c0.9-1,1.8-1.9,3-2.9c0.8,0,1.2,0,1.7,0.4
	c2.5,2,4.8,4.4,7.6,5.2c5.3,1.6,10.9,2.3,16.8,3.4c1.1,0,1.9,0,2.6,0.4c0.5,5.5,1.1,5.7,6.3,2.6c0.8,0,1.2,0,1.7,0.4
	c0.6,1.3,1,2.8,1.7,3c2,0.5,4.2,0.4,6.3,0.5c0.3,0.1,0.6,0.3,0.6,1c-0.3,2-0.5,3.5-0.7,5c0,1.4,0,2.8,0,5
	C1502.6,690.8,1502.6,691.9,1502.6,692.9z"/>
        <%--    영등포구20--%>
        <g>
            <path class="st26 gu20" lon="126.8983" lat="37.5236" gu="20" d="M1078.6,837.9c-4.9,7.9-9.9,15.5-14.9,23.1c-6.4,10-10.1,21.2-9.8,32.9c0.4,12-2.6,22.8-8.9,32.5
		c-1.9,2.9-6.7,4.1-10.4,5.6c-7.6,3-16.4,1.9-23.4,7.3c-6.8,5.2-11.2,11.3-10.8,20.5c0.2,3.9-1.1,7.9-2.2,11.7
		c-0.9,3.3-4.8,4.3-8.2,2.2c-4.5-2.7-9.1-5.4-13.2-8.7c-1.5-1.2-2.2-4-2.2-6.1c-0.2-11.2,0-22.3-0.2-33.5c0-1.9-0.7-4.9-2.1-5.6
		c-8.5-4.8-8.4-13.3-9.9-21.2c-1.7-8.9-2.6-18.1-5.6-26.6c-1.3-3.6-6.6-6.1-10.4-8.6c-3.5-2.4-7.5-4.2-11.2-6.4
		c-3.2-1.9-4.9-4.4-4.9-8.5c0.2-15.2,0-30.3,0.2-45.5c0-2.2,1.4-5,3.1-6.5c4.9-4.4,10-8.9,15.7-12.2c5.1-3,5-6.9,5-11.7
		c0-14.2-8.1-25.2-14-37.1c-4.5-9.3-11.3-17.8-9.9-29.2c0.3-2.5,0.6-4.9,0.9-7.8c3.3,2,6.8,4.2,9.8,6.9c8.5,7.6,16.6,15.8,25.5,23.1
		c5.5,4.5,11.9,7.7,18.1,11.2c9.3,5.2,18.5,10.3,28.1,14.9c9.3,4.5,18.9,8.5,28.4,12.5c4.9,2,7.5,4.6,7.4,10.6
		C1048.4,802.6,1059.1,822.3,1078.6,837.9z"/>
            <path class="st27 gu20" lon="126.8983" lat="37.5236" gu="20" d="M1112.3,809.3c5.7,5.5,11.2,10.8,17.1,16.5c-1.7,1.1-2.5,2.1-3.3,2.1c-8.1,0-16.3,0-24.4-0.4
		c-10.1-0.5-16.8-7.1-23-14c-7.3-8-9.8-18.2-11.9-28.4c-0.4-1.7,0.3-4.9,1.3-5.3c1.9-0.7,4.4-0.1,6.4,0.6
		C1090.3,785.5,1100.9,797.7,1112.3,809.3z"/>
        </g>

        <%--노원구9--%>
        <g>
            <path class="st6 gu9 sd9" lon="127.0583" lat="37.6514" gu="9" d="M1623.7,424.7c-0.2-0.4-0.3-0.7-0.5-1c-5.8-11-4.4-14.3,6.7-20.6c4.9-2.8,9.7-6.6,13.2-11
		c4.9-6.1,4.1-13.8,2.3-21c-1.3-5.3-3.6-10.3-4.9-15.5c-2.3-9.5-4.1-19-6.2-28.5c5.8,1.8,12,2.9,17.4,5.5c5.3,2.6,5.3,8.9,6.5,13.9
		c1.2,4.8,1.5,9.8,2.7,14.6c1.7,6.9,3.9,13.6,5.7,20.5c2.5,9.5-2.2,20.3-10.6,25.2c-3.3,1.9-6.6,3.7-10,5.6
		c-3.3,1.8-5.2,4.8-5.6,8.2"/>
            <path class="st6 gu9 sd9" lon="127.0583" lat="37.6514" gu="9" d="M1608.6,316.6c-4.1,0.1-8.3-0.1-12.4-0.7c-4.3-0.6-8.7-6-8.6-10.9c0.4-11.1,1.2-22.2,1.8-33.2
		c0.1-1.3,0.2-2.7,0.1-4c-0.6-6.8,2.7-11.3,8.4-14.5c5.1-2.9,8.3-6.9,7.7-13.3c-0.6-6.8,0.2-13.8-1.4-20.3c-1.3-5.4-5-10.2-7.9-15.1
		c-1-1.7-2.8-2.9-4.2-4.3c-7.5-7.6-7.5-14.3-0.2-22.2c5.6-6.1,9.6-13.1,10.4-21.5c0.5-5.7-2.6-10.1-6.7-14.2
		c6.8,2.5,14.3,4.6,20.7,8.4c6.3,3.7,8.6,13.1,4.4,20.8c-3,5.6-6.7,10.9-10.4,16.1c-4.5,6.3-3.9,16.4,2.3,20.7
		c9.8,6.9,12.7,16.8,13.9,27.9c0,0.2,0,0.3,0,0.5c1.2,10.5-0.2,19.7-10.6,25.6c-5.3,3-6.2,8.5-6.4,14.2c-0.4,9.3-1.4,18.5-1.8,27.8
		C1607.5,308.2,1608.3,312.2,1608.6,316.6z"/>
            <path class="st11 gu9 sd9" lon="127.0583" lat="37.6514" gu="9" d="M1585.4,135.8c-4.2-1-8.8-1.7-12.8-3.5c-12.2-5.6-23-13.6-33-22.5c-1.5-1.4-3.7-2.1-5.8-3.4
		c11.8,0.3,21.1,7,30.2,13.7C1571.1,125.2,1578.1,130.3,1585.4,135.8z"/>
            <path class="st30 gu9" lon="127.0583" lat="37.6514" gu="9" d="M1450.6,410.3c-0.3-1.4-0.3-2.7-0.8-3.5c-5-7.3-10.2-14.4-16.3-23c5.8,0,10-0.2,14.1,0.1
		c3.4,0.2,4.9-0.7,5-4.3c0.1-5.3,0.2-10.7,1.1-15.8c0.9-5.3,2.4-10.6,4.4-15.6c4.1-10.7,5.5-21.6,5.7-33.1
		c0.2-13.7,1.8-27.4,2.8-41.1c0.6-8-1.7-15.1-5-22.4c-6.2-13.9-10-28.1-4.7-43.6c3.7-10.7,6.2-21.9,9-32.8c0.6-2.2,0.6-4.6,0.6-6.9
		c0.1-9.8,0-19.6,0-29.4c13.4-2.1,22.3-11.5,32.7-18.1c5.6-3.5,11-7.3,16.8-10.4c8.4-4.5,17.1-2.8,24.2,3.7
		c10.7,9.8,23.1,17.2,36.1,23.6c4.9,2.4,10.7,3.3,15.4,6.1c10.2,5.9,8.4,14.8,4.4,23.1c-2.2,4.5-5.9,8.3-9.1,12.3
		c-4.6,5.7-4.3,17.1,2.2,22.8c10.1,8.9,13.5,19.4,13.9,32.6c0.2,8.2-1.9,12.9-8.3,17.3c-6.2,4.2-9.2,10.5-9.3,18.3
		c-0.1,11-0.7,21.9-0.9,32.9c-0.2,10.4,5.4,15.5,15.8,16.3c6,0.5,12,2.2,17.9,3.8c4.3,1.2,9.2,1.1,12.4,5.5c4.4,6.1,4.6,13.1,6,20
		c1.2,5.8,2.2,11.7,4.1,17.2c5.5,15.7,3.7,27-12.4,35.4c-5.4,2.8-11.5,5.3-11.1,12.9c0.2,3.2,1.4,6.3,1.9,9.8
		c-10.5,7.2-21.3,11.7-34,10.4c-6.4-0.6-13.1,0.8-19.4-0.3c-9.9-1.7-17.3,3.8-25.4,7.2c-7.2,3-13.7,7.4-20.8,10.7
		c-3.4,1.6-7.3,2.2-11.4,3.3c-0.8,0-1.2,0-1.7,0.1c-0.4,0-0.9,0-1.9-0.3c-10.4-3.1-20.2-6-30-8.9c-0.7-1.4-1.4-2.8-2.1-4.9
		c-1.7-2.5-3.3-4.3-4.9-6c-1-1.4-1.9-2.9-3-5c-3.1-4.8-6-8.9-9-13C1453.9,414.9,1452.3,412.8,1450.6,410.3z"/>
        </g>
        <%--    종로구23--%>
        <path class="st31 gu23" lon="126.9816" lat="37.5703" gu="23" d="M1201.6,642c-0.4-0.3-0.9-0.9-1.2-0.7c-6.5,2.7-10-1.5-13.9-5.6c-4.9-5.2-9.8-10.4-15.2-15
	c-6.4-5.4-7-13.3-5.8-19.4c2.8-14,8.4-27.4,12.3-41.2c2.1-7.5,5.9-14.9,1.4-23.4c-2.4-4.6-2.8-10.4-3.6-15.8
	c-1.2-7.7-7.3-9.7-13.1-11.5c-4.1-1.3-5-3.1-4.6-7.2c0.7-6.3,0.6-12.8,0.7-19.2c0.1-15-0.4-30,0.2-45c0.3-8.4,2.1-16.7,3.8-24.9
	c1.9-9,9.9-14.2,14.2-21.8c5.7-10.2,16.1-14,25.2-19.5c3.8-2.3,9.3-2.1,14-2.5c1.1-0.1,2.6,1.7,3.7,2.8c3.8,3.9,7.5,7.9,11.6,12.2
	c0.7,0.8,1,1.3,1.3,1.8c6.1,25.9,12.5,51.6,23.1,76.1c4.9,11.4,5.6,23.5-1.3,34.8c-1.2,2-4,3.4-6.3,4.3c-13,4.7-11.3,3.4-11.3,16
	c0,7.6-1.9,7.5,7.5,10.8c7.9,2.7,15.7,4.5,24,5.4s16.3,5.1,24.4,8.2c1.3,0.5,2.2,2.5,2.9,3.9c6.4,13.3,12.6,26.7,19.3,39.9
	c2.5,5,6.2,9.4,9.8,14.5c1.3,0.9,2.3,1.3,3.2,1.7c5.4,0.3,10.7,0.7,16.8,1.4c2.5,0.4,4.4,0.5,6.2,0.6c2,0.1,4,0.1,6.7,0.4
	c1.5,0.4,2.4,0.5,3.3,0.6c0.4,0.1,0.8,0.1,1.5,0.7c0.1,2.9-0.2,5.4-0.2,7.9c0,3.5,0.3,7.1,0.5,11.1c0,2.1-0.1,3.8-0.5,5.5
	c-1.4,0.3-2.4,0.6-4,1c-16.1,0-31.8,0-47.8,0c-3.5,0.4-6.5,0.8-9.9,1.2c-0.8,0.3-1.3,0.6-2.1,0.9c-1.8,0.6-3.2,1.3-5,1.9
	c-0.8,0-1.2,0.1-2,0.1c-1.5,0.6-2.6,1.2-4,1.8c-0.7,0-1.1,0-2,0c-3.2,0.1-5.8,0.1-8.9,0.1c-1.8,0.3-3.2,0.6-5,0.9
	c-3.8,0-7.2,0-10.8-0.1c-0.7-0.4-1.2-0.7-1.8-1.2c-0.3-0.5-0.6-0.7-0.9-1.1c-0.3-0.7-0.7-1.2-1.1-1.9c-2.3-2.7-4-6.5-6.5-7.1
	c-12.9-3.1-22,4.1-30.5,12.5c0,0,0,0-0.4-0.1C1213.1,639.9,1207.3,640.9,1201.6,642z"/>
        <%--    동대문구11--%>
        <path class="st32 dongdaemungu gu11" lon="127.0421" lat="37.5716" gu="11" d="M1509.7,664c0,0,0,0.5-0.4,0.8c-0.5,1.3-0.6,2.2-0.8,3.2c0,0.4,0,0.8-0.4,1.6c-3.2,2.9-6.2,4.6-9.9,1.8
	c-0.3-0.2-1.1,0.3-2,0.5c-0.7,0-1.1-0.1-1.7-0.4c-3.8-1.7-7.4-3-11.4-4.4c-0.7-0.1-1.2-0.1-1.7-0.5c-1.1-0.7-2-1.1-3.4-1.5
	c-1.1,0-1.8-0.1-2.7-0.4c-2.1-1.1-4-1.8-6.2-2.6c-0.8,0-1.2,0-1.8-0.3c-2.4-1.1-4.6-1.9-7.2-2.7c-0.8,0-1.2,0-1.8-0.4
	c-2.1-1.1-4-1.8-6.3-2.6c-1.4-0.1-2.5-0.1-3.6-0.5c-2.6-3.2-6.5-5.2-6.4-10c0-0.9-1.7-1.7-2.6-2.9c0-0.8,0-1.2,0-2c-1-1.8-2-3.3-3-5
	c0-0.8-0.1-1.2-0.1-1.9c-0.6-0.8-1.2-1.3-2.1-1.8c-0.5,0-0.6,0-1,0c-0.2,0-0.5,0-0.6-0.3c-0.7-0.8-1.4-1.2-2.2-2.1
	c-7-1.4-13.9-2.5-20.8-3.4c-0.7-0.1-1.5,0.5-2.6,0.8c-1.4-0.3-2.5-0.6-3.9-1.1c-3.2-0.4-6.5-2.4-8.8,1.2c0,0,0,0-0.4,0.1
	c-2.4,3.4-4.4,6.7-6.6,10.3c-0.8,0.4-1.3,0.6-2.3,0.8c-6,0.2-11.5,0.5-15.1-5c-0.3-0.5-1.3-0.6-1.6-1c-1-1.4-2.7-2.9-2.7-4.5
	c-0.3-6.3-0.4-12.7,0-19c0.1-2.4,1.3-5.1,2.8-6.9c5.9-6.5,11.4-13.2,10.9-22.5c-0.3-5.4,3-7.2,6.7-9.1c0.9-0.4,1.9-0.5,2.7-1
	c10.1-5.7,20.2-11.3,30.2-17.1c2-1.2,4.5-2.9,5.2-5c3.1-8.7,6.5-17.1,12.9-23.9c5.1-5.5,9.9-11.1,17.6-13.5c3.6-1.1,6.6-4.2,9.9-6.3
	c0.4,0,0.8-0.1,1.9,0.2c5.1,1.2,9.1,0.7,12.1-3.2c0.4,0,0.9,0,1.9,0.2c2.9,0.3,5.3,0.8,7.5,0.3c6.2-1.2,12.3-2.8,18.8-4.3
	c0.3,2,0.6,3.1,0.6,4.2c0.1,8.2,0.6,16.2,2.5,24.4c2.5,11,2.5,22.6,3.5,33.9c1.1,12.6,2.1,25.3,3.2,37.9c0,0.5,0.4,0.9,0.5,1.4
	c3,14.1,4.1,28.3,1.3,42.7c0,0,0,0-0.3,0c-0.5,1-0.6,2-0.7,3c0,0.4,0,0.8-0.4,1.6c-1.4,2.4-2.4,4.4-3.4,6.4
	c-0.3,1.1-0.6,2.2-1.3,3.7c-0.6,1.7-0.8,2.9-0.9,4.2c0,0.4,0,0.8-0.4,1.6C1510.4,662.7,1510.1,663.4,1509.7,664z"/>

        <%--    중랑구25--%>
        <g>
            <path class="st6 gu25 sd25" lon="127.0947" lat="37.6038" gu="25" d="M1640.4,420.6c-0.5,3.9,1,8.4,4.3,12.5c4.1,5,9.7,7,15.5,9.2c3.3,1.2,6.7,3.9,8.4,6.9
		c3.6,6.4,5.8,13.6,9.1,20.3c4.9,10,3.2,19.6-3.1,27.5c-7,8.7-9.6,17.8-9.5,28.8c0.2,12.5-1.4,25.1-2.7,37.6
		c-1,9.8-7.1,17.3-12.7,24.8c-6.2,8.2-12.7,16-18.6,24.4c-1.4,2-1.8,5.3-1.5,7.9l-19.3,1.7c-0.6-1.9-1.2-3.6-1.9-5.6
		c0-1.5,0-2.5,0-4c0-2.2,0-3.9,0.1-5.9c0.4-0.7,0.6-1.2,1.1-1.8c0.5-0.3,0.7-0.6,0.8-1.3c0.4-1.7,0.7-3.1,1.3-4.5
		c0.2-0.1,0.6-0.1,0.9-0.1c0.5,0,0.6,0,1.1-0.1c0.4-0.7,0.6-1.3,0.9-2.1c2.7-3.4,5.3-6.5,8.1-9.8c0.5-0.3,0.7-0.6,0.9-1.2
		c3.7-4.8,7.3-9.2,11.1-13.9c0.4-0.7,0.6-1.3,0.9-2.1c0.7-1.1,1.3-1.9,2.1-2.9c0.4-0.7,0.6-1.3,0.7-1.9c0,0,0,0,0.3,0
		c0.8-0.7,1.2-1.3,1.6-2.2c0-1.1,0-1.9,0.3-3c0.4-1.8,0.6-3.3,0.7-5c0-0.2,0-0.7,0.4-0.8c0.8-3.4,1.2-6.6,1.6-10.3
		c0-1.8,0-3.2,0.3-4.9c0.4-11.8,0.6-23.2,0.7-35c0-0.2,0-0.7,0.3-0.8c0.8-0.7,1.2-1.3,1.6-2.3c2-3.4,4-6.5,6.3-9.8
		c0.4-0.7,0.6-1.3,0.9-2.1c0.7-0.8,1.3-1.2,2.1-1.9c0.4-1.1,0.6-1.9,0.8-3.2c0.7-1.8,1.3-3.2,2.3-4.9c0.1-3.8-0.1-7.2-0.3-11.1
		c-0.7-2.1-1.3-3.9-2-5.9c-0.3-1.1-0.7-1.9-1.1-3c-0.7-1.1-1.3-1.9-1.9-3c-0.3-0.8-0.7-1.2-1-1.7c0,0,0,0,0-0.3
		c-0.7-1.1-1.3-1.9-2.3-2.9c-0.5-10.5-5.7-15.9-15.7-18c-3.6-0.8-6.7-4.4-10.1-7.1c-0.2-0.4-0.4-0.8-0.5-1.1L1640.4,420.6z"/>
            <path class="st35 gu25" lon="127.0947" lat="37.6038" gu="25" d="M1607.5,613c-0.4,2.9-0.9,5.8-1.3,8.2c-5.2-0.4-10.3-0.6-15.3-1.3c-10.2-1.4-18.8,2.3-27.2,7.3
		c-1.7,1.1-4,1.7-6.1,1.7c-9,0.2-18,0-27,0.1c-3.1,0-4.9-0.5-5.3-4.2c-0.7-8.6-1.8-17.1-2.9-25.6c-1.5-11.8-3.1-23.6-4.5-35.4
		c-0.7-6.1-0.7-12.2-1.4-18.3c-2.7-21.9-6.2-43.7-5-65.9c0.3-5.6,0.3-11.3,1.2-16.9c0.3-2,2.4-4.3,4.3-5.3
		c8.7-4.6,17.8-8.4,26.3-13.4c9.7-5.7,20-6.8,30.9-6.1c4,0.3,8-0.3,12,0.1c10.5,1.1,20-1.9,28.9-7.1c4.2-2.4,8-3.3,11.8,1.4
		c1.6,2,5.2,2.5,8,3.5c5.2,1.9,10.4,3.3,11.1,10.3c0.3,2.4,2.5,4.5,4.2,7.2c1,2,1.6,3.5,2.3,4.9c5,10.1,6.6,19.4-0.9,29.9
		c-2.6,3.6-5.3,7.2-7.5,11c-0.8,1.3-0.4,3.2-0.5,5.3c0,6.7-0.1,13-0.5,19.5c-0.7,2.2-1.1,4.3-1.4,6.3c-0.3,2.9-0.6,5.9-0.7,8.8
		c-0.2,5.3-0.3,10.6-0.5,16.3c0,1,0,1.7-0.4,2.6c-6.3,12.3-14.1,23.1-23.5,32.9c-2,2.1-2.8,5.4-4.1,8.1c0,0-0.4,0.1-1,0.1
		c-2.5,2.3-5.8,4-4,8.4C1607.5,609.6,1607.5,611.3,1607.5,613z"/>
        </g>
        <%--    금천구8--%>
        <g>
            <path class="st9 gu8 sd8" lon="127.0495" lat="37.4491" gu="8" d="M974.6,1174.3c9.6,2.6,19.4,2.7,29.3,2.7c16.4,0.1,27.9-7.4,34.9-21.8c3.2-6.7,6.9-12.3,13.8-15.5
		c8.5-3.9,14.8-1.5,17.9,7.8c-5.1,3-8,7.4-10.1,12.6c-5.8,14-16.3,22.9-31.6,23.5c-13.7,0.5-27.5-0.5-41.1-2
		C983.2,1181.2,979,1177.1,974.6,1174.3z"/>
            <path class="st36 gu8" lon="127.0495" lat="37.4491" gu="8" d="M950.5,977c7.5,0.9,13-2.7,18.2-6.7c3-2.3,5.5-2.6,8.6-0.6c3.5,2.2,7.2,4.1,10.6,6.4c3,2.1,5.8,3.2,9.7,2.1
		c1.5-0.4,4,1.6,5.8,2.9c3.8,2.9,7,6.5,11,8.9c3.3,2,4.6,4.2,4.5,8c-0.3,7-0.6,14,0,21c1.5,17,4.1,33.9,5.1,50.8
		c0.6,10.3,4.5,18.8,9.7,27.1c1.3,2.1,3.9,4.5,6.1,4.8c6.2,0.9,9.5,3.7,11.1,9.9c1.8,6.9,1.3,13.2-0.8,19.9c-1.6,5.1-3.7,9-8.2,12.1
		c-2.4,1.7-3.9,5.3-4.9,8.3c-4.7,13.5-14.9,20.2-28.2,21.8c-8.4,1-17.2-0.8-25.8-1c-6.9-0.2-9.4-5.3-11-10.4
		c-3.2-10-5.7-20.3-8.4-30.5c-3.4-13.2-6.7-26.4-10.2-39.6c-1.8-6.8-3.7-13.6-5.9-20.3c-1.4-4.1-3.4-7.3-8.7-8.3
		c-3.1-0.6-6.8-4.2-8-7.2c-4-10.6-6.9-21.6-10.3-32.3c-2.5-7.7-5.2-15.2-7.7-22.9c-2.1-6.5-4.2-13.1-6.1-19.7
		c-1-3.5,0.8-4.6,4.3-4.6C924,977,937,977,950.5,977z"/>
        </g>
        <%--    강남구1--%>
        <g>
            <path class="st6 gu1 sd1" lon="127.0495" lat="37.5145" gu="1" d="M1581.1,1109.3c0.1,0,0.2-0.1,0.3-0.1c11.6-2.6,23.2-5.4,34.8-6.8c13-1.5,21.5-8.2,28.3-18.4
		c2.1-3.1,4.3-6.5,9-5.9c2.6,0.3,5,0.3,7.1-0.2l6.3,11c-0.8,1-1.5,2.1-2.2,3.1c-4.8,7.1-10.7,12.9-19,15.3
		c-6.5,1.9-13.3,2.5-19.9,3.8c-10.2,2-20.5,3.9-30.6,6.4c-2.7,0.7-4.3,2.2-5.3,4.3L1581.1,1109.3z"/>
            <path class="st37 gu1" lon="127.0495" lat="37.5145" gu="1" d="M1326.5,821.4c8-7.9,15.9-15.6,24.3-22.7c2.4-2,6.4-2.6,9.8-2.6c11.4-0.3,22.9-1.1,34.2,0.2
		c9.7,1.2,19.3,4.5,28.6,7.9c6.7,2.5,12.7,6.7,19.1,10c12.6,6.5,25.1,13,37.8,19.2c2.1,1,4.9,0.4,7.8,0.5
		c0.5,13.2,1.1,26.4,0.3,39.5c-0.7,10.5,2.9,19.2,7.4,28.2c3.4,6.9,9.4,10.7,14.7,15.6c8.7,8.2,20.2,11.7,30.1,17.9
		c1.3,0.8,3.1,0.9,4.8,1.1c8.4,1.2,16.9,2.5,25.3,3.6c9.6,1.3,17.6,5,19.6,15.6c1.2,6.4,5,10,10.4,12.9c6.1,3.3,12,6.9,18,10.5
		c0.9,0.6,1.8,1.8,1.9,2.9c1.5,10.1,2.6,20.2,4.2,30.2c0.4,2.5,2,4.8,3.5,7c7.2,10.7,15.2,20.9,21.5,32.1c4.2,7.3,6,16,8.8,24.4
		c-2.2,0.4-4.3,0.6-6.5,0.4c-3.4-0.3-5.5,1.2-7.5,3.9c-5.9,8.1-12,16.2-22.6,18.4c-8.4,1.8-16.9,3.1-25.3,4.8
		c-3.4,0.7-6.8,1.5-10.1,2.5c-4.5,1.4-7.1-0.2-9-4.5c-2.9-6.4-6.2-12.7-9.7-18.9c-0.8-1.4-2.8-2.4-4.4-3
		c-9.8-3.7-16.1-11.3-22.2-19.2c-0.8-1-0.7-2.9-0.6-4.3c0.2-4.3,0.8-8.6,0.9-12.9c0.1-8.7-8.1-16.7-16.9-16.8
		c-5.2,0-10.4-0.4-15.5,0.1c-5,0.5-9.9,2.4-14.9,3c-10.5,1.4-12.8,10.3-16.8,17.6c-2.1,3.8-4.6,5.8-9.1,5.3
		c-9.5-1-18.1,2.2-26.9,5.3c-7.7,2.7-7.4,2.9-10.7-4.5c-6.8-14.9-7-31.1-9.2-46.9c-0.5-3.9-2.5-7.8-4.6-11.1
		c-6.4-9.9-16.5-14.4-27.1-18.9c-6.1-2.6-10.6-9.4-15.7-14.3c-1.8-1.7-3-4.1-4.9-5.6c-3.8-2.9-5.1-6.9-5.4-11.2
		c-0.8-12.9-1.8-25.8-1.9-38.7c-0.1-7.8-5.2-11.8-10.2-16c-2.7-2.3-4.7-4.4-5.2-8.4c-1.2-10.2-2.3-20.5-5.2-30.2
		c-2.1-7.3-6.9-13.8-10.5-20.8C1329.2,827.7,1327.9,824.7,1326.5,821.4z"/>
        </g>
        <%--    서대문구14--%>
        <path class="st38 gu14" lon="126.9388" lat="37.5763" gu="14" d="M1170.4,665.9c0,0-0.4,0-0.6,0.1c-2.6,1.7-5.3,3.1-7.3,5.2c-4.8,5.3-10.8,4.1-16.6,3.4
	c-10-1.1-20-3.3-29.9-3.3c-10.7,0-19.3-2.8-27.1-10.3c-17.6-16.8-35.8-33.1-53.5-49.8c-6-5.7-11.4-12-17-18
	c-0.8-0.9-1.2-2.3-1.8-3.8c0.7-3.5,1.8-6.7,1.9-9.9c0.2-5.4,2-9.5,5.5-13.8c7-8.6,15.2-12.2,26.3-11c8.8,1,17.8,0.6,26.7-0.2
	c2.8-0.3,5.5-3.9,7.8-6.4c3.6-3.9,6.8-8,6.9-13.8c0-1.1,1.9-2.7,3.3-3.3c7.9-3.3,16-6.2,23.9-9.5c1.2-0.5,2.3-2.4,2.5-3.9
	c1.4-8,4.5-15.1,9.3-21.7c2.3-3.2,15.5-9.8,18.3-9.4c3.3,0.5,4.6,2.2,4.5,5.4c0,4,0.3,8-0.1,12c-0.6,5.3,2.6,7.8,6.8,8.9
	c6.6,1.8,10.8,4.9,11.8,12.5c0.8,6.2,3.5,12.2,5.2,18.4c0.4,1.5-0.1,3.3-0.5,4.8c-1.6,5.8-3.3,11.7-5.2,17.5
	c-2.4,7.5-5.4,14.9-7.5,22.6c-1.8,6.6-6.2,13.2-1.6,20.3c-1.5,11.9,8.9,16.2,15,23.2c3.9,4.5,8.4,8.4,12.9,13.1
	c-1.4,5.2-2.7,10-7.4,12.7c-2.8,1.6-5.5,3.4-8.7,5.1C1172.7,664,1171.6,664.9,1170.4,665.9z"/>
        <%--    중구24--%>
        <path class="st34 gu24" lon="126.9996" lat="37.5610" gu="24" d="M1291.6,635.1c0.4,0,0.9-0.1,1.8,0.2c4.1,3.3,4.9,1,5.2-2.2c0.5-0.3,1-0.6,1.7-0.5c2.5,3,7.4,2,10.3-1.6
	c15.7,0,31.3,0,47.5,0.3c1.5,0.8,2.5,1.3,3.5,1.8c0,8.5,0.1,17,0,25.4c0,2.1-0.3,4.5-1.4,6.2c-5.2,8-9.5,16.7-17.8,22.3
	c-8.1,5.5-11.2,14.4-14.9,22.9c-1.7,3.9-3.7,7.7-5.7,11.9c-4.5-1.9-8.7-4.3-13.2-6.2c-2.6-1.2-5.5-2.3-8.3-2.4
	c-8.5-0.3-17,0-25.4-0.2c-2.1-0.1-4.5-1.1-6.1-2.4c-4.1-3.3-7.8-7.2-11.9-10.6c-1.3-1.1-3.2-1.9-4.8-1.8
	c-12.9,0.8-25.7,1.9-38.5,2.7c-5,0.3-10,0.2-14.9,0.2c-2.2,0-4.3-0.1-6.5,0c-7.4,0.6-7.4,0.4-9.7-7.1c-2.4-7.8-5.3-15.5-7.9-23.3
	c-0.4-1.2-0.6-2.6-0.6-4.3c0.5-0.7,0.7-1,1.1-1.3c10.2-2.9,15.9-10,19.7-19c2.2-0.5,4.3-0.9,7.1-1.7c3.6-0.6,6.6-0.7,9.4-1.5
	c2.9-0.9,5.6-2.5,8.4-3.9c0,0,0,0.1,0.4,0.1c4.5-2.6,8.9-4.8,12.8-7.7c6.3-4.9,14.5-4.6,19.7,0.9c1,1,2.8,1.3,4.3,1.9
	c0.3,0.4,0.6,0.9,0.7,1.8c-0.2,0.9-0.3,1.3-0.3,1.7c0.5-0.2,1-0.4,1.6-0.6c0.5,0.3,0.9,0.6,1.6,1.4c1.6,1.2,3,2.6,4.3,2.5
	c2.7,0,5.3-0.8,8.1-1.2c-0.5-0.6-0.8-1.1-1.2-1.6c1.4-0.3,2.8-0.6,4.7-0.5c2.9,3.5,6.4,3.2,9.4-0.5c0.4,0,0.8,0,1.8,0.2
	C1290.4,638.6,1291.7,637.9,1291.6,635.1z"/>

        <text transform="matrix(1 0 0 1 1447.6338 968.3757)" class="st39 st40 gu1" lon="127.0495" lat="37.5145" gu="1">
            강남구
        </text>
        <text transform="matrix(1 0 0 1 1289.5262 1007.8318)" class="st39 st40 gu15" lon="127.0348" lat="37.4807"
              gu="15">서초구
        </text>
        <text transform="matrix(1 0 0 1 1093.476 1067.2949)" class="st39 st40 gu5" lon="126.9538" lat="37.4753" gu="5">
            관악구
        </text>
        <text transform="matrix(1 0 0 1 1099.4939 911.2505)" class="st39 st40 gu12" lon="126.9415" lat="37.5096"
              gu="12">동작구
        </text>
        <text transform="matrix(1 0 0 1 951.5786 844.35)" class="st39 st40 gu20" lon="126.8983" lat="37.5236" gu="20">
            영등포구
        </text>
        <text transform="matrix(1 0 0 1 936.382 1033.7063)" class="st39 st40 gu8" lon="127.0495" lat="37.4491" gu="8">
            금천구
        </text>
        <%--    구로구7--%>
        <g>
            <path class="st9 gu7 sd7" lon="126.9041" lat="37.4926" gu="7" d="M733,1030c0.2-0.6,0.9-1.8,1.5-1.7c6.4,0.5,12.8,1.4,19.3,1.6c4.1,0.2,8.2-0.9,12.4-0.8
		c14.3,0.2,28.6,0.4,42.9,1c4.9,0.2,8.6-1.1,12.1-4.3c9.3-8.7,18.9-17.1,28.1-25.9c9.7-9.3,17.3-20,20.8-33.3c2-7.7,8-11.7,15-14
		c7.7-2.6,14.8,3,14.7,10c-6,2.6-8.1,7.8-9.8,13.2c-4,13.2-11.8,23.8-22.2,32.8c-9.3,8.1-18,16.7-27.1,24.9
		c-4.9,4.4-10.9,4.6-17.2,4.4c-14.5-0.6-29.1-0.4-43.6-1.2c-10.5-0.6-21-1.9-31.4-3.3C743.3,1032.7,738.4,1031.1,733,1030z"/>
            <path class="st41 gu7" lon="126.9041" lat="37.4926" gu="7" d="M815.6,882.3c8.5-7.5,16.6-14.8,25-21.8c1.8-1.5,4.7-2.1,7.1-2.4c3.8-0.4,7.7-0.1,11.5-0.1
		c6.6,0,8.7,1.8,9.2,8.6c1,12.7,6,16.9,19.2,17.4c7.7,0.3,15.3,0,23,0.1c3.5,0,6.1-0.8,7.8-4.6c2.5-5.9,5.9-11.5,8.9-17.1
		c1.4-2.7,2.9-4.1,6.3-1.9c4.9,3.3,10.7,5.4,15.2,9.2c3,2.5,5.5,6.7,6.5,10.5c2.5,9.8,4.7,19.7,5.7,29.8c0.6,6,3.6,9.2,7.9,12.3
		c1.1,0.8,1.5,2.9,1.6,4.4c0.1,11.3,0.1,22.7,0,34c0,1.4-0.3,3.3-1.3,4.1c-4.9,4-9.8,8.5-16.8,8.4c-14.5-0.3-28.9-0.7-43.4-1
		c-5.2-0.1-5.1-4.7-5.3-7.4c-0.6-7.3-3.8-12.7-10.4-15c-7-2.4-13.3,0.6-18.9,4.9c-4.5,3.5-7.2,8.3-8.5,13.7
		c-2.2,9.1-7,16.8-13.6,23.2c-11.4,11.2-23.2,21.9-34.7,32.9c-4.5,4.3-10,3.9-15.5,3.3c-1-0.1-1.9-0.6-2.9-0.6
		c-11.8-0.4-23.6-0.8-35.4-1c-9.5-0.2-19,0-29.8,0c0.7-3.7,0.8-6,1.6-7.9c3.7-8.8,7.6-17.4,11.3-26.1c4-9.5,6.6-19.3,3.1-29.4
		c-2.1-6.1-5.4-11.9-7.5-18.1c-1.2-3.6-2.5-8-1.4-11.3c3.7-11.2,8.4-22.1,12.9-33.1c2.2-5.5,5.4-10.6,7.1-16.2
		c1.3-4.5,1-9.6-2.8-13.5c-1.2-1.2-2.1-2.7-3.9-5.2c9.4,1.3,17.4,1.9,25.1,3.7c2.1,0.5,4,4.2,4.8,6.9c2.5,8.1,2.5,8.2,11,8.3
		c3.8,0.1,7.6,0.9,11.4,0.7C809.7,884.6,812.5,883.3,815.6,882.3z"/>
            <text transform="matrix(1 0 0 1 796.632 934.4565)" class="st39 st40 gu7" lon="126.9041" lat="37.4926"
                  gu="7">구로구
            </text>
        </g>
        <text transform="matrix(1 0 0 1 816.2925 827.8484)" class="st39 st40 gu19" lon="126.8687" lat="37.5142" gu="19">
            양천구
        </text>
        <text transform="matrix(1 0 0 1 719.1567 660.7769)" class="st39 st40 gu4" lon="126.8516" lat="37.5481" gu="4">
            강서구
        </text>
        <text transform="matrix(1 0 0 1 973.5876 672.8569)" class="st39 st40 gu13" lon="126.9105" lat="37.5607" gu="13">
            마포구
        </text>
        <text transform="matrix(1 0 0 1 1056.4861 606.3223)" class="st39 st40 gu14" lon="126.9388" lat="37.5763"
              gu="14">서대문구
        </text>
        <text transform="matrix(1 0 0 1 1051.9479 429.657)" class="st39 st40 gu22" lon="126.9312" lat="37.5999" gu="22">
            은평구
        </text>
        <text transform="matrix(1 0 0 1 1200.7384 580.8973)" class="st39 st40 gu23" lon="126.9816" lat="37.5703"
              gu="23">종로구
        </text>
        <text transform="matrix(1 0 0 1 1232.739 679.2552)" class="st39 st40 gu24" lon="126.9996" lat="37.5610" gu="24">
            중구
        </text>
        <text transform="matrix(1 0 0 1 1377.1311 718.7552)" class="st39 st40 gu16" lon="127.0368" lat="37.5634"
              gu="16">성동구
        </text>
        <text transform="matrix(1 0 0 1 1397.6136 598.001)" class="st39 st40 gu11" lon="127.0421" lat="37.5716" gu="11">
            동대문구
        </text>
        <text transform="matrix(1 0 0 1 1310.2112 516.7784)" class="st39 st40 gu17" lon="127.0203" lat="37.5863"
              gu="17">성북구
        </text>
        <text transform="matrix(1 0 0 1 1310.2233 373.7785)" class="st39 st40 gu3" lon="127.0277" lat="37.6369" gu="3">
            강북구
        </text>
        <text transform="matrix(1 0 0 1 1351.9766 234.2786)" class="st39 st40 gu10" lon="127.0495" lat="37.6658"
              gu="10">도봉구
        </text>
        <text transform="matrix(1 0 0 1 1492.5422 313.7598)" class="st39 st40 gu9" lon="127.0583" lat="37.6514" gu="9">
            노원구
        </text>
        <text transform="matrix(1 0 0 1 1546.2155 532.5174)" class="st39 st40 gu25" lon="127.0947" lat="37.6038"
              gu="25">중랑구
        </text>
        <text transform="matrix(1 0 0 1 1514.0481 725.0132)" class="st39 st40 gu6" lon="127.0651" lat="37.5340" gu="6">
            광진구
        </text>
        <%--    송파구18--%>
        <g>
            <path class="st6 gu18 sd18" lon="127.1079" lat="37.5117" gu="18" d="M1660.7,1077.9c6.4-1.4,10.9-6.5,13.8-15.4c3.8-11.7,8.2-14.8,20.4-15.4c8-0.4,15.6-2.3,18.6-11.2
		c1.3-3.8,1.9-7.9,2.9-11.8c1.8-6.7,3.6-13,11.3-16.3c7.4-3.1,13.4-8.7,15.8-16.8c2.3-7.9,4-15.9,5.8-23.9c2-8.9,5.3-16.5,14.5-20.5
		c2.5-1.1,4.6-5,5.3-8c1.1-4.5,0.5-9.1,0.5-13.6c5.3,1.3,10.7,2.2,15.7,4.2c2.1,0.8,3.8,4,4.5,6.5c2.4,8.5-0.5,15.1-8.1,19.3
		c-8.3,4.6-10.7,12.4-12.2,21c-1.7,10.1-2.4,20.7-9.1,29c-2.9,3.6-7,6.8-11.2,8.7c-9.1,4.1-11,12-12.6,20.4
		c-2.8,14.7-6.9,18.6-20.3,18.9c-12.2,0.3-17,4.2-20.8,15.8c-3.3,10-8,17.1-20.6,16.2c-3.8-0.3-6.1,1.5-7.9,3.9"/>

            <path class="st42 gu18" lon="127.1079" lat="37.5117" gu="18" d="M1491.6,835.4c12.4,3.1,25.1,1.6,37.6,1.4c10.2-0.2,20.6-0.8,30.4-3.2c8.6-2.1,16.4-7.1,22.3-14.3
			c7.1-8.6,13.9-17.6,21.4-25.9c6.9-7.8,12.9-16.1,17.4-25.5c2.8-6,6.2-11.7,9.3-17.5c2-3.9,4.7-1.2,7.3-1c0.7-0.2,1.2-0.2,2,0.2
			c1,0.7,1.7,1,2.3,1.4c0.7,0,1.5,0.1,2.8,0.4c2.4,1.8,4.2,3.2,6,4.7c0.1,1.1,0.1,2.2-0.1,3.9c-0.5,3.1-0.7,5.6-0.8,8.1
			c0,0.8-0.1,1.6-0.5,2.8c-0.7,1.4-1,2.4-1.4,3.3c0,0.8-0.1,1.5-0.4,2.7c-0.4,1-0.6,1.6-0.7,2.2c-1,3.7-2,7.4-3.4,11.6
			c-1.7,2.8-4.3,5-0.6,7.4c0.8,0.9,1.7,1.8,2.9,3.2c2,1.6,3.5,2.7,5.1,3.8c0.5,0.3,0.9,0.6,1.7,1.3c1.6,1.5,3,2.6,4.3,3.7
			c0.5,0.6,1,1.2,1.7,2.3c1.2,3,2.2,5.4,3.2,7.9c0,0.4,0,0.8-0.2,1.8c0.9,3.8,1,8.5,3.3,10c2.8,1.8,7.3,0.9,11.1,1.2
			c1,0,2,0,3.6,0.4c7.1,1.1,11.3,5.5,15.6,9.9c0.4,0.4,1.2,0.3,1.8,0.5c0.4,0,0.9,0.1,1.9,0.4c2.1,0.4,3.6,0.6,5.1,0.8
			c0.4,0,0.8,0,1.6,0.4c1.4,0.7,2.4,1.1,3.4,1.5c1.8,1.6,3.6,3.2,5.6,5c2.7,3.5,2.6,6.5,0.1,10c-2.9,4-5.1,8.6-7.8,12.7
			c-2.1,3.1-2,5.8-0.5,9.3c1.7,3.8,3.1,8,3.5,12.2c0.9,8.6,4.5,14,12.9,16.2c12,3.2,24.1,5.9,36.2,8.8c5,1.2,8.1,4.8,8.1,10
			c0,1.8-0.1,3.7,0,5.5c0.1,3.7-0.8,6.4-4.8,8.2c-9.8,4.1-13.3,12.9-15.1,22.5c-1.2,6-1.8,12.2-3.4,18c-2.2,8.3-6.6,15.6-15,18.8
			c-10.5,4-13,12.5-14.8,22.2c-0.7,4.1-2.4,8.2-4.5,11.8c-2.3,3.9-6.1,5.3-11,5.2c-14.9-0.3-20.6,4.1-25.7,18.5
			c-1.8,4.9-3.3,10.1-8.8,12.5c-0.6,0.3-1.5,0.1-2.5,0c-1.9-5.7-3.1-11.4-5.2-16.8c-2-5.2-4.4-10.3-7.4-14.9
			c-5.9-9.2-12.6-17.8-18.5-27c-1.6-2.6-1.7-6.3-2.2-9.5c-1.4-8-2.3-16.1-4.1-23.9c-0.6-2.7-2.9-5.6-5.2-7.3
			c-4.8-3.4-10-6.5-15.4-8.9c-6.2-2.7-8.7-7.6-10.3-13.5c-2.1-8-8.7-13.3-16.7-14.4c-10.6-1.5-21.8-2-31.7-5.6
			c-10.8-4-20.6-11-30.7-16.9s-15.6-15.6-19.9-25.8c-1.6-3.8-1.8-8.4-1.9-12.7C1491.5,863.2,1491.6,849.5,1491.6,835.4z"/>
            <text transform="matrix(1 0 0 1 1606.7791 918.2496)" class="st39 st40 gu18" lon="127.1079" lat="37.5117"
                  gu="18">송파구
            </text>
            <path class="st6 gu18 sd18" lon="127.1079" lat="37.5117" gu="18" d="M1739,866.7c-3.4,5.6-6.7,11.1-10.1,16.7c-0.9,1.4-1.7,4-1,5c5.1,7.2,4.3,15.8,6.2,24c-3.7-0.6-7-1.4-10.3-2.5
		c-6.8-2.1-11.1-5-11.5-13.4c-0.2-4.1-1.6-8.4-3.4-12.1c-1.5-3.2-1.9-5.6,0-8.7c3.8-6.2,7.3-12.6,11-19.1L1739,866.7z"/>
        </g>
        <%--강동구2--%>
        <g>
            <path class="st6 gu2 sd2" lon="127.1258" lat="37.5273" gu="2" d="M1719.9,856.6c0.9-1.6,1.9-3.2,2.8-4.8c5.3-8.4,9.8-17,15.4-24.7c8.9-12.4,14.4-25.5,13.4-41.1
		c-0.4-6.2,2.1-9,8-10.9c21.1-6.8,42.2-13.5,63.3-20.4c9.4-3.1,16-11.8,15.4-21.5c-0.6-8.7-2.3-17.3-4-25.9
		c-2.3-11.8-3.8-23.6,1-35.2c2-5,3-10.1,1.3-15.6c-0.8-2.6-0.5-5.7-1.3-8.3c-1.1-3.4-2.1-7.2-4.4-9.6c-2.2-2.3-6-3.2-9.2-4.7
		c-9.2-4.1-11.2-7.8-9.7-18c0.3-0.6-0.2-1.4-0.4-2.1c6-3.4,12-6.9,17.9-10.3c3.1-1.8,6.3-3.6,9.7-5.5c3,1.9,5.6,3.9,8.3,5.8
		c0.9,0.6,1.9,1,4,2.1c-4.3,3.9-7.7,7.9-11.9,10.4c-6.1,3.7-7.4,8.7-7.1,15.2c0.2,5.6,4.7,6.8,8.2,9c3.6,2.2,8.3,3.2,11.2,6.1
		c2.5,2.5,3.7,6.8,4.4,10.5c1.7,8.8,2,17.4-1.7,26.2c-3.5,8.4-2.3,17.6-0.6,26.5c1.6,8.4,4.3,16.7,5.2,25.2
		c1.2,12.2-3.3,23.4-17.9,27.9c-18.3,5.7-36.5,11.7-54.8,17.5c-1.2,0.4-2.7,0.3-3.9,0.7c-6.3,2.2-10.9,4.4-10.2,12.4
		c1.2,15-5.1,27.7-12.8,40c-6.9,11-13.7,22.1-20.5,33.2L1719.9,856.6z"/>
            <path class="st43 gu2" lon="127.1258" lat="37.5273" gu="2" d="M1722.9,851.9c-2.8,0.2-5.2,0.2-8.3,0c-2.4-1.8-4.2-3.4-6.1-5.3c-1.1-0.7-2.1-1.1-3.4-1.5
			c-0.7,0-1.1,0-1.7-0.3c-1.7-0.5-3.3-0.6-5.1-0.8c-0.8,0-1.2-0.1-1.7-0.4c-4.4-5.9-8.5-12.1-17.5-10.4c-1.4,0-2.4,0-3.7-0.3
			c-7.1-0.7-12.3-3.4-13.8-11.1c0-0.7,0-1.1,0-1.9c-1-2.9-1.9-5.3-3.2-7.9c-0.8-0.7-1.2-1.3-1.8-2.2c-1.4-1.4-2.7-2.5-4.3-3.7
			c-0.7-0.4-1.2-0.7-1.7-1.3c-1.7-1.4-3.3-2.5-5.2-3.8c-1.1-1-2-1.9-2.8-3.3c0.3-2.5,0.6-4.6,0.9-7.1c1-4.1,2-7.8,3.3-11.7
			c0.4-0.7,0.6-1.2,0.8-2.1c0.1-1.1,0.1-1.9,0.5-2.7c0.7-1,1-2,1.4-3.3c0.1-1.2,0.1-1.9,0.4-3c0.5-2.7,0.7-5.2,0.9-8.1
			c-0.1-1.5-0.1-2.6-0.2-4c-1.2-2.9-1.3-6.8-6.2-4.6c-1.1,0-1.9-0.1-2.7-0.4c-0.7-0.6-1.3-1-2.3-1.4c-0.8-0.1-1.3-0.1-1.9-0.4
			c-1.8-2.2-3.6-4.2-5.3-6.1c2.9-11.2,5.8-22.5,8.6-33.7c2.2-8.7,5.7-16.2,13.6-21.7c10.8-7.4,20.7-16.1,31.3-23.7
			c8.1-5.9,17.7-7.9,27.4-7.4c16.5,0.9,30.9-3.9,44.7-12.6c11.9-7.5,24.6-13.8,37.6-20.7c0.8-0.4,1-0.6,1.2-0.9
			c4.7-2.7,9.5-5.3,14.6-8.1c0.6,0.6,1.1,1.4,1,2.1c-1.4,10.2,0.5,13.8,9.7,18c3.2,1.4,7,2.3,9.2,4.7c2.3,2.4,3.4,6.2,4.4,9.6
			c0.8,2.6,0.5,5.7,1.3,8.3c1.7,5.4,0.7,10.6-1.3,15.6c-4.8,11.6-3.2,23.4-1,35.2c1.6,8.6,3.4,17.2,4,25.9c0.6,9.7-6,18.5-15.4,21.5
			c-21.1,6.9-42.2,13.6-63.3,20.4c-5.9,1.9-8.4,4.7-8,10.9c1,15.5-4.5,28.7-13.4,41.1C1732.7,834.9,1728.2,843.5,1722.9,851.9z"/>
            <text transform="matrix(1 0 0 1 1688.0695 732.9474)" class="st39 st40 gu2" lon="127.1258" lat="37.5273"
                  gu="2">강동구
            </text>

        </g>
        <text transform="matrix(1 0 0 1 1201.5833 783.7552)" class="st39 st40 gu21" lon="126.9675" lat="37.5360"
              gu="21">용산구
        </text>
        <g id="레이어_2_1_">
        </g>
</svg>
</div>
<div>
    <h2>서울 날씨</h2>
    <h3 class="lowtemp1">최저 온도: </h3>
    <h3 class="maxtemp1">최고 온도: </h3>
    <h3 class="hicon1"></h3>

    <h2 id="h2gu"></h2>
    <table class="table table-info">
        <thead>
        <tr>
            <td>시간</td>
            <td>온도</td>
            <td>강수확률</td>
            <td>풍속</td>
            <td>날씨</td>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>



<script>
    $.getJSON("https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=44714b1973a73780b4840a89a5f87c7e&units=metric", function (result) {
        // alert(result.main.temp);
        $(".lowtemp1").html("최저 온도" + result.main.temp_min + "°C");
        $(".maxtemp1").html("최고 온도" + result.main.temp_max + "°C");
        var wicon = "<img src='http://openweathermap.org/img/wn/" + result.weather[0].icon + ".png' alt='" + result.weather[0].discription + "'>"// 날씨에 따른 아이콘 변수 선언 https://openweathermap.org/weather-conditions 참조
        $(".hicon1").html(wicon);
    });
    // $(document).on("click",".hanriver",function(){
    //
    // });
    // ,text.gu1,text.gu2,text.gu3,text.gu4,text.gu5,text.gu6,text.gu7,text.gu8,text.gu9,text.gu10,text.gu11,text.gu12,text.gu13,text.gu14,text.gu15,text.gu16,text.gu17,text.gu18,text.gu19,text.gu20,text.gu21,text.gu22,text.gu23,text.gu24,text.gu25
    $(document).on("click", ".gu1,.gu2,.gu3,.gu4,.gu5,.gu6,.gu7,.gu8,.gu9,.gu10,.gu11,.gu12,.gu13,.gu14,.gu15,.gu16,.gu17,.gu18,.gu19,.gu20,.gu21,.gu22,.gu23,.gu24,.gu25", function () {
        var lat = $(this).attr("lat");
        var lon = $(this).attr("lon");
        var gu = $(this).attr("gu");
        var guname = "";

        switch (gu) {
            case "1":
                guname = "강남구";
                break;
            case "2":
                guname = "강동구";
                break;
            case "3":
                guname = "강북구";
                break;
            case "4":
                guname = "강서구";
                break;
            case "5":
                guname = "관악구";
                break;
            case "6":
                guname = "광진구";
                break;
            case "7":
                guname = "구로구";
                break;
            case "8":
                guname = "금천구";
                break;
            case "9":
                guname = "노원구";
                break;
            case "10":
                guname = "도봉구";
                break;
            case "11":
                guname = "동대문구";
                break;
            case "12":
                guname = "동작구";
                break;
            case "13":
                guname = "마포구";
                break;
            case "14":
                guname = "서대문구";
                break;
            case "15":
                guname = "서초구";
                break;
            case "16":
                guname = "성동구";
                break;
            case "17":
                guname = "성북구";
                break;
            case "18":
                guname = "송파구";
                break;
            case "19":
                guname = "양천구";
                break;
            case "20":
                guname = "영등포구";
                break;
            case "21":
                guname = "용산구";
                break;
            case "22":
                guname = "은평구";
                break;
            case "23":
                guname = "종로구";
                break;
            case "24":
                guname = "중구";
                break;
            case "25":
                guname = "중랑구";
                break;
            default :
                guname = "구아님";
                break;
        }
        console.log(guname);
        $("#h2gu").text(guname + " 날씨");

        $.ajax({
            type: "get",
            url: "https://api.openweathermap.org/data/2.5/forecast?lat=" + lat + "&lon=" + lon + "&appid=36ccda560636ea50a6c38074156e4bef&units=metric",
            dataType: "json",
            success: function (result) {
                var ta = "";
                $.each(result.list, function (i, elt) {
                    var ctime = elt.dt//배열 시간
                    var ctemp = elt.main.temp//배열 날씨
                    var cgangsu = elt.main.humidity//강수 확률
                    var cwind = elt.wind.speed//풍속
                    var wicon = "<img src='http://openweathermap.org/img/wn/" + elt.weather[0].icon + ".png' alt='" + elt.weather[0].discription + "'>"

                    function convertTime(t) {
                        var ot = new Date(t * 1000);// jquery문 new Date(); 국제표준시로 변경 (Date생성자는 시간의 특정 지점을 나타내는 Date객체를 생성한다)
                                                    //변수 ot에는 Sun Sep 25 2022 01:38:10 GMT+0900 (한국 표준시) <-이런식으로 시간이 담겨져 있음 수정필요
                        //원하는 시간만 출력
                        var d = ot.getDate();//날짜 얻기
                        var hr = ot.getHours();//시간단위 얻기
                        var m = ot.getMinutes();//분단위 얻기
                        // var s = ot.getSeconds();//초 단위 얻기
                        return d + "일" + " " + hr + "시";
                    }

                    var currentTime = convertTime(ctime);

                    ta += "<tr>" +
                        "<td>" + currentTime + "</td>" +//날짜
                        "<td>" + ctemp + "°C</td>" +//온도
                        "<td>" + cgangsu + "%</td>" +//강수확률
                        "<td>" + cwind + "m/s</td>" +//풍속
                        "<td>" + wicon + "</td>" +//날씨
                        "</tr>";
                });
                $("tbody").html(ta);//tbody에 ta내용을 넣어준다
            }
        });

        var catesel = $("#categorysel option:selected").val();
        // console.log(catesel);

        if (catesel == "cafe") {
            var c = "";
            var p = "";
            $.ajax({
                type: "get",
                url: root + "/courseboard/cafelistgu",
                dataType: "json",
                data: {"gu": gu, "currentPage": 1},
                success: function (suc) {
                    if (suc.totalCount==0) {
                        c += '<div class="griditem">';
                        c += '<h2>등록된 곳이 없습니다</h2>';
                        c += '</div>';
                        c+='<input type="hidden" id="gucode" value="'+suc.gu+'">';
                    } else {
                        $.each(suc.list, function (i, res) {
                            c += '<div class="griditem">';
                            <%--c+='<c:forEach var="dto" items="${res}" varStatus="i">';--%>
                            c += '<a href="' + root + '/course/cafedetail?cafe_num=' + res.cafe_num + '&currentPage=' + suc.currentPage + '">';
                            c += '<div class="item">';
                            c += '<div class="blog-card spring-fever">';
                            <%--c+='<c:set var="photo" value="'+res.photo+'"/>';--%>
                            c += '<img src="' + res.photo + '" style="width:100%; height: 100%;">';
                            c += '<div class="title-content">';
                            c += '<h3>' + res.title + '</h3>';
                            c += '<hr/>';
                            c += '<div class="intro">' + res.addr + '</div>';
                            c += '</div>';
                            c += '<div class="card-info">';
                            c += '대표메뉴: ' + res.menu + '<br>';
                            c += '전화번호: ' + res.tel;
                            c += '</div>';
                            c += '<div class="utility-info">';
                            c += '<ul class="utility-list">';
                            c += '<li class="comments">' + res.answercount + '</li>';
                            c += '<li class="date">' + res.readcount + '</li>';
                            c += '<li class="staravg"><i class="fa-solid fa-star"></i>' + res.staravg + '</li>';
                            c += '</ul>';
                            c += ' </div>';
                            c += '<div class="gradient-overlay"></div>';
                            c += '<div class="color-overlay"></div>';
                            c += '</div>';
                            c += ' <div class="card-info">';
                            c += '</div>';
                            c += '<div class="gradient-overlay"></div>';
                            c += '<div class="color-overlay"></div>';
                            c += '</div>';
                            c += '</a>';
                            <%--c+='</c:forEach>';--%>
                            c += '</div>';
                            c+='<input type="hidden" id="gucode" value="'+suc.gu+'">';

                        })
                        p += '<ul class="pagination">';
                        if (suc.startPage > 1) {
                            p += '<li class="page-item"><a class="page-link" cafecolumn="' + suc.cafecolumn + '" cafeword="' + suc.cafeword + '" currentPage="' + (suc.startPage - 1) + '">이전</a></li>';
                            // p += '<li class="page-item"><a href="list?currentPage='+(suc.startPage-1)+'" class="page-link">&lt;</a></li>';
                        }
                        for (var pp = suc.startPage; pp <= suc.endPage; pp++) {
                            if (pp == suc.currentPage) {
                                p += '<li class="page-item active"><a class="page-link" cafecolumn="' + suc.cafecolumn + '" cafeword="' + suc.cafeword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                                // p += '<li class="page-item active"><a href="list?currentPage='+pp+'" class="page-link">'+pp+'</a></li>';
                            } else if (pp != suc.currentPage) {
                                p += '<li class="page-item"><a class="page-link" cafecolumn="' + suc.cafecolumn + '" cafeword="' + suc.cafeword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                                // p += '<li class="page-item"><a href="list?currentPage='+pp+'" class="page-link">'+pp+'</a></li>';
                            }
                        }
                        if (suc.endPage < suc.totalPage) {
                            p += '<li class="page-item"><a class="page-link" cafecolumn="' + suc.cafecolumn + '" cafeword="' + suc.cafeword + '" currentPage="' + (suc.endPage + 1) + '">다음</a></li>';
                            // p += '<li class="page-item"><a href="list?currentPage='+(suc.endPage+1)+'" class="page-link">&gt;</a></li>';
                        }
                        p += '</ul>';


                    }
                    $("#divgrid").html(c);
                    $(".paging").html(p);

                }
            });

        } else if (catesel == "food") {
            var f = "";
            var p = "";
            $.ajax({
                type: "get",
                url: root + "/courseboard/foodlistgu",
                dataType: "json",
                data: {"gu": gu, "currentPage": 1},
                success: function (suc) {
                    if (suc.totalCount==0) {
                        f += '<div class="griditem">';
                        f += '<h2>등록된 곳이 없습니다</h2>';
                        f += '</div>';
                        f+='<input type="hidden" id="gucode" value="'+suc.gu+'">';
                    } else {
                        $.each(suc.list, function (i, res) {
                            f += '<div class="griditem">';
                            <%--c+='<c:forEach var="dto" items="${res}" varStatus="i">';--%>
                            f += '<a href="' + root + '/course/fooddetail?food_num=' + res.food_num + '&currentPage=' + suc.currentPage + '">';
                            f += '<div class="item">';
                            f += '<div class="blog-card spring-fever">';
                            <%--c+='<c:set var="photo" value="'+res.photo+'"/>';--%>
                            f += '<img src="' + res.photo + '" style="width:100%; height: 100%;">';
                            f += '<div class="title-content">';
                            f += '<h3>' + res.title + '</h3>';
                            f += '<hr/>';
                            f += '<div class="intro">' + res.addr + '</div>';
                            f += '</div>';
                            f += '<div class="card-info">';
                            f += '대표메뉴: ' + res.menu + '<br>';
                            f += '전화번호: ' + res.tel;
                            f += '</div>';
                            f += '<div class="utility-info">';
                            f += '<ul class="utility-list">';
                            f += '<li class="comments">' + res.answercount + '</li>';
                            f += '<li class="date">' + res.readcount + '</li>';
                            f += '<li class="staravg"><i class="fa-solid fa-star"></i>' + res.staravg + '</li>';
                            f += '</ul>';
                            f += ' </div>';
                            f += '<div class="gradient-overlay"></div>';
                            f += '<div class="color-overlay"></div>';
                            f += '</div>';
                            f += ' <div class="card-info">';
                            f += '</div>';
                            f += '<div class="gradient-overlay"></div>';
                            f += '<div class="color-overlay"></div>';
                            f += '</div>';
                            f += '</a>';
                            <%--c+='</c:forEach>';--%>
                            f += '</div>';
                            f+='<input type="hidden" id="gucode" value="'+suc.gu+'">';

                        })
                        p += '<ul class="pagination">';
                        if (suc.startPage > 1) {
                            p += '<li class="page-item"><a class="page-link" foodcolumn="' + suc.foodcolumn + '" foodword="' + suc.foodword + '" currentPage="' + (suc.startPage - 1) + '">이전</a></li>';
                            // p += '<li class="page-item"><a href="list?currentPage='+(suc.startPage-1)+'" class="page-link">&lt;</a></li>';
                        }
                        for (var pp = suc.startPage; pp <= suc.endPage; pp++) {
                            if (pp == suc.currentPage) {
                                p += '<li class="page-item active"><a class="page-link" foodcolumn="' + suc.foodcolumn + '" foodword="' + suc.foodword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                                // p += '<li class="page-item active"><a href="list?currentPage='+pp+'" class="page-link">'+pp+'</a></li>';
                            } else if (pp != suc.currentPage) {
                                p += '<li class="page-item"><a class="page-link" foodcolumn="' + suc.foodcolumn + '" foodword="' + suc.foodword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                                // p += '<li class="page-item"><a href="list?currentPage='+pp+'" class="page-link">'+pp+'</a></li>';
                            }
                        }
                        if (suc.endPage < suc.totalPage) {
                            p += '<li class="page-item"><a class="page-link" foodcolumn="' + suc.foodcolumn + '" foodword="' + suc.foodword + '" currentPage="' + (suc.endPage + 1) + '">다음</a></li>';
                            // p += '<li class="page-item"><a href="list?currentPage='+(suc.endPage+1)+'" class="page-link">&gt;</a></li>';
                        }
                        p += '</ul>';


                    }
                    $("#divgrid").html(f);
                    $(".paging").html(p);

                }
            });
        } else if (catesel == "trip") {
            var t = "";
            var p = "";
            $.ajax({
                type: "get",
                url: root + "/courseboard/triplistgu",
                dataType: "json",
                data: {"gu": gu, "currentPage": 1},
                success: function (suc) {
                    if (suc.totalCount==0) {
                        t += '<div class="griditem">';
                        t += '<h2>등록된 곳이 없습니다</h2>';
                        t += '</div>';
                        t+='<input type="hidden" id="gucode" value="'+suc.gu+'">';
                    } else {
                        $.each(suc.list, function (i, res) {
                            t += '<div class="griditem">';
                            <%--c+='<c:forEach var="dto" items="${res}" varStatus="i">';--%>
                            t += '<a href="' + root + '/course/tripdetail?trip_num=' + res.trip_num + '&currentPage=' + suc.currentPage + '">';
                            t += '<div class="item">';
                            t += '<div class="blog-card spring-fever">';
                            <%--c+='<c:set var="photo" value="'+res.photo+'"/>';--%>
                            t += '<img src="' + res.photo + '" style="width:100%; height: 100%;">';
                            t += '<div class="title-content">';
                            t += '<h3>' + res.title + '</h3>';
                            t += '<hr/>';
                            t += '<div class="intro">' + res.addr + '</div>';
                            t += '</div>';
                            t += '<div class="card-info">';
                            t += '<span class="contentdot">' + res.content + '</span>';
                            t += '</div>';
                            t += '<div class="utility-info">';
                            t += '<ul class="utility-list">';
                            t += '<li class="comments">' + res.answercount + '</li>';
                            t += '<li class="date">' + res.readcount + '</li>';
                            t += '<li class="staravg"><i class="fa-solid fa-star"></i>' + res.staravg + '</li>';
                            t += '</ul>';
                            t += ' </div>';
                            t += '<div class="gradient-overlay"></div>';
                            t += '<div class="color-overlay"></div>';
                            t += '</div>';
                            t += ' <div class="card-info">';
                            t += '</div>';
                            t += '<div class="gradient-overlay"></div>';
                            t += '<div class="color-overlay"></div>';
                            t += '</div>';
                            t += '</a>';
                            <%--c+='</c:forEach>';--%>
                            t += '</div>';
                            t+='<input type="hidden" id="gucode" value="'+suc.gu+'">';

                        })
                        p += '<ul class="pagination">';
                        if (suc.startPage > 1) {
                            p += '<li class="page-item"><a class="page-link" tripcolumn="' + suc.tripcolumn + '" tripword="' + suc.tripword + '" currentPage="' + (suc.startPage - 1) + '">이전</a></li>';
                            // p += '<li class="page-item"><a href="list?currentPage='+(suc.startPage-1)+'" class="page-link">&lt;</a></li>';
                        }
                        for (var pp = suc.startPage; pp <= suc.endPage; pp++) {
                            if (pp == suc.currentPage) {
                                p += '<li class="page-item active"><a class="page-link" tripcolumn="' + suc.tripcolumn + '" tripword="' + suc.tripword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                                // p += '<li class="page-item active"><a href="list?currentPage='+pp+'" class="page-link">'+pp+'</a></li>';
                            } else if (pp != suc.currentPage) {
                                p += '<li class="page-item"><a class="page-link" tripcolumn="' + suc.tripcolumn + '" tripword="' + suc.tripword + '" currentPage="' + pp + '">' + pp + '</a></li>';
                                // p += '<li class="page-item"><a href="list?currentPage='+pp+'" class="page-link">'+pp+'</a></li>';
                            }
                        }
                        if (suc.endPage < suc.totalPage) {
                            p += '<li class="page-item"><a class="page-link" tripcolumn="' + suc.tripcolumn + '" tripword="' + suc.tripword + '" currentPage="' + (suc.endPage + 1) + '">다음</a></li>';
                            // p += '<li class="page-item"><a href="list?currentPage='+(suc.endPage+1)+'" class="page-link">&gt;</a></li>';
                        }
                        p += '</ul>';

                    }
                    $("#divgrid").html(t);
                    $(".paging").html(p);

                }
            });
        }


    });


</script>