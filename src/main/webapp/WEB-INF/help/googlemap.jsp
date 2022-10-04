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

        #searchword {
            width: 300px;
            display: flex;
            display: inline-block;
            vertical-align: top;
        }

        #getlist {
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
        /* 더하기 버튼 추가 시, 입력창 추가 이벤트 */
        $(function () {
            /* +버튼 클릭 시, 경로 추가 이벤트 */
            $(document).on("click", ".cosselectadd", function () {
                if ($("div.cosselect_main").length == 5) {
                    alert("경로 추가는 최대 5개까지만 가능합니다.");
                    return;
                };
                cnt++;
                console.log(cnt);
                cosSelectAdd();
                $("div.cos2").append(s);
                s = "";

                for (var i = 0; i < $(".cosselect_main").length; i++) {
                    $(".cosselect_main").eq(i).find(".coscnt").text("경로 " + (i + 1));
                }
            });

            /* 빼기 버튼 클릭 시, 경로 삭제 이벤트 */
            $(document).on("click", ".cosselectsubstract", function () {
                if ($("div.cosselect_main").length < 2) {
                    alert("첫 경로는 삭제 할 수 없습니다.");
                    return;
                }
                ;
                if (confirm($(this).siblings(".coscnt").text() + " 를 삭제하시겠습니까?")) {
                    $(this).parents(".cosselect_main").remove();
                    cnt--;
                }

                for (var i = 0; i < $(".cosselect_main").length; i++) {
                    $(".cosselect_main").eq(i).find(".coscnt").text("경로 " + (i + 1));
                }
            });

            /* 검색 이벤트 */

            $(document).on("keyup", "#searchword", function () {
                if($(this).attr("cnt") != cnt) { return;}
                var txt = $(this).val();
                if(txt != '') {
                    $(".searchlist").children().remove();

                    $.ajax({
                        type    : "get",
                        url     : "../course/searchlist",
                        dataType: "json",
                        data    : {"searchthema": $("#searchthema").val(), "searchword": $("#searchword").val()},
                        success : function (res) {
                            //테마를 3개로 나눠서 검색 시 테이블을 구분해서 가져옴
                            if($("#searchthema").val() == "cafe") {
                                console.log("cafe");
                                $.each(res, function(i, elt){
                                    $(".searchlist").append(
                                        $('<div>').text(elt.title).attr({'cafe_num' : elt.cafe_num})
                                    );
                                });
                            }
                            if($("#searchthema").val() == "trip") {
                                console.log("trip");
                                $.each(res, function(i, elt){
                                    $(".searchlist").append(
                                        $('<div>').text(elt.title).attr({'trip_num' : elt.trip_num})
                                    );
                                });
                            }
                            if($("#searchthema").val() == "food") {
                                console.log("food");
                                $.each(res, function(i, elt){
                                    $(".searchlist").append(
                                        $('<div>').text(elt.title).attr({'food_num' : elt.food_num})
                                    );
                                });
                            }

                            $(".searchlist").children().addClass("searchwordlist");
                        }//sucess
                    });//ajax

                } else {
                    $(".searchlist").children().remove();
                } // if end
            }); // getlist click end

            //검색목록 클릭 시 값이 input tag에 바인드되고 검색창이 꺼지게 하는 이벤트
            $(document).on("click", ".searchwordlist",function(){
                alert("hi");
                $("input.in1").val($(this).text());
                if($("#searchthema").val() == "cafe") {
                    console.log("cafe");
                    stepArr[0] = "cafe," + $(this).attr("cafe_num");
                }
                if($("#searchthema").val() == "trip") {
                    console.log("trip");
                    stepArr[0] = "trip," + $(this).attr("trip_num");
                }
                if($("#searchthema").val() == "food") {
                    console.log("food");
                    stepArr[0] = "food," + $(this).attr("food_num");
                }
                console.log(stepArr[0]);
                $(this).parent().hide();
            });

        //테마를 선택하지 않고 검색창 클릭시 테마선택으로 이동
        $(document).on("click", "#searchword", function () {
            if($("#searchthema option:selected").text() == "테마 선택") {
                alert("테마를 먼저 선택해 주세요");
                $("#searchthema").focus();
                return;
            }
            $(".searchlist").show();
        });

        });

        /* 더하기 버튼 추가 시, 입력창 추가 메서드 */
        function cosSelectAdd() {
            s += "<div class='cosselect_main'>";
            s += "<span class='coscnt'></span>";
            s += "<button type='button' class='cosselectsubstract'><i class='fas fa-minus'></i></button>";
            s += "<br>";
            s += "<div class='cosselect_thema'>";
            s += "<select class='form-control sel1' id='searchthema' cnt=" + cnt + " name='searchthema'>";
            s += "<option selected='' disabled='' hidden='' class=op1'>테마 선택</option>";
            s += "<option class='op1' value='cafe'>카페</option>";
            s += "<option class='op1' value='food'>음식점</option>";
            s += "<option class='op1' value='trip'>놀거리</option>";
            s += "</select>";
            s += "</div>";
            s += "<div class='i' id='cossearch_insert'>";
            s += "<input type='text' class='form-control in1' placeholder='검색어를 입력' id='searchword' name='searchword' cnt='"+cnt+"'>";
            s += "<div class='searchlist'></div>";
            s += "<button class='form-control' id='getlist'><i class='fas fa-search' aria-hidden='true'></i></button>";
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
                center: new kakao.maps.LatLng(33.450701, 126.570667),
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
            <div class="cosselect_main first">
                <span class="coscnt">경로 1</span>
                <button type="button" class="cosselectsubstract"><i class='fas fa-minus'></i></button>
                <br>
                <div class="cosselect_thema">
                    <select class="form-control sel1" id="searchthema" required="required" name="searchthema">
                        <option selected="" disabled="" hidden="" class="op1">테마 선택</option>
                        <option class="op1" value="cafe">카페</option>
                        <option class="op1" value="food">음식점</option>
                        <option class="op1" value="trip">놀거리</option>
                    </select>
                </div>
                <div class="i" id="cossearch_insert">
                    <input type="text" class="form-control in1" placeholder="검색어를 입력" id="searchword"
                           required="required" name="searchword" cnt="1">
                    <div class="searchlist"></div>
                    <button class="form-control" id="getlist"><i class="fas fa-search" aria-hidden="true"></i></button>
                </div>

                <div class="cosadd_btn">

                </div>
            </div>
            <div class="cos2"></div>
                <button type="button" class="cosselectadd" style="margin:auto; display: block;">경로추가<i class='fas fa-angle-down'></i></button>


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