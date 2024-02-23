
document.addEventListener('DOMContentLoaded', function() {
    buildCalendar(new Date().getFullYear(), new Date().getMonth());
    fetchScheduleAndDisplay();
});

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
                row.appendChild(cell);
            } else if (date > daysInMonth) {
                break;
            } else {
                cell.innerText = date;
                const fullDate = `${year}-${(month + 1).toString().padStart(2, '0')}-${date.toString().padStart(2, '0')}`;
                cell.setAttribute('data-date', fullDate);
                cell.addEventListener("click", onDateClick);
                row.appendChild(cell);
                date++;
            }
        }
        calendarBody.appendChild(row);
    }
    document.getElementById("calendar-month-year").innerText = `${year}년 ${month + 1}월`;
}

function fetchScheduleAndDisplay() {
    fetch("ScheduleViewService")
    .then(response => response.json())
    .then(schedules => {
        schedules.forEach(schedule => {
            const formattedDate = convertDateFormat(schedule.started_at);
            const cell = document.querySelector(`#calendar-body td[data-date="${formattedDate}"]`);
            if (cell) {
                appendScheduleToCell(cell, schedule.sche_content, schedule.sche_seq);
            }
        });
    })
    .catch(error => console.error('Error fetching schedule:', error));
}

var userId = document.getElementById('userId').dataset.userId;


// 스케줄 삭제 버튼을 생성하고 이벤트 리스너를 추가하는 함수
function createDeleteButton(sche_seq, cell, scheduleDiv) {
    const deleteBtn = document.createElement("button");
    deleteBtn.textContent = "X";
    deleteBtn.classList.add("delete-btn");
    deleteBtn.onclick = function(event) {
        event.stopPropagation();
        if (confirm("정말 삭제하시겠습니까?")) {
            deleteSchedule(sche_seq, userId, cell, scheduleDiv);
        }
    };
    return deleteBtn;
}

// 스케줄 삭제 요청을 보내는 함수
function deleteSchedule(sche_seq, userId, cell, scheduleDiv) {
    fetch(`deleteSchedule?sche_seq=${sche_seq}&mem_id=${userId}`, {
        method: 'POST', // 혹은 'GET', 서버 구현에 따라 달라질 수 있습니다.
    })
    .then(response => {
        if (!response.ok) throw new Error('Network response was not ok');
        cell.removeChild(scheduleDiv); // UI에서 스케줄 항목 삭제
    })
    .catch(error => console.error('Error:', error));

}

function convertDateFormat(dateStr) {
    const parts = dateStr.split(" ")[0];
    return parts;
}

function onDateClick(event) {
    const selectedDate = event.target.getAttribute('data-date');
    const scheduleContent = prompt("스케줄을 입력하세요:", "");
    if (!scheduleContent) return;
    addSchedule(selectedDate, scheduleContent);
}

function addSchedule(selectedDate, scheduleContent) {
    fetch('scheduleAdd', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `schedule=${encodeURIComponent(scheduleContent)}&selectedDate=${encodeURIComponent(selectedDate)}&mem_id=${encodeURIComponent(mem_id)}`
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        // 서버로부터의 응답 처리가 성공적으로 완료되면 페이지를 새로고침합니다.
        window.location.reload(); // 이 부분이 페이지를 새로고침하는 코드입니다.
    })
    .catch(error => console.error('Error:', error));
}
function appendScheduleToCell(cell, content, sche_seq) {
    const scheduleDiv = document.createElement("div");
    scheduleDiv.textContent = content;
    const deleteBtn = createDeleteButton(sche_seq, cell, scheduleDiv);
    scheduleDiv.appendChild(deleteBtn);
    cell.appendChild(scheduleDiv);
}