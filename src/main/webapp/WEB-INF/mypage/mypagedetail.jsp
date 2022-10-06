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

    <style type="text/css">
        div.mypagemain{
            width: 400px;
            height: 90vh;
            /*border: 1px solid black;*/
            float: left;
            margin-left: 55px;
        }

        div.mypagemain2{
            width: 700px;
            margin-left: 150px;
            /*border: 1px solid black;*/
        }

        img{
            display: block;
            margin: auto;
            border-radius: 70%;
        }
    </style>

</head>
<body>
<div class="mypagemain">
    <caption align="top">
        <h1><b>마이페이지</b></h1>
    </caption>
    <hr>
    <div><img src="${profilephoto}">닉네임 </div>
    <br>
    <a href=""><p>계정관리</p></a>
    <a href="${root}/findboard/list?user_num=${sessionScope.user_num}"><p>내 동행 게시글</p></a>
    <a href="${root}/qna/qnalist?user_num=${sessionScope.user_num}"><p>내 Q&A</p></a>
    <a href="${root}/help/map?user_num=${sessionScope.user_num}"><p>내 경로</p></a>

</div>

    <div class="mypagemain2">
        <caption align="top">
            <h1 style="text-align: center;"><b>계정관리</b></h1>
            <hr>
        </caption>
        <div><img src="${profilephoto}"></div>
        <div>닉네임<input type="text" id="nickname" value="${nickname}"></div>
        <br>
        <div>핸드폰 번호 <input type="text" id="hp" value="${hp}"></div>
        <br>
        <div>연령대 <input type="text" id="age" value="${age}"></div>
        <br>
        <div>관심사 </div>
        <br>
        <div>소개글</div>
        <div><textarea placeholder="소개글을 작성하세요(**자 이내)" style="height:150px;"></textarea> </div>
        <br>

        <h5>설정</h5>


        <div class="container mt-3">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
                Open modal
            </button>
        </div>

        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Modal Heading</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        Modal body..
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>




    </div>


</body>
</html>