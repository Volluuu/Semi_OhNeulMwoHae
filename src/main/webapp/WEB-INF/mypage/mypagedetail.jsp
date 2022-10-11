<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

    <style type="text/css">
        div.mypagemain {
            width: 300px;
            height: 90vh;
            /*border: 1px solid black;*/
            float: left;
            margin-left: 80px;
        }

        div.mypagemain2 {
            width: 600px;
            margin-left: 600px;
            /*border: 1px solid black;*/

        }

        img {
            display: block;
            margin: auto;
            width: 200px;
            height: 200px;
            border-radius: 70%;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('#nicknameCheck').click(
                function nicknameCheck() {
                    const regex = /^[ㄱ-ㅎ|가-힣]{2,8}$/;
                    if (!regex.test($('#nickname').val())) {
                        $('#nicknameSuccess').text("조건에 맞지 않습니다.");
                        return;
                    }
                    $("#nicknameSuccess").text("");
                    $.ajax({
                        type: "GET",
                        dataType: "text",
                        url: "/user/loginNicknameCheck?nickname=" + $("#nickname").val(),
                        success: function (res) {
                            let json = JSON.parse(res);
                            if (json.count == 0) {
                                $('#nicknameSuccess').text("사용가능한 닉네임입니다");
                            } else {
                                $("#nicknameSuccess").text("이미 사용중인 닉네임입니다");
                                alert("중복 닉네임");
                            }
                        }//success
                    });
                }
            );

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


            $("#checkOriginPassword").click(function () {
                $.ajax({
                    type: "GET",
                    dataType: "text",
                    url: "/user/loginPasswordCheck?originPassword=" + $("#originPassword").val(),
                    success: function (res) {
                        console.log(res);
                        let json = JSON.parse(res);
                        console.log(json);
                        if (json.code == 0) {
                            $('#originPasswordSuccess').text('비밀번호 확인되었습니다.');
                        } else {
                            $('#originPasswordSuccess').text('현재 비밀번호 맞지 않습니다.');
                        }
                    }//success
                });//ajax
            });
        });

        function interestClick(e) {
            //alert("test");
        }

        function update() {
            if ($('#nickname').val() != $('#originNickname').val() && $('#nicknameSuccess').text() != "사용가능한 닉네임입니다") {
                alert($('#nicknameSuccess').text());
                return false;
            }

            var interest = '';
            if (document.getElementById('gamsung').checked) {
                interest += '감성,'
            }
            if (document.getElementById('inner').checked) {
                interest += '실내,'
            }
            if (document.getElementById('activity').checked) {
                interest += '액티비티,'
            }
            if (document.getElementById('matzip').checked) {
                interest += '맛집,'
            }
            if (document.getElementById('zayeon').checked) {
                interest += '자연,'
            }
            if (document.getElementById('healing').checked) {
                interest += '힐링,'
            }
            if (document.getElementById('nocar').checked) {
                interest += '뚜벅이,'
            }

            if (interest.length > 0) {
                interest = interest.substring(0, interest.length - 1);
            }

            document.getElementById('interest').value = interest;
            return true;
        }

        function updatePassword() {
            //비밀번호 체크 여부
            if ($("#passwordSuccess").text() != '사용가능한 비밀번호입니다') {
                alert($("#passwordSuccess").text());
                return false;
            }

            if ($("#pass").val().includes(' ') || $("#pass2").val().includes(' ')) {
                alert("비밀번호에 공백이 있습니다.");
                return false;
            }

            //기존 비밀번호 맞는지 체크
            if ($("#originPasswordSuccess").text() != '비밀번호 확인되었습니다.') {
                alert($("#originPasswordSuccess").text());
                return false;
            }

            return true;
        }

    </script>
</head>
<body>
<div class="mypagemain">
    <caption align="top">
        <h1><b>마이페이지</b></h1>
    </caption>
    <hr>
    <a href="${root}/help/map?user_num=${sessionScope.user_num}"><p>내 즐겨찾기</p></a>

</div>

