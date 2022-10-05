<%--
  Created by IntelliJ IDEA.
  User: ostsc
  Date: 2022-09-28
  Time: 오전 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<html>
<head>
    <title>Title</title>
</head>
<style>
    div.dg_container {
        width: 65%;
        margin-left: 15%;
        margin-right: 20%;
    }

    div.dg_searcharea {
        width: 100%;
        text-align: center;
    }

    a.dg_a {
        color: gray;
        text-decoration: none;
    }

    a.dg_a:link, a.dg_a:visited {
        color: dimgray;
        text-decoration: none;
    }

    a.dg_a:hover, a.dg_a:active {
        color: black;
        text-decoration: underline;
    }

    table.findtable {
        width: 65%;
        margin-left: 15%;
        margin-right: 20%;
        outline: 1px solid black;
        text-indent: 10px;

    }

    table.findtable td {
        border: 1px solid black;
    }

    table.findtable tr {
        width: 25%;
    }

    .findtable p {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        width: 300px;
        height: 22px;
    }

    footer {
        font-size: 5px;
        background-color: darkslateblue;
    }

    .paging {
        display: flex;
        justify-content: center;
    }

    ul {
        list-style: none;
    }

    li {
        float: left;
        padding: 3px 3px 3px 3px;
    }

    div.dg_searcharea {
        justify-content: center;
    }

    div.dg_session {
        float: right;
    }

    span.fr {
        float: right;
    }

    #divgrid {
        width: 100%;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-auto-rows: minmax(200px, auto);
        gap: 20px;
        /*margin-left: auto;*/
        /*margin-right: auto;*/
        /*justify-content: space-between;*/
    }
