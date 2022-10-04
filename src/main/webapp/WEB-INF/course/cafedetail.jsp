<%--
  Created by IntelliJ IDEA.
  User: hyeongjoon
  Date: 2022/10/03
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/cafedetail.css">
<link rel="stylesheet" href="../css/star.css">
<link rel="stylesheet" href="../css/footer.css">
<style>

    *{
        font-size: 24px;
        font-family: Dongle;
    }
    html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
    blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em,
    img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u,
    i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption,
    tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure,
    figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time,
    mark, audio, video
    {
        margin: 0;
        padding: 0;
        border: 0;
        font-style: normal;
    }

    div
    {
        display: block;
    }

    section
    {
        display: block;
    }
    button.fr{
        float:right;
    }

</style>
<script src="https://kit.fontawesome.com/93e75e33a3.js" crossorigin="anonymous"></script>
<html>
<head>
    <title>Title</title>
</head>
<script>
    $(function (){
        cafelist();
    });

    function cafelist() {
        var root='${root}';
        var loginok = '${sessionScope.loginok}';
        var loginnum = '${sessionScope.user_num}';
        var cafe_num = '${dto.cafe_num}';
        var s = "";
        $.ajax({
            type: "get",
            url: root + "/course/cafedetailist",
            dataType: "json",
            data: {"cafe_num": cafe_num},
            success: function (res) {
                $("#review").append("댓글 갯수 : " + res.length);
                $.each(res, function (i, elt) {
                    s += "<div class='cafestar'>";
                    s += "유저 번호 : "+elt.user_num;
                    if (loginok == 'yes' && loginnum == elt.user_num) {
                        s += '<button class="btn btn-outline-dark adel fr" course_num="' + elt.course_num + '">삭제</button>';
                        s += '<button class="btn btn-outline-dark aupd fr" course_num="' + elt.course_num + '">수정</button>';
                    }
                    s += "<p><pre class='cafecontent'>"+elt.content+"</pre><span class='day'>" + elt.writeday + "</span></p>";
                    s += "</div>";

                });
                $("#review").append(s);
            }
        });


    }
</script>
<body>

<%---------------------------------------------------------------------------------body--%>
<div class="dPuFYu" id="contents" style="margin-bottom: 66px;" media="web">
    <section direction="vertical" class="hj_mainimg">
        <img src="${dto.photo}">
    </section>
    <div class="hj_bmain">
        <div class="hj_bhead">
            <div class="hj_bbody">
                <div id="title">
                    <h2>${dto.title}</h2>

                </div>
                <div id="topinfo" type="companion" class="iYZztd">
                    <div>
                        <div>
                            <p><img src="../image/location.png" style="width:16px;"> ${dto.addr}</p>
                        </div>
                    </div>
                    <div>
                        <p><img src="../image/call.png" style="width:20px;"> ${dto.tel}</p>
                    </div>
                    <div>
                        <div>
                            <p><img src="../image/coffee.png" style="width:23px;"> ${dto.menu}</p>
                        </div>
                    </div>
                </div>

                <%--------------------------------------------------------------------------- 별점--%>
                <form class="mb-3" id="myform">
                    <input type="hidden" name="user_num" value="${sessionScope.user_num}">
                    <input type="hidden" name="cafe_num" value="${dto.cafe_num}">
                    <fieldset>
                        <span class="text-bold">별점을 선택해주세요</span>
                        <input type="radio" name="star" value="5" id="rate1"><label
                            for="rate1">★</label>
                        <input type="radio" name="star" value="4" id="rate2"><label
                            for="rate2">★</label>
                        <input type="radio" name="star" value="3" id="rate3" checked><label
                            for="rate3">★</label>
                        <input type="radio" name="star" value="2" id="rate4"><label
                            for="rate4">★</label>
                        <input type="radio" name="star" value="1" id="rate5"><label
                            for="rate5">★</label>
                    </fieldset>
                    <div>
		                <textarea class="col-auto form-control" type="text" name="content" id="reviewContents"
                                  placeholder="댓글을 남겨보세요!"></textarea>
                    </div>
                    <button type="button" class="btn btn-outline-dark" id="cafestarbtn">등록</button>
                </form>
                <script>
                    $(document).on("click", "#cafestarbtn", function () {
                        var root = "${root}";
                        var user_num="${sessionScope.user_num}";
                        var star=$("input[name='star']:checked").val();
                        var content=$("#reviewContents").val();
                        var cafe_num="${dto.cafe_num}";
                        $.ajax({
                            type: "get",
                            url: root + "/commentcourse/cafestar",
                            dataType: "text",
                            data: {"user_num":user_num,"star":star,"content":content,"cafe_num":cafe_num},
                            success: function (res) {
                                cafelist();

                                $("#reviewContents").val("");
                            }
                        });
                    });

                </script>
            </div>
        </div>
    </div>
</div>
<div id="review"></div>


%--------------------------------------------------------------------------------footer--%>
<footer id="footer" class="efLSbp">
    <div class="inner">
        <%--            ----------------logo--%>
        <h6 class="h_logo bjBbfw"><i class="fa-sharp fa-solid fa-car-side icons"></i> 오늘뭐해?</h6>
        <%--    ----------------------------info start--%>
        <div class="finfo info_wrap_horizontal big_gap grey_6A">
            <div>
                <p class="info_bold info_large grey_6A_only">
                    고객센터: 070-8835-2626

                </p>
            </div>
            <p class="info_regular grey_6A_only">
                <em>상담가능시간: 매일 9:00~24:00</em>
            </p>
        </div>
        <%--            -----------------------주식회사 Start--%>
        <div class="Footer__FoldWrapper-sc-190uiip-1 dRbhKq footer_info grey_6A">
                <span>
                    <em>주식회사: 오늘뭐해</em>
                </span>
            <span>
                    <em>대표: 이동건</em>
                </span>
            <span>
                    <em>개인정보보호책임자: 이동건</em>
                </span>
            <span>
                    <em>사업자 등록번호: 010-4154-8185</em>
                </span>
        </div>

        <%--            ----------------------------------------------개인정보Start--%>
        <div class="info_wrap_horizontal vertical_line info_regular grey_6A small_gap font_fix_320">
            <p class="info_bold">개인정보 처리방침</p>
            <p> | 이용약관</p>
            <p> | 취소 및 환불정책</p>
            <p> | 파트너 입점</p>
        </div>

        <%--            ------------------------------copyright--%>
        <div class="middle_gap">
            <p class="copyright">Copyright © 오늘뭐해 Inc. All Rights Reserved.</p>
        </div>
    </div>
</footer>


</body>
</html>
