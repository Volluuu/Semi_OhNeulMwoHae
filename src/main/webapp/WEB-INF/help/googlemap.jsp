<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Anton&family=Dancing+Script:wght@600&family=Dongle&family=Edu+VIC+WA+NT+Beginner:wght@500&family=Gamja+Flower&family=Indie+Flower&family=Jua&family=Merriweather:ital@1&family=Nabla&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@500&family=Palanquin:wght@200&display=swap"
          rel="stylesheet">

    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <style type="text/css">

        /* 저장된 경로 */
        .mapandselect {
            width: 1500px;
            margin: 0 auto;
        }

        /* history */
        .savehistory {
            border: 1px solid red;
            width: 300px;
        }

        /* 지도 */
        #map {
            width: 700px;
            height: 750px;
        "
        }

        /* 코스 제목 */
        #cos_title {
            width: 400px;
            margin: 0 auto;
            font-size: 15px;
        }

        /* 테마 선택 */
        .cosselect {
            width: 500px;
            position: relative;
            border: 1px solid black;
        }

        .cosselect_main {
            /*border: 1px solid red;*/
            width: 500px;
            margin: 0 auto;
            font-size: 10px;
        }

        .cosselect_thema {
            /*border: 1px solid blue;*/
            width: 120px;
            display: inline-block;
            vertical-align: top;
        }

        #cossearch_insert {
            /*border: 1px solid magenta;*/
            width: 370px;
            display: inline-block;
            vertical-align: top;
        }

        .searchlist {
            border: 1px solid crimson;
            width: 370px;
            max-height: 300px;
            display: none;
            position: absolute;
            z-index: 1;
            background-color: white;
            overflow-y: scroll;
        }

        input.in1 {
            width: 300px;
            display: inline-block;
            vertical-align: top;
        }

        button.insert_course_button {
            border: 1px solid orange;
            width: 50px;
            display: inline-block;
            vertical-align: top;
            justify-content: center;
        }

        .searchwordlist {
            list-style: none;
        }

        .searchwordlist:hover {
            background-color: gray;
            cursor: pointer;
        }

        .cosadd_btn {
        }

        /* 버튼 */
        .cosselectbtn {
            bottom: 0%;
        }

        .cosbtnupdate {

        }

        .cosbtndelete {

        }

        .cosbtnsave {

        }

    </style>
    <script>
        var cnt = 1;
        var s = "";
        var c = "";
        var stepArr = new Array(5);
        var markerArr = new Array(5);
        /* 더하기 버튼 추가 시, 입력창 추가 이벤트 */
        $(function () {
            /* +버튼 클릭 시, 경로 추가 이벤트 */
            $(document).on("click", ".cosselectadd", function () {
                if ($("div.cosselect_main").length == 5) {
                    alert("경로 추가는 최대 5개까지만 가능합니다.");
                    return;
                }
                cnt++;
                console.log(cnt);
                cosSelectAdd();
                $("div.cos2").append(s);
                s = "";

                for (var i = 0; i < $(".cosselect_main").length; i++) {
                    $(".cosselect_main").eq(i).find(".coscnt").text("경로 " + (i + 1));
                    $(".cosselect_main").eq(i).find(".in1").attr("cnt", (i + 1));
                }
            });

            /* 빼기 버튼 클릭 시, 경로 삭제 이벤트 */
            $(document).on("click", ".cosselectsubstract", function () {
                if ($("div.cosselect_main").length < 2) {
                    alert("첫 경로는 삭제 할 수 없습니다.");
                    return;
                }

                if (confirm($(this).siblings(".coscnt").text() + " 를 삭제하시겠습니까?")) {
                    $(this).parents(".cosselect_main").remove();
                    cnt--;
                }

                for (var i = 0; i < $(".cosselect_main").length; i++) {
                    $(".cosselect_main").eq(i).find(".coscnt").text("경로 " + (i + 1));
                    $(".cosselect_main").eq(i).find(".in1").attr("cnt", (i + 1));
                }
                MarkerArr[cnt - 1].setMap(null);
            });

            /* 검색 이벤트 */

            $(document).on("keyup", "input.in1", function () {
                var word = $(this); // parent, children, find 등을 사용하기 위해 #searchword를 특정 시켜준다.
                var txt = word.val();
                if (txt != '') {
                    $(this).next().children().remove();

                    $.ajax({
                        type    : "get",
                        url     : "../course/searchlist",
                        dataType: "json",
                        data    : {
                            "searchthema": word.parent().parent().find("select.sel1").val(),
                            "searchword" : word.val()
                        },
                        success : function (res) {

                            //테마를 3개로 나눠서 검색 시 테이블을 구분해서 가져옴
                            if (word.parent().parent().find("select.sel1").val() == "cafe") {
                                console.log("cafe");
                                $.each(res, function (i, elt) {
                                    word.next().append(
                                        $('<div>').text(elt.title).attr({'cafe_num': elt.cafe_num})
                                    );
                                });
                            }
                            if (word.parent().parent().find("select.sel1").val() == "trip") {
                                console.log("trip");
                                $.each(res, function (i, elt) {
                                    word.next().append(
                                        $('<div>').text(elt.title).attr({'trip_num': elt.trip_num})
                                    );
                                });
                            }
                            if (word.parent().parent().find("select.sel1").val() == "food") {
                                console.log("food");
                                $.each(res, function (i, elt) {
                                    word.next().append(
                                        $('<div>').text(elt.title).attr({'food_num': elt.food_num})
                                    );
                                });
                            }

                            word.next().children().addClass("searchwordlist");
                        }//sucess
                    });//ajax

                } else {
                    $(this).next().children().remove();
                } // if end
            }); // input keyup end

            //검색목록 클릭 시 값이 input tag에 바인드되고 검색창이 꺼지게 하는 이벤트
            $(document).on("click", ".searchwordlist", function () {
                alert("hi");
                var checkedword = $(this);
                var selectedType = $(this).parent().parent().parent().find("select.sel1").val();
                var step = $(this).parent().siblings("input.in1").attr("cnt") - 1;
                // input tag에 선택한 목적지를 바인드
                $(this).parent().prev().val($(this).text());

                if (selectedType == "cafe") {
                    console.log("cafe 여기에요");
                    stepArr[step] = "cafe," + $(this).attr("cafe_num");
                    $(this).parent().siblings("input.in1").attr("isSelect", "yes");
                    $(this).parent().siblings("input.in1").attr("course_num", $(this).attr("cafe_num"));
                }
                if (selectedType == "trip") {
                    console.log("trip");
                    stepArr[step] = "trip," + $(this).attr("trip_num");
                    $(this).parent().siblings("input.in1").attr("isSelect", "yes");
                    $(this).parent().siblings("input.in1").attr("course_num", $(this).attr("trip_num"));
                }
                if (selectedType == "food") {
                    console.log("food");
                    stepArr[step] = "food," + $(this).attr("food_num");
                    $(this).parent().siblings("input.in1").attr("isSelect", "yes");
                    $(this).parent().siblings("input.in1").attr("course_num", $(this).attr("food_num"));
                }
                console.log(stepArr);
                $(this).parent().hide();
            });

            //테마를 선택하지 않고 검색창 클릭시 테마선택으로 이동
            $(document).on("click", "input.in1", function () {
                if ($(this).parent().parent().find("select.sel1 option:selected").text() == "테마 선택") {
                    alert("테마를 먼저 선택해 주세요");
                    $(this).parent().parent().find("select.sel1").focus();
                    return;
                }
                $(this).next().show();
            }); // $(document).on("click", "input.in1", function end

            //마커에 넣을 위도와 경도를 가져오는 이벤트
            $(document).on("click", ".insert_course_button", function () {
                var button = $(this);
                var thiscnt = button.siblings("input.in1").attr("cnt");
                if ($(this).parent().parent().find("select.sel1 option:selected").text() == "테마 검색") {
                    alert("테마를 먼저 선택해 주세요");
                    $(this).parent().parent().find("select.sel1").focus();
                    return;
                }
                if (button.siblings("input.in1").attr("isSelect") == "no" && button.siblings("input.in1").val() == "") {
                    alert("목적지를 먼저 선택해 주세요");
                    button.siblings("input.in1").focus();
                    return;
                }
                if (markerArr[thiscnt - 1]) {
                    if (!confirm("해당 경로의 마커가 이미 존재합니다. 기존의 마커를 삭제하고 마커를 새로 생성하시겠습니까?")) {
                        return;
                    }
                    markerArr[thiscnt - 1].setMap(null);
                }
                var course_type = button.parent().siblings("div.cosselect_thema").find("select.sel1").val();
                var course_num = button.siblings("input.in1").attr("course_num");
                var step = button.siblings("input.in1").attr("cnt");

                $.ajax({
                    type    : "get",
                    url     : "../course/getlatlon",
                    dataType: "json",
                    data    : {
                        "course_type": course_type,
                        "course_num" : course_num
                    },
                    success : function (res) {
                        console.log(res.lat, res.lon);
                        var markerPosition = new kakao.maps.LatLng(res.lat, res.lon);
                        var marker = new kakao.maps.Marker({position: markerPosition});
                        marker.setMap(map);
                        markerArr[thiscnt - 1] = marker;
                        var movelatlon = new kakao.maps.LatLng(res.lat, res.lon);
                        map.setCenter(movelatlon);

                        //인포 윈도우 생성
                        var iwContent =
                                '<div style="padding:5px; width:200px;">'+res.title+' <br><a href="https://map.kakao.com/link/map/Hello World!,' + res.lat + ',' + res.lon + '" style="color:blue" target="_blank">큰지도보기</a>' +
                                '<br><a href="https://map.kakao.com/link/to/Hello World!,' + res.lat + ',' + res.lon + '" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            iwPosition = new kakao.maps.LatLng(res.lat, res.lon); //인포윈도우 표시 위치입니다
                        // 인포윈도우를 생성합니다
                        var infowindow = new kakao.maps.InfoWindow({
                            position: iwPosition,
                            content : iwContent
                        });
                        infowindow.open(map, marker);
                    }//sucess
                });//ajax
            }); // insert_course_button end
            //목록창이 입력되어 있는 상태에서 테마를 바꾸면 검색목록이 초기화되는 이벤트
            $(document).on("change", "select.sel1", function () {
                var find_in1 = $(this).parent().parent().find("input.in1");
                find_in1.val("");
                console.log("reset");
                find_in1.attr("isSelect", "no");

            });
        }); //$function end

        /* 더하기 버튼 추가 시, 입력창 추가 메서드 */
        function cosSelectAdd() {
            s += "<div class='cosselect_main'>";
            s += "<span class='coscnt'></span>";
            s += "<button type='button' class='cosselectsubstract'><i class='fas fa-minus'></i></button>";
            s += "<br>";
            s += "<div class='cosselect_thema'>";
            s += "<select class='form-control sel1' cnt=" + cnt + " name='searchthema'>";
            s += "<option selected='' disabled='' hidden='' class=op1'>테마 선택</option>";
            s += "<option class='op1' value='cafe'>카페</option>";
            s += "<option class='op1' value='food'>음식점</option>";
            s += "<option class='op1' value='trip'>놀거리</option>";
            s += "</select>";
            s += "</div>";
            s += "<div class='i' id='cossearch_insert'>";
            s += "<input type='text' class='form-control in1' placeholder='검색어를 입력' name='searchword' cnt='" + cnt + "' isSelect='no'>";
            s += "<div class='searchlist'></div>";
            s += "<button class='form-control insert_course_button'><i class='fas fa-plus' aria-hidden='true'></i></button>";
            s += "</div>";
            s += "</div>";
        }

    </script>
