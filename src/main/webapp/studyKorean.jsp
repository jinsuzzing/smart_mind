<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Study Page</title>
    <link rel="stylesheet" href="assets/css/studyKorean.css"> <!-- CSS 파일 연결 -->
</head>

<body>
   <nav>
      <c:if test="${result == null}">
         <button onclick='location.href="login.jsp";' class="login">로그인</button>
      </c:if>
      <c:if test = "${result != null}">
      <span class="welcome">${mem_id}님 환영합니다~</span>
         <button onclick='location.href="update.jsp";' class="update">개인정보수정</button>
         <button onclick='location.href="LogoutService";' class="logout">로그아웃</button>
      </c:if>
   </nav>
    <div class="menu-bar">
        <a href="studyKorean.jsp">
            <img src="images/smart_image/logo_background.png" class="menu-logo">
        </a>
        <a href="studyKorean.jsp" class="menu-item">공부하러가기</a>
        <a href="schedule.jsp" class="menu-item">스케줄관리</a>
        <a href="CommunityView" class="menu-item">커뮤니티</a>
        <a href="notice.jsp" class="menu-item">공지사항</a>
    </div>
    <div id="slider">
        <div class="slides">
          <div class="slide"><img src="images/smart_image/Group 278.jpg" alt="Slide 1"></div>
          <div class="slide"><img src="images/smart_image/Group 283.jpg" alt="Slide 2"></div>
          <div class="slide"><img src="images/smart_image/Group 286.jpg" alt="Slide 3"></div>
          <div class="slide"><img src="images/smart_image/Group 284.jpg" alt="Slide 4"></div>
    </div>
    <div class="button-container">
        <a href="studyKorean.jsp" id="c" class="study-button">국어</a>
        <a href="studyEnglish.jsp" class="study-button">영어</a>
        <a href="studyMath.jsp" class="study-button">수학</a>
        <a href="studyScience.jsp" class="study-button">과학</a>
    </div>
    <div class="lecture-container">
        <h2 class="lecture-title">■ 강의 목록</h2>
        <div class="lecture-list">
            <div class="lecture-item">
                <img
                    src="images/smart_image/korea1.jpg"><br>
                <span class="lecture-text">재미있는 한글 여행</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 김한글 선생님</span><br>
                <span class="lecture-text">조회수 : 57</span>
            </div>
            <div class="lecture-item">
                <img
                    src="images/smart_image/korea2.jpg"><br>
                <span class="lecture-text">이야기로 배우는 국어</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 이문장 선생님</span><br>
                <span class="lecture-text">조회수 : 64</span>
            </div>
            <div class="lecture-item">
                <img
                    src="images/smart_image/korea3.jpg"><br>
                <span class="lecture-text">마법의 국어 규칙</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 최띄어쓰기 선생님</span><br>
                <span class="lecture-text">조회수 : 43</span>
            </div>
            <div class="lecture-item">
                <img src="images/smart_image/korea4.jpg"><br>
                <span class="lecture-text">우리말 놀이터</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 박사랑 선생님</span><br>
                <span class="lecture-text">조회수 : 77</span>
            </div>
        </div>
        <!-- 새로운 공부 시작하기 버튼 추가 -->
    <div class="start-study-container">
        <a href="studyKoreanFirst.jsp">
        <button class="start-study-button">공부 시작하기</button>
        </a>
        <button class="start-study-button">공부 시작하기</button>
        <button class="start-study-button">공부 시작하기</button>
        <button class="start-study-button">공부 시작하기</button>
    </div>
    <div class="lecture-list">
            <div class="lecture-item">
                <img
                    src="images/smart_image/korea5.jpg"><br>
                <span class="lecture-text">동화 속 숨은 국어 비밀</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 손글씨 선생님</span><br>
                <span class="lecture-text">조회수 : 121</span>
            </div>
            <div class="lecture-item">
                <img
                    src="images/smart_image/korea6.jpg"><br>
                <span class="lecture-text">말하기와 듣기의 모험</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 조어법 선생님</span><br>
                <span class="lecture-text">조회수 : 37</span>
            </div>
            <div class="lecture-item">
                <img
                    src="images/smart_image/korea7.webp"><br>
                <span class="lecture-text">글자 탐험대</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 홍읽기 선생님</span><br>
                <span class="lecture-text">조회수 : 88</span>
            </div>
            <div class="lecture-item">
                <img src="images/smart_image/korea8.webp"><br>
                <span class="lecture-text">신나는 문장 여행</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 윤문법 선생님</span><br>
                <span class="lecture-text">조회수 : 107</span>
            </div>
        </div>
        <!-- 새로운 공부 시작하기 버튼 추가 -->
        <div class="start-study-container">
            <button class="start-study-button">공부 시작하기</button>
            <button class="start-study-button">공부 시작하기</button>
            <button class="start-study-button">공부 시작하기</button>
            <button class="start-study-button">공부 시작하기</button>
        </div>
        
    </div>
    <script src = "assets/js/studyKorean.js"></script>
</body>

</html>