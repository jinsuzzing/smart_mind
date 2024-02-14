document.getElementById('myVideo').addEventListener('ended', function() {
            // 사용자에게 페이지 전환 여부를 묻는 확인 창을 표시
            var isConfirmed = confirm('비디오 재생이 끝났습니다. 테스트 페이지로 이동하시겠습니까?');
            // 사용자가 '확인'을 클릭한 경우에만 페이지 전환
            if (isConfirmed) {
                window.location.href = 'studyKoreanFirstTest.jsp';
            }
        });
        
        /**
 * 
 */