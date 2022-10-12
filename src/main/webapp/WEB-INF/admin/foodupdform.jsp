<%--
  Created by IntelliJ IDEA.
  User: ostsc
  Date: 2022-10-12
  Time: 오후 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>title</title>
</head>
<body>
    <h1>${dto.title} 수정</h1>
    <form action="foodupdact" method="post" enctype="multipart/form-data">
        <input type="hidden" name="food_num" value="${dto.food_num}">
        <input type="hidden" name="currentPage" value="${currentPage}">
        <div>이름<input type="text" name="title" class="form-control" required="required" value="${dto.title}"></div>
        <div>주소<input type="text" name="addr" class="form-control" required="required" value="${dto.addr}"></div>
        <div>카테고리<input type="text" name="category" class="form-control" required="required" value="${dto.category}"></div>
        <div>대표메뉴<input type="text" name="menu" class="form-control" required="required" value="${dto.menu}"></div>
        <div>전화번호<input type="text" name="tel" class="form-control" required="required" value="${dto.tel}"></div>
        <div>위도<input type="text" name="lat" class="form-control" required="required" value="${dto.lat}"></div>
        <div>경도<input type="text" name="lon" class="form-control" required="required" value="${dto.lon}"></div>
        <div>구<input type="text" name="gu" class="form-control" required="required" value="${dto.gu}"></div>
        <div>사진 선택을 안하면 기존 사진이 유지됩니다<input type="file" name="upload" class="form-control"></div>
        <button type="submit" class="btn btn-outline-secondary">푸드코스 수정</button>
    </form>
</body>
</html>
