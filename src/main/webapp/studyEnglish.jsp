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
         <button onclick='location.href="update.jsp";' class="update">개인정보수정</button>
         <button onclick='location.href="LogoutService";' class="logout">로그아웃</button>
      </c:if>
   </nav>
    <div class="menu-bar">
        <a href="main.jsp">
            <img src="images/smart_image/logo_background.png" class="menu-logo">
        </a>
        <a href="studyKorean.jsp" class="menu-item">공부하러가기</a>
        <a href="schedule.jsp" class="menu-item">스케줄관리</a>
        <a href="community.jsp" class="menu-item">커뮤니티</a>
        <a href="notice.jsp" class="menu-item">공지사항</a>
    </div>
    <div class="button-container">
        <a href="studyKorean.jsp" class="study-button">국어</a>
        <a href="studyEnglish.jsp" id="c" class="study-button">영어</a>
        <a href="studyMath.jsp" class="study-button">수학</a>
        <a href="studyScience.jsp" class="study-button">과학</a>
    </div>
    <div class="lecture-container">
        <h2 class="lecture-title">■ 강의 목록</h2>
        <div class="lecture-list">
            <div class="lecture-item">
                    <img
                    src="images/smart_image/english1.webp"><br>
                <span class="lecture-text">매일매일 재미있는 영어 여행</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 김혜진 선생님</span><br>
                <span class="lecture-text">조회수 : 103</span>
            </div>
            <div class="lecture-item">
                    <img
                    src="images/smart_image/english2.webp"><br>
                <span class="lecture-text">영어로 떠나는 세계 문화 탐험</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 박준영 선생님</span><br>
                <span class="lecture-text">조회수 : 121</span>
            </div>
            <div class="lecture-item">
                <img
                    src="images/smart_image/english3.webp"><br>
                <span class="lecture-text">동물 친구들과 배우는 영어</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 최서윤 선생님</span><br>
                <span class="lecture-text">조회수 : 57</span>
            </div>
            <div class="lecture-item">
                <img
                    src="images/smart_image/english4.webp"><br>
                <span class="lecture-text">영어 마법사가 되는 비결</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 이동육 선생님</span><br>
                <span class="lecture-text">조회수 : 157</span>
            </div>
        </div>
        <!-- 새로운 공부 시작하기 버튼 추가 -->
        <div class="start-study-container">
            <button class="start-study-button">공부 시작하기</button>
            <button class="start-study-button">공부 시작하기</button>
            <button class="start-study-button">공부 시작하기</button>
            <button class="start-study-button">공부 시작하기</button>
        </div>
        <div class="lecture-list">
            <div class="lecture-item">
                    <img
                    src="images/smart_image/english5.webp"><br>
                <span class="lecture-text">영어로 쓰는 나만의 일기</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 정다은 선생님</span><br>
                <span class="lecture-text">조회수 : 80</span>
            </div>
            <div class="lecture-item">
                    <img
                    src="images/smart_image/english6.webp"><br>
                <span class="lecture-text">영화 속으로 뛰어든 영어</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 송지아 선생님</span><br>
                <span class="lecture-text">조회수 : 97</span>
            </div>
            <div class="lecture-item">
                <img
                    src="images/smart_image/english7.webp"><br>
                <span class="lecture-text">영어 노래 함께 부르며 배우기</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 김민수 선생님</span><br>
                <span class="lecture-text">조회수 : 57</span>
            </div>
            <div class="lecture-item">
                <img
                    src="images/smart_image/english8.webp"><br>
                <span class="lecture-text">영어로 만나는 전 세계 친구들</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 황태현 선생님</span><br>
                <span class="lecture-text">조회수 : 87</span>
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
</body>

</html>