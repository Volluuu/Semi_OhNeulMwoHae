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
<style type="text/css">
.title h1 {
	font-family: 'Abril Fatface';
	font-size: 70px;
	margin-top: 20px;
	margin-left: 20px;
	height: 100px;
	font-style: italic;
}

#btnlogin {
	position: absolute;
	right: 100px;
}



#loginstate>b {
	position: absolute;
	right: 100px;
} 
#btnlogout {
	position: absolute;
	right: 100px;
}

</style>

</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>" />
<div class="title">
		<a href="${root}/" style="text-decoration: none;color: black;"><h1>Bitcamp</h1></a> 
	</div>
	
<span id="loginstate"> 
		<c:if test="${sessionScope.loginok==null}">
			<button type="button" class="btn btn-secondary" id="btnlogin"
				data-bs-toggle="modal" data-bs-target="#myModal">로그인</button>
		</c:if> 
		<c:if test="${sessionScope.loginok!=null}">
			<b>${sessionScope.loginname}님</b>
			&nbsp;&nbsp;
			<button type="button" class="btn btn-danger" id="btnlogout">로그아웃</button>
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