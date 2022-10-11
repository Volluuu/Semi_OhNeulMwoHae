<%--
  Created by IntelliJ IDEA.
  User: dmltk
  Date: 2022-10-03
  Time: 오후 5:15
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
<script type="text/javascript">



    var msg = "${msg}";

    if (msg != "") {
        alert(msg);
    }


</script>
<c:set var="root" value="<%=request.getContextPath()%>" />
<form class="user" action="/user/findpassword" method="POST">
<div class="usermain">
    <table class="table table-bordered" style="width: 530px">
        <caption align="top">
            <h1 style="text-align: center;"><b>비밀번호 찾기</b></h1>
        </caption>
        <tr>
            <td>
                <div style="text-align: center;">
                    <h7>가입한 아이디를 입력해주세요</h7>
                    <br>
                    <h7>아이디 입력을 통해 비밀번호를 확인합니다.</h7>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group">
                    <input type="text" placeholder="아이디를 입력해주세요" id="loginid3" name="loginid"
                           class="form-control" style="width: 120px;" required="required">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group">
                    <button type="submit" class="btn btn-success" style="background-color: black; width:530px;" id="btncellphone">비밀번호 확인하기</button>
                </div>
            </td>
        </tr>
    </table>
</div>
</form>

</body>
</html>
