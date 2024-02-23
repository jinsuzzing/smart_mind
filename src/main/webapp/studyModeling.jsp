<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>집중도 분석중</title>
    <link rel="stylesheet" href="assets/css/menu.css">
    <link rel="stylesheet" href="assets/css/studyModeling.css">
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
        <a href="studyMath.jsp" class="study-button">수학</a>
        <a href="studyScience.jsp" class="study-button">과학</a>
    </div>
    <div class="content-container">
        <div class="video-container">
            <video id="myVideo" controls>
                <source src="./video/자세.mp4" type="video/mp4">
            </video>
            <video id="myVideo" controls>
                <source src="./video/졸음.mp4" type="video/mp4">
            </video>
        </div>

    </div>
    <script>
    document.getElementById('myVideo').addEventListener('ended', function() {
        // 사용자에게 페이지 전환 여부를 묻는 확인 창을 표시
        var isConfirmed = confirm('비디오 재생이 끝났습니다. 테스트 페이지로 이동하시겠습니까?');
        // 사용자가 '확인'을 클릭한 경우에만 페이지 전환
        if (isConfirmed) {
            window.location.href = 'studyKoreanFirstTest.jsp';
        }
    });
    </script>
    
</body>

</html>