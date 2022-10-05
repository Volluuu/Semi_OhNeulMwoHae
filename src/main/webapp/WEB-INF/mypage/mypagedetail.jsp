<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link
            href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
            rel="stylesheet"
    >
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <style type="text/css">
    div.mypagemain{
        position: absolute;
        margin: -100px 0px 0px -200px;
        top: 50%;
        left: 50%;
        padding: 5px;
    }

    .btn1{
        text-align: center;
    }

    .btn2{
        display :inline-block;
    }

    img{
        display: block;
        margin: auto;
        border-radius: 70%;
    }
    </style>

</head>
<body>
<div>
    <form action="list">
    <table class="table table-bordered" style="width: 600px">
        <caption align="top">
            <h1 style="text-align: center;"><b>마이페이지</b></h1>
        </caption>
        <hr>
        <img src="${profilephoto}">

        <div>닉네임 <input type="text" id="nickname" value="${nickname}"></div>
        <br>
        <div>핸드폰 번호 <input type="text" id="hp" value="${hp}"></div>
        <br>
        <div>연령대 <input type="text" id="age" value="${age}"></div>
        <br>
        <div>관심사 </div>
        <br>
        <div>소개글 <textarea placeholder="소개글을 작성하세요" style="height:150px;"></textarea> </div>
        <br>



        <div class="btn1">
        <button type="button" class="btn2">수정</button>
        <button type="button" class="btn2">나의 경로</button>
        </div>

</div>
</body>
</html>