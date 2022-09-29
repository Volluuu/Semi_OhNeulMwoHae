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
    .mapandselect{
        width: 1500px;
        margin: 0 auto;
    }

    /* history */
    .savehistory{
       border: 1px solid red;
        width: 300px;
    }

    /* 지도 */
    #map{
        width:700px;
        height:750px;"
    }

    /* 코스 제목 */
    #cos_title{
        width: 400px;
        margin: 0 auto;
        font-size: 15px;
    }

    /* 테마 선택 */
    .cosselect{
       width:500px;
        position:relative;
        border:1px solid black;
    }

    .cosselect_main{
       border: 1px solid red;
        width: 500px;
        margin: 0 auto;
        font-size: 10px;
    }
    .cosselect_thema{
        border: 1px solid blue;
        width: 120px;
        display: inline-block;
        vertical-align: top;
    }
    #cossearch_insert{
        border: 1px solid magenta;
        width: 370px;
        display: inline-block;
        vertical-align: top;
    }

    #keyword{
        width: 300px;
        display: flex;
        display: inline-block;
        vertical-align: top;
    }
    #getlist{
        border: 1px solid orange;
        width: 50px;
        display: inline-block;
        vertical-align: top;
    }
    .cosadd_btn{
    }

</style>
    <script>
        var cnt="1";
        var s="";
        $(function (){
            $(document).on("click",".cosselectadd",function (){
                if($("div.cosselect_main").length==5) {
                    alert("경로 추가는 최대 5개까지만 가능합니다.");
                    return;
                };
                cnt++;
                cosSelectAdd();
                $("div.cos2").append(s);
                s="";

                for(var i=0;i<$(".cosselect_main").length;i++){
                    $(".cosselect_main").eq(i).find(".coscnt").text("경로 "+(i+1));
                }
            });

            $(document).on("click",".cosselectsubstract",function (){
                if($("div.cosselect_main").length<2) {
                    alert("첫 경로는 삭제 할 수 없습니다.");
                    return;
                };

                $(this).parents(".cosselect_main").remove();
                cnt--;

                for(var i=0;i<$(".cosselect_main").length;i++){
                    $(".cosselect_main").eq(i).find(".coscnt").text("경로 "+(i+1));
                }
            });
        });

        function cosSelectAdd(){
            s+="<div class='cosselect_main' id='delSearchKey'>";
            s+="<span class='coscnt'>경로 "+cnt+"</span>";
            s+="<br>";
            s+="<div class='cosselect_thema'>";
            s+="<select class='form-control sel1' id='type'>";
            s+="<option selected='' disabled='' hidden='' class=op1'>테마 선택</option>";
            s+="<option class='op1' value='cafe'>카페</option>";
            s+="<option class='op1' value='food'>음식점</option>";
            s+="<option class='op1' value='trip'>놀거리</option>";
            s+="</select>";
            s+="</div>";
            s+="<div class='i' id='cossearch_insert'>";
            s+="<input type='text' class='form-control in1' placeholder='검색어를 입력' id='keyword'>";
            s+="<button class='form-control' id='getlist'><i class='fas fa-search' aria-hidden='true'></i></button>";
            s+="</div>";
            s+="<div class='cosadd_btn'>";
            s+="<button type='button' class='cosselectsubstract'><i class='fas fa-minus'></i></button>";
            s+="<button type='button' class='cosselectadd'><i class='fas fa-plus'></i></button>";
            s+="</div>";
            s+="</div>";
        }

      /*  function list() {
           /!* var loginok='${sessionScope.loginok}';
            var loginid='${sessionScope.loginid}';
            var writerid='${dto.id}';
            //alert(loginok+","+loginid);
            //alert(writerid);
*!/
            var s="";
            $.ajax({
                type:"get",
                url:"../course/list",
                dataType:"json",
                data:{"user_num":num},
                success:function(res){
                    $.each(res, function(i, elt){
                        if(writerid==elt.id){
                        s+="<div>"+elt.title;
                            s+="<span class='writer'>작성자</span>";
                        }
                        s+="<br>";
                        s+="<pre>"+elt.message;
                        s+="<span class='day'>"+elt.writeday;
                        if(loginok=='yes' && loginid==elt.id){
                            s+="<i class='material-icons adel' style='font-size:17px;' id='adel' idx="+elt.idx+">close</i>"
                        }
                        s+="</span></pre></div>";
                    });
                    $("div.alist").html(s);
                }//success
            }); //ajax
        };//function*/
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
        <h2>경로설정</h2>
            <input type="text" class="form-control" id="cos_title" placeholder="코스 제목 입력">
            <div class="cosselect_main">
                <span class="coscnt">경로 1</span>
                <br>
                <div class="cosselect_thema">
                    <select class="form-control sel1" id="type">
                        <option selected="" disabled="" hidden="" class="op1">테마 선택</option>
                        <option class="op1" value="cafe">카페</option>
                        <option class="op1" value="food">음식점</option>
                        <option class="op1" value="trip">놀거리</option>
                    </select>
                </div>
                <div class="i" id="cossearch_insert">
                    <input type="text" class="form-control in1" placeholder="검색어를 입력" id="keyword">
                    <button class="form-control" id="getlist"><i class="fas fa-search" aria-hidden="true"></i></button>
                </div>

                <div class="cosadd_btn">
                    <button type="button" class="cosselectsubstract"><i class='fas fa-minus'></i></button>
                    <button type="button" class="cosselectadd"><i class='fas fa-plus'></i></button>
                </div>
            </div>
            <div class="cos2">

            </div>


        <!-- 경로설정 버튼 -->
        <div class="toorlist"></div>
        <button style="position:absolute; bottom:0%; left:50px; font-weight: bold">경로수정</button>
        <button style="position:absolute; bottom:0%; left:200px; font-weight: bold">경로삭제</button>
        <button style="position:absolute; bottom:0%; left:350px; font-weight: bold">경로저장</button>
        </div>

    </div>
</div>

<script>

    var type_of_course = "";
    var user_keyword = "";
    $("#type").change(function () {
        type_of_course = $("#type").val();
        alert(type_of_course);

    }); //type change end

    $("#keyword").change(function () {
        alert("hi");
        user_keyword = $(this).val();
    }); // keyword change end

    $("#getlist").click(function () {
        $.ajax({
            type    : "get",
            url     : "../help/getlist",
            dataType: "text",
            data    : {
                "title": user_keyword,
                "type": type_of_course
            },
            success : function (res) {
                (".toorlist").html("hi");
            }//sucess
        });//ajax
    }); // getlist click end
</script>
</body>
</html>