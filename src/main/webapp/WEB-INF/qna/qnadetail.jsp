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
    .alist{
      width: 100%;
    }
    .answer_list{
    }
    .adminans{

    }
    .writer{

    }
    span.answermessage{
      width: 80%;
      text-align: center;
      color: gray;
    }
    span.day{
      float: right;
      text-align: right;
      color: gray;
    }
    i.adel{
      cursor: pointer;
      color: red;
    }

    .answercntsuc{
      color: gray;
    }
    .answercntfail{

    }

  </style>
  <script>
    var qna_num=${dto.qna_num};
    var user_num=${dto.user_num};

    $(function (){
     console.log("qna_num:"+qna_num);
     console.log("user_num:"+user_num);
     list(); // 처음시작 시 댓글 출력

      $(document).on("click","#btnsave",function() {
        var fdata=$("#aform").serialize();
        fdata=decodeURIComponent(fdata);
        //alert(fdata);
        $.ajax({
          type:"post",
          url:"answerInsert",
          dataType:"text",
          data:fdata,
          success:function(res){
           //location.reload();
            list();
            $("#message").val("");
          }//success
        }); //ajax
      });//클릭 이벤트

      //삭제 이벤트
      $(document).on("click",".adel",function() {
        var answer_num=$(this).attr("answer_num");
        alert(answer_num);
        var ans=confirm("정말 삭제하시겠습니까?");
        console.log(ans);
        if(ans){
          $.ajax({
            type:"get",
            url:"answerDelete",
            dataType:"text",
            data:{"answer_num":answer_num},
            success:function(res){
              alert("삭제하였습니다");
              list();
            }//sucess
          });//ajax
        };
      });//click
    });

    function list() {
      var s="";
      var admin="${sessionScope.isadmin}";
      $.ajax({
        type:"get",
        url:"answerList",
        dataType:"json",
        data:{"qna_num":qna_num},
        success:function(res){
          $.each(res, function(i, elt){
              s += "<div class='answer_list'><span class='answermessage'>";
              s += "└"+elt.message+"</span>";
              s += "<span class='day'>" + elt.writeday;
              if(admin == 'admin') {
                s += "<i class='material-icons adel' style='font-size:17px;' id='adel' answer_num=" + elt.answer_num + ">close</i>";
              }
              s += "</span></div>";
          });
          $("div.alist").html(s);
        }//success
      }); //ajax*/
    };//function --%>
  </script>
</head>
<body>
<div class="qna_main">
  <div class="qna_info">
    <h1>고객센터</h1>
    <a href="${root}/qna/noticelist"><p>공지사항</p></a>
    <a href="${root}/qna/faqlist"><p>자주묻는 질문</p></a>
    <a href="${root}/qna/qnalist"><p>1:1 문의사항</p></a>
  </div>
  <div class="qna_list">
    <h3>1:1 문의 상세보기</h3>
    <div>
      <table class="table table-bordered" >
        <input type="hidden" name="qna_num" value="${dto.qna_num}">
        <input type="hidden" name="user_num" value="${user_num}">
        <%-- <input type="hidden" name="id" value="${sessionScope.loginid}">
         <input type="hidden" name="name" value="${sessionScope.loginname}">--%>
        <tr>
          <td>
            <h2><b>${dto.subject}</b></h2>
            <c:if test="${dto.acount>0 && dto.answer eq 'yes'}">
              <span class="answercntsuc">[답변 완료]</span>
            </c:if>
            <c:if test="${dto.acount==0}">
              <span class="answercntfail">[답변 대기중]</span>
            </c:if>
            <span style="color: #ccc; font-size: 13px; text-align: left;">
              <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
            </span>
          </td>
        </tr>
        <tr height="300" valign="top">
          <td>
            <pre>${dto.content}</pre>
            <!-- 댓글 목록 -->
            <span>답변 내용</span>
            <div class="alist">
            </div>
            <c:if test="${sessionScope.loginok!=null}">
              <div class="aform">
                <form id="aform">
                  <input type="hidden" name="qna_num" value="${dto.qna_num}">
                  <input type="hidden" name="user_num" value="${dto.user_num}">
                 <%-- <input type="hidden" name="id" value="${sessionScope.loginid}">
                  <input type="hidden" name="name" value="${sessionScope.loginname}">--%>
                  <c:if test="${sessionScope.isadmin eq 'admin'}">
                  <div class="input-group">
                    <textarea name="message" id="message" class="form-control"></textarea>
                    <button type="button" class="btn btn-dark btn-sm" id="btnsave" user_num="${user_num}">등록</button>
                  </div>
                  </c:if>
                </form>
              </div>
            </c:if>
          </td>
        </tr>
        <tr>
          <td>
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