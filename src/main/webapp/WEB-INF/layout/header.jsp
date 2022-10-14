	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Anton&family=Dancing+Script:wght@600&family=Dongle&family=Edu+VIC+WA+NT+Beginner:wght@500&family=Gamja+Flower&family=Indie+Flower&family=Jua&family=Merriweather:ital@1&family=Nabla&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@500&family=Palanquin:wght@200&display=swap"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style type="text/css">
	.title{
		text-align: center;
		display: flex;
		/*position: fixed;*/
		background-color: white;
		margin: 0 auto;
		vertical-align: middle;
		/*background-color: #38B6FF;*/
	}


	.logo {
		width: 150px;
		height: 150px;
		margin-left: 50px;
	}

	.logo img{
		width: 100px;
		height: 100px;
	}

	.menu{
		/*width: 40%;*/
		min-width: 600px;
		margin: 0 auto;
		text-align: center;
		font-weight: bold;
	}

	.menu1{

	}
	.menu a{
		margin-left: 20px;
		margin-right: 20px;
		text-decoration: none;
		color: black;
		cursor: pointer;
	}

	.menu a:hover{
		text-shadow: 10px 10px 10px black;
		color: black;
		cursor: pointer;
	}

	.search_bar{
		width: 450px;
	}


	.myinfo{
		min-width: 100px;
		margin-left: 20px;
		font-weight: bold;
	}

	.myinfo a{
		text-decoration: none;
		margin-left: 20px;
		margin-right: 20px;
		color: black;
		font-size: 12px;
	}

	.myinfo a:hover{
		color: black;
		cursor: pointer;
		text-shadow: 10px 10px 10px black;
	}

	.my1{
		float: right;
		width: 300px;
		text-align: center;
	}
	/* 로그인 버튼 */
	/*#loginstate{
		position: absolute;
		right: 100px;
		width: 100px;
		height: 150px;
	}*/

	#btnlogin {
		right: 50px;
		top: auto;
		font-size: 12px;
	}

	#loginstate>b{
		height: 20px;
		right: 50px;
	}

	#btnlogout {
		right: 50px;
		font-size: 12px;
	}



</style>

