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
  
    div.infomain{
    	height: 800px;
    	vertical-align: middle;
    }
    
    div.infophoto img{
    	width: 200px;
    	height:200px;
    	border-radius: 100px;
    	margin:0 auto;
    	border: 1px solid black;
    }
    
    div.infotext{
    	width: 200px;
    	height: 350px;
    	margin: 0 auto;
    }
    
    div.infotb table.table-bordered {
    	width: 300px;
    	height: 300px;
    	margin: 0 auto;
    	border: 1px solid white;
    }
    
    div.infotb table tr th i{
    	font-size: 30px;
    }
    
    div.infotb table tr td{
    	font-size: 25px;
    }
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div class="infomain">
	<h1 style="font-family: Abril Fatface; font-style: italic;">Info</h1>
	<div class="infophoto">
	<img src="${root}/image/profile.jpg">
	</div>
<br><br>

	<div class="infotb">
		<table class="table table-bordered">
			<tr>
				<th>
					<i class="bi bi-person-fill"></i>
				</th>
				<td>홍길동
				</td>
			</tr>
			<tr>
				<th>
					<i class="bi bi-phone-fill"></i>
				</th>
				<td>010-1234-1234
				</td>
			</tr>
			<tr>
				<th>
					<i class="bi bi-envelope-fill"></i>
				</th>
				<td>bit701@bitcamp.co.kr
				</td>
			</tr>
		</table>
	</div>
</div>

</body>
</html>