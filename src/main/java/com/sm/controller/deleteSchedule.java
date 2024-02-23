package com.sm.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sm.model.DAO;

@WebServlet("/deleteSchedule")
public class deleteSchedule extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션에서 로그인한 사용자의 ID를 가져옵니다.
        HttpSession session = request.getSession();
        String loggedInUserId = (String) session.getAttribute("loggedInUserId");

        // 요청 파라미터에서 삭제할 스케줄의 ID(sche_seq)를 가져옵니다.
        int sche_seq = Integer.parseInt(request.getParameter("sche_seq"));

        // DAO 인스턴스 생성
        DAO dao = new DAO();
        
        

        // 스케줄 삭제 시도
        Map<String, Object> params = new HashMap<>();
        params.put("sche_seq", sche_seq);
        params.put("mem_id", loggedInUserId);
        boolean deleted = dao.deleteSchedule(params);

        if (deleted) {
            // 스케줄이 성공적으로 삭제되었다면, 여기에 성공 처리 로직을 구현합니다.
            // 예: 성공 메시지를 설정하거나, 특정 페이지로 리디렉션
            response.sendRedirect("schedule.jsp?deleteSuccess=true");
        } else { 
            // 삭제 권한이 없거나 삭제에 실패했다면, 여기에 실패 처리 로직을 구현합니다.
            // 예: 실패 메시지를 설정하거나, 에러 페이지로 리디렉션
            response.sendRedirect("schedule.jsp?deleteSuccess=false");
        }
    }
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // doPost 요청을 doGet 메서드로 처리하도록 위임
    }
}
