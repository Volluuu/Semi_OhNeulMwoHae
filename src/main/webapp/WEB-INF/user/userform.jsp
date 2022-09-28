<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
      href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    >
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
<style type="text/css">

    
    #showimg{
    	border: 1px solid lightgray;
    	width: 150px;
    	height: 180px;
    }
    
    </style>
    <script type="text/javascript">
    	$(function(){
    		//버튼 클릭 시 사진 불러오는 이벤트 추가
    		$("#btnphoto").click(function(){
				$("#myphoto").trigger("click");
			});//photo click
			
			
			//사진 미리보기 코드
			$("#myphoto").change(function(){
				 //console.log("1:"+$(this)[0].files.length);
				 //console.log("2:"+$(this)[0].files[0]);
				 //정규표현식
				var reg = /(.*?)\/(jpg|jpeg|png|bmp|gif)$/;
				var f=$(this)[0].files[0];//현재 선택한 파일
				if(!f.type.match(reg)){
				  alert("확장자가 이미지파일이 아닙니다");
				  return;
				}
				 if($(this)[0].files[0]){
				  var reader=new FileReader();
				  reader.onload=function(e){
				   $("#showimg").attr("src",e.target.result);
				  }
				  reader.readAsDataURL($(this)[0].files[0]);
				 }
			});//change
			
			//아이디 입력 시, .idsuccess 값 지움
			$("#loginid").keyup(function(e) {	
				$("div.idsuccess").text("");		
			});//아이디 지움 event
			
			//ajax함수는 url에서 안보임(back에서만 처리한느 함수라서)
			//중복체크 버튼 시 아이디 체크
			$("#btnidcheck").click(function() {
				$.ajax({
					type:"get",
					dataType:"json",
					url:"idcheck",
					data:{"id":$("#loginid2").val()},
					success:function(res){
						if(res.count==0){
							$("div.idsuccess").text("ok");
						}else{
							$("div.idsuccess").text("fail");
						}
					}//success
				});//ajax
			});//idcheck
			
			
			//2번째 비밀번호 입력 시 체크
			$("#pass2").keyup(function(){
				var p1=$("#pass").val();
				var p2=$(this).val();
				if(p1==p2){
					$("div.passsuccess").text("ok");
				}else{
					$("div.passsuccess").text("");
				}
			});//pass2
			
    	});//$function
    	
    	//submit 전에 호출
    	function check() {
    		//사진 여부
    		if($("#myphoto").val()==""){
				alert("사진이 없습니다");
				return false;
			}
			//id 중복체크 여부
			if($("div.idsuccess").text()!='ok'){
				alert("아이디 중복 체크를 해주세요");
				return false;
			}
			//비밀번호 체크 여부
			if($("div.passsuccess").text()!='ok'){
				alert("비밀번호가 서로 다릅니다");
				return false;
			}
		}//check()
    	
    </script>
    
</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
	<table class="table table-bordered" style="width: 700px; margin-left: 300px;">
		<caption align="top"><h1 class="alert alert-dark"><b>회원가입</b></h1></caption>
		<tr>
			<td style="width: 250px;" rowspan="4" align="center">
				<input type="file" id="myphoto" name="myphoto" style="display: none;">
				
				<button type="button" id="btnphoto" class="btn btn-dark">사진선택</button>
				<br>
				<img id="showimg">
			</td>
			<td>
				<div class="input-group">
				<input type="text" placeholder="아이디 입력" id="loginid2" name="loginid" class="form-control"
				style="width: 120px;" required="required">
				<button type="button" class="btn btn-dark btn-sm" id="btnidcheck">중복체크</button>
				&nbsp;
				<div class="idsuccess">id check</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
					<input type="password" style="width: 120px;" class="form-control" 
					name="pass" id="pass" placeholder="숫자4자리 입력" maxlength="4" pattern="[0-9]{4,}" required="required">
					
					<input type="password" style="width: 120px;" class="form-control" 
					id="pass2" placeholder="숫자4자리 확인" maxlength="4" pattern="[0-9]{4,}" required="required">
					&nbsp;
					<div class="passsuccess">pass check</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요" required="required">
			</td>
		</tr>
		<tr>
			<td>
				<input type="email" name="email" class="form-control" placeholder="이메일을 입력해주세요" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div class="input-group">
					<input type="text" name="hp" placeholder="(-)없이 Hp번호만 입력해주세요" class="form-control"
					style="width: 200px;" required="required">
					
					<input type="text" name="address" placeholder="주소를 입력해주세요" class="form-control"
					style="width: 300px;" required="required">
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-dark" style="width: 180px;">회원가입</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>























