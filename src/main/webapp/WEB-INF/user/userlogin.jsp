<%--
  Created by IntelliJ IDEA.
  User: dmltk
  Date: 2022-09-30
  Time: 오후 1:59
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
            <h1 style="text-align: center;"><b>로그인</b></h1>
        </caption>
        <tr>
            <td>
                <div class="input-group">
                    <input type="text" placeholder="아이디" id="loginid2" name="loginid"
                           class="form-control" style="width: 120px;" required="required">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group">
                    <input type="password" style="width: 10px; font-family: 'Jua';" class="form-control"
                           name="pass" id="pass" placeholder="비밀번호" maxlength="20"
                           required="required">
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group">
                    <button type="button" class="btn btn-success" style="background-color: black; width:530px;" id="btnloginok">로그인 하기</button>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group">
                    <button type="button" class="btn btn-success"  id="btnsocial1" >네이버</button>
                    &nbsp;&nbsp;
                    <button type="button" class="btn btn-success"  id="btnsocial2" style="background-color: yellow; color:black;">카카오</button>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="input-group">
                    <button type="button" onclick="location.href='${root}/user/userform'" class="btn btn-success"  id="btnjoin" style="border-radius:30px; background-color: white; width:530px; color:black;">간편 회원가입</button>
                </div>
            </td>
        </tr>
    </table>
</div>
<!-- 스크립트 이벤트 -->
<script type="text/javascript">
    //로그인창에 있는 로그인 버튼
    $("#btnloginok").click(function(){
        //아이디와 비번 읽기
        var id=$("#loginid").val();
        // console.log(id);
        var pass=$("#loginpass").val();
        // console.log(pass);
        var root='${root}';

    });

   /* //로그아웃
    $("#logout").click(function(){
        var root='${root}';
        $.ajax({
            type:"get",
            url:root+"/user/logout",
            dataType:"text",
            success:function(res){
                alert("로그아웃 되었습니다.")
                location.reload();

            }//success

        });//ajax
    });*/

</script>
</body>
</html>
