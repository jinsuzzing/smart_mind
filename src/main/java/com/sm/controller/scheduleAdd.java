package com.sm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sm.model.DAO;
import com.sm.model.MemberDTO;

@WebServlet("/scheduleAdd")
public class scheduleAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json");
	    
	    // 로그인한 사용자의 아이디를 세션에서 가져옵니다.
	    HttpSession session = request.getSession();
	    String mem_id = (String) session.getAttribute("loggedInUserId"); // 수정된 부분

	    String sche_content = request.getParameter("schedule");
	    String started_at = request.getParameter("selectedDate");
	    
	    MemberDTO dto = new MemberDTO();
	    dto.setMem_id(mem_id); // 사용자 아이디 설정
	    dto.setSche_content(sche_content);
	    dto.setStarted_at(started_at);
	    
	    DAO dao = new DAO();
	    int row = dao.scheduleAdd(dto);
	    
	    if (row > 0) {
	        request.setAttribute("member", dto);
	        RequestDispatcher rd = request.getRequestDispatcher("schedule.jsp");
	        rd.forward(request, response);
	    } else {
	        response.sendRedirect("schedule.jsp");
	    }
	}



}