</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>" />
<div class="title">
		<div class="logo">
			<a href="${root}/home"><img src="${root}/image/logo1.jpg"></a>
		</div>
		<div class="menu">
			<div class="input-group menu1">
				<a href="${root}/qna/qnalist">고객센터</a>
				<a href="${root}/courseboard/list">추천 코스</a>
				<a href="${root}/findboard/list">친구 찾기</a>
				<a href="${root}/help/map?user_num=${sessionScope.user_num}">경로 설정</a>
				<c:if test="${sessionScope.isadmin=='admin'}">
				<a href="${root}/admin/list">관리자페이지</a>
				</c:if>
			</div>
		</div>
		<div class="search_bar">
			<%--<div class="input-group search1">
				&lt;%&ndash;<select class="form-control sel1">
					<option selected disabled hidden class="op1">게시판 선택</option>
					<option class="op1">경로 추천</option>
					<option class="op1">친구 찾기</option>
				</select>
				<input type="text" class="form-control in1" placeholder="원하는 장소를 검색하든지 말든지">
				<button class="form-control btn1"><i class='fas fa-search'></i></button>&ndash;%&gt;
			</div>--%>
		</div>
	<div class="myinfo">
		<div class="input-group my1">
			<c:if test="${sessionScope.loginok!=null}">
				<a href="${root}/mypage/mypagedetail">마이페이지</a>
			</c:if>
			<c:if test="${sessionScope.loginok==null}">
			<a href="${root}/user/userform">회원가입</a>
			</c:if>
		</div>
	</div>

	<span id="loginstate">
		<c:if test="${sessionScope.loginok==null}">
				<button type="button" class="btn btn-success" id="btnlogin"
						data-bs-toggle="modal" data-bs-target="#myLoginModal" style="background-color: white; color:black;">로그인</button>
		</c:if>

			<c:if test="${sessionScope.loginok!=null}">
				<b>${sessionScope.loginname}님</b>
				&nbsp;&nbsp;
				<button type="button" class="btn btn-danger" id="btnlogout" style="background-color: white; color:black;">로그아웃</button>
			</c:if>
	</span>




	<!-- 로그인창 -->
	<div class="modal" id="myLoginModal" >
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" style="margin-left: 180px;">로그인</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="input-group mb-3 input-group">
						<span class="input-group-text">아이디</span>
						<input type="text" class="form-control" id="loginid">
					</div>
					<div class="input-group mb-3 input-group" style="font-family: Jua;">
						<span class="input-group-text">비밀번호</span>
						<input type="password" class="form-control" id="loginpass">
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">

						<button type="button" class="btn btn-success" data-bs-dismiss="modal" id="btnloginok" style="background-color: #00AAFF; color: white; width:480px;">로그인</button>
						<div class="input-group" style="width:65%; text-align: center; margin: 0 auto;">
						<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=h329mamXhLqa2E3NXaS3&redirect_uri=http://localhost:9000/user/naver" style="width: 150px;">
							<img src="${root}/image/naverlogin2.png" style="width: 100px; margin-top: 24px;">
						</a>
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=3ed5690883b3d1e49474845d49aad6d5&redirect_uri=http://localhost:9000/user/kakao&response_type=code" style="width: 150px;">
							<img src="${root}/image/kakaologin3.png" style="width: 100px; margin-top: 24px;">
						</a>
						</div>
						<div class="input-group" style="text-align: center;">
							<a href="${root}/user/userid" style="width: 140px;text-decoration: none;color:gray;">아이디 찾기</a>
							<a href="${root}/user/findpwview" style="width: 140px;text-decoration: none;color:gray; margin-left: 20px;">비밀번호 찾기</a>
							<a href="${root}/user/userform" style="width: 140px;text-decoration: none;color:gray; margin-left: 10px;">회원가입</a>

						</div>
						<%--<button type="button" onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=h329mamXhLqa2E3NXaS3&redirect_uri=http://localhost:9000/user/naver'" class="btn btn-success"  id="btnsocial1" style="width: 260px;">네이버</button>
						<button type="button" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=3ed5690883b3d1e49474845d49aad6d5&redirect_uri=http://localhost:9000/user/kakao&response_type=code'" class="btn btn-success"  id="btnsocial2" style="width: 260px; background-color: yellow; color:black;">카카오</button>--%>
					<%--<button type="button" onclick="location.href='${root}/user/userform'" class="btn btn-success"  id="btnjoin" style="border-radius:30px; background-color: white; width:260px; color:black;">간편 회원가입</button>
					<button type="button" onclick="location.href='${root}/user/userid'" class="btn btn-success"  id="btnid" style="border-radius:30px; background-color: white; width:260px; color:black;">아이디 찾기</button>
					<button type="button" onclick="location.href='${root}/user/userpassword'" class="btn btn-success"  id="btnpassword" style="border-radius:30px; background-color: white; width:260px; color:black;">비밀번호 찾기</button>--%>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 스크립트 이벤트 -->
	<script type="text/javascript">
		//팝업창에 있는 로그인 버튼
		$("#btnloginok").click(function(){
			//아이디와 비번 읽기
			var id=$("#loginid").val();
			// console.log(id);
			var pass=$("#loginpass").val();
			// console.log(pass);
			var root='${root}';

				//console.log("root"+root);
				$.ajax({
					type:"get",
					url:root+"/user/login",
					dataType:"json",
					data:{"loginid":id,"password":pass},
					success:function(res){			
						if(res.result=='fail'){
							alert("아이디나 비번이 맞지 않습니다");
						}else{
							location.href = "${root}/home";
						}
					}//success
					
				}); //ajax
		});

		
		//로그아웃
		$("#btnlogout").click(function(){
			var root='${root}';
			$.ajax({
				type:"get",
				url:root+"/user/logout",
				dataType:"text",
				success:function(res){
					location.href = "${root}/home";
					
				}//success
				
			});//ajax
		});

		//엔터키로 누르면 로그인
		$("#myLoginModal").keypress(function (e){
			if(e.keyCode==13){
				var id=$("#loginid").val();
				// console.log(id);
				var pass=$("#loginpass").val();
				// console.log(pass);
				var root='${root}';

				//console.log("root"+root);
				$.ajax({
					type:"get",
					url:root+"/user/login",
					dataType:"json",
					data:{"loginid":id,"password":pass},
					success:function(res){
						if(res.result=='fail'){
							alert("아이디나 비번이 맞지 않습니다");
						}else{
							location.href = "${root}/home";

						}
					}//success

				}); //ajax
			}
		});

	</script>

</body>
</html>