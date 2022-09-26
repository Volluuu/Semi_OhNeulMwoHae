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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">

    .mt-3{
    	width: 100%;
    }
    .card{
    	float: left;
    	margin-left: 1.6%;
    	margin-right: 1.6%;
    	
    }
    
    </style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div style="width: 60%; margin-left: 130px;">
	<h1 class="alert alert-dark">총 ${totalCount} 명의 회원이 있습니다</h1>
	<br>
	<table class="table table-bordered">
		<c:forEach var="dto" items="${list}">
			<tr>
				<td style="width: 250px;" align="center" rowspan="5" >
					<img src="../upload/${dto.photo}" width="230px;" height="250px;" border="1">
					<br>
					<!-- 로그인 한 사람만 보이도록 -->
					<c:if test="${sessionScope.loginok!=null and sessionScope.loginid==dto.loginid}">
						<input type="file" id="newphoto" style="display: none;" num="${dto.num}"><!-- 수정 시 호출 -->
						<button type="button" class="btn btn-secondary btnnewphoto" style="margin-top: 10px;">사진수정</button>
					</c:if>
				</td>
				<td style="width: 300px">회원명 : ${dto.name}</td>
				<td rowspan="5" align="center" valign="middle" width="100px;">
				<!-- 로그인 한 사람만 보이도록 -->
				<c:if test="${sessionScope.loginok!=null and sessionScope.loginid==dto.loginid}">
					<button type="button" class="btn btn-secondary btnupdate" num="${dto.num}"
					data-bs-toggle="modal" data-bs-target="#myUpdateModal">수정</button>
					<br><br>
					<button type="button" class="btn btn-danger btndelete" num="${dto.num}">삭제</button>
				</c:if>
				</td>
			</tr>
			<tr>
				<td>아이디 : ${dto.loginid}</td>
			</tr>
			<tr>
				<td>email : ${dto.email}</td>
			</tr>
			<tr>
				<td>핸드폰 : ${dto.hp}</td>
			</tr>
			<tr>
				<td>주소 : ${dto.address}</td>
			</tr>
		</c:forEach>
	</table>
</div>


	
	<!-- 회원 수정창 -->
	<div class="modal" id="myUpdateModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원정보 수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">회원명</span> 
						<input type="text" class="form-control" id="updatename">
					</div>

					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">핸드폰</span> 
						<input type="text" class="form-control" id="updatehp">
					</div>
					
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">email</span> 
						<input type="text" class="form-control" id="updateemail">
					</div>
					
					<div class="input-group mb-3 input-group-sm">
						<span class="input-group-text">주소</span> 
						<input type="text" class="form-control" id="updateaddr">
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal" id="btnupdateok">Update</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>

			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(".btnnewphoto").click(function() {
		$("#newphoto").trigger("click");
	});
	$("#newphoto").change(function() {
		var num=$(this).attr("num");	
		console.log(num);
		var form=new FormData();
		form.append("photo",$("#newphoto")[0].files[0]);//선택한 1개만 추가
		form.append("num",num);
		console.dir(form);
		
		$.ajax({
			type:"post",
			url:"updatephoto",
			processData:false,
			contentType:false,
			dataType:"text",
			data:form,
			success:function(res){
				alert("수정되었습니다");
				location.reload();

			}//success
			
		}); //ajax
	});
	
 	//멤버삭제
	 $(".btndelete").click(function() {
		 var num=$(this).attr("num");
		 //alert(num);
		 var ans=confirm("정말 탈퇴하시겠습니까?")
		 if(ans){
			$.ajax({
				type:"get",
				url:"delete",
				dataType:"text",
				data:{"num":num},
				success:function(res){	
					alert("탈퇴하였습니다");
					location.reload();
					
				}//success
				
			}); //ajax
		 }
		});
 	
 	//수정버튼 클릭 시 모달 다이얼로그에 데이터 넣기
	 $(".btnupdate").click(function() {
		 updatenum=$(this).attr("num");
		 //alert(updatenum);
			$.ajax({
				type:"get",
				url:"updateform",
				dataType:"json",
				data:{"num":updatenum},
				success:function(res){	
					console.dir(res);
					$("#updatename").val(res.name);
					$("#updatehp").val(res.hp);
					$("#updateemail").val(res.email);
					$("#updateaddr").val(res.address);
					
				}//success
				
			}); //ajax
		});
		
	 $("#btnupdateok").click(function() {
		 var updatename=$("#updatename").val();
		 var updatehp=$("#updatehp").val();
		 var updateemail=$("#updateemail").val();
		 var updateaddr=$("#updateaddr").val();
		 
		 var data="num="+updatenum+"&name="+updatename+"&hp="+updatehp+"&email="+updateemail+"&address="+updateaddr;
		 console.log(data);
		 
		 $.ajax({
				type:"post",
				url:"update",
				dataType:"text",
				data:data,
				success:function(res){	
					location.reload();
				}//success
				
			}); //ajax
		 
	 });
		
</script>

<%-- 	
<div class="container mt-3">
	  <div class="card" style="width:30%;">
	    <img class="card-img-top" src="${root}/image/noimage.png" alt="Card image" style="width:100%;">
	    <div class="card-body">
	      <h4 class="card-title">Angel</h4>
	      <p class="card-text">
	      이  름 :천사<br> 
	      핸드폰 :010-1234-1234<br>
	      e-mail :angel@naver.com<br>
	      주  소 :서울시 강남구
	      </p>
	      <a href="#" class="btn btn-primary">See Profile</a>
	    </div>
	  </div>
	  
	  <div class="card" style="width:30%">
	    <img class="card-img-top" src="${root}/image/noimage.png" alt="Card image" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">John</h4>
	      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
	      <a href="#" class="btn btn-primary">See Profile</a>
	    </div>
	  </div>
	  
	  <div class="card" style="width:30%">
	    <img class="card-img-top" src="${root}/image/noimage.png" alt="Card image" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">Tom</h4>
	      <p class="card-text">Some example text some example text. John Doe is an architect and engineer</p>
	      <a href="#" class="btn btn-primary">See Profile</a>
	    </div>
	 </div>
</div> --%>
</body>
</html>