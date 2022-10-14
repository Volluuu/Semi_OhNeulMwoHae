<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
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
        #demo{
            width: 1300px;
            height: 300px;
            margin: 0 auto;
        }
    .slideimg img {
        width:1400px;
        height: 300px;
    }
        /* 추천 코스 */
        /* Title 영역*/
        .cosSection {
            position: relative;
            width: 1520px;
            padding-top: 65px;
            margin: 0 auto;
        }

        .cosSectionTitle {
            font-size:50px;
            letter-spacing: 5px;
            margin-left: 80px;
        }

        .cosSectionTitle_p {
            font-weight: bold;
            font-size: 50px;
            margin-bottom: 0;
        }

        /* Button 영역 */
        .cosAddButton {
        }

        .cosRecommendBtn {
            font-size: 12px;
            font-weight: bold;
            color: gray;
            border: none;
            background-color: white;
        }

        .cosStarsBtn {
            font-size: 12px;
            font-weight: bold;
            color: gray;
            border: none;
            background-color: white;
        }

        .cosPopularBtn {
            font-size: 12px;
            font-weight: bold;
            color: gray;
            border: none;
            background-color: white;
        }

        .cosAddBtn {
            font-size: 12px;
            font-weight: bold;
            color: gray;
            border: none;
            background-color: white;
            text-decoration: none;
        }

        /* slide 영역*/
        /*slide layer*/
        .swiper-container {
            height: 420px;
            /*border:5px solid silver;*/
            border-radius: 7px;
            /*box-shadow:0 0 20px #ccc inset;*/
        }

        .swiper-slide {
            display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
            align-items: center; /* 위아래 기준 중앙정렬 */
            justify-content: center; /* 좌우 기준 중앙정렬 */
        }

        /* slide 이미지 */
        .swiper-slide img {
            /*box-shadow:0 0 5px #555;*/
            max-width: 400px;
            height: 250px; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
            /* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
            border-radius: 30px;
        }

        /* slide content */
        .swiper-slide a {
            text-decoration: none;
            color: gray;
        }

        .swiper-slide a:hover {
            text-decoration: none;
            color: gray;
            text-shadow: 2px 2px 5px;
            background-color: white;
        }

        .swiper-slide_title {
            font-size: 20px;
            padding-left: 5px;
        }

        .cos_info {
            float: right;
        }

        .cos_info p {
            margin-left: 10px;
            margin-right: 10px;
        }

        .swiper-slide_id {
            font-size: 10px;
        }

        .swiper-slide_writeday {
            font-size: 10px;
        }

        .swiper-slide_readcount {
            font-size: 10px;
        }

        .swiper-slide_stars {
            font-size: 10px;
        }

        /*find 영역*/
        .findSection {
            position: relative;
            width: 1520px;
            padding-top: 65px;
            margin: 0 auto;
        }
        .mainphoto {
            border-radius: 30px;
        }
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
        <p class="cosSectionTitle_p">추천코스</p>
        <p style="font-size:15px; color: #ccc;">조회수가 가장 높은 장소들을 모아봤어요</p>
        <div class="cosAddButton">
            <button type="button" class="cosRecommendBtn">카페</button>
            <button type="button" class="cosStarsBtn">음식점</button>
            <button type="button" class="cosPopularBtn">놀거리</button>
            <a href="/courseboard/list" class="cosAddBtn">더보기</a>
        </div>
    </div>

    <div class="cosSectionContent">
        <!-- 추천 코스 : 반복문 돌릴필요 -->
        <div class="swiper-container slide1">
            <div class="swiper-wrapper">

                <c:forEach var="cafe" items="${cafeTopList}">
                    <div class="swiper-slide">
                        <div class="swiper-slide_content1">
                            <a href="/course/cafedetail?cafe_num=${cafe.cafe_num}&currentPage=1">
                                    <img class="mainphoto" src="${cafe.photo}">
                                    <p class="swiper-slide_title">${cafe.title}</p>

                                    <div class="input-group cos_info">

                                            <p class="swiper-slide_id">메뉴 : ${cafe.menu}</p>
                                            <p class="swiper-slide_readcount">조회수 : ${cafe.readcount}</p>
                                            <p class="swiper-slide_stars">별점 : ${cafe.staravg}</p>
                                    </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>

                <c:forEach var="food" items="${foodTopList}">
                    <div class="swiper-slide">
                        <div class="swiper-slide_content1">
                            <a href="/course/fooddetail?food_num=${food.food_num}&currentPage=1">

                                <img src="${food.photo}">
                                <p class="swiper-slide_title">${food.title}</p>

                                <div class="input-group cos_info">
                                    <p class="swiper-slide_id">메뉴 : ${food.menu}</p>
                                    <p class="swiper-slide_readcount">조회수 : ${food.readcount}</p>
                                    <p class="swiper-slide_stars">별점 : ${food.staravg}</p>
                                </div>

                            </a>
                        </div>
                    </div>

                </c:forEach>

                <c:forEach var="trip" items="${tripTopList}">
                    <div class="swiper-slide">
                        <div class="swiper-slide_content1">
                            <a href="/course/tripdetail?trip_num=${trip.trip_num}&currentPage=1">

                                <img src="${trip.photo}">
                                <p class="swiper-slide_title">${trip.title}</p>

                                <div class="input-group cos_info">
                                    <p class="swiper-slide_readcount">조회수 : ${trip.readcount}</p>
                                    <p class="swiper-slide_stars">별점 : ${trip.staravg} </p>
                                </div>

                            </a>
                            </div>
                        </div>
                    </c:forEach>
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
        <div class="cosSectionTitle">
            <p class="cosSectionTitle_p">친구 찾기</p>
            <p style="font-size:15px; color: #ccc;">같이 놀러 갈 친구를 찾아봐요</p>
            <div class="cosAddButton">
                <a href="findboard/list" class="cosAddBtn">더보기</a>
            </div>
        </div>

        <div class="swiper-container slide2">
            <div class="swiper-wrapper">
                <c:forEach var="find" items="${findTopList}">
                    <div class="swiper-slide">
                        <div class="swiper-slide_content1">
                            <a href="/findboard/finddetail?find_num=${find.find_num}&currentPage=1">

                                <c:set var="photo" value="${find.photo}"/>
                                <c:if test="${find.find1photo!=null}">
                                    <img alt="" src="${find.find1photo}" class="img-thumbnail"
                                         style="width:100%; height: 100%;">
                                </c:if>
                                <c:if test="${find.find1photo==null}">
                                    <img alt="" src="${root}/upload/${fn:split(photo, ',')[0]}" class="img-thumbnail"
                                         style="width:100%; height: 100%;">
                                </c:if>

                                <p class="swiper-slide_title">${find.subject}</p>

                                <div class="input-group cos_info">
                                    <p class="swiper-slide_readcount">조회수 : ${find.readcount}</p>
                                </div>
                                    <%--
                                      --%>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>


<script>

    $(function () {

        $('.cosRecommendBtn').on('click', function () {
            $('.swiper-pagination-bullet').eq(0).trigger('click')

        })

        $('.cosStarsBtn').on('click', function () {
            $('.swiper-pagination-bullet').eq(1).trigger('click')

        })

        $('.cosPopularBtn').on('click', function () {
            $('.swiper-pagination-bullet').eq(2).trigger('click')

        })


        new Swiper('.slide1', {

            slidesPerView: 3, // 동시에 보여줄 슬라이드 갯수
            spaceBetween: 10, // 슬라이드간 간격
            slidesPerGroup: 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

            // 그룹수가 맞지 않을 경우 빈칸으로 메우기
            // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
            loopFillGroupWithBlank: true,

            loop: true, // 무한 반복

            pagination: { // 페이징
                el: '.swiper-pagination',
                clickable: true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
            },
            navigation: { // 네비게이션
                nextEl: '.swiper-button-next', // 다음 버튼 클래스명
                prevEl: '.swiper-button-prev', // 이번 버튼 클래스명
            },
        });
    })


    new Swiper('.slide2', {

        slidesPerView: 3, // 동시에 보여줄 슬라이드 갯수
        spaceBetween: 10, // 슬라이드간 간격
        // slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

        // 그룹수가 맞지 않을 경우 빈칸으로 메우기
        // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
        loopFillGroupWithBlank: true,

        // loop : true, // 무한 반복

        pagination: { // 페이징
            el: '.swiper-pagination2',
            clickable: true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
        },
        navigation: { // 네비게이션
            nextEl: '.swiper-button-next2', // 다음 버튼 클래스명
            prevEl: '.swiper-button-prev2', // 이번 버튼 클래스명
        },
    });
</script>
</body>
</html>