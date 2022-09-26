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
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
  
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>

<div id="demo" class="carousel slide" data-bs-ride="carousel" style="width: 80%;">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${root}/image/wallpaper1.jpg" alt="Los Angeles" class="d-block" style="width:100%; height: 500px;">
    </div>
    <div class="carousel-item">
      <img src="${root}/image/wallpaper2.jpg" alt="Chicago" class="d-block" style="width:100%;height: 500px;">
    </div>
    <div class="carousel-item">
      <img src="${root}/image/wallpaper3.jpg" alt="New York" class="d-block" style="width:100%;height: 500px;">
    </div>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>

<!-- <div class="container-fluid mt-3">
  <h3>Carousel Example</h3>
  <p>The following example shows how to create a basic carousel with indicators and controls.</p>
</div> -->
<h1>소태호 커밋 테스트</h1>
<h2>소태호 커밋 테스트 2번째</h2>
<h3>소태호 커밋 테스트 3번째</h3>
<h4> 박재우 테스트 4 </h4>
<h3>소태호 커밋 1번</h3>
<h3>소태호 커밋 2 번</h3>
</body>
</html>