</style>
<body>
<div class="dg_container">
    <div class="dg_searcharea">
        <%--        <form action="searchlist">--%>
        <div class="input-group">
            <select name="findcolumn" class="form-control" style="text-align: center;" id="findcolumn">
                <option value="subject" selected>제목</option>
                <option value="content">내용</option>
                <option value="subcon">제목+내용</option>
                <option value="nickname">닉네임</option>
            </select>

            <input type="text" name="findword" class="form-control" placeholder="검색 단어" value="${param.findword}"
                   id="findword">

            <button type="submit" class="btn btn-outline-dark" id="searchbtn">검색</button>
            <c:if test="${sessionScope.loginok!=null}">
                <a href="${root}/findboard/searchlist?findcolumn=nickname&findword=${sessionScope.nickname}&currentPage=${currentPage}"
                   class="dg_a">내가 쓴 글</a>
            </c:if>
            <script>
                var root = "${root}";
                $(document).on("click", "#searchbtn", function () {
                    var findcolumn = $("#findcolumn option:selected").val();
                    var findword = $("#findword").val();
                    var currentPage = "${currentPage}";
                    var s = "";
                    var p = "";
                    $.ajax({
                        type: "get",
                        url: root + "/findboard/searchlist",
                        dataType: "json",
                        data: {"findcolumn": findcolumn, "findword": findword, "currentPage": currentPage},
                        success: function (res) {
                            if (res.totalCount == 0) {
                                $("#uc").text("등록된 글이 없습니다");
                            } else {
                                $("#uc").text("총 " + res.totalCount + "개의 글이 있습니다");
                                $.each(res.list, function (i, elt) {
                                    s += '<div class="griditem">';
                                    s += '<a href="' + root + '/findboard/finddetail?find_num=' + elt.find_num + '&currentPage=' + res.currentPage + '" style="color:black;text-decoration:none;">';
                                    if (elt.find1photo != null) {
                                        s += '<img src="' + elt.find1photo + '" class="img-thumbnail" style="margin-bottom:7px;width:300px;aspect-ratio: 1/1;">';
                                    } else {
                                        s += '<img src="' + root + '/upload/' + elt.photo + '" class="img-thumbnail" style="margin-bottom:7px;width:300px;aspect-ratio: 1/1;">';
                                    }
                                    s += '<p>제목 : ' + elt.subject + '</p>';
                                    s += '<p>내용 : ' + elt.content + '</p>';
                                    s += '<p>닉네임 : ' + elt.nickname + '</p>';
                                    s += '<p style="color: darkgray;">';
                                    s += '<span class="fr">';
                                    s += '<i class="bi bi-eye"></i>&nbsp;' + elt.readcount + '&nbsp;';
                                    s += '<i class="bi bi-chat"></i>&nbsp;' + elt.answercount + '&nbsp;';
                                    s += '</span>';
                                    s += '</p>';
                                    s += '</div>';
                                });
                                p += '<ul class="pagination">';
                                if (res.startPage > 1) {
                                    p += '<li class="page-item"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + (res.startPage - 1) + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+(res.startPage - 1)+'">이전</a></li>';
                                }
                                for (var pp = res.startPage; pp <= res.endPage; pp++) {
                                    if (pp == res.currentPage) {
                                        p += '<li class="page-item active"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + pp + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+pp+'">' + pp + '</a></li>';
                                    } else {
                                        p += '<li class="page-item"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + pp + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+pp+'">' + pp + '</a></li>';
                                    }
                                }
                                if (res.totalPage > res.endPage) {
                                    p += '<li class="page-item"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + (res.endPage + 1) + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+(res.endPage + 1)+'">다음</a></li>';

                                }
                                p += '</ul>';
                                $("#divgrid").html(s);
                                $("#paging").html(p);
                            }


                        }
                    });
                });

                $(document).on("click", ".page-link", function () {
                    var findcolumn = $(this).attr("findcolumn");
                    var findword = $(this).attr("findword");
                    var currentPage = $(this).attr("currentPage");
                    var s = "";
                    var p = "";
                    $.ajax({
                        type: "get",
                        url: root + "/findboard/searchlist",
                        dataType: "json",
                        data: {"findcolumn": findcolumn, "findword": findword, "currentPage": currentPage},
                        success: function (res) {
                            if (res.totalCount == 0) {
                                $("#uc").text("등록된 글이 없습니다");
                            } else {
                                $("#uc").text("총 " + res.totalCount + "개의 글이 있습니다");
                                $.each(res.list, function (i, elt) {
                                    s += '<div class="griditem">';
                                    s += '<a href="' + root + '/findboard/finddetail?find_num=' + elt.find_num + '&currentPage=' + res.currentPage + '" style="color:black;text-decoration:none;">';
                                    if (elt.find1photo != null) {
                                        s += '<img src="' + elt.find1photo + '" class="img-thumbnail" style="margin-bottom:7px;width:300px;aspect-ratio: 1/1;">';
                                    } else {
                                        s += '<img src="' + root + '/upload/' + elt.photo + '" class="img-thumbnail" style="margin-bottom:7px;width:300px;aspect-ratio: 1/1;">';
                                    }
                                    s += '<p>제목 : ' + elt.subject + '</p>';
                                    s += '<p>내용 : ' + elt.content + '</p>';
                                    s += '<p>닉네임 : ' + elt.nickname + '</p>';
                                    s += '<p style="color: darkgray;">';
                                    s += '<span class="fr">';
                                    s += '<i class="bi bi-eye"></i>&nbsp;' + elt.readcount + '&nbsp;';
                                    s += '<i class="bi bi-chat"></i>&nbsp;' + elt.answercount + '&nbsp;';
                                    s += '</span>';
                                    s += '</p>';
                                    s += '</div>';
                                });
                                p += '<ul class="pagination">';
                                if (res.startPage > 1) {
                                    p += '<li class="page-item"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + (res.startPage - 1) + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+(res.startPage - 1)+'">이전</a></li>';
                                }
                                for (var pp = res.startPage; pp <= res.endPage; pp++) {
                                    if (pp == res.currentPage) {
                                        p += '<li class="page-item active"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + pp + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+pp+'">' + pp + '</a></li>';
                                    } else {
                                        p += '<li class="page-item"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + pp + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+pp+'">' + pp + '</a></li>';
                                    }
                                }
                                if (res.totalPage > res.endPage) {
                                    p += '<li class="page-item"><a class="page-link" href="' + root + '/findboard/searchlist?findcolumn='+res.findcolumn+'&findword='+res.findword+'&currentPage=' + (res.endPage + 1) + '" findcolumn="'+res.findcolumn+'" findword="'+res.findword+'" currentPage="'+(res.endPage + 1)+'">다음</a></li>';

                                }
                                p += '</ul>';
                                $("#divgrid").html(s);
                                $("#paging").html(p);
                            }


                        }
                    });
                });
            </script>
            <div class="dg_session">
                <c:if test="${sessionScope.loginok==null}">
                    <b>로그인이 안 되어 있습니다</b>
                    <button type="button" class="btn btn-outline-dark" id="dg_loginbtn">세션 주기</button>
                </c:if>

                <c:if test="${sessionScope.loginok!=null}">
                    <b>${sessionScope.name}님 로그인 중</b>
                    &nbsp;&nbsp;
                    <button type="button" class="btn btn-outline-dark" id="dg_logoutbtn">세션 없애기</button>
                </c:if>
            </div>
        </div>
        <%--        </form>--%>

    </div>

    <script>
        $(document).on("click", "#dg_loginbtn", function () {
            var root = "${root}";
            console.log("root" + root);
            $.ajax({
                type: "get",
                url: root + "/findboard/login",
                dataType: "text",
                data: {
                    "user_num": "2", "loginid": "angel", "password": "1234",
                    "name": "천사", "nickname": "악마", "email": "gotothehell@naver.com",
                    "hp": "010-7272-9573", "profile": "나는 정지훈이다", "interest": "infp", "profilephoto": "user.png",
                    "alarm": "없음", "isadmin": "user", "gaipday": "2022-09-29 09:42:44"
                },
                success: function (res) {
                    location.reload();
                },
            });
        });

        $(document).on("click", "#dg_logoutbtn", function () {
            var root = "${root}";
            $.ajax({
                type: "get",
                url: root + "/findboard/logout",
                dataType: "text",
                success: function (res) {
                    location.reload();

                }
            });
        })
    </script>
    <div class="alert alert-light">
        <c:if test="${totalCount>0}">
            <h4 id="uc">총 ${totalCount}개의 글이 있습니다</h4>
        </c:if>
        <c:if test="${totalCount==0}">
            <h4 id="uc">등록된 글이 없습니다</h4>
        </c:if>
        <br>
        <c:if test="${sessionScope.loginok!=null}">
            <button type="button" class="btn btn-outline-dark"
                    onclick="location.href='${root}/findboard/findform'">글쓰기
            </button>
        </c:if>

        <br>
        <c:if test="${totalCount==0}">
            <tr>
                <td colspan="4" align="center" valign="middle">
                    <h4>등록된 글이 없습니다</h4>
                </td>
            </tr>
        </c:if>

        <%--        <c:if test="${totalCount>0}">--%>
        <%--        <ul type="portrait" class="huOMZn">--%>
        <%--            <c:forEach var="dto" items="${list}" varStatus="i">--%>

        <%--            <div type="portrait" class="accompanyItem__ItemWrapper-sc-8nv24v-0 dUcsyA">--%>
        <%--                <a href="${root}/findboard/finddetail?find_num=${dto.find_num}&currentPage=${currentPage}"--%>
        <%--                   style="color:black;text-decoration:none;">--%>
        <%--                    <div>--%>
        <%--                        <c:set var="photo" value="${dto.photo}"/>--%>
        <%--                        <img src="${root}/upload/${fn:split(photo, ',')[0]}" alt="배경사진"--%>
        <%--                             style="width:100%;aspect-ratio: 1/1;max-height:250px;max-width:250px;">--%>
        <%--                    </div>--%>

        <%--                    <div type="portrait" class="accompanyItem__ContentWrapper-sc-8nv24v-1 kZxQCp">--%>
        <%--                        <div class="accompanyItem__TitleWrapper-sc-8nv24v-2 QJbqF" id="subject">--%>
        <%--                            <p class="Pgqux">모집중 ${dto.subject}</p>--%>

        <%--                        </div>--%>
        <%--                        <p type="portrait" class="accompanyItem__DescWrapper-sc-8nv24v-3 ewCfNG"--%>
        <%--                           id="pcontent">${dto.content}</p>--%>

        <%--                    </div>--%>
        <%--                    <div class="accompanyItem__ViewAndMsgWrapper-sc-8nv24v-6 bVhyCq">--%>
        <%--                        <div>--%>
        <%--                            <span style="color: darkgray;float:right;"></span>--%>
        <%--                        </div>--%>
        <%--                        <div>--%>
        <%--                            <p>${dto.name}/${dto.nickname}/(${dto.loginid})</p>--%>
        <%--                            <p style="color: darkgray;"><fmt:formatDate value="${dto.writeday}"--%>
        <%--                                                                        pattern="yyyy-MM-dd"/><span class="fr"><i--%>
        <%--                                    class="bi bi-eye"></i>&nbsp;${dto.readcount}&nbsp;<i--%>
        <%--                                    class="bi bi-chat"></i>&nbsp;${dto.answercount}&nbsp;</span></p>--%>

        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </a>--%>
        <%--            </div>--%>


    </div>
