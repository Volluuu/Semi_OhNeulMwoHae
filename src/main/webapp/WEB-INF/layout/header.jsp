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
		width: 100%;
		text-align: center;
		display: flex;
	}

	.logo {
		width: 5%;
		height: 150px;
		margin-left: 50px;
	}

	.logo img{
		width: 150px;
		height: 150px;
	}

	.menu{
		margin-left: 100px;
	}

	.menu1{
		width: 35%;
		text-align: center;
	}
	.menu a{
		margin-left: 20px;
		margin-right: 20px;
		text-decoration: none;
		color: black;
		cursor: pointer;
	}

	.menu a:hover{
		background-color: black;
		color: white;
		cursor: pointer;
	}

	.search_bar{
		width: 450px;
		margin-left: 100px;
	}

	.search1{
		width: 20%;
		height: 15px;
		margin-top: 40px;
	}

	div.search1 .sel1{
		width: 120px;
		font-size: 13px;
		color: gray;
	}

	div.search1 .op1{
		width: 120px;
		font-size: 15px;
		color: black;
	}

	div.search1 .in1{
		width: 250px;
		font-size: 15px;
	}
	div.search1 .btn1{
		width: 50px;
	}

	.myinfo{
		margin-left: 100px;
	}

	.myinfo a{
		text-decoration: none;
		margin-left: 20px;
		margin-right: 20px;
		color: gray;
		font-size: 15px;
	}

	.myinfo a:hover{
		background-color: black;
		color: white;
		cursor: pointer;
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
			<a href="${root}/"><img src="${root}/image/logo1.jpg"> </a>
		</div>
		<div class="menu">
			<div class="input-group menu1">
				<a href="${root}/">Home</a>
				<a href="${root}/board/list">Board</a>
				<a href="${root}/board/form">Board form</a>
				<a href="${root}/member/list">Memberlist</a>
				<a href="${root}/member/form">Sign</a>
				<a href="${root}/help/map">GoogleMap</a>
			</div>
		</div>
		<div class="search_bar">
			<div class="input-group search1">
				<select class="form-control sel1">
					<option selected disabled hidden class="op1">게시판 선택</option>
					<option class="op1">경로 추천</option>
					<option class="op1">친구 찾기</option>
				</select>
				<input type="text" class="form-control in1" placeholder="원하는 장소를 검색하든지 말든지">
				<button class="form-control btn1"><i class='fas fa-search'></i></button>
			</div>
		</div>
		<div class="myinfo">
			<div class="input-group my1">
				<a href="#">마이페이지</a>
				<a href="#">몰라</a>
				<a href="#">몰라 2</a>
			</div>
		</div>

	<span id="loginstate">
		<c:if test="${sessionScope.loginok==null}">
			<button type="button" class="btn btn-outline-secondary btn-sm" id="btnlogin"
					data-bs-toggle="modal" data-bs-target="#myModal">로그인</button>
		</c:if>
		<c:if test="${sessionScope.loginok!=null}">
			<b>${sessionScope.loginname}님</b>
			<button type="button" class="btn btn-danger btn-sm" id="btnlogout">로그아웃</button>
		</c:if>
	</span>
	<!-- 로그인창 -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원 로그인</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">LoginId</span>
						<input type="text" class="form-control" id="loginid">
					</div>

					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">LoginPass</span>
						<input type="password" class="form-control" id="loginpass">
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-bs-dismiss="modal" id="btnloginok">Login</button>
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
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
			var pass=$("#loginpass").val();
			var root='${root}';
				console.log("root"+root);
				$.ajax({
					type:"get",
					url:root+"/member/login",
					dataType:"json",
					data:{"id":id,"pass":pass},
					success:function(res){			
						if(res.result=='fail'){
							alert("아이디나 비번이 맞지 않습니다");
						}else{
							location.reload();
						}
					}//success
					
				}); //ajax
		});
		
		//로그아웃
		$("#btnlogout").click(function(){
			var root='${root}';
			$.ajax({
				type:"get",
				url:root+"/member/logout",
				dataType:"text",
				success:function(res){			
					location.reload();
					
				}//success
				
			});//ajax
		});

	</script>

</body>
</html>