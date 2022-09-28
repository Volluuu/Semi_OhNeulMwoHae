<%--
  Created by IntelliJ IDEA.
  User: ostsc
  Date: 2022-09-28
  Time: 오전 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    div.dg_searcharea {
        width: 100%;
        text-align: center;
    }
    div.dg_findlist{
        margin-top: 10px;
    }
    button.dg_searchbtn {
        margin-left: 10px;
    }

    input.dg_inputtext {

    }

    a.dg_a {
        color: gray;
        text-decoration: none;
    }

    a.dg_a:link, a.dg_a:visited {
        color: dimgray;
        text-decoration: none;
    }

    a.dg_a:hover, a.dg_a:active {
        color: black;
        text-decoration: underline;
    }
</style>
<body>
<%-- 검색창 --%>
<div class="dg_searcharea">
    <form action="list">
        <select name="findcolumn" class="dg_select">
            <option value="subject" selected>제목</option>
            <option value="content">내용</option>
            <option value="subcon">제목+내용</option>
            <option value="nickname">닉네임</option>
        </select>
        &nbsp;&nbsp;&nbsp;
        <input type="text" name="findword" class="dg_inputtext" placeholder="검색 단어" value="${param.findword}">

        <button type="submit" class="dg_searchbtn">검색</button>
    </form>

    <a href="list?findcolumn=nickname&searchword=${sessionScope.nickname}" class="dg_a">내가 쓴 글</a>
</div>
<div class="dg_findlist">
    <h4>총 ${totalCount}개의 글이 있습니다</h4>
    <br>

</div>


</body>
</html>
