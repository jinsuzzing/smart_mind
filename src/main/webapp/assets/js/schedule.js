function buildCalendar(year = new Date().getFullYear(), month = new Date().getMonth()) {
    const firstDay = new Date(year, month, 1).getDay();
    const daysInMonth = new Date(year, month + 1, 0).getDate();

    let calendarBody = document.getElementById("calendar-body");
    calendarBody.innerHTML = "";

    let date = 1;
    for (let i = 0; i < 6; i++) {
        let row = document.createElement("tr");
        for (let j = 0; j < 7; j++) {
            let cell = document.createElement("td");
            if (i === 0 && j < firstDay) {
                // 초기 행에서 첫 번째 날짜 전까지는 셀을 비워둠
                row.appendChild(cell);
            } else if (date > daysInMonth) {
                break; // 해당 월의 모든 날짜가 처리되면 반복 종료
            } else {
                cell.innerText = date;
                cell.addEventListener("click", onDateClick); // 여기에 클릭 이벤트 리스너 추가
                row.appendChild(cell);
                date++;
            }
        }
        
        calendarBody.appendChild(row);
    }

    document.getElementById("calendar-month-year").innerText = `${year}년 ${month + 1}월`;
}

// 페이지가 로드될 때 달력을 처음에 한 번 그림
buildCalendar();

function onDateClick(event) {
    const selectedDate = event.target.innerText;
    const schedule = prompt("스케줄을 입력하세요:", "");
    if (schedule) {
        // 선택한 날짜에 스케줄을 저장하는 로직을 여기에 추가합니다.
        // 예: localStorage 사용 또는 서버에 저장하는 코드
        console.log(`날짜: ${selectedDate}, 스케줄: ${schedule}`);
    }
}

let currentYear = new Date().getFullYear();
let currentMonth = new Date().getMonth();

document.getElementById("prev-month").addEventListener("click", () => {
    currentMonth--;
    if (currentMonth < 0) {
        currentMonth = 11;
        currentYear--;
    }
    buildCalendar(currentYear, currentMonth); // 현재 연도와 월을 파라미터로 전달
});

document.getElementById("next-month").addEventListener("click", () => {
    currentMonth++;
    if (currentMonth > 11) {
        currentMonth = 0;
        currentYear++;
    }
    buildCalendar(currentYear, currentMonth); // 현재 연도와 월을 파라미터로 전달
});
document.getElementById('calendar-month-year').addEventListener('click', function() {
    let yearMonth = prompt("연도와 월을 입력하세요 (예: 2024-02):");
    if (yearMonth) {
        // 입력받은 값으로 달력을 업데이트하는 로직을 추가합니다.
        // 예시: document.getElementById('calendar-month-year').innerText = `${year}년 ${month}월`;
        console.log("선택된 날짜:", yearMonth); // 실제 구현 필요
    }
});

document.getElementById("addScheduleModal").addEventListener("click", function() {
    document.getElementById("scheduleModal").style.display = "block"; // 모달 표시
});

function addSchedule() {
    const date = document.getElementById("scheduleDate").value; // 날짜 입력 필드의 값을 가져옵니다.
    const text = document.getElementById("scheduleText").value; // 텍스트 입력 필드의 값을 가져옵니다.

    // XMLHttpRequest 객체를 생성하여 서버로 요청을 전송합니다.
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "scheduleAdd", true); // 'POST' 메소드를 사용하여 'scheduleAdd' 서블릿으로 요청을 보냅니다.
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); // 요청의 본문 타입을 설정합니다.

    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            alert("스케줄이 추가되었습니다."); // 요청이 성공적으로 처리되면 사용자에게 알립니다.
            // 여기에 성공 시 추가 동작을 구현할 수 있습니다.
        }
    };

    // 서버로 전송할 데이터를 인코딩하여 보냅니다.
    xhr.send("schedule=" + encodeURIComponent(text) + "&selectedDate=" + date);
}


// 달력 날짜 클릭 시 이벤트 처리
document.querySelectorAll("#calendar-table td").forEach(td => {
    td.addEventListener("click", function() {
        const selectedDate = this.innerText;
        const scheduleText = prompt("스케줄을 입력하세요:");
        // 입력 받은 스케줄을 달력에 추가하는 로직 구현
        console.log(selectedDate, scheduleText); // 실제 구현 필요
    });
});

function fetchScheduleAndDisplay() {
    fetch("scheduleAddView") // 서버 URL로 변경
    .then(response => response.json())
    .then(data => {
        data.forEach(schedule => {
            // 달력의 날짜 칸을 찾아 스케줄 내용을 표시하는 로직
            // 예: 날짜에 해당하는 td를 찾고, schedule.content를 표시
            const cell = document.querySelector(`#calendar-body td[data-date="${schedule.date}"]`);
            if (cell) {
                cell.innerHTML += `<div>${schedule.content}</div>`; // 스케줄 내용 추가
            }
        });
    })
    .catch(error => console.error('Error fetching schedule:', error));
}

// 페이지 로드 시 스케줄 데이터 요청
document.addEventListener('DOMContentLoaded', fetchScheduleAndDisplay);



