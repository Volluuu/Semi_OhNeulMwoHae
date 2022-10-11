<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: dmltk
  Date: 2022-10-06
  Time: 오후 3:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        div.usermain{
            position: absolute;
            margin: -100px 0px 0px -200px;
            top: 30%;
            left: 45%;
            padding: 5px;


        }
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>" />
<div class="usermain">
    <table class="table table-bordered" style="width: 530px">
        <caption align="top">
            <h1 style="text-align: center;"><b>아이디 찾기</b></h1>
        </caption>
        <tr>
            <td>
                <div style="text-align: center;">
                    <h7>아이디</h7>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div>
                    <ol>
                <c:forEach items="${user}" var="user">
                    <li>${user.loginid}</li>
                </c:forEach>
                    </ol>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