</div>

<%--</c:forEach>--%>
<%--</ul>--%>
<%--</c:if>--%>


<div id="divgrid">
    <c:if test="${totalCount>0}">

        <c:forEach var="dto" items="${list}" varStatus="i">
            <div class="griditem">
                <a href="${root}/findboard/finddetail?find_num=${dto.find_num}&currentPage=${currentPage}"
                   style="color:black;text-decoration:none;">

                    <c:set var="photo" value="${dto.photo}"/>
                    <c:if test="${dto.find1photo!=null}">
                        <img alt="" src="${dto.find1photo}" class="img-thumbnail"
                             style="margin-bottom:7px;width:300px;aspect-ratio: 1/1;">
                    </c:if>
                    <c:if test="${dto.find1photo==null}">
                        <img alt="" src="${root}/upload/${fn:split(photo, ',')[0]}" class="img-thumbnail"
                             style="margin-bottom:7px;width:300px;aspect-ratio: 1/1;">
                    </c:if>
                    <p>제목 : ${dto.subject}</p>
                    <p>내용 : ${dto.content}&nbsp;</p>
                    <p>닉네임 : ${dto.nickname}</p>
                    <p style="color: darkgray;"><fmt:formatDate value="${dto.writeday}"
                                                                pattern="yyyy-MM-dd"/><span class="fr"><i
                            class="bi bi-eye"></i>&nbsp;${dto.readcount}&nbsp;<i
                            class="bi bi-chat"></i>&nbsp;${dto.answercount}&nbsp;</span></p>
                </a>
            </div>
        </c:forEach>
    </c:if>
