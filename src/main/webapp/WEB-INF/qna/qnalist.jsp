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
      height: 90vh;
      /*border: 2px solid black;*/
      margin: 0 auto;
    }
    .qna_info{
      width: 200px;
      height: 90vh;
      /*border: 1px solid black;*/
      float: left;
    }
    .qna_info a{
      text-decoration: none;
      color: gray;
      font-size: 15px;
    }
    .qna_list{
      width: 1200px;
      margin-left: 45px;
      display: inline-block;
    }
    .qna_list ul{
    }
    .qna_list li{
      list-style: circle;
    }
    #qna_title{
      border: 1px solid black;
      width: 100%;
      max-height: 60vh;
      margin: 0 auto;
      text-align: center;
    }
    .qna_subject_title{
      width: 65%;
    }
    .qna_writeday_title{
      width: 35%;
    }
    .qna_title_subject{

    }
    .qna_title_subject a{
      text-decoration: none;
      color: black;
      font-size: 20px;
      font-weight: bold;
    }
    .qna_title_content{

    }
    .qna_title_writeday{
      color: gray;
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
    .answercntsuc{
      color: gray;
    }
    .answercntfail{

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
    <a href="${root}/qna/faqlist"><p>자주묻는 질문</p></a>
    <a href="${root}/qna/qnalist"><p>1:1 문의사항</p></a>
  </div>
  <div class="qna_list">
    <h3>1:1 문의사항</h3>
    <hr>
    <input type="hidden" name="user_num" value="${dto.user_num}">
    <input type="hidden" name="qna_num" value="${dto.qna_num}">
    <input type="hidden" name="currentPage" value="${currentPage}">
    <button type="button" class="btn btn-secondary addqna" onclick="location.href='qnaform?user_num=${user_num}&currentPage=${currentPage}'">글쓰기</button>
    <%--<c:if test="${sessionScope.loginok!=null and sessionScope.loginid==dto.user_num}">--%>
    <table class="table table-bordered" id="qna_title">
      <tr>
        <th class="qna_subject_title">문의 내용</th>
        <th class="qna_writeday_title">문의 일자</th>
      </tr>
    <c:forEach var="dto" items="${list}">
      <tr>
        <label>
        <td class="qna_title_subject">
          <a href="qnadetail?qna_num=${dto.qna_num}&currentPage=${currentPage}">
           ${dto.subject}&nbsp;&nbsp;
            <c:choose>
               <c:when test="${dto.acount>0 && dto.user_num eq 1}">
                 <span class="answercntsuc">[답변 완료]</span>
               </c:when>
               <c:otherwise>
                 <span class="answercntfail">[답변 대기중]</span>
               </c:otherwise>
            </c:choose>
          </a>
        </td>
        <td class="qna_title_content">
          <span class="qna_title_writeday">
              <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
          </span>&nbsp;&nbsp;
        </label>
        </td>
      </tr>
    </c:forEach>
    </table>
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
</div><!-- main -->
</body>
</html>