<%--
  Created by IntelliJ IDEA.
  User: ostsc
  Date: 2022-09-29
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table table-bordered" style="width:600px;">
    <tr>
        <td>
            <h3><b>${dto.subject}</b></h3>
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
                    <img alt="" src="${root}/upload/${photo}" width="250" onerror="this.style.display='none'"><!-- 해당 폴더에 없는 사진은 안보이게 처리 -->
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
                        <input type="hidden" name="num" value="${dto.num}">
                        <input type="hidden" name="id" value="${sessionScope.loginid}">
                        <input type="hidden" name="name" value="${sessionScope.loginname}">
                        <br>
						<textarea name="message" id="message" style="width:400px;height:60px;"
                                  ></textarea>
                            <button type="button" id="btnasave">등록</button>
                    </form>
                </div>
            </c:if>
        </td>
    </tr>
    <tr>
        <td>
            <button type="button"  onclick="location.href='${root}/findboard/findform'">새글</button>

            <button type="button" onclick="location.href='${root}/findboard/list?currentPage=${currentPage}'">목록</button>

            <!-- 로그인 중이면서 세션의 아이디와 글의 아이디가 같을 경우에만 수정,삭제 가능 -->
            <c:if test="${sessionScope.loginok!=null && sessionScope.loginid==dto.id}">
                <button type="button"
                        onclick="location.href='${root}/findboard/updatefind?find_num=${dto.find_num}&currentPage=${currentPage}'">수정</button>

                <button type="button"
                        onclick="location.href='${root}/findboard/deletefind?find_num=${dto.find_num}&currentPage=${currentPage}'">삭제</button>
            </c:if>
        </td>
    </tr>
</table>
</body>
</html>
