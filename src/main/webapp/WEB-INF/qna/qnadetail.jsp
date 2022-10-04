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
    $(function (){

      console.log("num="+num);

      list();// 처음시작 시 댓글 출력

      //삭제 이벤트
      $(document).on("click",".adel",function() {
        var idx=$(this).attr("idx");
        var ans=confirm("정말 삭제하시겠습니까?");
        if(ans){
          $.ajax({
            type:"get",
            url:"../answer/delete",
            dataType:"text",
            data:{"idx":idx},
            success:function(res){
              alert("삭제하였습니다");
              list();
            }//sucess
          });//ajax
        };
      });//click

      //댓글저장
      $("#btnsave").click(function() {
        var fdata=$("#aform").serialize();//form태그안의 name을 쿼리 스트링 형태로 읽어온다
        //alert(fdata);
        $.ajax({
          type:"post",
          url:"../answer/insert",
          dataType:"text",
          data:fdata,
          success:function(res){
            list();//댓글 내용만 바뀐다.location.reload();도 가능함, 댓글 목록을 다시 db에서 가져와 출력

            //입력값이랑 사진 안보이게 처리
            $("#message").val("");
            $("#aphoto").attr("src","").css("display","none");
          }//success
        }); //ajax
      });

    });

    function list() {
      var loginok='${sessionScope.loginok}';
      var loginid='${sessionScope.loginid}';
      var writerid='${dto.id}';
      //alert(loginok+","+loginid);
      //alert(writerid);

      var s="";
      $.ajax({
        type:"get",
        url:"../answer/list",
        dataType:"json",
        data:{"num":num},
        success:function(res){
          $("b.banswer").text(res.length);//댓글 갯수 출력
          $.each(res, function(i, elt){
            s+="<div>"+elt.name;
            if(writerid==elt.id){
              s+="<span class='writer'>작성자</span>";
            }
            s+="<br>";
            s+="<pre>"+elt.message;
            s+="<span class='day'>"+elt.writeday;
            if(loginok=='yes' && loginid==elt.id){
              s+="<i class='material-icons adel' style='font-size:17px;' id='adel' idx="+elt.idx+">close</i>"
            }
            s+="</span></pre></div>";
          });
          $("div.alist").html(s);
        }//success
      }); //ajax
    };//function
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