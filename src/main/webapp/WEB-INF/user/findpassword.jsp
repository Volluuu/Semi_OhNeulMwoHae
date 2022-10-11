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
    </table>
</div>
</body>
</html>
