<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Anton&family=Dancing+Script:wght@600&family=Dongle&family=Edu+VIC+WA+NT+Beginner:wght@500&family=Gamja+Flower&family=Indie+Flower&family=Jua&family=Merriweather:ital@1&family=Nabla&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@500&family=Palanquin:wght@200&display=swap"
          rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <style type="text/css">

        div.gmapmain h1 {
            float: left;
        }

        div.gmapmain iframe {
            float: left;
            width: 65%;
        }

        div.gmapmain table {
            float: right;
            width: 35%;
            line-height: 50px;
            vertical-align: middle;
        }

    </style>
</head>
<body>

<div class="mapandselect">
    <div id="map" style="width:500px;height:600px; float:left;"></div>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=975192c3e707d21a2b0a6dda745636ec"></script>
    <script>
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level : 3
        };

        var map = new kakao.maps.Map(container, options);
    </script>

    <div class="select" style="float:left; height: 600px; width:500px; position:relative; border:1px solid black;">
        <h2>경로설정</h2>
        <div class="search_bar">
            <div class="input-group search1">
                <select class="form-control sel1" id="type">
                    <option selected="" disabled="" hidden="" class="op1">게시판 선택</option>
                    <option class="op1" value="cafe">카페</option>
                    <option class="op1" value="food">음식점</option>
                    <option class="op1" value="trip">놀거리</option>
                </select>
                <input type="text" class="form-control in1" placeholder="검색어를 입력" id="keyword">
                <button class="form-control btn1" id="getlist"><i class="fas fa-search" aria-hidden="true"></i></button>
            </div>
        </div>
        <div class="toorlist"></div>
        <button style="position:absolute; bottom:0%; left:0%">경로수정</button>
        <button style="position:absolute; bottom:0%; left:33%">경로삭제</button>
        <button style="position:absolute; bottom:0%; left:66%">경로저장</button>
    </div>
</div>

<script>

    var type_of_course = "";
    var user_keyword = "";
    $("#type").change(function () {
        type_of_course = $("#type").val();
        alert(type_of_course);

    }); //type change end

    $("#keyword").change(function () {
        alert("hi");
        user_keyword = $(this).val();
    }); // keyword change end

    $("#getlist").click(function () {
        $.ajax({
            type    : "get",
            url     : "../help/getlist",
            dataType: "text",
            data    : {
                "title": user_keyword,
                "type": type_of_course
            },
            success : function (res) {
                (".toorlist").html("hi");
            }//sucess
        });//ajax
    }); // getlist click end
</script>
</body>
</html>