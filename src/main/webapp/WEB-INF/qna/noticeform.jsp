<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style type="text/css">
        .notice_main{
            width: 1500px;
            height: 90vh;
            /*border: 2px solid black;*/
            margin: 0 auto;
        }
        .notice_info{
            width: 200px;
            height: 90vh;
            /*border: 1px solid black;*/
            float: left;
        }
        .notice_info a{
            text-decoration: none;
            color: gray;
            font-size: 15px;
        }
        .notice_info a:hover{
            text-shadow: 10px 10px 10px gray;
        }
        .notice_list{
            width: 1200px;
            margin-left: 45px;
            display: inline-block;
        }
        .notice_list ul{
        }
        .notice_list li{
            list-style: circle;
        }
    </style>
    <script>
    </script>
</head>
<body>
<%--<c:if test="${sessionScope.loginok==null}">
  <script type="text/javascript">
    alert("먼저 로그인해주세요");
    history.back();
  </script>
</c:if>--%>
<div class="notice_main">
    <div class="notice_info">
        <h1>고객센터</h1>
        <a href="${root}/qna/noticelist"><p>공지사항</p></a>
        <a href="${root}/qna/faqlist"><p>자주묻는 질문</p></a>
        <a href="${root}/qna/qnalist"><p>1:1 문의사항</p></a>
    </div>
    <div class="notice_list">
        <h3>공지사항 작성</h3>
        <div>
            <form action="noticeinsert" method="post">
                <input type="hidden" name="user_num" value="${user_num}">
                <%--<input type="hidden" name="id" value="${sessionScope.loginid}">
                <input type="hidden" name="name" value="${sessionScope.loginname}">--%>
                <input type="hidden" name="currentPage" value="${currentPage}">
                <table class="table table-bordered">
                    <tr>
                        <th>제목</th>
                        <td>
                            <input type="text" name="subject" class="form-control" required="required" value="${subject}">
                        </td>
                    </tr>
                    <tr>
                        <th>공지내용</th>
                        <td>
                            <textarea name="content" class="form-control" required="required"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-secondary addqna">게시글 저장</button>
                            <button type="button" class="btn btn-secondary prevqna" onclick="location.href='noticelist?currnetPage=${currentPage}'">이전</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>