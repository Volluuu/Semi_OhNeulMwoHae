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
<div class="qna_main">
  <div class="qna_info">
    <h1>고객센터</h1>
    <a href="${root}/qna/noticelist"><p>공지사항</p></a>
    <a href="${root}/qna//faqlist"><p>자주묻는 질문</p></a>
    <a href="${root}/qna/qnalist"><p>1:1 문의사항</p></a>
  </div>
  <div class="qna_list">
    <h3>1:1 문의 상세보기</h3>
    <div>
      <table class="table table-bordered" >
        <input type="hidden" name="qna_num" value="${dto.qna_num}">
        <input type="hidden" name="user_num" value="${dto.user_num}">
        <%-- <input type="hidden" name="id" value="${sessionScope.loginid}">
         <input type="hidden" name="name" value="${sessionScope.loginname}">--%>
        <tr>
          <td>
            <h2><b>${dto.subject}</b></h2>
            <span style="color: #ccc; font-size: 13px; text-align: left;">
              <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
            </span>
          </td>
        </tr>
        <tr height="300" valign="top">
          <td>
            <pre>${dto.content}</pre>
            <div class="alist">
              댓글목록
            </div>
            <c:if test="${sessionScope.loginok!=null}">
              <div class="aform">
                <form id="aform">
                  <input type="hidden" name="qna_num" value="${dto.qna_num}">
                  <input type="hidden" name="user_num" value="${dto.user_num}">
                 <%-- <input type="hidden" name="id" value="${sessionScope.loginid}">
                  <input type="hidden" name="name" value="${sessionScope.loginname}">--%>

                  <div class="input-group">
                    <textarea name="message" id="message" class="form-control"></textarea>
                    <button type="button" class="btn btn-dark btn-sm" id="btnsave">등록</button>
                  </div>
                </form>
              </div>
            </c:if>
          </td>
        </tr>
        <tr>
          <td>
            <button type="button" class="btn btn-dark" onclick="location.href='qnaform'">새글</button>
            <button type="button" class="btn btn-dark" onclick="location.href='qnaform?qna_num=${dto.qna_num}&currentPage=${currentPage}'">답글</button>
            <button type="button" class="btn btn-dark" onclick="location.href='qnalist?currentPage=${currentPage}'">목록</button>

            <!-- 로그인중이면서 세션의 아이디와 글의 아이디가 같을 경우에만 수정,삭제 가능 -->
           <%-- <c:if test="${sessionScope.loginok!=null and sessionScope.loginid==dto.id}">--%>
              <button type="button" class="btn btn-dark" onclick="location.href='qnaupdateform?qna_num=${dto.qna_num}&currentPage=${currentPage}'">수정</button>
              <button type="button" class="btn btn-dark" onclick="location.href='qnadelete?qna_num=${dto.qna_num}&currentPage=${currentPage}'">삭제</button>
           <%-- </c:if>--%>
          </td>
        </tr>
      </table>
    </div>
  </div>
</div>
</body>
</html>