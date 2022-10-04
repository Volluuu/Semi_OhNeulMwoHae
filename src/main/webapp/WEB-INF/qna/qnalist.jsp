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
    .qna_title{
      border: 1px solid chartreuse;
      width: 100%;
      max-height: 80vh;
      display: flex;
      float: left;
    }
    .qna_writeday{
      border: 1px solid blue;
      width: 20%;
      float: right;
    }
  </style>
  <script>
    $(function (){

    });

  </script>
</head>
<body>
<div class="qna_main">
  <!-- 검색 -->
  <%--<div class="searcharea" style="width: 100%; text-align: center; margin-left: 830px;" >
    <form action="list">
      <div class="input-group" style="width: 450px;" >
        <select class="form-control" style="width: 100px;" name="searchcolumn">
          <option value="subject">제목</option>
          <option value="id">아이디</option>
          <option value="name">작성자</option>
          <option value="content">내용</option>
        </select>
        <input type="text" name="searchword" class="form-control" style="width: 200px;" placeholder="검색단어" value="${param.searchword}">

        <button type="submit" class="form-control"><i class='fas fa-search'></i></button>
        &nbsp;&nbsp;<a href="list?searchcolumn=id&searchword=${sessionScope.loginid}" class="form-control" style="width: 80px; text-decoration: none;">내가쓴글</a>
      </div>
    </form>
  </div>--%>
<!-- 리스트 출력 -->
  <div class="qna_info">
    <h1>고객센터</h1>
    <a href="${root}/qna/noticelist"><p>공지사항</p></a>
    <a href="${root}/qna//faqlist"><p>자주묻는 질문</p></a>
    <a href="${root}/qna/qnalist"><p>1:1 문의사항</p></a>
  </div>
  <div class="qna_list">
    <h3>1:1 문의사항</h3>
    <hr>
    <input type="hidden" name="user_num" value="${user_num}">
    <button type="button" class="btn btn-secondary addqna" onclick="location.href='qnaform?user_num=${user_num}&currentPage=${currentPage}'">글쓰기</button>
    <%--<c:if test="${sessionScope.loginok!=null and sessionScope.loginid==dto.user_num}">--%>
    <c:forEach var="dto" items="${list}">
      <div class="qna_title">
        <a href="qnadetail?qna_num=${dto.qna_num}&currentPage=${currentPage}">
          <b>${dto.subject}</b>
          <span class="qna_title_writeday">${dto.writeday}</span>
        </a>
        <button type="button" onclick="location.href='qnadelete?qna_num=${dto.qna_num}&currentPage=${currentPage}'">삭제</button>
      </div>
    </c:forEach>
    <%--</c:if>--%>
  </div>

  <!-- 페이징 처리 -->
  <div class="paging">
    <ul class="pagination">
      <c:if test="${startPage>1}">
        <li class="page-item"><a href="qnalist?currentPage=${startPage-1}" class="page-link">&lt;</a></li>
      </c:if>

      <!-- 페이지 번호 -->
      <c:forEach var="pp" begin="${startPage}" end="${endPage}">
        <c:if test="${pp==currentPage}">
          <li class="page-item active"><a href="qnalist?currentPage=${pp}" class="page-link">${pp}</a></li>
        </c:if>
        <c:if test="${pp!=currentPage}">
          <li class="page-item"><a href="qnalist?currentPage=${pp}" class="page-link">${pp}</a></li>
        </c:if>
      </c:forEach>

      <c:if test="${endPage<totalPage}">
        <li class="page-item"><a href="qnalist?currentPage=${endPage+1}" class="page-link">&gt;</a></li>
      </c:if>
    </ul>
  </div>
</div>
</body>
</html>