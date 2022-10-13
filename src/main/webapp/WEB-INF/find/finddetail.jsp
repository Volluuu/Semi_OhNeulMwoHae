<%--
  Created by IntelliJ IDEA.
  User: ostsc
  Date: 2022-09-29
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" href="/resources/css/findbutton.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/93e75e33a3.js" crossorigin="anonymous"></script>
<html>
<head>
    <title>Title</title>
</head>
<style>

    div.place {
        display: flex;
    }

    span.day {
        float: right;
        color: gray;
    }

    span.writer {
        color: red;
        border: 1px solid red;
        border-radius: 40px;
        margin-left: 5px;
        font-size: 0.8em;
        padding: 3px;
    }

    button.fr {
        float: right;
        margin-left: 3px;
        margin-right: 3px;
    }

    .container {
        margin-top: 24px;
        max-width: 1000px;

    }

    .it {
        padding-bottom: 24px;
    }

    .w-btn-green {
        background-color: #77af9c;
        color: #d7fff1;
    }

    button {
        margin: 20px;
    }

    .w-btn {
        font-size: 18px;
        position: relative;
        border: none;
        display: inline-block;
        padding: 8px 16px;
        border-radius: 15px;
        font-family: "paybooc-Light", sans-serif;
        box-shadow: 0 7px 35px rgba(0, 0, 0, 0.2);
        text-decoration: none;
        font-weight: 600;
        transition: 0.25s;
    }

    .w-btn-outline {
        position: relative;
        padding: 8px 16px;
        border-radius: 15px;
        font-family: "paybooc-Light", sans-serif;
        box-shadow: 0 7px 35px rgba(0, 0, 0, 0.2);
        text-decoration: none;
        font-weight: 600;
        transition: 0.25s;
    }

    .w-btn-blue {
        background-color: #6aafe6;
        color: #d4dfe6;
    }

    .w-btn-red {
        background-color: red;
        color: #e1eef6;
    }
</style>

<script type="text/javascript">
    var find_num =${dto.find_num};
    var root = "${root}";
    $(function () {
        list();//처음 시작시 댓글 출력

    });

    function list() {
        var loginok = '${sessionScope.loginok}';
        var loginid = '${sessionScope.loginid}';
        var loginnum = '${sessionScope.user_num}';
        var user_num = '${dto.user_num}';
        var s = "";
        $.ajax({
            type: "get",
            url: root + "/commentfriend/list",
            dataType: "json",
            data: {"find_num": find_num},
            success: function (res) {
                $("b.banswer").html("<i class='bi bi-chat'> " + res.length);
                $.each(res, function (i, elt) {
                    s += "<div class='eltnickname' style='font-size: 12px;'><p>";
                    if (elt.relevel > 0) {
                        for (var a = 0; a < elt.relevel; a++) {
                            s += "&emsp;";
                        }
                        s += "<i class='bi bi-arrow-return-right'></i>";
                    }

                    s += "<span style='font-size: 14px'>" + elt.nickname + "</span>";
                    if (user_num == elt.user_num) {
                        s += "<span class='writer' style='font-size: 9px;' '>&nbsp;작성자&nbsp;</span>";
                    }
                    if (loginok == 'yes' && loginnum == elt.user_num) {
                        s += '<button class="btn btn-outline-dark adel fr" style="font-size: 10px;" friend_num="' + elt.friend_num + '">삭제</button>';
                        s += '<button class="btn btn-outline-dark aupd fr" style="font-size: 10px;" friend_num="' + elt.friend_num + '">수정</button>';

                    }
                    s += ' <c:if test="${sessionScope.loginok!=null}">';
                    if (elt.relevel < 2) {

                        s += '<button class="btn btn-outline-dark adap fr" style="font-size: 10px;" ' +

                            'regroup="' + elt.regroup + '" restep="' + elt.restep + '" relevel="' + elt.relevel + '"' +
                            ' friend_num="' + elt.friend_num + '" diff="' + elt.diff + '">답글</button>';
                        s += '</p>';
                    }
                    s += '</c:if>';

                    s += "<p class='eltcontent'><pre class='precontent'>";
                    if (elt.relevel > 0) {
                        for (var a = 0; a < elt.relevel; a++) {
                            s += "&emsp;&nbsp;&nbsp;";
                        }
                    }
                    s += elt.content;
                    s += "</p>";
                    s += "<span class='day' style='font-size: 10px;'>" + elt.writeday + "</span>";
                    s += "</pre>";
                    s += "</div>";
                    s += "<hr>";

                });
                $("div.alist").html(s);
            }
        });


    }
</script>

