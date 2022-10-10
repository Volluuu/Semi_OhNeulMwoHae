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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

    <style type="text/css">
        div.mypagemain{
            width: 300px;
            height: 90vh;
            /*border: 1px solid black;*/
            float: left;
            margin-left: 80px;
        }

        div.mypagemain2{
            width: 600px;
            margin-left: 600px;
            /*border: 1px solid black;*/

        }

        img{
            display: block;
            margin: auto;
            width: 100px;
            height: 100px;
            border-radius: 70%;
        }
    </style>
    <script>

        function makeToUpdate() {
            $('#nickname').attr('readonly', false);
            $('#hp').attr('readonly', false);
            $('#age').attr('readonly', false);
            $('#nicknameCheck').show();
            $('#update').show();
        }


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
                url: "loginNicknameCheck?nickname=" + $("#nickname").val(),
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

        function update(){
            if ($('#nickname').val() != $('#originNickname').val() && $('#nicknameSuccess').text() != "사용가능한 닉네임입니다") {
                alert($('#nicknameSuccess').text());
                return;
            }
        }


    </script>
</head>
<body>
<div class="mypagemain">
    <caption align="top">
        <h1><b>마이페이지</b></h1>
    </caption>
    <hr>
    <a href="javascript:makeToUpdate();"><p>회원정보</p></a>
    <a href="${root}/findboard/list?user_num=${sessionScope.user_num}"><p>내 동행 게시글</p></a>
    <a href="${root}/qna/qnalist?user_num=${sessionScope.user_num}"><p>내 Q&A</p></a>
    <a href="${root}/help/map?user_num=${sessionScope.user_num}"><p>내 경로</p></a>

</div>

    <div class="mypagemain2">
        <caption align="top">
            <h1 style="text-align: center;"><b>회원정보</b></h1>
        </caption>
        <hr>
        <div>
            <img id="showimg" src="${profilephoto}"></div>
            <div></div>

            <input type="file" name="findupload" multiple="multiple" id="btnAtt" class="form-control">
            <div id='att_zone' data-placeholder='파일 선택 or 드래그 앤 드롭'></div>
            <br><br>

        <div>닉네임 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${nickname}&nbsp;&nbsp;
        <button type="button" id="nicknameCheck" onclick="nicknameCheck()" class="btn btn-danger">중복체크</button></div>
        <br>
        <div>핸드폰 번호 &nbsp;&nbsp;&nbsp; ${hp}</div>
        <br>
        <div>연령대 &nbsp;&nbsp;&nbsp;
            <select name="age">
            <option value="10">10대</option>
            <option value="20">20대</option>
            <option value="30">30대</option>
            <option value="40">40대</option>
        </select></div>
        <br>
        <div>관심사 &nbsp;&nbsp;&nbsp; </div>
        <br>
        <div>소개글</div>
        <div><textarea placeholder="소개글을 작성하세요(**자 이내)" style="height:150px; width: 600px; resize: none;"></textarea> </div>
        <br>

        <button type="button" id="update" style="display: none">수정</button>

        <h5>설정</h5>


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

                    <!-- Modal body -->
                    <div class="modal-body">
                        <input type="password" style="font-family: 'Jua'; width: 300px;" placeholder="현재 비밀번호"><br>
                        <input type="password" style="font-family: 'Jua'; width: 300px;" placeholder="새 비밀번호(영문, 숫자 8-20자)">
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">저장</button>
                    </div>

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
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        정말 탈퇴하시겠습니까?
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">확인</button>
                    </div>

                </div>
            </div>
        </div>
        </div>
        <br><br>
        <button type="button" class="btn btn-danger">저장</button>


</div>
<script>
    ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
        imageView = function imageView(att_zone, btn) {

            var attZone = document.getElementById('att_zone');
            var btnAtt = document.getElementById('btnAtt')
            var sel_files = [];

            // 이미지와 체크 박스를 감싸고 있는 div 속성
            var div_style = 'display:inline-block;position:relative;'
                + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
            // 미리보기 이미지 속성
            var img_style = 'width:100%;height:100%;z-index:none';
            // 이미지안에 표시되는 체크박스의 속성
            var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
                + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';

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
                sel_files.push(file);
                var reader = new FileReader();
                reader.onload = function (ee) {
                    let img = document.createElement('img')
                    img.setAttribute('style', img_style)
                    img.src = ee.target.result;
                    attZone.appendChild(makeDiv(img, file));
                }

                reader.readAsDataURL(file);
            }

            /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
            makeDiv = function (img, file) {
                var div = document.createElement('div')
                div.setAttribute('style', div_style)

                var btn = document.createElement('input')
                btn.setAttribute('type', 'button')
                btn.setAttribute('value', 'x')
                btn.setAttribute('delFile', file.name);
                btn.setAttribute('style', chk_style);
                btn.onclick = function (ev) {
                    var ele = ev.srcElement;
                    var delFile = ele.getAttribute('delFile');
                    for (var i = 0; i < sel_files.length; i++) {
                        if (delFile == sel_files[i].name) {
                            sel_files.splice(i, 1);
                        }
                    }

                    dt = new DataTransfer();
                    for (f in sel_files) {
                        var file = sel_files[f];
                        dt.items.add(file);
                    }
                    btnAtt.files = dt.files;
                    var p = ele.parentNode;
                    attZone.removeChild(p)
                }
                div.appendChild(img)
                div.appendChild(btn)
                return div
            }
        }
    )('att_zone', 'btnAtt')
</script>

</body>
</html>