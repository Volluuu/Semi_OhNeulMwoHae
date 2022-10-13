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
                    <h7>이메일로 전송했습니다</h7>
                </div>
            </td>
        </tr>
        <tr>
            <td>
               <div  style="width: 460px; margin-left: 80px;">
                   <button type="button" class="btn btn-success" id="btnlogin" data-bs-toggle="modal" data-bs-target="#myLoginModal" style="background-color: #00AAFF; color:white; width:200px; height:50px; font-size: 20px;">로그인</button>
                   <button type="button" class="btn btn-success" style="background-color: #00AAFF; width:200px; font-size: 20px;" id="btncellphone" onClick="location.href='${root}/home'">목록</button>

                </div>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
