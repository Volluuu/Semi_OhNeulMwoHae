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
<style type="text/css">
	div.menumain a{
		margin: 0 auto;
		text-align: center;
		text-decoration: none;
		color: black;
		font-size: 30px;
		font-family: 'Abril Fatface';
		margin-left: 30px;
		margin-right: 30px;
		width: 200px;
		height: 150px;
	}
    .menumain a:hover {
		cursor: pointer;
		color: white;
		background-color: black;
		width: 200px;
		height: 150px;
	}
  
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div class="menumain">
  <a href="${root}/">Home</a>   
  <a href="${root}/member/form">1st</a>       
  <a href="${root}/member/form">2nd</a>       
  <a href="${root}/member/form">3rd</a>       
  <a href="${root}/member/form">4th</a>       
  <a href="${root}/help/map">GoogleMap</a>           
</div>
</body>
</html>



























