<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 실패</title>
<link rel="stylesheet" href="assets/css/menu.css">
<link rel="stylesheet" href="assets/css/joinError.css">

</head>

<body>
	<div class="menu-bar">
		<a href="studyKorean.jsp"> <img
			src="images/smart_image/logo_background.png" class="menu-logo">
		</a> <a href="studyKorean.jsp" class="menu-item">공부하러가기</a> <a
			href="schedule.jsp" class="menu-item">스케줄관리</a> <a
			href="community.jsp" class="menu-item">커뮤니티</a> <a href="notice.jsp"
			class="menu-item">공지사항</a>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<img src="./images/smart_image/error.PNG" class="check">
	<br>
	<br>
	<br>
	<br>
	<span class="success">중복된 ID 입니다.</span>
	<br>
	<br>
	<form action="join.jsp">
		<button type="submit" class="submit-button">되돌아가기</button>
	</form>

</body>

</html>