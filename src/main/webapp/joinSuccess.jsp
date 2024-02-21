<%@page import="com.sm.model.MemberDTO"%>
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
	<div class="menu-bar">
		<a href="main.jsp"> <img
			src="images/smart_image/logo_background.png" class="menu-logo">
		</a> <a href="studyKorean.jsp" class="menu-item">공부하러가기</a> <a
			href="schedule.jsp" class="menu-item">스케줄관리</a> <a
			href="comunity.jsp" class="menu-item">커뮤니티</a> <a href="notice.jsp"
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