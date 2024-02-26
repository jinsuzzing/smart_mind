<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>배너 메뉴 페이지</title>

<link rel="stylesheet" href="assets/css/menu.css">
<link rel="stylesheet" href="assets/css/studyKoreanFirstTest.css">

</head>

<body>
	<nav>
		<c:if test="${result == null}">
			<button onclick='location.href="login.jsp";' class="login">로그인</button>
		</c:if>
		<c:if test="${result != null}">
			<span class="welcome">${result.mem_name}님 환영합니다~</span>
			<button onclick='location.href="update.jsp";' class="update">개인정보수정</button>
			<button onclick='location.href="LogoutService";' class="logout">로그아웃</button>
		</c:if>
	</nav>
	<div class="menu-bar">
		<a href="studyKorean.jsp"> <img
			src="images/smart_image/logo_background.png" class="menu-logo">
		</a> <a href="studyKorean.jsp" class="menu-item">공부하러가기</a> <a
			href="schedule.jsp" class="menu-item">스케줄관리</a> <a
			href="CommunityView" class="menu-item">커뮤니티</a> <a href="notice.jsp"
			class="menu-item">공지사항</a>
	</div>
	<div class="middle">
		<h1>수업평가</h1>
		<h2>기초코딩 - 누구나하는 기초(5문제)</h2>
		<form id="quizForm" action='testService'>
			<input type="hidden" name="mem_id" value="${result.mem_id}" /> <input
				type="hidden" name="test_answer" value="2" />
			<p>문제 1. 프로그램이란 무엇인가요?</p>
			<input type="radio" id="mem_answer" name="mem_answer" value="1"><label
				for="answer1">1. 데이터의 집합</label><br> <input type="radio"
				id="mem_answer" name="mem_answer" value="2"><label
				for="answer2">2. 명령어의 집합</label><br> <input type="radio"
				id="mem_answer" name="mem_answer" value="3"><label
				for="answer3">3. 하드웨어의 집합</label><br> <input type="radio"
				id="mem_answer" name="mem_answer" value="4"><label
				for="answer4">4. 사용자의 입력만을 받는 시스템</label><br> <input
				type="radio" id="mem_answer" name="mem_answer" value="5"><label
				for="answer5">5. 인터넷 브라우저</label><br>
			<button type="submit" class="writeOk">정답제출</button>
		</form>
	</div>
	<script>
		/*         function submitAnswer() {
		 const selectedAnswer = document.querySelector('input[name="quiz"]:checked');
		
		 const correctAnswer = "2"; // 실제 정답 가정
		 const isCorrect = selectedAnswer.value === correctAnswer;
		 sessionStorage.setItem("isCorrect", isCorrect); // 결과 저장
		 window.location.href = 'studyKoreanFirstScore.jsp'; // 결과 페이지로 이동
		 } */
		if (!mem_answer) {
			alert("답변을 선택해주세요.");
			return;
		}
	</script>
</body>
</html>