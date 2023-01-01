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
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
  <style type="text/css">
    .qna1{
      padding-top: 20px;
    }
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
      box-shadow: 5px 5px 10px gray;
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
    .qna_subject_title_ad{width: 65%}
    .qna_user_title_ad{width: 15%}
    .qna_writeday_title_ad{width: 20%}
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
    #qnasearchcolumn{
      width: 80px;
    }
    #qnasearchword{
      width: 300px;
    }
    #qna_search{
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

    var s="";
    var p="";

    $(function (){

        slist();

      $(document).on("keyup", ".qnasearchword", function (e) {
        if (e.keyCode == 13) {
          $(".qna_search").trigger("click");
        }
      });
      <%-- 검색 클릭 이벤트 --%>
      $(document).on("click",".qna_search",function () {
        qnasearchcolumn=$("#qnasearchcolumn").val();
        qnasearchword=$("#qnasearchword").val();

        $.ajax({
          type: "get",
          url: "qnaSearchList",
          dataType: "json",
          data: {
            "qnasearchcolumn": qnasearchcolumn,
            "qnasearchword": qnasearchword,
            "currentPage":currentPage,
            "user_num":user_num
          },
          success: function (res) {
            $(".qna_list_main").empty();
            s="";
            p="";
            s+="<table class='table table-hover' id='qna_title'>";
            s+="<tr>";
            if(adminok=="admin"){
              s+="<th class='qna_subject_title_ad'>문의 내용</th><th class='qna_user_title_ad'>작성자</th><th class='qna_writeday_title_ad'>문의 일자</th>";
            }
            if(adminok=="user"){
              s+="<th class='qna_subject_title'>문의 내용</th><th class='qna_writeday_title'>문의 일자</th>";
            }

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
                s += elt.subject;
                if (elt.answer == 'yes') {
                  s += "<span class='answercntsuc'>[답변 완료]</span>";
                } else {
                  s += "<span class='answercntfail'>[답변 대기중]</span>";
                }
                s += "</a></td>";
                s += "<td><span class='qnawriter'>"+elt.loginid+"</span></td>";
                s += "<td class='qna_title_content'><span class='qna_title_writeday'>";
                s += elt.writeday;
                s += "</span></td></tr>";
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
            $(".qna_list_main").html(s);
            $("ul.pagination").html(p);
          }//success
        });//ajax
      });//click

      <%-- 미 답변 이벤트 --%>
      $(document).on("click",".qnaanswelist",function () {
        ansList();
      });//$function
    });
      function ansList() {
        qnasearchcolumn = $("#qnasearchcolumn").val();
        qnasearchword = $("#qnasearchword").val();
        var currentPage="${currentPage}";

        $.ajax({
          type: "get",
          url: "qnaAnswerList",
          dataType: "json",
          data: {
            "qnasearchcolumn": qnasearchcolumn,
            "qnasearchword": qnasearchword,
            "currentPage": currentPage,
            "user_num": user_num
          },
          success: function (res) {
            $(".qna_list_main").empty();
            s = "";
            p = "";
            s += "<table class='table table-hover' id='qna_title'>";
            s += "<tr>";
            if (adminok == "admin") {
              s += "<th class='qna_subject_title_ad'>문의 내용</th><th class='qna_user_title_ad'>작성자</th><th class='qna_writeday_title_ad'>문의 일자</th>";
            }
            if (adminok == "user") {
              s += "<th class='qna_subject_title'>문의 내용</th><th class='qna_writeday_title'>문의 일자</th>";
            }
            $.each(res.list, function (i, elt) {
              if (adminok == "user") {
                s += "<tr><td class='qna_title_subject'>";
                s += "<a href='qnadetail?qna_num=" + elt.qna_num + "&currentPage=" + res.currentPage + "'>";
                s += elt.subject;
                if (elt.answer == 'not') {
                  s += "<span class='answercntfail'>[답변 대기중]</span>";
                }
                s += "</a></td><td class='qna_title_content'><span class='qna_title_writeday'>";
                s += elt.writeday;
                s += "</span>&nbsp;&nbsp;</label></td></tr>";
              }
              if (adminok == "admin") {
                s += "<tr><td class='qna_title_subject'>";
                s += "<a href='qnadetail?qna_num=" + elt.qna_num + "&currentPage=" + res.currentPage + "'>";
                s += elt.subject;
                if (elt.answer == 'yes') {
                  s += "<span class='answercntsuc'>[답변 완료]</span>";
                } else {
                  s += "<span class='answercntfail'>[답변 대기중]</span>";
                }
                s += "</a></td>";
                s += "<td><span class='qnawriter'>" + elt.loginid + "</span></td>";
                s += "<td class='qna_title_content'><span class='qna_title_writeday'>";
                s += elt.writeday;
                s += "</span></td></tr>";
              }
            });//each
            if (res.startPage > 1) {
              p += "<li class='page-item'><a href='javascript:ansList2(" + res.startPage - 1 + ")' class='page-link'>&lt;</a></li>"
            }
            for (var pp = res.startPage; pp <= res.endPage; pp++) {
              if (pp == res.currentPage) {
                p += "<li class='page-item active'><a class='page-link' href='javascript:ansList2(" + pp + ")'>" + pp + "</a></li>";
              } else {
                p += "<li class='page-item'><a class='page-link' href='javascript:ansList2(" + pp + ")'>" + pp + "</a></li>";
              }
            }
            if (res.endPage < res.totalPage) {
              p += "<li class='page-item'><a href='javascript:ansList2(" + (res.endPage + 1) + ")' class='page-link'>&gt;</a></li>";
            }
            $(".qna_list_main").html(s);
            $("ul.pagination").html(p);
          }//success
        });//ajax
      };

    function ansList2(cp) {
      qnasearchcolumn = $("#qnasearchcolumn").val();
      qnasearchword = $("#qnasearchword").val();

      $.ajax({
        type: "get",
        url: "qnaAnswerList",
        dataType: "json",
        data: {
          "qnasearchcolumn": qnasearchcolumn,
          "qnasearchword": qnasearchword,
          "currentPage": cp,
          "user_num": user_num
        },
        success: function (res) {
          $(".qna_list_main").empty();
          s = "";
          p = "";
          s += "<table class='table table-hover' id='qna_title'>";
          s += "<tr>";
          if (adminok == "admin") {
            s += "<th class='qna_subject_title_ad'>문의 내용</th><th class='qna_user_title_ad'>작성자</th><th class='qna_writeday_title_ad'>문의 일자</th>";
          }
          if (adminok == "user") {
            s += "<th class='qna_subject_title'>문의 내용</th><th class='qna_writeday_title'>문의 일자</th>";
          }
          $.each(res.list, function (i, elt) {
            if (adminok == "user") {
              s += "<tr><td class='qna_title_subject'>";
              s += "<a href='qnadetail?qna_num=" + elt.qna_num + "&currentPage=" + res.currentPage + "'>";
              s += elt.subject;
              if (elt.answer == 'not') {
                s += "<span class='answercntfail'>[답변 대기중]</span>";
              }
              s += "</a></td><td class='qna_title_content'><span class='qna_title_writeday'>";
              s += elt.writeday;
              s += "</span>&nbsp;&nbsp;</label></td></tr>";
            }
            if (adminok == "admin") {
              s += "<tr><td class='qna_title_subject'>";
              s += "<a href='qnadetail?qna_num=" + elt.qna_num + "&currentPage=" + res.currentPage + "'>";
              s += elt.subject;
              if (elt.answer == 'not') {
                s += "<span class='answercntfail'>[답변 대기중]</span>";
              }
              s += "</a></td>";
              s += "<td><span class='qnawriter'>" + elt.loginid + "</span></td>";
              s += "<td class='qna_title_content'><span class='qna_title_writeday'>";
              s += elt.writeday;
              s += "</span></td></tr>";
            }
          });//each
          if (res.startPage > 1) {
            p += "<li class='page-item'><a href='qnalist?currentPage=" + res.startPage - 1 + "' class='page-link'>&lt;</a></li>"
          }
          for (var pp = res.startPage; pp <= res.endPage; pp++) {
            if (pp == res.currentPage) {
              p += "<li class='page-item active'><a class='page-link' href='qnalist?currentPage=" + pp + "'>" + pp + "</a></li>";
            } else {
              p += "<li class='page-item'><a class='page-link' href='qnalist?currentPage=" + pp + "'>" + pp + "</a></li>";
            }
          }
          if (res.endPage < res.totalPage) {
            p += "<li class='page-item'><a href='qnalist?currentPage=" + res.endPage + 1 + " class='page-link'>&gt;</a></li>";
          }
          $(".qna_list_main").html(s);
          $("ul.pagination").html(p);
        }//success
      });//ajax
    };

      function slist(){
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
              s+="<table class='table table-hover' id='qna_title'>";
              s+="<tr>";
              if(adminok=="admin"){
                s+="<th class='qna_subject_title_ad'>문의 내용</th><th class='qna_user_title_ad'>작성자</th><th class='qna_writeday_title_ad'>문의 일자</th>";
              }
            if(adminok=="user"){
              s+="<th class='qna_subject_title'>문의 내용</th><th class='qna_writeday_title'>문의 일자</th>";
              }

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
                s += elt.subject;
                if (elt.answer == 'yes') {
                  s += "<span class='answercntsuc'>[답변 완료]</span>";
                } else {
                  s += "<span class='answercntfail'>[답변 대기중]</span>";
                }
                s += "</a></td>";
                s += "<td><span class='qnawriter'>"+elt.loginid+"</span></td>";
                s += "<td class='qna_title_content'><span class='qna_title_writeday'>";
                s += elt.writeday;
                s += "</span></td></tr>";
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
            $(".qna_list_main").html(s);
            $("ul.pagination").html(p);
          }//success
        });//ajax
      };//list
  </script>
