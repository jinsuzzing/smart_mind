<%@page import="com.sm.model.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 성공</title>
<link rel="stylesheet" href="assets/css/menu.css">
<link rel="stylesheet" href="assets/css/joinSuccess.css">

</head>

<body>
	<nav>
		<c:if test="${result == null}">
			<button onclick='location.href="login.jsp";' class="login">로그인</button>
		</c:if>
		<c:if test="${result != null}">
			<span class="welcome">${mem_id}님 환영합니다~</span>
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

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<img src="./images/smart_image/check.PNG" class="check">
	<br>
	<br>
	<br>
	<br>
	<span class="success">OOO님! 회원가입이 완료 되었습니다.</span>
	<br>
	<br>
	<form action="studyKorean.jsp">
		<button type="submit" class="submit-button">메인페이지로</button>
	</form>


</body>

</html>