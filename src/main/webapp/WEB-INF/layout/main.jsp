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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<style type="text/css">
  /* 배너 */
  .slideimg img{
    width: 1900px;
    height: 300px;
    margin: 0 auto;
  }

  /* 추천 코스 */
    /* Title 영역*/
  .cosSection{
    position: relative;
    width: 1520px;
    padding-top: 65px;
    margin:0 auto;
  }
  .cosSectionTitle{}
  .cosSectionTitle_p{
    font-weight: bold;
  }

    /* Button 영역 */
  .cosAddButton{}
  .cosRecommendBtn{
    font-size: 12px;
    font-weight: bold;
    color: gray;
    border: none;
    background-color: white;
  }
  .cosStarsBtn{
    font-size: 12px;
    font-weight: bold;
    color: gray;
    border: none;
    background-color: white;
  }
  .cosPopularBtn{
    font-size: 12px;
    font-weight: bold;
    color: gray;
    border: none;
    background-color: white;
  }
  .cosAddBtn{
    font-size: 12px;
    font-weight: bold;
    color: gray;
    border: none;
    background-color: white;
  }

    /* slide 영역*/
      /*slide layer*/
  .swiper-container {
    height:420px;
    /*border:5px solid silver;*/
    border-radius:7px;
    /*box-shadow:0 0 20px #ccc inset;*/
  }
  .swiper-slide {
    text-align:center;
    display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
    align-items:center; /* 위아래 기준 중앙정렬 */
    justify-content:center; /* 좌우 기준 중앙정렬 */
  }
      /* slide 이미지 */
  .swiper-slide img {
    /*box-shadow:0 0 5px #555;*/
    max-width:400px;
    height: 250px;/* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
    /* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
  }
      /* slide content */
  .swiper-slide a{
    text-decoration: none;
    color: gray;
  }
  .swiper-slide a:hover{
    text-decoration: none;
    color: gray;
    text-shadow: 2px 2px 5px;
    background-color: white;
  }

  .swiper-slide_title{
    font-size: 15px;
  }
  .cos_info{float: right;}
  .cos_info p{
    margin-left: 10px;
    margin-right: 10px;
  }
  .swiper-slide_id{font-size: 10px;}
  .swiper-slide_writeday{font-size: 10px;}
  .swiper-slide_readcount{font-size: 10px;}
  .swiper-slide_stars{font-size: 10px;}

</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>

<!-- 배너 -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>

  <!-- The slideshow/carousel -->
  <div class="carousel-inner slideimg">
    <div class="carousel-item active">
      <img src="${root}/image/banner11.jpg" alt="banner1" class="d-block">
    </div>
    <div class="carousel-item">
      <img src="${root}/image/banner12.jpg" alt="banner2" class="d-block">
    </div>
    <div class="carousel-item">
      <img src="${root}/image/banner13.jpg" alt="banner3" class="d-block">
    </div>
  </div>

  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>

<!-- <div class="container-fluid mt-3">
  <h3>Carousel Example</h3>
  <p>The following example shows how to create a basic carousel with indicators and controls.</p>
</div> -->

  <!-- 추천 코스 -->
<section class="cosSection">
  <div class="cosSectionTitle">
    <p class="cosSectionTitle_p">Most Pick!</p>
    <div class="cosAddButton">
      <button type="button" class="cosRecommendBtn">추천순</button>
      <button type="button" class="cosStarsBtn">별점순</button>
      <button type="button" class="cosPopularBtn">인기순</button>
      <button type="button" class="cosAddBtn">더보기&gt;</button>
    </div>
  </div>
  <div class="cosSectionContent">
    <!-- 추천 코스 : 반복문 돌릴필요 -->
    <div class="swiper-container">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
            <div class="swiper-slide_content1">
              <a href="#">
                <img src="http://oldmidi.cdn3.cafe24.com/p/0618.jpg">
                <p class="swiper-slide_title">제목</p>
                  <div class="input-group cos_info">
                    <p class="swiper-slide_id">작성자</p>
                    <p class="swiper-slide_writeday">작성일</p>
                    <p class="swiper-slide_readcount">조회수</p>
                    <p class="swiper-slide_stars">별점</p>
                  </div>
              </a>
            </div>
        </div>
        <div class="swiper-slide">
          <img src="https://ktsmemo.cafe24.com/p/0663.jpg">
        </div>
        <div class="swiper-slide">
          <img src="http://oldmidi.cdn3.cafe24.com/p/0050.jpg">
        </div>
        <div class="swiper-slide">
          <img src="https://ktsmemo.cafe24.com/p/0658.jpg">
        </div>
        <div class="swiper-slide">
          <img src="https://ktsmemo.cafe24.com/p/0022.jpg">
        </div>
        <div class="swiper-slide">
          <img src="http://oldmidi.cdn3.cafe24.com/p/0492.jpg">
        </div>
        <div class="swiper-slide">
          <img src="http://ktsmemo.cdn3.cafe24.com/p/0463.jpg">
        </div>
        <div class="swiper-slide">
          <img src="http://ktsmemo.cdn3.cafe24.com/p/0475.jpg">
        </div>
        <div class="swiper-slide">
          <img src="http://ktsmemo.cdn3.cafe24.com/p/0044.jpg">
        </div>
        <div class="swiper-slide">
          <img src="https://ktsmemo.cafe24.com/p/0372.jpg">
        </div>
        <div class="swiper-slide">
          <img src="https://ktsmemo.cafe24.com/p/0083.jpg">
        </div>
        <div class="swiper-slide">
          <img src="http://ktsmemo.cdn3.cafe24.com/p/0428.jpg">
        </div>
        <div class="swiper-slide">
          <img src="http://oldmidi.cdn3.cafe24.com/p/0740.jpg">
        </div>
        <div class="swiper-slide">
          <img src="http://ktsmemo.cdn3.cafe24.com/p/0730.jpg">
        </div>
        <div class="swiper-slide">
          <img src="http://ktsmemo.cdn3.cafe24.com/p/0829.jpg">
        </div>
        <div class="swiper-slide" style="font-size:50pt;">- 끝 -</div>
      </div>

      <!-- 네비게이션 -->
      <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
      <div class="swiper-button-prev"></div><!-- 이전 버튼 -->

      <!-- 페이징 -->
      <div class="swiper-pagination"></div>
    </div>
  </div>
</section>

  <!-- 친구 찾기 -->
<section class="findSection">
  <div class="findSectionTitle">
    <p class="findSectionTitle_p">친구 찾기</p>
    <div class="cosAddButton">
      <button type="button" class="cosAddBtn">더보기</button>
    </div>
  </div>
</section>

<script>
  new Swiper('.swiper-container', {

    slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
    spaceBetween : 10, // 슬라이드간 간격
    slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

    // 그룹수가 맞지 않을 경우 빈칸으로 메우기
    // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
    loopFillGroupWithBlank : true,

    loop : true, // 무한 반복

    pagination : { // 페이징
      el : '.swiper-pagination',
      clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
    },
    navigation : { // 네비게이션
      nextEl : '.swiper-button-next', // 다음 버튼 클래스명
      prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
    },
  });
</script>
</body>
</html>