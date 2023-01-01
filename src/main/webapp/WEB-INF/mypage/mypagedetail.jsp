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
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

    <style type="text/css">
        div.mypage_main{
            width: 1500px;
            height: 90vh;
            /*border: 2px solid black;*/
            margin: 0 auto;
            padding-top: 20px;
        }
        /* 정보란 */
        div.mypagemain2 {
            width: 60%;
            height: 90vh;
            /*border: 1px solid red;*/
            margin: 0 auto;
        }
        .form-control{
            height: 40px;
            font-size: 20px;
        }
        .form-select{
            height: 40px;
        }
        .tb1{
            font-size: 20px;
        }
        .tb1 th{
            width: 200px;
        }
        #btnAtt{
            margin: 0 auto;
            width: 300px;
        }
        #age{
            width: 150px;
        }
        .mypagemain2_interest label{
            margin-left: 50px;
            margin-right: 50px;
            font-size: 20px;
        }
        .mypagemain2_interest label:hover{
            text-shadow: 3px 3px 3px gray;
            cursor: pointer;
        }
        #text1{
            height: 200px;
        }
        #profileadd{
            font-size: 30px;
            color: gray;
            margin: 0 auto;
            text-align: right;
            cursor: pointer;
        }
        /* 이미지 */
        #showimg {
            display: block;
            margin: 0 auto;
            width: 200px;
            height: 200px;
            border-radius: 70%;
        }
        /* 모달창 */
        /*.modalclass{
            width: 100%;
            height: 200px;
            margin: 0 auto;
        }*/
        #myModal1{
           align-items: center;

        }
        .mypage_main_btn{
            text-align: center;
        }
        .coursemovebtn{
            text-align: center;
            margin: 0 auto;
        }
        .coursemovebtn:hover{
            text-shadow: 5px 5px 10px gray;
        }
    </style>
    <script type="text/javascript">
        $(function () {

            $(document).on("click","#profileadd",function (){
                $("#btnAtt").trigger("click");
            });

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
                                $('#nicknameSuccess').text("사용가능한 닉네임입니다.");
                            } else {
                                $("#nicknameSuccess").text("이미 사용중인 닉네임입니다.");
                                alert("중복된 닉네임입니다. 다른 닉네임을 사용바랍니다.");
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
                    $("#passwordSuccess").text("조건에 맞게 입력바랍니다.");
                } else if (p2 == '') {
                    $("#passwordSuccess").text("비밀번호 확인란을 입력바랍니다.");
                } else if (!regex.test(p2) || p1 != p2) {
                    $("#passwordSuccess").text("비밀번호가 일치하지 않습니다.");
                } else {
                    $("#passwordSuccess").text("사용가능한 비밀번호입니다.");
                }
            });//pass2

            //2번째 비밀번호 입력 시 체크
            $("#pass2").keyup(function () {
                var p1 = $("#pass").val();
                var p2 = $("#pass2").val();
                const regex = /^[a-zA-Z0-9]{8,20}$/;
                if (!regex.test(p1)) {
                    $("#passwordSuccess").text("조건에 맞게 입력바랍니다.");
                } else if (p2 == '') {
                    $("#passwordSuccess").text("조건에 맞게 작성바랍니다.");
                } else if (!regex.test(p2) || p1 != p2) {
                    $("#passwordSuccess").text("비밀번호가 일치하지 않습니다.");
                } else {
                    $("#passwordSuccess").text("사용가능한 비밀번호입니다.");
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
            if ($("#originPasswordSuccess").text() != '비밀번호가 확인되었습니다.') {
                alert($("#originPasswordSuccess").text());
                return false;
            }

            return true;
        }

        document.addEventListener('keydown', function(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
            };
        }, true);

    </script>
</head>
<body>
<div class="mypage_main">
    <div class="mypagemain2">
            <h1>회원정보</h1>
        <form action="update" method="post" enctype="multipart/form-data" onsubmit="return update()">
            <%--@declare id="zayeon"--%><%--@declare id="nocar"--%>
            <table class="table table-bordered tb1">
                <tr>
                    <td colspan="2" style="text-align: center">
                        <i class='fas fa-camera' id="profileadd"><img id="showimg" src="${profilephoto}" alt="profilephoto"></i>
                    <input type="file" name="findupload" multiple="multiple" id="btnAtt" class="form-control-file" hidden>
                    <div id='att_zone' data-placeholder='파일 선택'>

                    </div>
                    </td>
                </tr>
                <tr>
                    <th>
                        닉네임
                    </th>
                    <td>
                        <div class="input-group">
                            <input type="hidden" id="originNickname" value="${nickname}" readonly>
                            <input class="form-control" id="nickname" name="nickname" value="${nickname}">&nbsp;&nbsp;
                            <button type="button" id="nicknameCheck" class="btn btn-outline-secondary">중복체크</button><br>
                        </div>
                        <div id="nicknameSuccess"></div>
                    </td>
                </tr>
                <tr>
                    <th>
                        핸드폰 번호 &nbsp;
                    </th>
                    <td>
                        <input class="form-control" id="hp" name="hp" value="${hp}">
                        <div id="hpSuccess"></div>
                    </td>
                </tr>
                <tr>
                    <th>
                        연령대
                    </th>
                    <td>
                        <select class="form-select" name="age" id="age">
                            <option value="10" <c:if test="${age eq '10'}">selected="selected"</c:if>>10대</option>
                            <option value="20" <c:if test="${age eq '20'}">selected="selected"</c:if>>20대</option>
                            <option value="30" <c:if test="${age eq '30'}">selected="selected"</c:if>>30대</option>
                            <option value="40" <c:if test="${age eq '40'}">selected="selected"</c:if>>40대</option>
                        </select>
                        <div id="ageSuccess">

                        </div>
                    </td>
                </tr>&nbsp;&nbsp;&nbsp;
                <tr>
                    <th>
                        관심사
                    </th>
                    <td>
                        <div class="mypagemain2_interest">
                            <input type="hidden" id="interest" name="interest">
                            <c:set var="interest" value="${interest}"/>
                            <label for="gamsung">
                                <span class="chkbox">감성</span>
                            <input id="gamsung" type="checkbox" onclick="interestClick(this)"
                                   <c:if test="${fn:contains(interest, '감성')}">checked</c:if>>
                            </label>
                            <label for="inner">
                                <span class="chkbox">실내</span>
                            <input id="inner" type="checkbox" onclick="interestClick(this)"
                                   <c:if test="${fn:contains(interest, '실내')}">checked</c:if>>
                            </label>
                            <label for="activity">
                                <span class="chkbox">액티비티</span>
                            <input id="activity" type="checkbox" onclick="interestClick(this)"
                                   <c:if test="${fn:contains(interest, '액티비티')}">checked</c:if>>
                            </label>
                            <label for="matzip">
                                <span class="chkbox">맛집</span>
                            <input id="matzip" type="checkbox" onclick="interestClick(this)"
                                   <c:if test="${fn:contains(interest, '맛집')}">checked</c:if>>
                            </label>
                            <label for="zayeon">
                                <span class="chkbox">자연</span>
                            <input id="zayeon" type="checkbox" onclick="interestClick(this)"
                                   <c:if test="${fn:contains(interest, '자연')}">checked</c:if>>
                            </label>
                            <label for="healing">
                                <span class="chkbox">힐링</span>
                            <input id="healing" type="checkbox" onclick="interestClick(this)"
                                   <c:if test="${fn:contains(interest, '힐링')}">checked</c:if>>
                            </label>
                            <label for="nocar">
                                <span class="chkbox">뚜벅이</span>
                            <input id="nocar" type="checkbox" onclick="interestClick(this)"
                                   <c:if test="${fn:contains(interest, '뚜벅이')}">checked</c:if>>
                            </label>
                        </div><!-- mypagemain2_interest -->
                    </td>
                </tr>
                <tr>
                    <th>
                        소개글
                    </th>
                    <td>
                        <textarea class="form-control text1" id="text1" name="profile" placeholder="소개글을 작성하세요(150자 이내)">${profile}</textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="button" class="btn btn-toolbar coursemovebtn" onclick="location.href='${root}/help/map?user_num=${sessionScope.user_num}'">내가 설정한 경로 보기 Go Go!!</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="mypage_main_btn">
                            <button type="submit" class="btn btn-outline-primary" onclick="alert('저장되었습니다.')">저장</button>
                            <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#myModal1">
                                비밀번호 변경
                            </button>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#myModal2">
                                회원 탈퇴
                            </button>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div><!-- main2 -->


<%--<div class="modalclass">--%>
    <!-- The Modal -->
    <div class="modal fade" id="myModal1">
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
                        <h5>현재 비밀번호</h5>
                        <div class="input-group">
                            <input class="form-control" id="originPassword" type="password" placeholder="현재 비밀번호">
                            <button type="button" id="checkOriginPassword" class="btn btn-outline-secondary">비밀번호 확인</button>
                        </div>
                        <div id="originPasswordSuccess"></div>
                        <br>
                        <h5>변경할 비밀번호</h5>
                        <input class="form-control" id="pass" name="password" type="password" placeholder="새 비밀번호(영문, 숫자 8-20자)">
                        <input class="form-control" id="pass2" type="password" placeholder="새 비밀번호 확인(영문, 숫자 8-20자)">
                    </div>
                    <div id="passwordSuccess"></div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-outline-secondary" data-bs-dismiss="modal">저장</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>
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
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
                </div>

            </div>
        </div>
    </div>
   <%-- </div>--%>
</div><!-- main -->


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