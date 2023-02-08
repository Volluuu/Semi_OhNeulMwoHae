# 오늘뭐해?! 
1. 프로젝트 소개
- 놀고싶은데 친구들은 바쁘고 하루를 알차게 보내고 싶으신분들
- 매일 데이트 코스 짜느라 힘들었던 커플들
- 다양한 놀거리를 원하시는 분들

→ 이러한 분들을 위해 리뷰를 통한 다양한 놀거리와 코스를 미리 계획하고 준비 하실 수 있도록 구현해보았습니다.

2. 프로젝트 일정 및 규모
- 개발 기간 : 2022.11.04 ~ 12.01
- 인원 : 5명
- Role :
1) layout구성 및 디자인
 → tiles를 이용한 페이지 구현 (header, main, sidebar)
2) 고객센터
 → 게시판 형식을 이용하여, 관리자만 댓글 가능하며, 관리자가 댓글 작성 시, 답변완료로 업데이트 되도록 구현.
3) 경로 추천
 → 카테고리 선택을 통하여 검색되도록 구현
 → 추가 이벤트를 통하여 경로가 추가 되도록 구현
 
3. 페이지 주요기능
- jQuery, Spring Framework를 이용한 모임 및 경로 추천 사이트
![Animation](https://user-images.githubusercontent.com/114208462/217534859-e0eb7c55-474c-4c03-99e9-f59aa911d212.gif)
→ animation 효과를 이용해 통통 튀는 이미지 index 구성
→ tiles를 통해 layout을 구성하여 header,  main으로 구성
→ ajax를 통해 조회수가 가장 높은 순으로 보여줌

- kakaomap API를 이용하여 경로 찾기 구현.
![Animation3](https://user-images.githubusercontent.com/114208462/217536012-2e0f0f38-66db-428b-a2aa-8cf2766ca51f.gif)
→ 카카오지도 API를 사용하여 경로 카테고리 및 검색하여 추가 기능 구현
→ 최대 5개의 경로까지 추가 가능하며, 카테고리는 3가지로 구성(카페, 음식점, 놀거리)

- 공공포털 API를 이용하여 서울 시 내에 있는 음식점, 카페, 놀이에 대한 좌표 및 상점 데이터 사용.
![Animation2](https://user-images.githubusercontent.com/114208462/217536092-31e19464-f8e9-470b-9133-165fc2057e72.gif)

- 코스 추천, , 고객센터, 경로 찾기, 소셜 회원 가입 및 로그인, 마이페이지로 구성.

4. ERD
![image](https://user-images.githubusercontent.com/114208462/217532779-24f8c1a5-87ca-46cd-97b7-8597e6a46f87.png)

