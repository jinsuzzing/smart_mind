<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>로그인 페이지</title>
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="menu.css">
</head>
<body>
 <div class="menu-bar">
        <a href="main.jsp">
            <img src="images/smart_image/logo_background.png" class="menu-logo">
        </a>
        <a href="studyKorean.jsp" class="menu-item">공부하러가기</a>
        <a href="schedule.jsp" class="menu-item">스케줄관리</a>
        <a href="comunity.jsp" class="menu-item">커뮤니티</a>
        <a href="notice.jsp" class="menu-item">공지사항</a>
    </div>
    <br>
    <br>
    <br>

    <img src="images/smart_image/logo.png" alt="" width="200px" onclick="goToHomePage()">
    <h1>로그인</h1>
    <form action="LoginService" method="POST">
        <table>
            <tr height="50px">
                <!-- 아이디 입력란-->
                <td><label for="mem_id"></label></td>
                <td><input type="text" placeholder="아이디" style="background-color: #f5f5f5; width: 400px; height: 40px;"
                        id="mem_id" name="mem_id" required>
                </td>
            </tr>
            <tr>
                <!-- 비밀번호 입력란-->
                <td><label for="mem_pw"></label></td>
                <td><input type="password" placeholder="비밀번호"
                        style="background-color: #f5f5f5; width: 400px; height: 40px;" id="mem_pw" name="mem_pw"
                        required></td>
            </tr>

        </table>
        <!--로그인 버튼-->
        <button type="submit" class="submit-button">로그인</button>


    </form>
    <!--회원가입 페이지-->
    <div class="joinPage" style="display: flex; align-items: center; justify-content: center;">
        <a href="#" class="findId">ID찾기</a>
        <a>|</a>
        <a href="#" class="findPw">PW찾기</a>
        <a>|</a>
        <a href="join.jsp" class="makeId">회원가입</a>




        <script>
            // 1. 생년월일 8글자를 자동 .찍어주는기능 ex)19950512 >> 1995.05.12
            function formatBirthdate(input) {
                // 입력한 생년월일 값 가져오기
                var value = input.value;

                // 입력값이 8자리인지 확인
                if (value.length === 8) {
                    // 생년, 월, 일로 나누어 배열에 저장
                    var year = value.substring(0, 4);
                    var month = value.substring(4, 6);
                    var day = value.substring(6, 8);

                    // 포맷을 변경하여 다시 입력란에 적용
                    input.value = year + "." + month + "." + day;
                }
            }
        </script>
</body>
</html>