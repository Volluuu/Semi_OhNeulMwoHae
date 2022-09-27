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

    div.gmapmain h1{
    	float: left;
    }
    div.gmapmain iframe{
    	float: left;
    	width: 65%;
    }
    div.gmapmain table{
    	float: right;
    	width: 35%;
    	line-height:50px;
    	vertical-align: middle;
    }
    
    </style>
</head>
<body>
<h1>찾아오시는길</h1>

<div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=975192c3e707d21a2b0a6dda745636ec"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
</script>
	<table>
		<tr>
			<th>주소</th>
		</tr>
		<tr>
			<td>서울특별시 강남구 역삼동 819-3, 5층~9층</td>
		</tr>
		<tr>
			<th>대표번호</th>
		</tr>
		<tr>
			<td>02)3486-0070</td>
		</tr>
		<tr>
			<th>지하철</th>
		</tr>
		<tr>
			<td>신논현역 9호선 5번출구 - 강남역 방향 도보 12분<br>
				강남역 2호선 11번출구 - 신논현역 방향 도보 4분</td>
		</tr>
		<tr>
			<th>버스</th>
		</tr>
		<tr>
			<td>하차) 강남역12번출구(강남역, 강남역사거리방면)</td>
		</tr>
	</table>

</body>
</html>