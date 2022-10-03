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
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<html>
<head>
    <title>Title</title>
</head>
<style>
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
                    s += "<div class='eltnickname'><p>";
                    if(elt.relevel>0){
                        for(var a=0;a<elt.relevel;a++){
                            s+="&emsp;";
                        }
                        s+="<i class='bi bi-arrow-return-right'></i>";
                    }

                    s+=elt.nickname;
                    if (user_num == elt.user_num) {
                        s += "<span class='writer'>&nbsp;작성자&nbsp;</span>";
                    }
                    if (loginok == 'yes' && loginnum == elt.user_num) {
                        s += '<button class="btn btn-outline-dark adel fr" friend_num="' + elt.friend_num + '">삭제</button>';
                        s += '<button class="btn btn-outline-dark aupd fr" friend_num="' + elt.friend_num + '">수정</button>';

                    }
                    s += ' <c:if test="${sessionScope.loginok!=null}">';
                    s += '<button class="btn btn-outline-dark adap fr" ' +
                        'regroup="' + elt.regroup + '" restep="' + elt.restep + '" relevel="' + elt.relevel + '"' +
                        ' friend_num="' + elt.friend_num + '" rev="'+elt.rev+'">답글</button>';
                    s += '</p>';
                    s += '</c:if>';

                    s += "<p class='eltcontent'><pre class='precontent'>";
                    if(elt.relevel>0){
                        for(var a=0;a<elt.relevel;a++){
                            s+="&emsp;&nbsp;&nbsp;";
                        }
                    }
                    s+=elt.content;
                    s+="</p>";
                    s += "<span class='day'>" + elt.writeday + "</span>";
                    s += "</pre>";
                    s += "</div>";

                });
                $("div.alist").html(s);
            }
        });


    }
</script>

<body>
<table class="table table-bordered" style="width:600px;max-width: 600px;">
    <tr>
        <td>
            <h4><b>${dto.subject}</b></h4>
            <%--            <c:if test="${memphoto!='no'}">--%>
            <%--                <img alt="" src="../upload/${memphoto}" width="60" height="60" class="rounded-circle"--%>
            <%--                     align="left" onerror="this.src='../image/noimage.png'" hspace="15">--%>
            <%--            </c:if>--%>
            <%--            <b>${dto.name}(${dto.id})</b><br>--%>
            <span style="color:#ccc;font-size:13px;">
					<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
					&nbsp;&nbsp;
					조회&nbsp;${dto.readcount}
				</span>
        </td>
    </tr>
    <tr height="300" valign="top">
        <td>
            <pre>${dto.content}</pre>
            <br><br>
            <c:if test="${dto.photo!='noimage.png'}">
                <c:forTokens var="photo" items="${dto.photo}" delims=",">
                    <img alt="" src="${root}/upload/${photo}" width="250"
                         onerror="this.style.display='none'"><!-- 해당 폴더에 없는 사진은 안보이게 처리 -->
                </c:forTokens>
            </c:if>
            <br><br>
            &nbsp;<b class="banswer">0</b>
            <br>
            <div class="alist">
                댓글목록
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
                        <textarea class="form-control" name="content" id="content" style="width:400px;height:60px;"></textarea>
                        <button type="button" class="btn btn-outline-dark" id="btnasave">등록</button>
                    </form>
                </div>
            </c:if>
        </td>
    </tr>
    <tr>
        <td>
            <button type="button" class="btn btn-outline-dark" onclick="location.href='${root}/findboard/findform'">새글
            </button>

            <button type="button" class="btn btn-outline-dark"
                    onclick="location.href='${root}/findboard/list?currentPage=${currentPage}'">목록
            </button>

            <!-- 로그인 중이면서 세션의 아이디와 글의 아이디가 같을 경우에만 수정,삭제 가능 -->
            <c:if test="${sessionScope.loginok!=null && sessionScope.user_num==dto.user_num}">
                <button type="button" class="btn btn-outline-dark"
                        onclick="location.href='${root}/findboard/updatefind?find_num=${dto.find_num}&currentPage=${currentPage}'">
                    수정
                </button>

                <button type="button" class="btn btn-outline-dark"
                        onclick="location.href='${root}/findboard/deletefind?find_num=${dto.find_num}&currentPage=${currentPage}'">
                    삭제
                </button>
            </c:if>
        </td>
    </tr>
</table>
<script type="text/javascript">
    var find_num =${dto.find_num};
    var root = "${root}";
    $(function () {
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
            var rev = ti.attr("rev");

            $(".aform").remove();
            ti.parents(".eltnickname").append('<div class="aform"><form id="aform">' +
                '<input type="hidden" name="friend_num" value="' + friend_num + '">' +
                '<input type="hidden" name="find_num" value="' + find_num + '">' +
                '<input type="hidden" name="user_num" value="' + user_num + '">' +
                '<input type="hidden" name="regroup" value="' + regroup + '">' +
                '<input type="hidden" name="restep" value="' + restep + '">' +
                '<input type="hidden" name="relevel" value="' + relevel + '">' +
                '<input type="hidden" name="rev" value="' + rev + '">' +
                '<textarea name="content" id="content" style="width:400px;height:60px;"></textarea>' +
                '<button type="button" class="btn btn-outline-dark" id="btnasave">등록</button></form></div>');

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
                        "</textarea><button class='btn btn-outline-dark aupdok' friend_num='" + res.friend_num + "'>확인</button>");
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

    });

    function list() {
        var loginok = '${sessionScope.loginok}';
        var loginid = '${sessionScope.loginid}';
        var loginnum = '${sessionScope.user_num}';
        var user_num = '${dto.user_num}';
// 		console.log(loginok);
// 		console.log(loginid);
        var s = "";
        $.ajax({
            type: "get",
            url: root + "/commentfriend/list",
            dataType: "json",
            data: {"find_num": find_num},
            success: function (res) {
                $("b.banswer").html("<i class='bi bi-chat'> " + res.length);
                $.each(res, function (i, elt) {
                    s += "<div class='eltnickname'><p>";
                    if(elt.relevel>0){
                        for(var a=0;a<elt.relevel;a++){
                            s+="&emsp;";
                        }
                        s+="<i class='bi bi-arrow-return-right'></i>";
                    }

                    s+=elt.nickname;
                    if (user_num == elt.user_num) {
                        s += "<span class='writer'>&nbsp;작성자&nbsp;</span>";
                    }
                    if (loginok == 'yes' && loginnum == elt.user_num) {
                        s += '<button class="btn btn-outline-dark adel fr" friend_num="' + elt.friend_num + '">삭제</button>';
                        s += '<button class="btn btn-outline-dark aupd fr" friend_num="' + elt.friend_num + '">수정</button>';

                    }
                    s += ' <c:if test="${sessionScope.loginok!=null}">';
                    s += '<button class="btn btn-outline-dark adap fr" ' +
                        'regroup="' + elt.regroup + '" restep="' + elt.restep + '" relevel="' + elt.relevel + '"' +
                        ' friend_num="' + elt.friend_num + '" rev="'+elt.rev+'">답글</button>';
                    s += '</p>';
                    s += '</c:if>';

                    s += "<p class='eltcontent'><pre class='precontent'>";
                    if(elt.relevel>0){
                        for(var a=0;a<elt.relevel;a++){
                            s+="&emsp;&nbsp;&nbsp;";
                        }
                    }
                    s+=elt.content;
                    s+="</p>";
                    s += "<span class='day'>" + elt.writeday + "</span>";
                    s += "</pre>";
                    s += "</div>";

                });
                $("div.alist").html(s);
            }
        });


    }
</script>
</body>
</html>
