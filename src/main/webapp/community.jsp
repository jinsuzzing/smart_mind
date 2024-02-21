<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티</title>
<link rel="stylesheet" href="assets/css/comunity.css">
<link rel="stylesheet" href="assets/css/menu.css">
</head>
  
<body>
	<div class="menu-bar">
		<a href="main.jsp"> <img
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



		<!-- 게시글 목록-->
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr>
							<th scope="col" class="th-num">번호</th>
							<th scope="col" class="th-title">제목</th>
							<th scope="col" class="th-date">등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<th><a href="#!">공지사항 안내입니다.</a></th>
							<td>2024-02-05 10:36:47.0</td>
						</tr>
						
						<tr>
							<td>2</td>
							<th><a href="#!">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
								<p>테스트</p></th>
							<td>2024-02-10 05:26:57.0</td>
						</tr>
						<%int a = 2; %>
						<c:forEach items="${resultList}" var="mdto">
							<tr>
								<td><%
									  a += 1;
									  out.print(a);
									%></td>
								<th><a href="#!">${mdto.post_title}</a>
								<p>${mdto.mem_id}</p></th>
								<td>${mdto.created_at}</td>
							</tr>
						</c:forEach>
					


						
						
						
					</tbody>
				</table>
			</div>
		</div>
		<br>
	</section>
	<button type="submit" class="submit-button"
		onclick="goToCommunityWrite()">글쓰기</button>


	<!-- 페이지네이션-->
	<div class="page">
		<ul class="pagination modal">
			<li><a href="#" class="first">첫 페이지</a></li>
			<li><a href="#" class="arrow left">◀</a></li>
			<li><a href="#" class="active num">1</a></li>
			<li><a href="#" class="num">2</a></li>
			<li><a href="#" class="num">3</a></li>
			<li><a href="#" class="num">4</a></li>
			<li><a href="#" class="num">5</a></li>
			<li><a href="#" class="num">6</a></li>
			<li><a href="#" class="num">7</a></li>
			<li><a href="#" class="num">8</a></li>
			<li><a href="#" class="num">9</a></li>
			<li><a href="#" class="arrow right">▶</a>
			<li><a href="#" class="last">끝 페이지</a></li>
		</ul>
	</div>
	<script src="comunity_js_.jsp"></script>
	
	<script>
		function goToCommunityWrite() {
			window.location.href = 'community_write.jsp';

		}
	</script>



</body>

</html>