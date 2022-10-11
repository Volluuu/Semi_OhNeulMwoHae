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
    .faq_info a:hover{
      text-shadow: 10px 10px 10px gray;
    }
    .faq_list{
      width: 1200px;
      margin-left: 45px;
      display: inline-block;
    }
    .faq_list li{
      list-style: none;
    }
    .faq_title_main{
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
    div.faq_title_subject{
      cursor: pointer;
      border: 1px solid lightgray;
      display: flex;
    }
    .faq_title_subject_title{
      width: 80%;
      font-size: 30px;
      font-weight: bold;
      vertical-align: middle;
    }
    .faq_title_subject_content{
      width: 20%;
    }
    .faq_content_list{
      background-color: lightgray;
      min-height: 150px;
    }
  </style>
  <script>
    $(function (){

      $("div.faq_content").hide();


      $(document).on("click","div.faq_title_subject",function (){
        $(this).next().toggle(1000);
      });//click

    });//function

  </script>
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
      <input type="hidden" name="user_num" value="${dto.user_num}">
      <input type="hidden" name="notice_num" value="${dto.faq_num}">
      <input type="hidden" name="currentPage" value="${currentPage}">
      <c:if test="${sessionScope.isadmin eq 'admin'}">
      <button type="button" class="btn btn-secondary addfaq" onclick="location.href='faqform?user_num=${user_num}&currentPage=${currentPage}'">글쓰기</button>
      </c:if>
      <%--<c:if test="${sessionScope.loginok!=null and sessionScope.loginid==dto.user_num}">--%>
      <div class="faq_title_main">
        <c:forEach var="dto" items="${list}">
          <div class="faq_title_subject" faq_num="${dto.faq_num}">
            <li class="faq_title_subject_title">${dto.subject}&nbsp;&nbsp;</li>
            <li class="faq_title_subject_content"><fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
              <c:if test="${user_num eq 1}">
              <button type="button" onclick="location.href='faqdelete?faq_num=${dto.faq_num}&currentPage=${currentPage}'">삭제</button>
              </c:if>
            </li>
          </div>
          <div class="faq_content" faq_num="${dto.faq_num}">
            <li class="faq_content_list">└${dto.content}</li>
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