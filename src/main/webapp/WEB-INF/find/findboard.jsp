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

    div.dg_findlist {
        margin-top: 10px;
    }

    button.dg_searchbtn {
        margin-left: 10px;
    }

    input.dg_inputtext {

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

    span.floatright {
        float: right;
    }

    table.findtable {
        outline: 1px solid black;
        text-indent: 10px;

    }

    table.findtable td {
        border: 1px solid black;
    }

    table.findtable tr {
        width: 25%;
    }

    table.findtable p {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        width: 300px;
        height: 22px;
    }

    footer {
        font-size: 5px;
        background-color:darkslateblue;
    }
    .paging{
        display:flex;
        justify-content:center;
    }
    ul{
        list-style:none;
    }
    li{
        float:left;
        padding: 3px 3px 3px 3px;
    }
</style>
<body>
<%-- 검색창 --%>

<div class="dg_container">
    <div class="dg_searcharea">
        <form action="list">
            <select name="findcolumn" class="dg_select">
                <option value="subject" selected>제목</option>
                <option value="content">내용</option>
                <option value="subcon">제목+내용</option>
                <option value="nickname">닉네임</option>
            </select>

            <input type="text" name="findword" class="dg_inputtext" placeholder="검색 단어" value="${param.findword}">

            <button type="submit" class="dg_searchbtn">검색</button>
            <c:if test="${sessionScope.loginok!=null}">
                <a href="list?findcolumn=nickname&searchword=${sessionScope.nickname}" class="dg_a">내가 쓴 글</a>
            </c:if>
        </form>

    </div>
    <div class="dg_session">
        <c:if test="${sessionScope.loginok==null}">
            <b>로그인이 안 되어 있습니다</b>
            <button type="button" id="dg_loginbtn">세션 주기</button>
        </c:if>

        <c:if test="${sessionScope.loginok!=null}">
            <b>${sessionScope.name}님 로그인 중</b>
            &nbsp;&nbsp;
            <button type="button" id="dg_logoutbtn">세션 없애기</button>
        </c:if>
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
    <div class="dg_findlist">
        <h4>총 ${totalCount}개의 글이 있습니다</h4>
        <br>
        <c:if test="${sessionScope.loginok!=null}">
            <button type="button" class="btn btn-outline-success"
                    onclick="location.href='${root}/findboard/findform'">글쓰기
            </button>
        </c:if>

        <br>
        <table style="width:100%;" class="findtable">
            <c:if test="${totalCount==0}">
                <tr>
                    <td colspan="4" align="center" valign="middle">
                        <h4>등록된 글이 없습니다</h4>
                    </td>
                </tr>
            </c:if>
            <c:if test="${totalCount>0}">
                <tr>
                <c:forEach var="dto" items="${list}" varStatus="i">
                    <td style="width:25%;">
                        <a href="finddetail?find_num=${dto.find_num}&currentPage=${currentPage}"
                           style="color:black;text-decoration:none;">
                            <c:set var="photo" value="${dto.photo}"/>
                            <div style="text-align: center;height:75%">
                                <img alt="" src="${root}/upload/${fn:split(photo, ',')[0]}"
                                     style="margin-bottom:7px;width:100%;aspect-ratio: 1/1;max-height:250px;max-width:250px; ">
                            </div>
                            <p>${dto.subject}</p>
                            <p style="color: gray">${dto.content}&nbsp;</p>
                            <p>
                                    ${dto.name}/${dto.nickname}/(${dto.loginid})
                                <span style="color: darkgray;"
                                      class="floatright">${dto.readcount}&nbsp;${dto.answercount}&nbsp;</span>
                            </p>
                            <p style="color: darkgray;"><fmt:formatDate value="${dto.writeday}"
                                                                        pattern="yyyy-MM-dd"/></p>
                        </a>
                    </td>
                    <c:if test="${i.count==4}">
                        </tr><tr>
                    </c:if>
                </c:forEach>
                </tr>
            </c:if>
        </table>
    </div>
    <div class="paging">
        <ul>
            <c:if test="${startPage>1}">
                <li><a href="${root}/findboard/list?currentPage=${startPage-1}">이전</a></li>
            </c:if>
            <!-- 페이지 번호 -->
            <c:forEach var="pp" begin="${startPage}" end="${endPage}">
                <c:if test="${pp==currentPage}">
                    <li><a href="${root}/findboard/list?currentPage=${pp}">${pp}</a></li>
                </c:if>
                <c:if test="${pp!=currentPage}">
                    <li><a href="${root}/findboard/list?currentPage=${pp}">${pp}</a></li>
                </c:if>

            </c:forEach>

            <c:if test="${totalPage>endPage}">
                <li><a href="${root}/findboard/list?currentPage=${endPage+1}">다음</a></li>
            </c:if>
        </ul>
    </div>
    <footer>

        <p>
            <img src="${root}/image/logo1.jpg" alt="logo" style="width: 60px;">
            <em> 고객센터 </em>010-4154-8185
            <button>1:1 채팅상담</button>
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
    </footer>
</div>

</body>
</html>