</div>

<div class="paging" id="paging">
    <ul class="pagination">
        <c:if test="${startPage>1}">
            <li class="page-item"><a class="page-link" href="${root}/findboard/list?currentPage=${startPage-1}">이전</a>
            </li>
        </c:if>
        <!-- 페이지 번호 -->
        <c:forEach var="pp" begin="${startPage}" end="${endPage}">
            <c:if test="${pp==currentPage}">
                <li class="page-item active"><a class="page-link"
                                                href="${root}/findboard/list?currentPage=${pp}">${pp}</a></li>
            </c:if>
            <c:if test="${pp!=currentPage}">
                <li class="page-item"><a class="page-link" href="${root}/findboard/list?currentPage=${pp}">${pp}</a>
                </li>
            </c:if>

        </c:forEach>

        <c:if test="${totalPage>endPage}">
            <li class="page-item"><a class="page-link" href="${root}/findboard/list?currentPage=${endPage+1}">다음</a>
            </li>
        </c:if>
    </ul>
</div>
<footer>

    <p>
        <img src="${root}/image/logo1.jpg" alt="logo" style="width: 60px;">
        <em> 고객센터 </em>010-4154-8185
        <button class="btn btn-outline-light text-dark">1:1 채팅상담</button>
        <em>채팅상담</em> 9:00 ~ 24:00
        <em>유선상담</em> 10:00 ~ 19:00
    </p>
    <p>
        <em>주식회사</em> 오늘 뭐해!? <em>대표</em> 이동건 <em>개인정보보호책임자</em> AWS
        <br>
        <em>사업자등록번호</em> 000-00-00000 <em>관광사업등록번호</em> 00000-0000-000000 <em>통신판매업 신고번호</em> 몰라
    </p>
    <address>서울시 강남구 비트캠프</address>
    <a href="mailto:donggeonlee95@naver.com">donggeonlee95@naver.com</a>
    <div>개인정보 처리방침</div>
    <div>이용약관</div>
    <div>취소 및 환불정책</div>
    <div>파트너 입점</div>
    <a target="_blank" href="https://blog.naver.com/">blog</a>
    <br>
    <a target="_blank" href="https://www.instagram.com/">instagram</a>

    <p class="copyright">자사는 서울특별시관광협회 공제영업보증보험에 가입되어 있지 않습니다.</p>
    <p class="copyright">오늘 뭐해?!는 여행중개자이며 여행판매 당사자가 아닙니다. 여행에 관한 책임은 고객에게 있습니다.</p>
    <p class="copyright">Copyright © What are you doing today!? Inc. All Rights Didn't Reserved.</p>
    <br><br>
</footer>

</body>
</html>
