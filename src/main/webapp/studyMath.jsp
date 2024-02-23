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
    <link rel="stylesheet" href="assets/css/menu.css">
</head>
 
<body>
   <nav>
      <c:if test="${result == null}">
         <button onclick='location.href="login.jsp";' class="login">로그인</button>
      </c:if>
      <c:if test = "${result != null}">
      <span class="welcome">${result.mem_name}님 환영합니다~</span>
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
        <a href="community.jsp" class="menu-item">커뮤니티</a>
        <a href="notice.jsp" class="menu-item">공지사항</a>
    </div>
    <div class="button-container">
        <a href="studyKorean.jsp" class="study-button">국어</a>
        <a href="studyEnglish.jsp" class="study-button">영어</a>
        <a href="studyMath.jsp" id="c" class="study-button">수학</a>
        <a href="studyScience.jsp" class="study-button">과학</a>
    </div>
    <div class="lecture-container">
        <h2 class="lecture-title">■ 강의 목록</h2>
        <div class="lecture-list">
            <div class="lecture-item">
                    <img
                    src="images/smart_image/math1.webp"><br>
                <span class="lecture-text">마법의 숫자 나라 탐험기</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 김수학 선생님</span><br>
                <span class="lecture-text">조회수 : 77</span>
            </div>
            <div class="lecture-item">
                    <img
                    src="images/smart_image/math2.webp"><br>
                <span class="lecture-text">수학 여행: 더하기와 빼기의 모험</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 이계산 선생님</span><br>
                <span class="lecture-text">조회수 : 92</span>
            </div>
            <div class="lecture-item">
                <img
                    src="images/smart_image/math3.webp"><br>
                <span class="lecture-text">시간여행자의 수학 미션</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 박피타고라스 선생님</span><br>
                <span class="lecture-text">조회수 : 107</span>
            </div>
            <div class="lecture-item">
                <img
                    src="images/smart_image/math4.webp"><br>
                <span class="lecture-text">우주 정복자를 위한 수학</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 최별하 선생님</span><br>
                <span class="lecture-text">조회수 : 99</span>
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
                src="images/smart_image/math5.webp"><br>
            <span class="lecture-text">해적과 함께하는 분수의 보물찾기</span><br>
            <span class="lecture-text">등록일 : 2024.03.03</span><br>
            <span class="lecture-text">강사명 : 정보물 선생님</span><br>
            <span class="lecture-text">조회수 : 87</span>
        </div>
        <div class="lecture-item">
                <img
                src="images/smart_image/math6.webp"><br>
            <span class="lecture-text">수학의 마법사: 도형의 비밀</span><br>
            <span class="lecture-text">등록일 : 2024.03.03</span><br>
            <span class="lecture-text">강사명 : 송다각 선생님</span><br>
            <span class="lecture-text">조회수 : 57</span>
        </div>
        <div class="lecture-item">
            <img
                src="images/smart_image/math7.webp"><br>
            <span class="lecture-text">너도 할 수 있어! 재미있는 방정식</span><br>
            <span class="lecture-text">등록일 : 2024.03.03</span><br>
            <span class="lecture-text">강사명 : 황미지 선생님</span><br>
            <span class="lecture-text">조회수 : 180</span>
        </div>
        <div class="lecture-item">
            <img
                src="images/smart_image/math8.webp"><br>
            <span class="lecture-text">수학으로 떠나는 세계 여행</span><br>
            <span class="lecture-text">등록일 : 2024.03.03</span><br>
            <span class="lecture-text">강사명 : 윤지구 선생님</span><br>
            <span class="lecture-text">조회수 : 57</span>
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