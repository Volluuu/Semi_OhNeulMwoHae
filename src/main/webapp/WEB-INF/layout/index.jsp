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
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<style type="text/css">
    :root {
        --color-background: #44A3F7;
        --axis-x: 1px;
        --axis-y: 1rem;
        --delay: 10;
        --color-black: #000;
        --color-white: #f5f5f5;
        --color-orange: #D49C3D;
        --color-red: #D14B3D;
        --color-violet: #CF52EB;
        --color-blue: #f5f5f5;
        --color-green: #5ACB3C;
        --color-yellow: #DEBF40;
        --color-foreground: var(--color-white);
        --font-name: Righteous;
    }

    html, body {
        font-size: 50px;
        margin-top: 100px;
    }

    body {
        width: 21%;
        background-color: var(--color-background);
        align-items: center;
        justify-content: center;
        font-family: var(--font-name);
        /*height: 100vh;*/
        margin: 0 auto;
        position: relative;

    }

    .c-rainbow {
        counter-reset: rainbow;
        position: relative;
        display: block;
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .c-rainbow__layer {
        --text-color: var(--color-foreground);
        counter-increment: rainbow;
        font-size: 3rem;
        color: var(--text-color);
        text-shadow: -1px -1px 0 var(--color-black), 1px -1px 0 var(--color-black), -1px 1px 0 var(--color-black), 1px 1px 0 var(--color-black), 4px 4px 0 rgba(0, 0, 0, 0.2);
        animation: rainbow 1.5s ease-in-out infinite;
    }
    .c-rainbow__layer:nth-child(1) {
        animation-delay: calc( 1 / var(--delay) * 1s);
        left: calc(var(--axis-x) * 1);
        z-index: -10;
    }
    .c-rainbow__layer:nth-child(2) {
        animation-delay: calc( 2 / var(--delay) * 1s);
        left: calc(var(--axis-x) * 2);
        z-index: -20;
    }
    .c-rainbow__layer:nth-child(3) {
        animation-delay: calc( 3 / var(--delay) * 1s);
        left: calc(var(--axis-x) * 3);
        z-index: -30;
    }
    .c-rainbow__layer:nth-child(4) {
        animation-delay: calc( 4 / var(--delay) * 1s);
        left: calc(var(--axis-x) * 4);
        z-index: -40;
    }
    .c-rainbow__layer:nth-child(5) {
        animation-delay: calc( 5 / var(--delay) * 1s);
        left: calc(var(--axis-x) * 5);
        z-index: -50;
    }
    .c-rainbow__layer:nth-child(6) {
        animation-delay: calc( 6 / var(--delay) * 1s);
        left: calc(var(--axis-x) * 6);
        z-index: -60;
    }
    .c-rainbow__layer:nth-child(7) {
        animation-delay: calc( 7 / var(--delay) * 1s);
        left: calc(var(--axis-x) * 7);
        z-index: -70;
    }
    .c-rainbow__layer:not(:first-child) {
        position: absolute;
        top: 0;
    }
    .c-rainbow__layer--white {
        --text-color: var(--color-white);
    }
    .c-rainbow__layer--orange {
        --text-color: var(--color-orange);
    }
    .c-rainbow__layer--red {
        --text-color: var(--color-red);
    }
    .c-rainbow__layer--violet {
        --text-color: var(--color-violet);
    }
    .c-rainbow__layer--blue {
        --text-color: var(--color-blue);
    }
    .c-rainbow__layer--green {
        --text-color: var(--color-green);
    }
    .c-rainbow__layer--yellow {
        --text-color: var(--color-yellow);
    }

    @keyframes rainbow {
        0%, 100% {
            transform: translatey(var(--axis-y));
        }
        50% {
            transform: translatey(calc(var(--axis-y) * -1));
        }
    }
    .startbtn{
        margin: 0 auto;
        text-align: center;
        box-shadow: #ccc 10px 10px 0;
        outline: none;
        transition: 0.06s ease-out;
        text-transform: uppercase;
    }
    .startbtn:hover {
        transform: translateY(5px);
        box-shadow: #ccc 0 4px 0;
    }
    .startbtn:active {
        transform: translateY(8px);
        box-shadow: #ccc 0 2px 0;
    }
    .index_main{
        width: 450px;
        margin: 0 auto;
        text-align: center;
        padding-top: 80px;
    }

</style>
  <script>
      // @mtsgenerso
      // Ignore JS
      new Sign().print(document.body)
  </script>
</head>
<body>
<div class="index_main">
    <c:set var="root" value="<%=request.getContextPath()%>"/>
    <ul class="c-rainbow">
        <li class="c-rainbow__layer c-rainbow__layer--white">오늘 뭐해!?</li>
        <li class="c-rainbow__layer c-rainbow__layer--orange">오늘 뭐해!?</li>
        <li class="c-rainbow__layer c-rainbow__layer--red">오늘 뭐해!?</li>
        <li class="c-rainbow__layer c-rainbow__layer--violet">오늘 뭐해!?</li>
        <li class="c-rainbow__layer c-rainbow__layer--blue">오늘 뭐해!?</li>
        <li class="c-rainbow__layer c-rainbow__layer--green">오늘 뭐해!?</li>
        <li class="c-rainbow__layer c-rainbow__layer--yellow">오늘 뭐해!?</li>
    </ul>
    <br><br>
    <br><br>
    <button type="button" onclick="location.href='/home'" class="btn btn-light startbtn">
      시작하기
    </button>
</div>

</body>
</html>