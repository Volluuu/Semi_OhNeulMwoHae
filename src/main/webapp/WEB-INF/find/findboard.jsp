<%--
  Created by IntelliJ IDEA.
  User: ostsc
  Date: 2022-09-28
  Time: 오전 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>"/>
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
<div class="dg_session">
    <c:if test="${sessionScope.loginok==null}">
        <b>로그인이 안 되어 있습니다</b>
        <button type="button" id="dg_loginbtn">세션 주기</button>
    </c:if>

    <c:if test="${sessionScope.loginok!=null}">
        <b>${sessionScope.name}님 로그인 중</b>
        &nbsp;&nbsp;
        <button type="button" id="dg_logoutbtn">세션 없애기</button>
    </c:if>
</div>
<script>
    $(document).on("click","#dg_loginbtn",function(){
        var root="${root}";
        console.log("root"+root);
        $.ajax({
            type:"get",
            url:root+"/findboard/login",
            dataType:"text",
            data:{"user_num":"1","loginid":"admin","password":"gudwns96",
                "name":"관리자","nickname":"관리자닉네임","email":"donggeonlee95@naver.com",
                "hp":"010-4154-8185","profile":"나는 관리자다","interest":"intp","profilephoto":"admin.png",
                "alarm":"없음","isadmin":"admin","gaipday":"2022-09-26 07:18:34"},
            success:function(res){
                    location.reload();
            },
        });
    });

    $(document).on("click","#dg_logoutbtn",function(){
        var root="${root}";
        $.ajax({
            type:"get",
            url:root+"/findboard/logout",
            dataType:"text",
            success:function(res){
                location.reload();

            }
        });
    })
</script>
<div class="dg_findlist">
    <h4>총 ${totalCount}개의 글이 있습니다</h4>
    <br>
    <c:if test="${sessionScope.loginok!=null}">
                <button type="button" class="btn btn-outline-success"
                        onclick="location.href='form'">글쓰기</button>
    </c:if>
</div>


</body>
</html>
