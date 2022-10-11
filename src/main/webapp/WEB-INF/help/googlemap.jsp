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
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=975192c3e707d21a2b0a6dda745636ec"></script>
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
        var customArr = new Array(5);
        var mapBound = new Array(5);
        var iwArr = new Array(5);
        var linePath = new Array(5);
        var polyline = new kakao.maps.Polyline({
            endArrow     : true,
            path         : linePath, // 선을 구성하는 좌표배열 입니다
            strokeWeight : 5, // 선의 두께 입니다
            strokeColor  : '#FF0000', // 선의 색깔입니다
            strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle  : 'solid' // 선의 스타일입니다
        });
        var latArr = new Array(5);
        var lngArr = new Array(5);
        var isAdd = [false, false, false, false, false];
        /* 더하기 버튼 추가 시, 입력창 추가 이벤트 */
        $(function () {
            /* +버튼 클릭 시, 경로 추가 이벤트 */
            $(document).on("click", ".cosselectadd", function () {
                if ($("div.cosselect_main").length == 5) {
                    alert("경로 추가는 최대 5개까지만 가능합니다.");
                    return;
                }
                cnt++;
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
                } else {
                    return;
                }

                for (var i = 0; i < $(".cosselect_main").length; i++) {
                    $(".cosselect_main").eq(i).find(".coscnt").text("경로 " + (i + 1));
                    $(".cosselect_main").eq(i).find(".in1").attr("cnt", (i + 1));
                    $("span.step").eq(i).text("step" + (i + 1));
                }
                var thiscnt = $(this).siblings("div.i").children("input.in1").attr("cnt");
                if (customArr[thiscnt - 1]) { //삭제하려는 경로가 아직 설정되어있지 않은 경우 에러 발생, 예외처리
                    customArr[thiscnt - 1].setMap(null);
                    console.log("set NULL : " + thiscnt);
                    console.log(customArr);
                }
                isAdd[thiscnt - 1] = false;
                var endpoint = 0;
                for (var i = 0; i < isAdd.length; i++) {
                    if (isAdd[i] && thiscnt - 1 != i) {
                        endpoint = i - 1;
                    }
                }
                console.log("endpoint : " + endpoint);
                customArr[thiscnt - 1] = null;
                stepArr[thiscnt - 1] = null;

                //customArr 배열의 순서를 삭제한것과 동일하게 설정
                var newCustomArr = new Array(5);
                var newStepArr = new Array(5);
                var n = 0;
                for (var i = 0; i < newCustomArr.length; i++) {
                    if (i == (thiscnt - 1)) {
                        continue;
                    }
                    if (!customArr[i]) {
                        n++;
                        continue;
                    }
                    newStepArr[n] = stepArr[i];
                    customArr[i].setContent('<span style="background: skyblue; cursor:pointer;" class="step">step' + (n + 1) + '</span>');
                    newCustomArr[n++] = customArr[i];
                }
                // customArr = newCustomArr;
                for (var i = 0; i < customArr.length; i++) {
                    customArr[i] = newCustomArr[i];
                }

                stepArr = newStepArr;
                //지도범위 재설정
                console.log(isAdd);
                console.log("delete before mapBound");
                console.log(mapBound);
                n = 0;
                var bounds = new kakao.maps.LatLngBounds();
                for (var i = 0; i < mapBound.length; i++) {
                    if (i == (thiscnt - 1)) {
                        continue;
                    }
                    mapBound[n++] = mapBound[i];
                }
                for (var i = 0; i < mapBound.length - 1; i++) {
                    if (mapBound[i]) {
                        bounds.extend(mapBound[i]);
                    }
                }
                console.log("delete after mapBound : ")
                console.log(mapBound);
                map.setBounds(bounds);
                // 삭제한 경로를 제외한 폴리라인 다시 그리기

                n = 0;
                // for (var i = 0; i < new_linePath.length; i++) {
                //     if (i == (thiscnt - 1)) {
                //         continue;
                //     }
                //     new_linePath[n++] = linePath[i];
                // }
                // new_linePath[4] = undefined;
                // linePath = new_linePath;

                for (var i = 0; i < linePath.length; i++) {
                    if (i == (thiscnt - 1)) {
                        continue;
                    }
                    if (isAdd[i]) {
                        latArr[n] = latArr[i];
                        lngArr[n] = lngArr[i];
                        linePath[n++] = new kakao.maps.LatLng(latArr[i], lngArr[i]);
                    } else {
                        n++;
                    }
                }
                latArr[4] = lngArr[4] = null;

                linePath[4] = new kakao.maps.LatLng(latArr[endpoint], lngArr[endpoint]);
                polyline.setPath(linePath);
                polyline.setMap(map);
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
                                $.each(res, function (i, elt) {
                                    word.next().append(
                                        $('<div>').text(elt.title).attr({'cafe_num': elt.cafe_num})
                                    );
                                });
                            }
                            if (word.parent().parent().find("select.sel1").val() == "trip") {
                                $.each(res, function (i, elt) {
                                    word.next().append(
                                        $('<div>').text(elt.title).attr({'trip_num': elt.trip_num})
                                    );
                                });
                            }
                            if (word.parent().parent().find("select.sel1").val() == "food") {
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
                var selectedType = $(this).parent().parent().parent().find("select.sel1").val();
                var step = $(this).parent().siblings("input.in1").attr("cnt") - 1;
                // input tag에 선택한 목적지를 바인드
                $(this).parent().prev().val($(this).text());

                if (selectedType == "cafe") {
                    stepArr[step] = "cafe," + $(this).attr("cafe_num");
                    $(this).parent().siblings("input.in1").attr("isSelect", "yes");
                    $(this).parent().siblings("input.in1").attr("course_num", $(this).attr("cafe_num"));
                }
                if (selectedType == "trip") {
                    stepArr[step] = "trip," + $(this).attr("trip_num");
                    $(this).parent().siblings("input.in1").attr("isSelect", "yes");
                    $(this).parent().siblings("input.in1").attr("course_num", $(this).attr("trip_num"));
                }
                if (selectedType == "food") {
                    stepArr[step] = "food," + $(this).attr("food_num");
                    $(this).parent().siblings("input.in1").attr("isSelect", "yes");
                    $(this).parent().siblings("input.in1").attr("course_num", $(this).attr("food_num"));
                }
                //검색목록이 닫히게 하는 이벤트
                $(this).parent().hide().empty();
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
            // 추가했을 때 추가된 경로인것을 나타내는 문구 추가 하면 좋을 듯 *****************************************************
            $(document).on("click", ".insert_course_button", function () {
                var button = $(this);
                var thiscnt = button.siblings("input.in1").attr("cnt");
                if ($(this).parent().parent().find("select.sel1 option:selected").text() == "테마 선택") {
                    alert("테마를 먼저 선택해 주세요");
                    $(this).parent().parent().find("select.sel1").focus();
                    return;
                }
                if (button.siblings("input.in1").attr("isSelect") == "no" && button.siblings("input.in1").val() == "") {
                    alert("목적지를 먼저 선택해 주세요");
                    button.siblings("input.in1").focus();
                    return;
                }

                if (customArr[thiscnt - 1]) {
                    if (!confirm("해당 경로의 마커가 이미 존재합니다. 기존의 마커를 삭제하고 마커를 새로 생성하시겠습니까?")) {
                        return;
                    }
                    customArr[thiscnt - 1].setMap(null);
                }
                var course_type = button.parent().siblings("div.cosselect_thema").find("select.sel1").val();
                var course_num = button.siblings("input.in1").attr("course_num");
                var step = button.siblings("input.in1").attr("cnt");

                for (var i = 0; i < stepArr.length; i++) {
                    if (i == (step - 1)) {
                        continue;
                    }
                    if (stepArr[i] == (course_type + "," + course_num)) {
                        alert("이미 추가한 경로입니다");
                        button.siblings("input.in1").val("");
                        return;
                    }
                }
                $.ajax({
                    type    : "get",
                    url     : "../course/getlatlon",
                    dataType: "json",
                    data    : {
                        "course_type": course_type,
                        "course_num" : course_num
                    },
                    success : function (res) {
                        //인포 윈도우 생성
                        var iwContent =
                                '<div style="padding:5px; width:200px;">' + res.title + ' <br><a href="https://map.kakao.com/link/map/' + res.title + ',' + res.lat + ',' + res.lon + '" style="color:blue" target="_blank">큰지도보기</a>' +
                                '<br><a href="https://map.kakao.com/link/to/' + res.title + ',' + res.lat + ',' + res.lon + '" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            iwPosition = new kakao.maps.LatLng(res.lat, res.lon); //인포윈도우 표시 위치입니다
                        iwRemoveable = true;
                        var customContent = '<span style="background: skyblue;" class="step" cnt=' + thiscnt + '>step' + thiscnt + '</span>'
                        // 인포윈도우를 생성합니다
                        var custom = new kakao.maps.CustomOverlay({
                            position: iwPosition,
                            content : customContent
                        });
                        customArr[thiscnt - 1] = custom;
                        var detailInfowindow = new kakao.maps.InfoWindow({
                            position : iwPosition,
                            content  : iwContent,
                            removable: iwRemoveable
                        });
                        // *************************스텝1에서 지정한 위치에 커스텀오버레이가 있을 때 다른 스텝에서 해당 장소를 추가하면 이미 경로에 등록되어있다는 alert 출력***************
                        iwArr[thiscnt - 1] = detailInfowindow;
                        custom.setMap(map);

                        //마커가 생성될 때 마다 지도의 범위를 수정
                        var bounds = new kakao.maps.LatLngBounds();
                        var latlng = new kakao.maps.LatLng(res.lat, res.lon);
                        mapBound[thiscnt - 1] = latlng;
                        console.log(mapBound);
                        linePath[thiscnt - 1] = latlng;
                        polyline.setPath(linePath);
                        for (var i = 0; i < mapBound.length; i++) {
                            if (!mapBound[i]) {
                                continue;
                            }
                            bounds.extend(mapBound[i]);
                        }
                        map.setBounds(bounds);
                        polyline.setMap(map);
                        $(document).on("click", "span.step", function () {
                            if ($(this).attr("cnt") == thiscnt) {
                                iwArr[thiscnt - 1].open(map);
                            }
                        });
                        //위도 경도 값을 배열에 저장
                        latArr[thiscnt - 1] = res.lat;
                        lngArr[thiscnt - 1] = res.lon;
                        isAdd[thiscnt - 1] = true;
                        console.log(isAdd);
                    }//sucess
                });//ajax
            }); // insert_course_button end
            //목록창이 입력되어 있는 상태에서 테마를 바꾸면 검색목록이 초기화되는 이벤트
            $(document).on("change", "select.sel1", function () {
                var find_in1 = $(this).parent().parent().find("input.in1");
                find_in1.val("");
                find_in1.attr("isSelect", "no");
            });

            //코스를 저장하는 이벤트 : 저장 시 경로들 사이에 null이 있으면 채워달라는 alert 문구 출력
            $(".cosbtnsave").click(function () {
                for (var i = 0; i < stepArr.length; i++) {
                    if (!stepArr[i]) {
                        for (var j = i + 1; j < stepArr.length; j++) {
                            if (stepArr[j]) {
                                alert((i + 1) + "번째 경로가 비어있습니다. 경로삭제 혹은 경로를 추가해주세요.")
                                $("select.sel1").eq(i + 1).focus(); // 헤더부분 검색기능 빠지면 i수정
                                return;
                            }
                        }

                    }
                }
                if (!$("#cos_title").val()) {
                    alert("코스 제목을 입력해주세요")
                    $("#cos_title").focus();
                    return;
                }
                if (confirm("경로를 [나만의 경로]에 추가하시겠습니까?")) {
                    //페이지 이동하는 부분
                    $.ajax({
                        type    : "post",
                        url     : "../course/insertcourse",
                        dataType: "text",
                        data    : {
                            "step1"   : stepArr[0],
                            "step2"   : stepArr[1],
                            "step3"   : stepArr[2],
                            "step4"   : stepArr[3],
                            "step5"   : stepArr[4],
                            "user_num": ${user_num},
                            "cnt"     : cnt,
                            "title"   : $("#cos_title").val()
                        },
                        success : function (res) {
                            alert("경로가 저장되었습니다.");
                            location.reload();
                            //똑같은 제목을 가진 장바구니 목록이 있으면 return *********************************
                        }//sucess
                    });//ajax
                } else {
                    alert("저장이 취소되었습니다.");
                }
            });

            $(document).on("click", ".call_course_button", function (){
                $(".cos2").empty();
                var thiscnt = Number($(this).attr("cnt"));
                for(var i = 1; i < $(this).attr("cnt"); i++) {
                    s="";
                    cosSelectAdd();
                    $("div.cos2").append(s);
                }
                $("#cos_title").val($(this).attr("title"));

                for(let j = 1; j < thiscnt+1; j++) { // 헤더 부분 수정되면 변경 **************************************
                    var course_type = $(this).attr("step" + j).substr(0, 4);
                    var course_num = Number($(this).attr("step" + j).substr(5));
                    var repeat = j;
                    console.log("thiscnt : " + thiscnt);
                    console.log(j+"번째 : " + "course_type : " + course_type + " course_num : " + course_num);
                    if(course_type == "cafe") {
                        $("select.sel1").eq(j).val("cafe");
                        console.log( $("select.sel1").eq(j).val());
                    }
                    if(course_type == "food") {
                        $("select.sel1").eq(j).val("food");
                        console.log( $("select.sel1").eq(j).val());
                    }
                    if(course_type == "trip") {
                        $("select.sel1").eq(j).val("trip");
                        console.log( $("select.sel1").eq(j).val());
                    }
                    $.ajax({
                        type    : "get",
                        url     : "../course/getlatlon",
                        dataType: "json",
                        data    : {
                            "course_type": course_type,
                            "course_num" : course_num
                        },
                        success : function (res) {
                            alert("success");
                            $("input.in1").eq(j).val(res.title);
                            $("input.in1").eq(j).attr("isSelect", "yes");
                            $("input.in1").eq(j).attr("course_num", course_num);
                            $("input.in1").eq(j).attr("cnt", j);
                            console.log($("input.in1").eq(j).val());
                            $("button.insert_course_button").eq(j-1).trigger("click");
                        }//sucess
                    });//ajax
                }

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
            <c:forEach var="dto" items="${list}" varStatus="i">
                <div style="border: 1px solid yellow">
                    <div>제목 : ${dto.title}</div>
                    <div>작성날짜 : ${dto.writeday}</div>
                    <button class="call_course_button" cos_num="${dto.cos_num}" cnt="${dto.cnt}" title="${dto.title}" user_num="${dto.user_num}"
                    step1="${dto.step1}" step2="${dto.step2}" step3="${dto.step3}" step4="${dto.step4}" step5="${dto.step5}"
                    writeday="${dto.writeday}">불러오기</button>
                </div>
            </c:forEach>
        </div>

        <!-- map -->
        <div id="map"></div>

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