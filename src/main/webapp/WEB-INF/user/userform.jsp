<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link
            href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
            rel="stylesheet"
    >
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <style type="text/css">
        div.usermain{
            width: 1500px;
            height: 90vh;
            /*border: 2px solid black;*/
            margin: 0 auto;
        }
        .user_main{
            width: 50%;
            /*border: 1px solid red;*/
            margin: 0 auto;
        }
        #useraddbtn{
            width: 100%;
            height: 50px;
            -webkit-font-smoothing: antialiased;
        }
        #useraddbtn span{
            position: relative;
            top: 5px;
            display: inline-block;
            animation: bounce .5s ease infinite alternate;
            font-size: 20px;
            color: #FFF;
            text-shadow: 0 1px 0 #CCC,
            0 2px 0 #CCC,
            0 3px 0 #CCC,
            0 4px 0 #CCC,
            0 5px 0 #CCC,
            0 6px 0 transparent,
            0 7px 0 transparent,
            0 8px 0 transparent,
            0 9px 0 transparent,
            0 10px 10px rgba(0, 0, 0, .4);
        }

        #useraddbtn span:nth-child(2) { animation-delay: .1s; }
        #useraddbtn span:nth-child(3) { animation-delay: .2s; }
        #useraddbtn span:nth-child(4) { animation-delay: .3s; }
        #useraddbtn span:nth-child(5) { animation-delay: .4s; }
        #useraddbtn span:nth-child(6) { animation-delay: .5s; }
        #useraddbtn span:nth-child(7) { animation-delay: .6s; }
        #useraddbtn span:nth-child(8) { animation-delay: .7s; }

        @keyframes bounce {
            100% {
                top: -10px;
                text-shadow: 0 1px 0 #CCC,
                0 2px 0 #CCC,
                0 3px 0 #CCC,
                0 4px 0 #CCC,
                0 5px 0 #CCC,
                0 6px 0 #CCC,
                0 7px 0 #CCC,
                0 8px 0 #CCC,
                0 9px 0 #CCC,
                0 50px 25px rgba(0, 0, 0, .2);
            }
        }
    </style>
    <script type="text/javascript">
        $(function(){
            //아이디 입력 시, .idsuccess 값 지움
            $("#loginid2").keyup(function() {
                $("#idSuccess").text("");
                var id = $("#loginid2").val();
                if (!id.match(/^[a-zA-Z0-9]{2,10}$/)){
                    $("#idSuccess").text("조건에 맞게 입력해주세요");
                    return;
                }
            });//아이디 지움 event

            //ajax함수는 url에서 안보임(back에서만 처리한느 함수라서)
            //중복체크 버튼 시 아이디 체크
            $("#btnidcheck").click(function() {
                $("#idSuccess").text("");
                var id = $("#loginid2").val();
                if (!id.match(/^[a-zA-Z0-9]{2,10}$/)){
                    $("#idSuccess").text("조건에 맞게 입력해주세요");
                    return;
                }
                $.ajax({
                    type:"GET",
                    dataType:"text",
                    url:"loginidcheck?loginid="+$("#loginid2").val(),
                    success:function(res){
                        let json = JSON.parse(res);
                        if(json.count==0){
                            $("#idSuccess").text("사용가능한 아이디입니다");
                        }else{
                            $("#idSuccess").text("이미 사용중인 아이디입니다");
                            alert("중복 아이디");
                        }

                    }//success
                });//ajax
            });//idcheck
            //아이디 유효성 체크

            //1번째 비밀번호 입력 시 체크
            $("#pass").keyup(function () {
                var p1 = $("#pass").val();
                var p2 = $("#pass2").val();
                const regex = /^[a-zA-Z0-9]{8,20}$/;
                if (!regex.test(p1)) {
                    $("#passwordSuccess").text("조건에 맞게 입력해주세요");

                } else if (p2 == '') {
                    $("#passwordSuccess").text("비밀번호 확인란을 입력해주세요.");
                } else if (!regex.test(p2) || p1 != p2) {
                    $("#passwordSuccess").text("비밀번호가 일치하지 않습니다");
                } else {
                    $("#passwordSuccess").text("사용가능한 비밀번호입니다");
                }
            });//pass2

            //2번째 비밀번호 입력 시 체크
            $("#pass2").keyup(function () {
                var p1 = $("#pass").val();
                var p2 = $("#pass2").val();
                const regex = /^[a-zA-Z0-9]{8,20}$/;
                if (!regex.test(p1)) {
                    $("#passwordSuccess").text("조건에 맞게 입력해주세요");
                } else if (p2 == '') {
                    $("#passwordSuccess").text("조건에 맞게 채워주세요.");
                } else if (!regex.test(p2) || p1 != p2) {
                    $("#passwordSuccess").text("비밀번호가 일치하지 않습니다");
                } else {
                    $("#passwordSuccess").text("사용가능한 비밀번호입니다");
                }
            });//pass2

            $('#emailSelect').change(function (){
                let emailSelect = $('#emailSelect option:selected').val();
                $('#emailDomain').val(emailSelect);
            });

            //2번째 비밀번호 입력 시 체크
            $("#nickname").keyup(function () {
                const regex = /^[ㄱ-ㅎ|가-힣]{2,8}$/;
                var nickname = $('#nickname').val();
                if (regex.test(nickname)) {
                    $('#nicknameSuccess').text("사용가능한 닉네임입니다");
                } else {
                    $('#nicknameSuccess').text("조건에 맞지 않습니다.");
                }
            });

            $("#btnNicknameCheck").click(function() {
                const regex = /^[ㄱ-ㅎ|가-힣]{2,8}$/;
                if (!regex.test($('#nickname').val())) {
                    $('#nicknameSuccess').text("조건에 맞지 않습니다.");
                    return ;
                }
                $("#nicknameSuccess").text("");
                $.ajax({
                    type:"GET",
                    dataType:"text",
                    url:"loginNicknameCheck?nickname="+$("#nickname").val(),
                    success:function(res){
                        let json = JSON.parse(res);
                        if(json.count==0){
                            $('#nicknameSuccess').text("사용가능한 닉네임입니다");
                        }else{
                            $("#nicknameSuccess").text("이미 사용중인 닉네임입니다");
                            alert("중복 닉네임");
                        }
                    }//success
                });//ajax
            });

            $("#btnRequstCheck").click(function() {
                let correctAuthNum = Math.floor(Math.random() * (999999 - 100000)) + 100000;
                $('#correctAuthNum').val(correctAuthNum);

                $.ajax({
                    type: "POST",
                    dataType: "text",
                    url: "send-one?hp=" + $("#hp").val() + "&correctAuthNum=" + correctAuthNum,
                    success: function (res) {
                        console.log(res);
                        let json = JSON.parse(res);
                        console.log(json);
                        if (json.statusCode == 2000) {
                            alert("문자 전송을 완료했습니다.");
                        } else {
                            alert("문자 전송을 실패했습니다.");
                        }
                    }//success
                });//ajax
            });

            $("#btnAuthNumCheck").click(function () {
                if ($('#correctAuthNum').val() == $('#authNum').val()) {
                    $('#hpSuccess').text('');
                    alert("인증이 완료되었습니다.");
                } else {
                    $('#hpSuccess').text('잘못된 인증번호입니다.');
                    alert("잘못된 인증번호입니다.");
                }
            });
        });//$function

        //submit 전에 호출
        function check() {
            //
            if ($("#idSuccess").text() != '사용가능한 아이디입니다') {
                alert("아이디 오류");
                return false;
            }

            if ($("#loginid2").val().includes(' ')) {
                alert("아이디에 공백이 있습니다.");
                return false;
            }

            //비밀번호 체크 여부
            if ($("#passwordSuccess").text() != '사용가능한 비밀번호입니다') {
                alert("비밀번호가 서로 다릅니다");
                return false;
            }

            if ($("#pass").val().includes(' ') || $("#pass2").val().includes(' ')) {
    alert("비밀번호에 공백이 있습니다.");
    return false;
    }

    if ($("#nicknameSuccess").text() != '사용가능한 닉네임입니다') {
    alert("닉네임 오류");
    return false;
    }

    if($("#nickname").val().includes(' ')){
    alert("닉네임에 공백이 있습니다.");
    return false;
    }

    let email = $('#email').val();
    let emailDomain = $('#emailDomain').val();
    $('#email').val(email + emailDomain);
    if($("#email").val().includes(' ')){
    alert("이메일에 공백이 있습니다.");
    return false;
    }

    /*휴대폰 인증번호 받기*/
    if ($("#hpSuccess").text() != '인증이 완료되었습니다.') {
    alert($('#hpSuccess').text());
    return false;
    }

    }//check()

    </script>

