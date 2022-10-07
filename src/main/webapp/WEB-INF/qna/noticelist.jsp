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
    .notice_list li{
      list-style: none;
    }
    .notice_title_main{
      border: 1px solid lightgray;
    }
    .paging{
      width: 100%;
      margin-top: 10px;
      text-align: center;
    }
    .pagination{
      width: 20%;
      margin-left: 750px;
    }
    .page-item{
    }
    div.notice_title_subject{
      cursor: pointer;
      border: 1px solid lightgray;
      display: flex;
    }
    .notice_title_subject_title{
      width: 80%;
      font-size: 30px;
      font-weight: bold;
      vertical-align: middle;
    }
    .notice_title_subject_content{
      width: 20%;
    }
    .notice_content_list{
      background-color: lightgray;
    }
  </style>
  <script>
    $(function (){

      $("div.notice_content").hide();


      $(document).on("click","div.notice_title_subject",function (){
        $(this).next().toggle(1000);
      });//click

    });//function

  </script>
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
      <hr>
      <input type="hidden" name="user_num" value="${dto.user_num}">
      <input type="hidden" name="notice_num" value="${dto.notice_num}">
      <input type="hidden" name="currentPage" value="${currentPage}">
      <c:if test="${sessionScope.isadmin eq 'admin'}">
      <button type="button" class="btn btn-secondary addnotice" onclick="location.href='noticeform?user_num=${user_num}&currentPage=${currentPage}'">글쓰기</button>
      </c:if>
        <%--<c:if test="${sessionScope.loginok!=null and sessionScope.loginid==dto.user_num}">--%>
      <div class="notice_title_main">
        <c:forEach var="dto" items="${list}">
          <div class="notice_title_subject" notice_num="${dto.notice_num}">
            <li class="notice_title_subject_title">${dto.subject}&nbsp;&nbsp;</li>
            <li class="notice_title_subject_content"><fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/></li>
            <c:if test="${sessionScope.isadmin eq 'admin'}">
            <button type="button" onclick="location.href='noticedelete?notice_num=${dto.notice_num}&currentPage=${currentPage}'">삭제</button>
            </c:if>
          </div>
          <div class="notice_content" notice_num="${dto.notice_num}">
            <li class="notice_content_list">
              └${dto.content}
            </li>
          </div>
        </c:forEach>
      </div>
      <%--</c:if>--%>
  </div><!-- -->
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
  </div><!-- paging -->
</div>
</body>
</html>