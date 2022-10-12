<%--
  Created by IntelliJ IDEA.
  User: ostsc
  Date: 2022-10-12
  Time: 오후 2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h1>trip insert form</h1>
  <form action="tripinsertact" method="post" enctype="multipart/form-data">
      <div>이름<input type="text" name="title" class="form-control" required="required"></div>
      <div>주소<input type="text" name="addr" class="form-control" required="required"></div>
      <div>설명<input type="text" name="content" class="form-control" required="required"></div>
      <div>위도<input type="text" name="lat" class="form-control" required="required" placeholder="36.12839182"></div>
      <div>경도<input type="text" name="lon" class="form-control" required="required" placeholder="126.283194237"></div>
      <div>구<input type="text" name="gu" class="form-control" required="required" placeholder="1~25"></div>
      <div><input type="file" name="upload" class="form-control"></div>
      <button type="submit" class="btn btn-outline-secondary">트립코스 추가</button>
  </form>
</body>
</html>