<body>
<div class="container" style="border: 1px solid lightgray;">
    <div class="it">
        <table style="width:100%;">
            <tr style="border-bottom: 1px solid lightgray;">
                <td>
                    <h4 style="margin-top: 12px;">${dto.subject}<sub style="font-size: 14px;" >&emsp;${dto.nickname}</sub></h4>
                    <!-- 로그인 중이면서 세션의 아이디와 글의 아이디가 같을 경우에만 수정,삭제 가능 -->
                    <c:if test="${sessionScope.loginok!=null && sessionScope.user_num==dto.user_num}">
                    <div class="de_ed" style="float: right">
                        <button class="w-btn w-btn-blue" style="font-size: 12px;" type="button" onclick="location.href='${root}/findboard/updatefind?find_num=${dto.find_num}&currentPage=${currentPage}'"onclick="location.href='${root}/findboard/updatefind?find_num=${dto.find_num}&currentPage=${currentPage}'"><i style="font-size: 14px;" class="fa-solid fa-pen-to-square"></i>&nbsp;수정</button>
                        <button class="w-btn w-btn-red" style="font-size: 12px;" type="button" onclick="location.href='${root}/findboard/deletefind?find_num=${dto.find_num}&currentPage=${currentPage}'"><i style="font-size: 14px;" class="fa fa-times">&nbsp;삭제</i></button>
                    </c:if>
                    </div>
                    <span style="color:#ccc;font-size:13px;">
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
					&nbsp;&nbsp;
					조회&nbsp;${dto.readcount}
				</span>
                </td>
            </tr>
            <tr height="300">
                <td>
<%--                    사진 들어가는위치--%>
                    <div class="place">
                        <c:if test="${dto.find1photo!=null}">
                            <a href="${root}/course/${fn:split(dto.find1,',')[0]}detail?${fn:split(dto.find1,',')[0]}_num=${fn:split(dto.find1,',')[1]}&currentPage=1">
                                <figure style="margin: 10px;" class="fig" ffind="${dto.find1}"><img
                                        src="${dto.find1photo}" width="250" height="250">
                            </a>
                            <figcaption><span class="txt">1. ${dto.find1title}</span</figcaption>
                            </figure>
                        </c:if>
                        <c:if test="${dto.find2photo!=null}">
                            <a href="${root}/course/${fn:split(dto.find2,',')[0]}detail?${fn:split(dto.find2,',')[0]}_num=${fn:split(dto.find2,',')[1]}&currentPage=1">
                                <figure style="margin: 10px;" class="fig" ffind="${dto.find2}"><img
                                        src="${dto.find2photo}" width="250" height="250">
                            </a>
                            <figcaption><span class="txt">2. ${dto.find2title}</span></figcaption>
                            </figure>

                        </c:if>
                        <c:if test="${dto.find3photo!=null}">
                            <a href="${root}/course/${fn:split(dto.find3,',')[0]}detail?${fn:split(dto.find3,',')[0]}_num=${fn:split(dto.find3,',')[1]}&currentPage=1">
                                <figure style="margin: 10px;" class="fig" ffind="${dto.find3}"><img
                                        src="${dto.find3photo}" width="250" height="250">
                            </a>
                            <figcaption><span class="txt">3. ${dto.find3title}</span></figcaption>
                            </figure>

                        </c:if>
                        <c:if test="${dto.find4photo!=null}">
                            <a href="${root}/course/${fn:split(dto.find4,',')[0]}detail?${fn:split(dto.find4,',')[0]}_num=${fn:split(dto.find4,',')[1]}&currentPage=1">
                                <figure style="margin: 10px;" class="fig" ffind="${dto.find4}"><img
                                        src="${dto.find4photo}" width="250" height="250">
                            </a>
                            <figcaption><span class="txt">4. ${dto.find4title}</span></figcaption>
                            </figure>

                        </c:if>
                        <c:if test="${dto.find5photo!=null}">
                            <a href="${root}/course/${fn:split(dto.find5,',')[0]}detail?${fn:split(dto.find5,',')[0]}_num=${fn:split(dto.find5,',')[1]}&currentPage=1">
                                <figure style="margin: 10px;" class="fig" ffind="${dto.find5}"><img
                                        src="${dto.find5photo}" width="250" height="250">
                            </a>
                            <figcaption><span class="txt">5. ${dto.find5title}</span></figcaption>
                            </figure>

                        </c:if>
                    </div>

                    <%--내용------------------------------%>
                    <pre>${dto.content}</pre>
                    <br><br>

                    <c:if test="${dto.photo!='noimage.png'}">
                        <c:forTokens var="photo" items="${dto.photo}" delims=",">
                            <img alt="" src="${root}/upload/${photo}" width="250"
                                 onerror="this.style.display='none'"><!-- 해당 폴더에 없는 사진은 안보이게 처리 -->
                        </c:forTokens>
                    </c:if>
                    <br><br>
                    <hr>
                    &nbsp;<b class="banswer">0</b>
                    <br>
                    <div class="alist">

                    </div>

                    <c:if test="${sessionScope.loginok!=null}">
                        <div class="aform">
                            <form id="aform">
                                <input type="hidden" name="find_num" value="${dto.find_num}">
                                <input type="hidden" name="user_num" value="${sessionScope.user_num}">
                                <input type="hidden" name="regroup" value="0">
                                <input type="hidden" name="restep" value="0">
                                <input type="hidden" name="relevel" value="0">
                                <br>
                                <textarea class="form-control" name="content" id="content"
                                          style="width:100%;height:140px;" placeholder="댓글을 입력해주세요">

                                </textarea><button class="w-btn w-btn-green" type="button" id="btnasave" style="float: right; font-size: 14px; margin-top: 8px;">등록</button>
                            </form>
                            <button type="button" class="btn btn-outline-dark" style="font-size: 14px; margin-top: 8px;"
                                    onclick="location.href='${root}/findboard/list?currentPage=${currentPage}'">목록
                            </button>
                        </div>
                    </c:if>
                </td>
            </tr>
        </table>
    </div>