</head>
<body>
<div class="usermain">
    <div class="user_main">
        <h1>회원가입</h1>
    <input type="hidden" id="correctAuthNum">
    <form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
        <table class="table table-hover">
                <%
                    Object loginChannelObj = session.getAttribute("login_channel");
                    if (loginChannelObj != null) {
                        String loginChannel = (String) loginChannelObj;
                        switch (loginChannel) {
                            case "kakao_id":
                                out.println("<h2 style='font-size: 1em; color: red;'>카카오 ID로 회원가입 중입니다.</h2>");
                                break;
                            case "naver_id":
                                out.println("<h2 style='font-size: 1em; color: red;'>네이버 ID로 회원가입 중입니다.</h2>");
                                break;
                            default:
                                break;
                        }
                    }
                %>
            <tr>
                <td>
                    <div>아이디</div>
                    <div class="input-group">
                        <input placeholder="영문소문자, 숫자 2-10자" id="loginid2" name="loginid"
                               class="form-control" required="required"
                               <%
                                if (loginChannelObj != null) {
                                 String loginChannel = (String) loginChannelObj;
                                 switch (loginChannel) {
                                      case "kakao_id":
                                          out.println("value=\"kakao_" + (int)(Math.random() * 10000000) + "\"");
                                          break;
                                      case "naver_id":
                                          out.println("value=\"naver_" + (int)(Math.random() * 10000000) + "\"");
                                          break;
                                     default:
                                          break;
                                    }
                                 }
                               %>
                        >
                        <button type="button" class="btn btn-outline-secondary btn-sm"
                                id="btnidcheck">중복체크</button>
                    </div>
                    <div id="idSuccess"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div>비밀번호</div>
                    <%
                        boolean randomPassword = false;
                        String randomPasswordValue = "rnd";
                        if (loginChannelObj != null) {
                            String loginChannel = (String) loginChannelObj;
                            switch (loginChannel) {
                                case "kakao_id":
                                case "naver_id":
                                    randomPassword = true;
                                    for (int i=0; i<10; ++i) {
                                        randomPasswordValue += (int) (Math.random() * 10);
                                    }
                                    break;
                                default:
                                    break;
                            }
                        }
                    %>

                        <input type="password" style="font-family: 'Jua';" class="form-control"
                               name="password" id="pass" placeholder="영문, 숫자 8-20자" maxlength="20"
                               required="required"
                               <%
                                    if (randomPassword) {
                                        out.println("value=\"" + randomPasswordValue + "\"");
                                    }
                               %>
                        >
                    <br>
                    <div>비밀번호 확인</div>
                        <input type="password" style="font-family: 'Jua';" class="form-control"
                               id="pass2" placeholder="비밀번호 확인" maxlength="20"
                               required="required"
                                <%
                                    if (randomPassword) {
                                        out.println("value=\"" + randomPasswordValue + "\"");
                                    }
                                %>
                        >
                    <div id="passwordSuccess"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div>이름</div>
                    <input type="text" name="name" class="form-control"
                           placeholder="이름" required="required"
                           <%
                            Object nameObj = session.getAttribute("loginname");
                            if (nameObj != null) {
                                String name = (String) nameObj;
                                out.println("value=\"" + org.springframework.web.util.HtmlUtils.htmlEscapeHex(name) + "\"");
                            }
                            %>
                    >
                </td>
            </tr>

            <tr>
                <td>
                    <div>이메일</div>
                    <div class="input-group">
                        <%
                            Object emailObj = session.getAttribute("email");
                            String[] emailSplitted = null;
                            boolean emailValid = false;
                            if (emailObj != null) {
                                String email = (String) emailObj;
                                emailSplitted = email.split("@");
                                if (emailSplitted.length == 2) {
                                    emailValid = true;
                                }
                            }
                        %>
                        <input  id="email" name="email" class="form-control"
                                 placeholder="이메일" required="required"
                                <%
                                if (emailValid)
                                    out.println("value=\"" + org.springframework.web.util.HtmlUtils.htmlEscapeHex(emailSplitted[0]) + "\"");
                                %>
                        >
                        <input  id="emailDomain" name="emailDomain" class="form-control"
                                placeholder="ex) @naver.com" required="required"
                                <%
                                if (emailValid)
                                    out.println("value=\"" + org.springframework.web.util.HtmlUtils.htmlEscapeHex(emailSplitted[1]) + "\"");
                                %>
                        >
                        <select id="emailSelect" class="form-select">
                            <option value="">직접입력</option>
                            <option value="@naver.com">@naver.com</option>
                            <option value="@daum.net">@daum.net</option>
                            <option value="@gmail.com">@gmail.com</option>
                            <option value="@nate.com">@nate.com</option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div>휴대폰 번호</div>
                    <div class="input-group">
                        <input type="text" id="hp" name="hp" placeholder="핸드폰 번호 (-) 포함해서 입력"
                               class="form-control" required="required"
                                <%
                                Object loginHpObj = session.getAttribute("loginhp");
                                if (loginHpObj != null) {
                                    String loginHp = (String) loginHpObj;
                                    out.println("value=\"" + org.springframework.web.util.HtmlUtils.htmlEscapeHex(loginHp) + "\"");
                                }
                                %>
                        >
                        <button type="button" class="btn btn-outline-secondary btn-sm"
                                id="btnRequstCheck">인증요청</button>
                    </div>
                    <br>
                    <div class="input-group">
                        <input type="text" id="authNum"
                               class="form-control" placeholder="인증번호 입력" required="required">
                        <button type="button" class="btn btn-outline-secondary btn-sm"
                                id="btnAuthNumCheck">인증</button>
                    </div>
                    <div id="hpSuccess"></div>

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div>닉네임</div>
                    <div class="input-group">
                        <input type="text" id="nickname" name="nickname" placeholder="한글 2-8자"
                               class="form-control" required="required"
                                <%
                                Object nicknameObj = session.getAttribute("nickname");
                                if (nicknameObj != null) {
                                    String nickname = (String) nicknameObj;
                                    out.println("value=\"" + org.springframework.web.util.HtmlUtils.htmlEscapeHex(nickname) + "\"");
                                }
                                %>
                               >
                        <button type="button" class="btn btn-outline-secondary btn-sm"
                                id="btnNicknameCheck">중복체크</button>
                    </div>
                    <div id="nicknameSuccess"></div>
                </td>
            </tr>
            <tr>
                <td>
                    성별
                    <select name="gender" class="form-select">
                        <%
                            Object genderObj = session.getAttribute("gender");
                            String gender = "";
                            if (genderObj != null) {
                                gender = (String) genderObj;
                            }
                        %>
                        <option value="F"
                                <%
                                    if (gender.equalsIgnoreCase("F") || gender.equalsIgnoreCase("female")) {
                                        out.println("selected");
                                    }
                                %>
                        >여자</option>
                        <option value="M"
                                <%
                                    if (gender.equalsIgnoreCase("M") || gender.equalsIgnoreCase("male")) {
                                        out.println("selected");
                                    }
                                %>
                        >남자</option>
                    </select>
                    <br>
                    연령대
                    <select name="age" class="form-select">
                        <%
                            Object ageObj = session.getAttribute("age");
                            String age = "10";
                            if (ageObj != null) {
                                age = (String) ageObj;
                            }
                        %>
                        <option value="10" <% if (age.length() >= 2 && age.substring(0,2).equals("10")) out.println("selected"); %> >10대</option>
                        <option value="20" <% if (age.length() >= 2 && age.substring(0,2).equals("20")) out.println("selected"); %> >20대</option>
                        <option value="30" <% if (age.length() >= 2 && age.substring(0,2).equals("30")) out.println("selected"); %> >30대</option>
                        <option value="40" <% if (age.length() >= 2 && age.substring(0,2).equals("40")) out.println("selected"); %> >40대</option>
                    </select>
                </td>

            </tr>

            <tr>
                <td colspan="2">
                    <button type="submit" class="btn btn-secondary" id="useraddbtn">
                        <span>회</span>
                        <span>원</span>
                        <span>가</span>
                        <span>입</span>
                        <span>G</span>
                        <span>O</span>
                        <span>!</span>
                    </button>
                </td>
            </tr>
        </table>
    </form>
    </div>
</div>
<script>
    <%
    if (loginChannelObj != null) {
        String loginChannel = (String) loginChannelObj;
        if (loginChannel.equals("kakao_id") || loginChannel.equals("naver_id")) {
            out.println(
                    "window.addEventListener('load', function (e) {" +
                    "let checkSecondPassword = function () {" +
                    "var p1 = $('#pass').val();" +
                    "var p2 = $('#pass2').val();" +
                "const regex = /^[a-zA-Z0-9]{8,20}$/;" +
                "if (!regex.test(p1)) { " +
                "    $('#passwordSuccess').text('조건에 맞게 입력해주세요'); "+
                "} else if (p2 == '') { " +
                "    $('#passwordSuccess').text('조건에 맞게 채워주세요.');" +
                "} else if (!regex.test(p2) || p1 != p2) {" +
                "    $('#passwordSuccess').text('비밀번호가 일치하지 않습니다');"+
                "} else {"+
                "    $('#passwordSuccess').text('사용가능한 비밀번호입니다');"+
                "}"+
            "}; checkSecondPassword();"+
            "document.getElementById('btnidcheck').click();"+
            "document.getElementById('btnNicknameCheck').click();"+
                    "});"
            );
        }
    }
    %>
</script>
</body>
</html>