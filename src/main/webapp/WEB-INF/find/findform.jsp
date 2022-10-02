<%--
  Created by IntelliJ IDEA.
  User: ostsc
  Date: 2022-09-29
  Time: 오전 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<html>
<head>
    <title>Title</title>
</head>

<style>

    div.dg_container {
        display: flex;

    }

    .findlist {
        background-color: ghostwhite;
    }

    .cinsertlist:hover {
        background-color: darkgray;
        cursor: pointer;
    }

    #selectcword {
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: space-evenly;
        align-items: center;
        align-content: center;
    }

    .radio_select {
        cursor: pointer;
    }

    div.findlist{
        width:700px;
    }
    .cancel {
        float: right;
        color: darkred;
        margin-top: 5px;
    }

    .cancel:hover {
        cursor: pointer;
    }

    #att_zone {
        width: 660px;
        min-height: 150px;
        padding: 10px;
        border: 1px solid black;
    }

    #att_zone:empty:before {
        content: attr(date-placeholder);
        color: #999999;
        font-size: .9em;
    }

    table.dg_table {
        border: 1px solid black;
    }

    .radio_search {
        display: none;
    }

    .radio_myplace {
        display: none;
    }

    .radio_mycourse {
        display: none;
    }
</style>
<c:if test="${sessionScope.loginok==null}">
    <script>
        alert("로그인 해주세요");
        history.back();
    </script>
</c:if>
<body>
<script>
    $(function () {
        $(document).on("change","#ccolumn",function (){
           $("#cword").val("");
           $("#cword").focus();
           $(".findlist").empty();
        });


        $(document).on("keyup","#cword",function (e){
            if(e.keyCode==13){
               $("#cfind").trigger("click");
            }
        });

        $(document).on("click", "#cfind", function () {
            var root = "${root}";
            var s = "";
            $.ajax({
                type: "get",
                url: root + "/findboard/insertlist",
                dataType: "json",
                data: {"ccolumn": $("#ccolumn").val(), "cword": $("#cword").val()},
                success: function (res) {
                    s += "<ul><br>";
                    $.each(res, function (i, elt) {
                        s += "<li class='cinsertlist' photo='" + elt.photo + "'>" + elt.title + "</li>";
                    });
                    s += "</ul>";
                    $(".findlist").html(s);
                }
            });
        });

        $(document).on("click", ".cinsertlist", function () {
            var ti = $(this);
            var txt = ti.text();
            var photo = ti.attr("photo");

            if ($(".fig").length == 5) {
                alert("장소는 5개만 추가 가능합니다");
                return;
            }
            ;
            $("#selectcword").append("<figure style='margin: 10px;' class='fig'><img src='" + photo + "' width='250' height='250'><figcaption><span class='txt'>" + txt + "</span><i class='bi bi-x-circle cancel'></i></figcaption></figure>");

        });

        $(document).on("click", ".cancel", function () {
            var ti = $(this);
            ti.parents(".fig").remove();
        });

        $(document).on("click", "#radio_search", function () {
            $(".radio_myplace").hide();
            $(".radio_mycourse").hide();
            $(".findlist").empty();


            $(".radio_search").show();
        });

        $(document).on("click", "#radio_myplace", function () {
            var user_num = '${sessionScope.user_num}';
            var root = '${root}';
            $(".radio_search").hide();
            $(".radio_mycourse").hide();
            $(".findlist").empty();
            $(".foodlist").text("");
            $(".foodlist").text("카페 목록");
            $(".triplist").text("");
            $(".triplist").text("여행지 목록");
            $(".cafelist").text("");
            $(".cafelist").text("카페 목록");
            $(".radio_myplace").show();
            $.ajax({
                type: "get",
                url: root + "/subs/myplace",
                dataType: "json",
                data: {"user_num": user_num},
                success: function (res) {
                    if (res.length == 0) {
                        $(".radio_myplace").empty();
                        $(".radio_myplace").html("<p>즐겨찾기 한 장소가 없습니다</p>");
                    } else {
                        $.each(res, function (i, elt) {
                            if (elt.food_num != 0) {
                                var f = "";
                                $.ajax({
                                    type: "get",
                                    url: root + "/myplace/food",
                                    dataType: "json",
                                    data: {"food_num": elt.food_num},
                                    success: function (resf) {
                                        f += "<li class='cinsertlist' photo='" + resf.photo + "'>" + resf.title + "</li>";
                                        $(".foodlist").append(f);
                                    }
                                });

                            } else if (elt.trip_num != 0) {
                                var t = "";
                                $.ajax({
                                    type: "get",
                                    url: root + "/myplace/trip",
                                    dataType: "json",
                                    data: {"trip_num": elt.trip_num},
                                    success: function (rest) {
                                        t += "<li class='cinsertlist' photo='" + rest.photo + "'>" + rest.title + "</li>";
                                        $(".triplist").append(t);
                                    }
                                });

                            } else {
                                var c = "";
                                $.ajax({
                                    type: "get",
                                    url: root + "/myplace/cafe",
                                    dataType: "json",
                                    data: {"cafe_num": elt.cafe_num},
                                    success: function (resc) {
                                        c += "<li class='cinsertlist' photo='" + resc.photo + "'>" + resc.title + "</li>";
                                        $(".cafelist").append(c);
                                    }
                                });
                            }
                        });

                    }

                }
            });


        });

        $(document).on("click", "#radio_mycourse", function () {
            $(".radio_search").hide();
            $(".radio_myplace").hide();
            $(".findlist").empty();
            $(".radio_mycourse").show();







        });




    });//$(function)

