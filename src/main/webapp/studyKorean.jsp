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
        <a href="studyKorean.jsp">
            <img src="images/smart_image/logo_background.png" class="menu-logo">
        </a>
        <a href="studyKorean.jsp" class="menu-item">공부하러가기</a>
        <a href="schedule.jsp" class="menu-item">스케줄관리</a>
        <a href="community.jsp" class="menu-item">커뮤니티</a>
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
        <a href="studyKorean.jsp" class="study-button">국어</a>
        <a href="studyEnglish.jsp" class="study-button">영어</a>
        <a href="studyMath.jsp" class="study-button">수학</a>
        <a href="studyScience.jsp" class="study-button">과학</a>
    </div>
    <div class="lecture-container">
        <h2 class="lecture-title">■ 강의 목록</h2>
        <div class="lecture-list">
            <div class="lecture-item">
                <img
                    src="https://file.miricanvas.com/template_thumb/2020/04/23/6087-1587631276040/394a9de1-35a8-4f5f-956b-b71a315652fe/thumb.jpg"><br>
                <span class="lecture-text">쑥쑥 쉬운 국어</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 임경남 선생님</span><br>
                <span class="lecture-text">조회수 : 57</span>
            </div>
            <div class="lecture-item">
                <img
                    src="https://file.miricanvas.com/template_thumb/2020/07/10/122-1594355250136/e33ff071-21ff-4218-823f-f5c7f2177b6f/thumb.jpg"><br>
                <span class="lecture-text">쑥쑥 쉬운 국어</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 임경남 선생님</span><br>
                <span class="lecture-text">조회수 : 57</span>
            </div>
            <div class="lecture-item">
                <img
                    src="https://mblogthumb-phinf.pstatic.net/MjAyMjAzMTFfMjY4/MDAxNjQ2OTc3MzE1MTQz.A3P4iS7FBhYnnevK4oml3o5abobVglz-R6sgQk-28H0g.8wfo1piCBuwmAqUTf9MrBTYB91rm94DGOIU8I47DQIUg.PNG.kukje5157/%EB%B8%94%EB%A1%9C%EA%B7%B8_%EC%8D%B8%EB%84%A4%EC%9D%BC_%EC%B4%88%EB%93%B1%EB%8F%85%ED%95%B4.png?type=w800"><br>
                <span class="lecture-text">쑥쑥 쉬운 국어</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 임경남 선생님</span><br>
                <span class="lecture-text">조회수 : 57</span>
            </div>
            <div class="lecture-item">
                <img src="https://www.dolearn.ai/storage/uploads/thumbnail/430.jpg"><br>
                <span class="lecture-text">쑥쑥 쉬운 국어</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 임경남 선생님</span><br>
                <span class="lecture-text">조회수 : 57</span>
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
                    src="https://file.miricanvas.com/template_thumb/2020/04/23/6087-1587631276040/394a9de1-35a8-4f5f-956b-b71a315652fe/thumb.jpg"><br>
                <span class="lecture-text">쑥쑥 쉬운 국어</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 임경남 선생님</span><br>
                <span class="lecture-text">조회수 : 57</span>
            </div>
            <div class="lecture-item">
                <img
                    src="https://file.miricanvas.com/template_thumb/2020/07/10/122-1594355250136/e33ff071-21ff-4218-823f-f5c7f2177b6f/thumb.jpg"><br>
                <span class="lecture-text">쑥쑥 쉬운 국어</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 임경남 선생님</span><br>
                <span class="lecture-text">조회수 : 57</span>
            </div>
            <div class="lecture-item">
                <img
                    src="https://mblogthumb-phinf.pstatic.net/MjAyMjAzMTFfMjY4/MDAxNjQ2OTc3MzE1MTQz.A3P4iS7FBhYnnevK4oml3o5abobVglz-R6sgQk-28H0g.8wfo1piCBuwmAqUTf9MrBTYB91rm94DGOIU8I47DQIUg.PNG.kukje5157/%EB%B8%94%EB%A1%9C%EA%B7%B8_%EC%8D%B8%EB%84%A4%EC%9D%BC_%EC%B4%88%EB%93%B1%EB%8F%85%ED%95%B4.png?type=w800"><br>
                <span class="lecture-text">쑥쑥 쉬운 국어</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 임경남 선생님</span><br>
                <span class="lecture-text">조회수 : 57</span>
            </div>
            <div class="lecture-item">
                <img src="https://www.dolearn.ai/storage/uploads/thumbnail/430.jpg"><br>
                <span class="lecture-text">쑥쑥 쉬운 국어</span><br>
                <span class="lecture-text">등록일 : 2024.03.03</span><br>
                <span class="lecture-text">강사명 : 임경남 선생님</span><br>
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
    <script src = "assets/js/studyKorean.js"></script>
</body>

</html>