// 달력을 구성하고 초기화하는 함수입니다.
function buildCalendar(year = new Date().getFullYear(), month = new Date().getMonth()) {
    const firstDay = new Date(year, month, 1).getDay(); // 해당 월의 첫 번째 날의 요일 인덱스를 가져옵니다.
    const daysInMonth = new Date(year, month + 1, 0).getDate(); // 해당 월의 총 일수를 가져옵니다.

    let calendarBody = document.getElementById("calendar-body"); // 달력 본문을 나타내는 요소를 선택합니다.
    calendarBody.innerHTML = ""; // 달력 본문을 초기화합니다.

    let date = 1; // 날짜 카운터를 시작합니다.
    for (let i = 0; i < 6; i++) { // 최대 6주까지 표시할 수 있도록 반복합니다.
        let row = document.createElement("tr"); // 새로운 행을 생성합니다.
        for (let j = 0; j < 7; j++) { // 주당 7일을 처리합니다.
            let cell = document.createElement("td");
            if (i === 0 && j < firstDay) {
                // 첫 번째 행에서 첫 번째 요일 전까지는 비워둡니다.
                row.appendChild(cell);
            } else if (date > daysInMonth) {
                break; // 모든 날짜를 처리했다면 반복을 종료합니다.
            } else {
                cell.innerText = date; // 셀에 날짜를 표시합니다.
                
                // 날짜 셀에 data-date 속성 추가
                const fullDate = `${year}-${(month + 1).toString().padStart(2, '0')}-${date.toString().padStart(2, '0')}`;
                cell.setAttribute('data-date', fullDate);
                
                cell.addEventListener("click", onDateClick); // 클릭 이벤트 리스너를 추가합니다.
                row.appendChild(cell);
                date++; // 날짜를 증가시킵니다.
            }
        }
        calendarBody.appendChild(row); // 생성된 행을 달력 본문에 추가합니다.
    }

    document.getElementById("calendar-month-year").innerText = `${year}년 ${month + 1}월`; // 현재 연도와 월을 표시합니다.
}


// 달력의 날짜를 클릭했을 때 실행되는 함수입니다.
function onDateClick(event) {
    const selectedDate = event.target.getAttribute('data-date'); // 선택된 날짜를 data-date 속성에서 가져옵니다.
    const schedule = prompt("스케줄을 입력하세요:", ""); // 사용자에게 스케줄 입력을 요청합니다.
    if (schedule) {
        console.log(`날짜: ${selectedDate}, 스케줄: ${schedule}`); // 콘솔에 날짜와 스케줄을 출력합니다.

        // 서버로 스케줄 데이터를 전송합니다.
        fetch('scheduleAdd', { // 서블릿 URL에 맞게 수정하세요.
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded', // 컨텐트 타입 설정
            },
            body: `schedule=${encodeURIComponent(schedule)}&selectedDate=${encodeURIComponent(selectedDate)}` // 데이터 인코딩
        })
        .then(response => response.text()) // 응답을 텍스트로 변환
        .then(data => {
            // console.log(data); // 서버로부터의 응답을 콘솔에 출력
            // 여기에 성공 처리 로직을 추가할 수 있습니다. 예: 페이지 새로고침, 사용자에게 성공 메시지 표시 등
        })
        .catch(error => console.error('Error:', error)); // 오류 처리
    }
}

// 이전 달과 다음 달로 이동하는 버튼에 이벤트 리스너를 추가합니다.
let currentYear = new Date().getFullYear();
let currentMonth = new Date().getMonth();

document.getElementById("prev-month").addEventListener("click", () => {
    currentMonth--;
    if (currentMonth < 0) {
        currentMonth = 11;
        currentYear--;
    }
    buildCalendar(currentYear, currentMonth); // 이전 달의 달력을 구성합니다.
});

document.getElementById("next-month").addEventListener("click", () => {
    currentMonth++;
    if (currentMonth > 11) {
        currentMonth = 0;
        currentYear++;
    }
    buildCalendar(currentYear, currentMonth); // 다음 달의 달력을 구성합니다.
});

// 달력에 DB에서 가져온 스케줄을 표시하는 함수입니다.
function fetchScheduleAndDisplay() {
    fetch("ScheduleViewService") // 서블릿 URL에 맞게 수정
    
    .then(response => response.json())
    .then(schedules => {
		console.log("Received data:", schedules);
        schedules.forEach(schedule => {
            const formattedDate = convertDateFormat(schedule.started_at); // 필요에 따라 날짜 형식 조정
            const cell = document.querySelector(`#calendar-body td[data-date="${formattedDate}"]`);
			console.log("cell : ", cell);
            if (cell) {
                cell.innerHTML+= `<p>${schedule.sche_content}</p>`; // 스케줄 내용 추가
            }
        });
    })
    .catch(error => console.error('Error fetching schedule:', error));
}

document.addEventListener('DOMContentLoaded', function() {
    buildCalendar(new Date().getFullYear(), new Date().getMonth());
    fetchScheduleAndDisplay(); // 페이지 로딩 시 스케줄 정보 가져오기
});


function convertDateFormat(dateStr) {
    const parts = dateStr.split(" ")[0]; // " " 공백 문자를 기준으로 날짜와 시간을 분리하고, 날짜 부분만 추출
    return parts; // "YYYY-MM-DD" 형식의 날짜 문자열 반환
}
