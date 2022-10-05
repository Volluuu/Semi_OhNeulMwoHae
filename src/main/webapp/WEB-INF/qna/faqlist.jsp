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
    .faq_main{
      width: 1500px;
      height: 90vh;
      /*border: 2px solid black;*/
      margin: 0 auto;
    }
    .faq_info{
      width: 200px;
      height: 90vh;
      /*border: 1px solid black;*/
      float: left;
    }
    .faq_info a{
      text-decoration: none;
      color: gray;
      font-size: 15px;
    }
    .faq_list{
      width: 1200px;
      margin-left: 45px;
      display: inline-block;
    }
    .faq_list li{
      list-style: none;
    }
  </style>
</head>
<body>
<div class="faq_main">
  <div class="faq_info">
    <h1>고객센터</h1>
    <a href="${root}/qna/noticelist"><p>공지사항</p></a>
    <a href="${root}/qna/faqlist"><p>자주묻는 질문</p></a>
    <a href="${root}/qna/qnalist"><p>1:1 문의사항</p></a>
  </div>
  <div class="faq_list">
    <ul class="faq_title">
      <h3>자주묻는 질문</h3>
      <hr>
      <h3>${subject}</h3>
      <li class="faq_context">
        <pre>${content}</pre>
      </li>
    </ul>
  </div>
</div>
</body>
</html>