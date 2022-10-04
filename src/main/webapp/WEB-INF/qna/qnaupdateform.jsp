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
    .qna_main{
      width: 1500px;
      height: 80vh;
      border: 1px solid crimson;
      margin: 0 auto;
    }
    .qna_info{
      width: 200px;
      height: 80vh;
      border: 1px solid black;
      float: left;
    }
    .qna_info a {
      float: right;
      text-decoration: none;
      color: gray;
      font-size: 15px;
    }
    .qna_list{
      width: 1200px;
      border: 1px solid orange;
      display: inline-block;
    }
    .qna_list ul{
    }
    .qna_list li{
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
<div class="qna_main">
  <div class="qna_info">
    <h1>고객센터</h1>
    <a href="${root}/qna/noticelist"><p>공지사항</p></a>
    <a href="${root}/qna//faqlist"><p>자주묻는 질문</p></a>
    <a href="${root}/qna/qnalist"><p>1:1 문의사항</p></a>
  </div>
  <div class="qna_list">
    <h3>1:1 문의 게시글 수정</h3>
    <div>
      <form action="qnaupdate" method="post">
        <input type="hidden" name="user_num" value="${user_num}">
        <input type="hidden" name="qna_num" value="${qna_num}">
        <%--<input type="hidden" name="id" value="${sessionScope.loginid}">
        <input type="hidden" name="name" value="${sessionScope.loginname}">--%>
        <input type="hidden" name="currentPage" value="${currentPage}">
        <table class="table table-bordered">
          <tr>
            <th>제목</th>
            <td>
              <input type="text" name="subject" class="form-control" required="required" value="${dto.subject}">
            </td>
          </tr>
          <tr>
            <th>문의 사항</th>
            <td>
              <textarea name="content" class="form-control" required="required">${dto.content}</textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2" align="center">
              <button type="submit" class="btn btn-secondary addqna">게시글 저장</button>
              <button type="button" class="btn btn-secondary prevqna" onclick="location.href='qnadetail?currnetPage=${currentPage}'">이전</button>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
</body>
</html>