</script>
<div class="dg_container">
    <div class="insertfind">
        <form action="insertfind" method="post" enctype="multipart/form-data">
            <input type="hidden" name="user_num" value="${sessionScope.user_num}">
            <input type="hidden" name="currentPage" value="${currentPage}">

            <table class="table table-bordered">
                <tr align="center" valign="middle">
                    <th style="width:80px;">제목</th>
                    <td style="width:900px;">
                        <input type="text" name="subject" required="required" placeholder="제목을 입력하세요"
                               class="form-control"
                               id="dg_subject" width="500">
                    </td>
                </tr>
                <tr align="center" valign="middle">
                    <th>장소</th>
                    <td>
                        <div id="selectcword"></div>
                    </td>
                </tr>
                <tr align="center" valign="middle">
                    <th style="width:20%;">사진<br>첨부</th>
                    <td>
                        <div class="input-group">
                            <input type="file" name="findupload" multiple="multiple" id="btnAtt" class="form-control">
                            <div id='att_zone' placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
					<textarea name="content" required="required"
                              style="width:100%;aspect-ratio: 10 / 3;" id="dg_content"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="submit" class="btn btn-outline-dark">게시글 저장</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div class="insertlist">
        <div class="dg_radio">
            <label>
                <input type="radio" name="radio_select" class="radio_select" id="radio_search">&nbsp;장소 검색&nbsp;
            </label>
            <label>
                <input type="radio" name="radio_select" class="radio_select" id="radio_myplace">&nbsp;즐겨찾기 한 장소&nbsp;
            </label>
            <label>
                <input type="radio" name="radio_select" class="radio_select" id="radio_mycourse">&nbsp;내 경로&nbsp;
            </label>
        </div>
        <div class="radio_search">
            <div class="input-group">
                <select class="form-control" name="ccolumn" id="ccolumn">
                    <option hidden selected disabled>테마 선택</option>
                    <option value="trip">여행</option>
                    <option value="cafe">카페</option>
                    <option value="food">식당</option>
                </select>
                <input type="text" class="form-control" placeholder="검색하시오" id="cword" name="cword"
                       value="${param.cword}">
                <button type="button" class="btn btn-outline-dark" id="cfind">검색</button>
            </div>
        </div>
        <div class="radio_myplace">
            <ul class='foodlist'>식당 목록

            </ul>
            <ul class='triplist'>여행지 목록

            </ul>
            <ul class='cafelist'>카페 목록
            </ul>

        </div>
        <div class="radio_mycourse">
            <p>경로 저장한 곳</p>
        </div>
        <div class="findlist"></div>
    </div>
</div>

<script>
    ( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
        imageView = function imageView(att_zone, btn) {

            var attZone = document.getElementById(att_zone);
            var btnAtt = document.getElementById(btn)
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


            /*첨부된 이미리즐을 배열에 넣고 미리보기 */
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
