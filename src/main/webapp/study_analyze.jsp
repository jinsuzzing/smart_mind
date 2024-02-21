<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학습데이터 분석</title>
<!-- 차트를 그려주는 라이브러리 선언 (chart.js) -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link rel="stylesheet" href="assets/css/study_analyze.css">
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
   <br>
   <br>
   <br>
   <div class="lecture-container">

      <h2 class="lecture-title">● 오늘의 학습분석 데이터</h2>
      <div class="lecture-item">
         <span class="lecture-text"> <span class="highlight">진수님</span>
            께서는 오늘 <span class="highlight">06시간</span> 학습하였습니다.
         </span> <br> <span class="lecture-text">오늘 학습시간중 <span
            class="highlight">04시간</span>부터 <span class="blacktext">집중력이
               저하</span> 되었습니다.
         </span> <br> <span class="ai_comment" id="randomComment"></span>
      </div>

   </div>
   <br>
   <br>
   <br>
   <h2 class="lecture-title">● 분석데이터 상세보기</h2>
   <br>
   <br>
   <br>
   <div class="chart-container">

      <!-- 차트를 그릴 캔버스 요소추가 -->
      <canvas id="myChart"></canvas>
      <canvas id="mySecondChart"></canvas>

   </div>
   <br>
   <br>
   <br>
<h2 class="lecture-title">● 테스트 문제 채점결과</h2>
   <div id="board-list">
      <div class="container">
         <table class="board-table">
            <thead>
               <tr>
                  <th scope="col" class="th-num">문항</th>
                  <th scope="col" class="th-title">채점결과</th>
               </tr>
            </thead>
            <tbody>
            <tr>
                  <td>1번 문제</td>
                  <th><a href="#!">정답입니다!!</a></th>
               </tr>
               <tr>
                  <td>2번 문제</td>
                  <th><a href="#!"></a></th>
               </tr>
                              <tr>
                  <td>3번 문제</td>
                  <th><a href="#!"></a></th>
               </tr>
               <tr>
                  <td>4번 문제</td>
                  <th><a href="#!"></a></th>
               </tr>
               



            </tbody>
         </table>
      </div>
   </div>

   <script>
      //AI의 집중도 상승 꿀팁 랜덤값으로 출력
      document
            .addEventListener(
                  'DOMContentLoaded',
                  function() {
                     var comments = [
                           "집중력이 저하될 때는 달콤한게 짱이죠!! 초콜릿 한 입 어떠세요?🍫",
                           "집중이 필요할 땐 짧은 산책이 최고죠! 기분전환 어때요?🚶‍♂️",
                           "휴식도 중요해요! 5분간의 명상으로 마음을 진정시켜보세요🧘",
                           "물 한 잔의 마법! 수분 보충으로 집중력을 높여보세요💧",
                           "짧은 스트레칭으로 몸을 깨워보세요. 활력을 되찾을 수 있어요🤸‍♂️" ];

                     var randomIndex = Math.floor(Math.random()
                           * comments.length);
                     var randomComment = comments[randomIndex];

                     document.getElementById('randomComment').textContent = randomComment;
                  });
   </script>
   <script>
      // 차트 출력 스크립트
      var ctx = document.getElementById('myChart').getContext('2d');
      var myChart = new Chart(ctx, {
         type : 'line', // 차트의 종류를 'line'으로 변경
         data : {
            labels : [ '1시간', '2시간', '3시간', '4시간', '5시간', '6시간' ], // X축 라벨
            datasets : [ {
               label : '# of Votes', // 데이터셋의 라벨
               data : [ 50, 90, 75, 70, 40, 10 ], // Y축 데이터
               backgroundColor : [ 'rgba(255, 99, 132, 0.2)', // 데이터 포인트의 배경 색상
               ],
               borderColor : [ '#D2003F', // 꺽은선의 색상
               ],
               borderWidth : 5, // 선의 두께
               fill : false
            // 꺽은선 아래 영역을 채우지 않음
            } ]
         },
         options : {

            scales : {
               y : {
                  beginAtZero : true, // Y축이 0부터 시작하도록 설정
                  ticks : {
                     font : {
                        size : '30px' // Y축 폰트 크기를 18px로 설정 
                     }
                  }
               },
               x : {
                  ticks : {
                     font : {
                        size : '30px' // X축 폰트 크기를 18px로 설정
                     }
                  }
               }
            }
         }
      });
   </script>
   <script>
      const ctx2 = document.getElementById('mySecondChart').getContext('2d');
      const mySecondChart = new Chart(ctx2, {
         type : 'pie', // 차트의 타입을 'pie'로 설정
         data : {
            labels : [ '집중한 시간', '집중못한 시간' ],
            datasets : [ {
               label : 'Your Label Here',
               data : [ 70, 30 ], // 데이터
               backgroundColor : [ 'rgb(255,84,133)', // 집중한 시간
               'rgb(230,230,230)', // (집중 못한 시간)
               ],
               borderColor : [ '#D2003F', 'rgb(210,210,210)', ],
               borderWidth : 5
            } ]
         },
         options : {

         }
      });
   </script>
</body>
</html>