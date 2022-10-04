<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring5+Tiles3+Mybatis</title>
<link
      href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    >
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
<c:set var="root" value="<%=request.getContextPath()%>"/>
	<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
    * {
		font-family:"Dohyeon";
		font-size: 20px;

	}
    div.mainlayout1 {
    	width: 100%;
		height: 100vh;

    }
    
    
  /*  div.mainlayout1 #info{
    	float: right;
    	width: 20%;
    }
    
    div.mainlayout1 #main{
    	width: 100%;
		margin: 0 auto;
    }*/
    
    #header{
    	width: 100%;
    	height: 150px;
    	text-align: center;
    	line-height: 130px;
		box-shadow: 1px 1px 20px lightgray;
    }
    
    /*#menu{
    	width: 100%;
    	height: 140px;
    	text-align: center;
    	margin: 0 auto;
    }*/
    
   #info{

    }
    
    #main{
		margin-top: 5%;
    }
</style>
</head>
<body>
<div class="mainlayout1">

	<div class="main" id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	<%--<div class="main" id="menu">
		<tiles:insertAttribute name="menu"/>
	</div>--%>
	<div class="main" id="main">
		<tiles:insertAttribute name="main"/>
	</div>
	<div class="main" id="info">
		<tiles:insertAttribute name="info"/>
	</div>
</div>
</body>
</html>
























