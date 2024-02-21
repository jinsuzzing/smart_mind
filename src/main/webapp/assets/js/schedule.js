document.addEventListener('DOMContentLoaded', function() {
    buildCalendar(new Date().getFullYear(), new Date().getMonth());
    fetchScheduleAndDisplay();
});
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
    // 각 날짜 셀에 대해 클릭 이벤트 리스너 등록
    document.querySelectorAll("#calendar-body td").forEach(td => {
        td.addEventListener("click", onDateClick);
    });
}


// 달력의 날짜를 클릭했을 때 실행되는 함수입니다.
function onDateClick(event) {
    const selectedDate = event.target.getAttribute('data-date'); // 선택된 날짜를 data-date 속성에서 가져옵니다.
    const scheduleContent = prompt("스케줄을 입력하세요:", ""); // 사용자에게 스케줄 입력을 요청합니다.
    if (!scheduleContent) return; // 스케줄 내용이 없으면 종료

    console.log(`날짜: ${selectedDate}, 스케줄: ${scheduleContent}`); // 콘솔에 날짜와 스케줄을 출력합니다.

    // 서버로 스케줄 데이터를 전송합니다.
    fetch('scheduleAdd', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `schedule=${encodeURIComponent(scheduleContent)}&selectedDate=${encodeURIComponent(selectedDate)}`
    })
    .then(response => {
        if (!response.ok) throw new Error('Network response was not ok');
        return response.text();
    })
    .then(() => {
        updateCalendarCell(selectedDate, scheduleContent); // 성공적으로 추가된 후 화면에 바로 반영
    })
    .catch(error => console.error('Error:', error));
}
function updateCalendarCell(date, content) {
    const cell = document.querySelector(`#calendar-body td[data-date="${date}"]`);
    if (!cell) return;

    // 스케줄 내용과 삭제 버튼을 담을 div 생성
    const scheduleDiv = document.createElement("div");
    scheduleDiv.classList.add("schedule-item");

    // 스케줄 텍스트 추가
    const textNode = document.createTextNode(content);
    scheduleDiv.appendChild(textNode);

    // 삭제 버튼 추가
    const deleteBtn = document.createElement("button");
    deleteBtn.textContent = "X";
    deleteBtn.classList.add("delete-btn");
    deleteBtn.onclick = function() {
        // 스케줄 삭제 로직
        cell.removeChild(scheduleDiv);
        // 여기서 서버에 삭제 요청을 보내는 코드를 추가할 수 있습니다.
    };
    scheduleDiv.appendChild(deleteBtn);

    cell.appendChild(scheduleDiv);
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
    fetch("ScheduleViewService")
    .then(response => response.json())
    .then(schedules => {
        console.log("Received data:", schedules);
        schedules.forEach(schedule => {
            const formattedDate = convertDateFormat(schedule.started_at);
            const cell = document.querySelector(`#calendar-body td[data-date="${formattedDate}"]`);
            if (!cell) return; // 해당 날짜의 셀이 없으면 종료

            // 스케줄 내용을 담을 div를 찾거나 새로 생성
            let scheduleDiv = cell.querySelector(".schedule-content");
            if (!scheduleDiv) {
                scheduleDiv = document.createElement("div");
                scheduleDiv.classList.add("schedule-content");
                cell.appendChild(scheduleDiv);
            }

            // 스케줄 내용 업데이트
            scheduleDiv.textContent = schedule.sche_content;
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