</div>
<script type="text/javascript">
    var find_num =${dto.find_num};
    var root = "${root}";
    console.log("find_num=" + find_num);

    list();//처음 시작시 댓글 출력

    $(document).on("click", ".adel", function () {
        var friend_num = $(this).attr("friend_num");
        var yes = confirm("삭제하시겠습니까?");
        if (yes) {
            $.ajax({
                type: "get",
                url: root + "/commentfriend/delete",
                dataType: "text",
                data: {"friend_num": friend_num},
                success: function (res) {
                    list();
                }
            });
        }
    });

    $(document).on("click", ".adap", function () {
        var ti = $(this);
        var friend_num = ti.attr("friend_num");
        var user_num = '${sessionScope.user_num}';
        var regroup = ti.attr("regroup");
        var restep = ti.attr("restep");
        var relevel = ti.attr("relevel");
        var diff = ti.attr("diff");

        $(".aform").remove();
        ti.parents(".eltnickname").append('<div class="aform"><form id="aform">' +
            '<input type="hidden" name="friend_num" value="' + friend_num + '">' +
            '<input type="hidden" name="find_num" value="' + find_num + '">' +
            '<input type="hidden" name="user_num" value="' + user_num + '">' +
            '<input type="hidden" name="regroup" value="' + regroup + '">' +
            '<input type="hidden" name="restep" value="' + restep + '">' +
            '<input type="hidden" name="relevel" value="' + relevel + '">' +
            '<input type="hidden" name="diff" value="' + diff + '">' +

            '<textarea name="content" id="content" style="width:400px;height:60px;"></textarea><br><button class="w-btn w-btn-green" type="button" id="btnasave" style="font-size: 14px; margin-left: 347px;">등록</button></form></div>'
            );

    });

    $(document).on("click", ".aupd", function () {
        var ti = $(this);
        var friend_num = ti.attr("friend_num");
        $.ajax({
            type: "get",
            url: root + "/commentfriend/updateform",
            dataType: "json",
            data: {"friend_num": friend_num},
            success: function (res) {
                ti.parent().siblings("pre.precontent").remove();
                ti.parent().siblings(".eltcontent").html("<textarea class='form-control' name='content'" +
                    "required='required'  style='width:400px;height:60px;'>" + res.content +

                    "</textarea><button class='btn btn-outline-dark aupdok' style='font-size: 10px' friend_num='" + res.friend_num + "'>확인</button>");

            }
        });
    });

    $(document).on("click", ".aupdok", function () {
        var friend_num = $(this).attr("friend_num");
        var aupdtxt = $(this).prev().val();
        console.log(aupdtxt);
        $.ajax({
            type: "get",
            url: root + "/commentfriend/updateok",
            dataType: "text",
            data: {"friend_num": friend_num, "content": aupdtxt},
            success: function (res) {
                list();
            }
        });
    });

    $(document).on("click", "#btnasave", function () {
        var root = "${root}";
        var fdata = $("#aform").serialize();//form태그 안의 name을 쿼리 스트링 형태로 읽어온다
        $.ajax({
            type: "get",
            url: root + "/commentfriend/insert",
            dataType: "text",
            data: fdata,
            success: function (res) {
                list();//댓글 목록을 다시 db에서 가져와서 출력

                //입력값이랑 사진 안보이게 처리
                $("#content").val("");
            }
        });
    });

</script>
</body>
</html>
