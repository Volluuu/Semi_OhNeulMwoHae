<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<body>
<script type="text/javascript">



    var msg = "${msg}";

    if (msg != "") {
        alert(msg);
    }


</script>
<div class="p-5">
    <div class="text-center">
        <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
        <p class="mb-4">아이디와 이메일을 입력해주세요!</p>
    </div>
    <form class="user" action="/user/findpw" method="post">
        <div class="form-group">
            <input type="text" class="form-control form-control-user"
                   id="userId" aria-describedby="IdHelp" name="loginid"
                   placeholder="아이디 입력해주세요">
        </div>
        <div class="form-group">
            <input type="email" class="form-control form-control-user"
                   id="userEmail" aria-describedby="emailHelp" name="email"
                   placeholder="이메일 입력해주세요">
        </div>

        <button type="submit" class="btn btn-primary btn-user btn-block">
            비밀번호 찾기
        </button>
    </form>
</div>
</body>
</html>
