<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Anton&family=Dancing+Script:wght@600&family=Dongle&family=Edu+VIC+WA+NT+Beginner:wght@500&family=Gamja+Flower&family=Indie+Flower&family=Jua&family=Merriweather:ital@1&family=Nabla&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@500&family=Palanquin:wght@200&display=swap" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style type="text/css">

	.infomain{
		margin: 0 auto;
		position:absolute;
		width: 100px;
		height: 250px;
		display: inline-block;
		background-color: transparent;
		right: 50px;
		bottom: 10%;
		text-align: center;
		z-index: 1;
	}
/*
    div.infotb table.table-bordered {
    	width: 100px;
    	height: 200px;
    	margin: 0 auto;
    	border: 0px solid white;
    	
    }*/

    #proimg {
    	width: 100%;
    	height: 90px;
    	text-align: center;
		margin: 0 auto;
    }


	a.up1{
		width: 100%;
	}

	i.top{
		font-size: 50px;
		color: black;
		margin-top: 20px;
		margin-bottom: 20px;
		text-shadow: 5px 5px 8px gray;
	}

	.gohome{
		font-size: 50px;
		color: black;
		text-shadow: 5px 5px 8px gray;
	}

</style>
	<script>
	$(function (){

		$(document).on("click",".top",function(){
			$( 'html, body' ).animate( { scrollTop : 0 }, 50 );
			return false;
		});

		$(document).ready(function(){
			var currentPosition = parseInt($(".infomain").css("top"));

			$(window).scroll(function() {
				var position = $(window).scrollTop();
				$(".infomain").stop().animate({"top":position+currentPosition+"px"},200);
			});
		});
	});
	</script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div class="infomain">

	<!-- 로그인한 상태에서는 로그인한 멤버의 사진이 나오도록한다 -->

	<c:if test="${sessionScope.loginok==null}">
		<a href="${root}/mypage/mypagedetail"><img src="${root}/image/profile.jpg" class="rounded-circle" id="proimg" onerror="this.src='${root}/image/noimage.jpg';"></a>
	</c:if>
	<c:if test="${sessionScope.loginok!=null}">
	<a href="#"><img src="${root}/upload/${sessionScope.loginphoto}" class="rounded-circle" id="proimg"></a>
	</c:if>
	<a href="#" class="up1"><i class='far fa-arrow-alt-circle-up top'></i></a>
	<a href="${root}/"><i class='fas fa-home gohome'></i></a>
<br><br>
<%--
	<div class="infotb">
		<table class="table table-bordered">
			<tr>
				<th>
					<i class="bi bi-person-fill"></i>
				</th>
				<td>
					<c:if test="${sessionScope.loginok==null}">
						-
					</c:if>
					<c:if test="${sessionScope.loginok!=null}">
						${sessionScope.loginname}
					</c:if>
				</td>
			</tr>
			<tr>
				<th>
					<i class="bi bi-phone-fill"></i>
				</th>
				<td>
					<c:if test="${sessionScope.loginok==null}">
						-
					</c:if>
					<c:if test="${sessionScope.loginok!=null}">
						${sessionScope.loginhp}
					</c:if>
				</td>
			</tr>
			<tr>
				<th>
					<i class="bi bi-envelope-fill"></i>
				</th>
				<td>
					<c:if test="${sessionScope.loginok==null}">
						-
					</c:if>
					<c:if test="${sessionScope.loginok!=null}">
						${sessionScope.loginemail}
					</c:if>
				</td>
			</tr>
		</table>
	</div>--%>
</div>
</body>
</html>