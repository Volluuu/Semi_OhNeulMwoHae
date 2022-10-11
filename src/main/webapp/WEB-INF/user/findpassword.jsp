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
            <h1 style="text-align: center;"><b>비밀번호 찾기</b></h1>
        </caption>
        <tr>
            <td>
                <div style="text-align: center;">
                    <h7>비밀번호</h7>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="text-align: center;">
                    ${user.password}
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group">
                    <button type="button" class="btn btn-success" style="background-color: black; width:530px;" id="btncellphone" onClick="location.href='${root}/'">메인페이지로 이동</button>
                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
