<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 
<head>
    <title>배너 메뉴 페이지</title>
    <link rel="stylesheet" href="assets/css/menu.css">
    <link rel="stylesheet" href="assets/css/studyKoreanFirst.css">
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
    <div class="button-container">
        <a href="studyKorean.jsp" class="study-button">국어</a>
        <a href="studyEnglish.jsp" class="study-button">영어</a>
        <a href="studyMath.jsp" class="study-button">수학</a>
        <a href="studyScience.jsp" class="study-button">과학</a>
    </div>
    
    <div class="title">
    <h1>강의제목 : 쉽게 배우는 영어</h1>
    <button>재생목록에 담기</button>
    </div>

    <div class="subtitle">
        <span>민수 쌤과 쉽고 재밋게 배우는 중등영어!!</span>
        <span class="lessen">레슨수 : 18개</span>
    </div>

    <div class="course-table">
        <table>
            <thead>
                <tr>
                    <th>강의 제목</th>
                    <th>강의 수</th>
                    <th>업로드 날짜</th>
                    <th>재생시간</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1. 영어와 친해지기</td>
                    <td>4개</td>
                    <td>24.02.13</td>
                    <td>00:48:27</td>
                </tr>
                <tr>
                    <td colspan="2" class="setitle">
                        <a href="studyKoreanFirstView.jsp" style="display: block; color: inherit; text-decoration: none; height: 100%; width: 100%;">
                            01. 영어의 역사
                        </a>
                    </td>
                    <td>24.02.13</td>
                    <td>01:10:43</td>
                </tr>
                <tr>
                    <td colspan="2" class="setitle">02. 기초 영어 문법을 알아보자</td>
                    <td>24.02.13</td>
                    <td>01:10:43</td>
                </tr>
                <!-- 다른 강의들에 대한 행 추가 -->
                <tr>
                    <td>2. 영어와 다가가기</td>
                    <td>3개</td>
                    <td>업로드 날짜</td>
                    <td>재생시간</td>
                </tr>
                <!-- 여기에 추가 강의 내용 행을 넣으세요 -->
            </tbody>
        </table>
    </div>
    

</body>

</html>