</head>
<body>
<div class="qna1">
  <div class="qna_main">

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
      <!-- 검색 -->
      <div class="qna_searcharea" >
        <div class="input-group">
          <select class="form-select qnasearchcolumn" name="qnasearchcolumn" id="qnasearchcolumn">
            <option value="subject">제목</option>
            <option value="content">내용</option>
          </select>
          <%--        <input type="text" name="qnasearchword" id="qnasearchword" class="form-control" placeholder="검색단어" value="${param.qnasearchword}">--%>
          <input type="text" name="qnasearchword" id="qnasearchword" class="form-control qnasearchword" placeholder="검색단어" value="${param.qnasearchword}">

          <button type="button" class="form-control qna_search" id="qna_search"><i class='fas fa-search qna_search1'></i></button>
          &nbsp;&nbsp;<button type="button" class="btn btn-outline-secondary qnaanswelist">미 답변</button>

        </div>
      </div>


      <input type="hidden" name="user_num" value="${dto.user_num}">
      <input type="hidden" name="qna_num" value="${dto.qna_num}">
      <input type="hidden" name="currentPage" value="${currentPage}">
      <c:if test="${sessionScope.loginok!=null}">
        <button type="button" class="btn btn-outline-secondary addqna" onclick="location.href='qnaform?user_num=${user_num}&currentPage=${currentPage}'">글쓰기</button>
      </c:if>
      <br>
      <br>
      <div class="qna_list_main">

      </div>
    </div><!-- -->
    <br>
    <br>
    <!-- 페이징 처리 -->
    <div class="paging">
      <ul class="pagination">

      </ul>
    </div><!-- paging -->
  </div><!-- main -->
</div>
</body>
</html>