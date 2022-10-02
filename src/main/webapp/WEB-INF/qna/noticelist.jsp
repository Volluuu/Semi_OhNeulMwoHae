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
      height: 80vh;
      border: 1px solid crimson;
      margin: 0 auto;
    }
    .notice_info{
      width: 200px;
      height: 80vh;
      border: 1px solid black;
      float: left;
    }
    .notice_info a {
      float: right;
      text-decoration: none;
      color: gray;
      font-size: 15px;
    }
    .notice_list{
      width: 1200px;
      border: 1px solid orange;
      display: inline-block;
    }
    .notice_list li{
      list-style: none;
    }
  </style>
</head>
<body>
<div class="notice_main">
  <div class="notice_info">
    <h1>고객센터</h1>
    <a href="${root}/qna/noticelist"><p>공지사항</p></a>
    <a href="${root}/qna/faqlist"><p>자주묻는 질문</p></a>
    <a href="${root}/qna/qnalist"><p>1:1 문의사항</p></a>
  </div>
  <div class="notice_list">
    <ul class="notice_title">
      <h3>공지사항</h3>
      <h3>${subject}</h3>
      <li class="notice_context">
        <pre>${content}</pre>
      </li>
    </ul>
  </div>
</div>
</body>
</html>