<div class="mypagemain2">
    <caption align="top">
        <h1 style="text-align: center;"><b>회원정보</b></h1>
    </caption>
    <hr>
    <form action="update" method="post" enctype="multipart/form-data" onsubmit="return update()">
        <%--@declare id="zayeon"--%><%--@declare id="nocar"--%><div>
            <img id="showimg" src="${profilephoto}" alt="profilephoto">
        </div>
        <input type="file" name="findupload" multiple="multiple" id="btnAtt" class="form-control">
        <div id='att_zone' data-placeholder='파일 선택'></div>
        <br>
        <br>
        <input type="hidden" id="originNickname" value="${nickname}" readonly>
        <div>닉네임 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input id="nickname" name="nickname"
                                                                                     value="${nickname}"
        >&nbsp;&nbsp;
            <button type="button" id="nicknameCheck" class="btn btn-danger">중복체크</button>
            <div id="nicknameSuccess"></div>
        </div>
        <br>
        <div>핸드폰 번호 &nbsp;&nbsp;&nbsp; <input id="hp" name="hp" value="${hp}">
            <div id="hpSuccess"></div>
        </div>
        <br>
        <div>연령대 &nbsp;&nbsp;&nbsp;
            <select name="age" id="age">
                <option value="10" <c:if test="${age eq '10'}">selected="selected"</c:if>>10대</option>
                <option value="20" <c:if test="${age eq '20'}">selected="selected"</c:if>>20대</option>
                <option value="30" <c:if test="${age eq '30'}">selected="selected"</c:if>>30대</option>
                <option value="40" <c:if test="${age eq '40'}">selected="selected"</c:if>>40대</option>
            </select>
            <div id="ageSuccess"></div>
        </div>
        <br>
        <div>관심사 &nbsp;&nbsp;&nbsp;</div>
        <input type="hidden" id="interest" name="interest">
        <c:set var="interest" value="${interest}"/>

        <label for="gamsung">
            감성
        </label>

        <input id="gamsung" type="checkbox" onclick="interestClick(this)"
               <c:if test="${fn:contains(interest, '감성')}">checked</c:if>>

        <label for="inner">
            실내
        </label>
        <input id="inner" type="checkbox" onclick="interestClick(this)"
               <c:if test="${fn:contains(interest, '실내')}">checked</c:if>>

        <label for="activity">
            액티비티
        </label>
        <input id="activity" type="checkbox" onclick="interestClick(this)"
               <c:if test="${fn:contains(interest, '액티비티')}">checked</c:if>>
            <br>

        <label for="matzip">
            맛집
        </label>
        <input id="matzip" type="checkbox" onclick="interestClick(this)"
               <c:if test="${fn:contains(interest, '맛집')}">checked</c:if>>

        <label for="zayeon">
            자연
        </label>
        <input id="zayeon" type="checkbox" onclick="interestClick(this)"
               <c:if test="${fn:contains(interest, '감성')}">checked</c:if>>

        <label for="healing">
            힐링
        </label>
        <input id="healing" type="checkbox" onclick="interestClick(this)"
               <c:if test="${fn:contains(interest, '감성')}">checked</c:if>>

            <label for="nocar">
                뚜벅이
            </label>
            <input id="nocar" type="checkbox" onclick="interestClick(this)"
                   <c:if test="${fn:contains(interest, '감성')}">checked</c:if>>
        <br><br>
        <div>소개글</div>
        <div><textarea name="profile" placeholder="소개글을 작성하세요(150자 이내)"
                       style="height:150px; width: 600px; resize: none;">${profile}</textarea>
        </div>
        <br>
        <button type="submit" class="btn btn-danger">저장</button>
    </form>

    <div class="modalclass" style="display: flex;">
        <div class="container mt-3">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal1">
                비밀번호 변경
            </button>
        </div>

        <!-- The Modal -->
        <div class="modal" id="myModal1">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">비밀번호 변경</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <form action="updatePassword" method="post" enctype="multipart/form-data"
                          onsubmit="return updatePassword()">
                        <!-- Modal body -->
                        <div class="modal-body">
                            <input id="originPassword" type="password" style="font-family: 'Jua'; width: 300px;"
                                   placeholder="현재 비밀번호"><br>
                            <button type="button" id="checkOriginPassword" class="btn btn-danger">비밀번호 확인</button>
                            <div id="originPasswordSuccess"></div>
                            <input id="pass" name="password" type="password" style="font-family: 'Jua'; width: 300px;"
                                   placeholder="새 비밀번호(영문, 숫자 8-20자)">
                            <input id="pass2" type="password" style="font-family: 'Jua'; width: 300px;"
                                   placeholder="새 비밀번호 확인(영문, 숫자 8-20자)">
                        </div>
                        <div id="passwordSuccess"></div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger" data-bs-dismiss="modal">저장</button>
                        </div>
                    </form>


                </div>
            </div>
        </div>


        <div class="container mt-3">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal2">
                회원 탈퇴
            </button>
        </div>


        <!-- The Modal -->
        <div class="modal" id="myModal2">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">회원 탈퇴</h4>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        정말 탈퇴하시겠습니까?
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <form action="delete" method="post" enctype="multipart/form-data">
                            <button type="submit" class="btn btn-danger">확인</button>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <br><br>

</div>
<script>
    ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
        imageView = function imageView(att_zone, btn) {

            var attZone = document.getElementById('att_zone');
            var btnAtt = document.getElementById('btnAtt')
            var sel_file;

            btnAtt.onchange = function (e) {
                var files = e.target.files;
                var fileArr = Array.prototype.slice.call(files)
                for (f of fileArr) {
                    imageLoader(f);
                }
            }

            // 탐색기에서 드래그앤 드롭 사용
            attZone.addEventListener('dragenter', function (e) {
                e.preventDefault();
                e.stopPropagation();
            }, false)

            attZone.addEventListener('dragover', function (e) {
                e.preventDefault();
                e.stopPropagation();

            }, false)

            attZone.addEventListener('drop', function (e) {
                var files = {};
                e.preventDefault();
                e.stopPropagation();
                var dt = e.dataTransfer;
                files = dt.files;
                for (f of files) {
                    imageLoader(f);
                }

            }, false)


            /*첨부된 이미지들을 배열에 넣고 미리보기 */
            imageLoader = function (file) {
                sel_file = file;
                var reader = new FileReader();
                reader.onload = function (ee) {
                    let img = document.getElementById('showimg');
                    img.src = ee.target.result;
                }
                reader.readAsDataURL(file);
            }

            /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */

        }
    )('att_zone', 'btnAtt')
</script>

</body>
</html>