</head>
<body>
<div class="mapandselect">
    <div class="input-group">
        <!-- 저장된 경로 -->
        <div class="savehistory">
            History
        </div>

        <!-- map -->
        <div id="map"></div>
        <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=975192c3e707d21a2b0a6dda745636ec"></script>
        <script>
            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(37.499442, 127.029023),
                level : 3
            };

            var map = new kakao.maps.Map(container, options);
        </script>

        <!-- 경로설정 -->
        <div class="cosselect">

            <%-- <form action="cosInsert" method="post">--%>
            <h2>경로설정</h2>
            <input type="text" class="form-control" id="cos_title" placeholder="코스 제목 입력" name="title"
                   required="required">
            <div class="cosselect_main">
                <span class="coscnt">경로 1</span>
                <button type="button" class="cosselectsubstract"><i class='fas fa-minus'></i></button>
                <br>
                <div class="cosselect_thema">
                    <select class="form-control sel1" required="required" name="searchthema">
                        <option selected="" disabled="" hidden="" class="op1">테마 선택</option>
                        <option class="op1" value="cafe">카페</option>
                        <option class="op1" value="food">음식점</option>
                        <option class="op1" value="trip">놀거리</option>
                    </select>
                </div>
                <div class="i" id="cossearch_insert">
                    <input type="text" class="form-control in1" placeholder="검색어를 입력"
                           required="required" name="searchword" cnt="1" isSelect="no">
                    <div class="searchlist"></div>
                    <button class="form-control insert_course_button"><i class="fas fa-plus" aria-hidden="true"></i>
                    </button>
                </div>

            </div>
            <div class="cos2"></div>
            <button type="button" class="cosselectadd" style="margin:auto; display: block;">경로추가<i
                    class='fas fa-angle-down'></i></button>


            <!-- 경로설정 버튼 -->
            <div class="toorlist"></div>
            <div class="cosselectbtn">
                <button type="button" class="cosbtnupdate">경로수정</button>
                <button type="button" class="cosbtndelete">경로삭제</button>
                <button type="button" class="cosbtnsave">경로저장</button>
            </div>
            <%-- </form>--%>
        </div>
    </div>
</div>

<script>

</script>
</body>
</html>