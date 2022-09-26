<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
      href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    >
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
 <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style type="text/css">
    
    li>a.page-link{
    	margin-top: 20px;
    	margin-left: 600px;
    }
    
    b.bcount{
    	font-size: 0.8em;
    }
    
    </style>
   
</head>
<body>

<div class="searcharea" style="width: 100%; text-align: center; margin-left: 830px;" >
	<form action="list">
	<div class="input-group" style="width: 450px;" >
		<select class="form-control" style="width: 100px;" name="searchcolumn">
			<option value="subject">제목</option>
			<option value="id">아이디</option>
			<option value="name">작성자</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="searchword" class="form-control" style="width: 200px;" placeholder="검색단어" value="${param.searchword}">
		
		<button type="submit" class="form-control"><i class='fas fa-search'></i></button>
		&nbsp;&nbsp;<a href="list?searchcolumn=id&searchword=${sessionScope.loginid}" class="form-control" style="width: 80px; text-decoration: none;">내가쓴글</a>
	</div>
	</form>
	
	
</div>
<br>
<div class="boardlist" style="width: 70%; margin-left: 100px;">
	<h3 class="alert alert-dark">총 ${totalCount}개의 글이 있습니다</h3>
	<br><br>
	<table class="table table-bordered">
		<tr style="background-color: #ddd">
			<th style="width: 50px; text-align: center;">번호</th>
			<th style="width: 350px; text-align: center;">제목</th>
			<th style="width: 80px; text-align: center;">작성자</th>
			<th style="width: 120px; text-align: center;">작성일</th>
			<th style="width: 50px; text-align: center;">조회</th>
			<th style="width: 50px; text-align: center;">좋아요</th>
		</tr>
		<c:if test="${totalCount==0}">
			<tr>
				<td colspan="6" align="center">
					<h4>등록된 글이 없습니다</h4>
				</td>			
			</tr>
		</c:if>
		<c:if test="${totalCount>0}">
			<c:forEach var="dto" items="${list}">
				<tr>
					<td align="center">${no}</td>
					<c:set var="no" value="${no-1}"/>
					<td style="text-align: left;">
						<!-- 답글일 경우 level 1당 2칸 띄우기 -->
						<c:forEach begin="1" end="${dto.relevel}">
							&nbsp;&nbsp;
						</c:forEach>
						<!-- 답글일 경우 답글 이미지 넣기 -->
						<c:if test="${dto.relevel>0}">
							<img src="../image/re.png">
						</c:if>
						<a href="detail?num=${dto.num}&currentPage=${currentPage}" style="color: black; text-decoration: none;">
						${dto.subject}
						<c:if test="${dto.photo!='no'}">
							&nbsp;<i class='fas fa-photo-video' style="color: gray;"></i>
						</c:if>
						
						<!-- 댓글이 0개 이상인 경우에 댓글 갯수 출력 -->
						<c:if test="${dto.acount>0}">
							<b style="color: red;" class="bcount">[${dto.acount}]</b> 
						</c:if>
						</a>
					</td>	
					<td align="center">${dto.name}</td>
					<td align="center">
						<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>	
					</td>
					<td align="center">${dto.readcount}</td>
					<td align="center">${dto.likes}</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${sessionScope.loginok!=null}">
			<tr>
				<td colspan="6">
					<button type="button" class="btn btn-secondary" style="float: right;"
					onclick="location.href='form'"><i class='fas fa-edit'></i></button>
				</td>
			</tr>
		</c:if>
	</table>
</div>
<div class="paging">
	<ul class="pagination">
		<c:if test="${startPage>1}">
			<li class="page-item"><a href="list?currentPage=${startPage-1}" class="page-link">&lt;</a></li>
		</c:if>	
		
		<!-- 페이지 번호 -->
		<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			<c:if test="${pp==currentPage}">
				<li class="page-item active"><a href="list?currentPage=${pp}" class="page-link">${pp}</a></li>
			</c:if>
			<c:if test="${pp!=currentPage}">
				<li class="page-item"><a href="list?currentPage=${pp}" class="page-link">${pp}</a></li>
			</c:if>
		</c:forEach>
		
		<c:if test="${endPage<totalPage}">
			<li class="page-item"><a href="list?currentPage=${endPage+1}" class="page-link">&gt;</a></li>
		</c:if>
	</ul>
</div>
</body>
</html>



















