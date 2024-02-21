<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="assets/css/menu.css">
<link rel="stylesheet" href="assets/css/community_write.css">
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
	<section class="notice">
		<div class="page-title">
			<div class="container">
				<h3>커뮤니티</h3>
			</div>
		</div>

		<form action="Communityservice" method="post">
			<input type="hidden" name="mem_id" value = "${result.mem_name}"/>
			<div id="board_write">
				<div id="write_area">
					<div id="title">
						<textarea name="post_title" id="utitle" rows="1" cols="55"
							placeholder="제목을 입력해주세요" maxlength="100" required></textarea>
					</div>
					<br>
					<div class="wi_line"></div>
					<div id="content">
						<textarea name="post_content" id="ucontent" placeholder="내용을 입력해주세요"
							required></textarea>
					</div>
					<input type="file" id="fileInput" style="display: none" />
					<!-- 사용자 정의 스타일을 적용할 label -->
					<label for="fileInput" id="fileLabel">파일선택</label>
					<div class="bt_se">
						<button type="submit" class="writeOk">작성완료</button>
					</div>
				</div>
			</div>
		</form>
		<script src="community_write.js">
			
		</script>
</body>

</html>