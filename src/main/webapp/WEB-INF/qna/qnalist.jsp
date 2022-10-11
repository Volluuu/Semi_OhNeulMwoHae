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
    .qna_info a:hover{
      text-shadow: 10px 10px 10px gray;
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
      /*border: 1px solid black;*/
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
    .qnawriter{
      font-size: 15px;
      color: blue;
    }
    /* 검색 */
    .qna_searcharea{
      float: right;
      width: 600px;
    }
    .qnasearchcolumn{
      width: 80px;
    }
    .qnasearchword{
      width: 300px;
    }
    .qna_search{
      width: 30px;
    }
    .qna_search1{
      width: 30px;
    }

  </style>
  <script>
    var adminok="${sessionScope.isadmin}";
    var user_num="${sessionScope.user_num}";
    var qnasearchcolumn=$("#qnasearchcolumn").val();
    var qnasearchword=$("#qnasearchword").val();
    var currentPage="${currentPage}";

    $(function (){
      /* alert("session user_num:"+user_num);
       alert("dto user_num:"+num);
       alert("isadmin:"+admin);*/
      slist();
/*

      $(document).on("click",".qna_search",function (){
        var result="";
        var p="";

        $.ajax({
          type: "get",
          url: "qnaSearchList",
          dataType: "json",
          data: {
            "qnasearchcolumn": qnasearchcolumn,
            "qnasearchword": qnasearchword,
            "currentPage": currentPage,
            "user_num": user_num},
          success: function (res) {
            alert(res.qnasearchword);
            /!* $.each(res.list, function (i, elt) {
               if(adminok=="user") {
                 result += "<tr><td class='qna_title_subject'>";
                 result += "<a href='qnadetail?qna_num=" + elt.qna_num + "&currentPage=" + res.currentPage + "'>";
                 result += elt.subject;
                 if (elt.answer == 'yes') {
                   result += "<span class='answercntsuc'>[답변 완료]</span>";
                 } else {
                   result += "<span class='answercntfail'>[답변 대기중]</span>";
                 }
                 result += "</a></td><td class='qna_title_content'><span class='qna_title_writeday'>";
                 result += elt.writeday;
                 result += "</span>&nbsp;&nbsp;</label></td></tr>";
               }
               if(adminok=="admin") {
                 result += "<tr><td class='qna_title_subject'>";
                 result += "<a href='qnadetail?qna_num=" + elt.qna_num + "&currentPage=" + res.currentPage + "'>";
                 result += elt.subject+"<span class='qnawriter'>"+elt.loginid+"</span>";
                 if (elt.answer == 'yes') {
                   result += "<span class='answercntsuc'>[답변 완료]</span>";
                 } else {
                   result += "<span class='answercntfail'>[답변 대기중]</span>";
                 }
                 result += "</a></td><td class='qna_title_content'><span class='qna_title_writeday'>";
                 result += elt.writeday;
                 result += "</span>&nbsp;&nbsp;</label></td></tr>";
               }
             });

             if (res.startPage>1)
             {
               p += "<li class='page-item'><a href='qnalist?currentPage=" + res.startPage - 1 + "' class='page-link'>&lt;</a></li>"
             }

             for (var pp = res.startPage; pp <= res.endPage; pp++) {
               if (pp == res.currentPage) {
                 p += "<li class='page-item active'><a class='page-link' href='qnalist?currentPage=" + pp + "'>" + pp + "</a></li>";
               }
               else {
                 p += "<li class='page-item'><a class='page-link' href='qnalist?currentPage=" + pp + "'>" + pp + "</a></li>";
               }
             }

             if(res.endPage < res.totalPage){
               p+="<li class='page-item'><a href='qnalist?currentPage="+(res.endPage+1)+" class='page-link'>&gt;</a></li>";
             }
             $("#qna_title").html(result);
             $("ul.pagination").html(p);
           }//success
         });//ajax*!/
          }
        });
*/

      });

      function slist(){
        var s="";
        var p="";


        $.ajax({
          type: "get",
          url: "qnaAllList",
          dataType: "json",
          data: {
            "qnasearchcolumn": qnasearchcolumn,
            "qnasearchword": qnasearchword,
            "currentPage": currentPage,
            "user_num": user_num},
          success: function (res) {

            $.each(res.list, function (i, elt) {
              if(adminok=="user") {
                s += "<tr><td class='qna_title_subject'>";
                s += "<a href='qnadetail?qna_num=" + elt.qna_num + "&currentPage=" + res.currentPage + "'>";
                s += elt.subject;
                if (elt.answer == 'yes') {
                  s += "<span class='answercntsuc'>[답변 완료]</span>";
                } else {
                  s += "<span class='answercntfail'>[답변 대기중]</span>";
                }
                s += "</a></td><td class='qna_title_content'><span class='qna_title_writeday'>";
                s += elt.writeday;
                s += "</span>&nbsp;&nbsp;</label></td></tr>";
              }
              if(adminok=="admin") {
                s += "<tr><td class='qna_title_subject'>";
                s += "<a href='qnadetail?qna_num=" + elt.qna_num + "&currentPage=" + res.currentPage + "'>";
                s += elt.subject+"<span class='qnawriter'>"+elt.loginid+"</span>";
                if (elt.answer == 'yes') {
                  s += "<span class='answercntsuc'>[답변 완료]</span>";
                } else {
                  s += "<span class='answercntfail'>[답변 대기중]</span>";
                }
                s += "</a></td><td class='qna_title_content'><span class='qna_title_writeday'>";
                s += elt.writeday;
                s += "</span>&nbsp;&nbsp;</label></td></tr>";
              }
            });//each

            if (res.startPage>1)
            {
              p += "<li class='page-item'><a href='qnalist?currentPage=" + res.startPage - 1 + "' class='page-link'>&lt;</a></li>"
            }

            for (var pp = res.startPage; pp <= res.endPage; pp++) {
              if (pp == res.currentPage) {
                p += "<li class='page-item active'><a class='page-link' href='qnalist?currentPage=" + pp + "'>" + pp + "</a></li>";
              }
              else {
                p += "<li class='page-item'><a class='page-link' href='qnalist?currentPage=" + pp + "'>" + pp + "</a></li>";
              }
            }

            if(res.endPage < res.totalPage){
              p+="<li class='page-item'><a href='qnalist?currentPage="+(res.endPage+1)+" class='page-link'>&gt;</a></li>";
            }

            $("#qna_title").append(s);
            $("ul.pagination").html(p);
          }//success
        });//ajax
      };//list


  </script>
</head>
<body>
<div class="qna_main">
  <!-- 검색 -->
  <div class="qna_searcharea" >
    <div class="input-group">
      <select class="form-control qnasearchcolumn" name="qnasearchcolumn" id="qnasearchcolumn">
        <option value="subject">제목</option>
        <option value="loginid">아이디</option>
        <option value="content">내용</option>
      </select>
      <%--        <input type="text" name="qnasearchword" id="qnasearchword" class="form-control" placeholder="검색단어" value="${param.qnasearchword}">--%>
      <input type="text" name="qnasearchword" id="qnasearchword" class="form-control qnasearchword" placeholder="검색단어">

      <button type="button" class="form-control qna_search"><i class='fas fa-search qna_search1'></i></button>
      &nbsp;&nbsp;<button type="button" class="btn btn-secondary qnaanswelist">답변완료보기</button>
    </div>
  </div>
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
    <c:if test="${sessionScope.loginok!=null}">
      <button type="button" class="btn btn-secondary addqna" onclick="location.href='qnaform?user_num=${user_num}&currentPage=${currentPage}'">글쓰기</button>
    </c:if>
    <h3 class="cntlist"></h3>
    <table class='table table-hover' id='qna_title'>
      <tr>
        <th class='qna_subject_title'>문의 내용</th>
        <th class='qna_writeday_title'>문의 일자</th>
      </tr>
    </table>
    <%--<c:if test="${sessionScope.loginok!=null and sessionScope.loginid==dto.user_num}">--%>
    <%-- <table class="table table-hover" id="qna_title">
       <tr>
         <th class="qna_subject_title">문의 내용</th>
         <th class="qna_writeday_title">문의 일자</th>
       </tr>
     <c:forEach var="dto" items="${list}">
       <c:if test="${(sessionScope.user_num eq user_num and sessionScope.user_num ne '' and user_num ne '') or sessionScope.isadmin eq 'admin'}">
       <tr>
         <label>
         <td class="qna_title_subject">
           <a href="qnadetail?qna_num=${dto.qna_num}&currentPage=${currentPage}">
            ${dto.subject}&nbsp;&nbsp;
            <c:choose>
                <c:when test="${dto.answer eq 'yes'}">
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
       </c:if>
     </c:forEach>
     </table>--%>
  </div><!-- -->

  <!-- 페이징 처리 -->
  <div class="paging">
    <ul class="pagination">
      <%-- <c:if test="${startPage>1}">
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
       </c:if>--%>
    </ul>
  </div><!-- paging -->

</div><!-- main -->
</body>
</html>