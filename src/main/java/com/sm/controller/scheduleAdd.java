package com.sm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sm.model.DAO;
import com.sm.model.MemberDTO;

@WebServlet("/scheduleAdd")
public class scheduleAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		String sche_content = request.getParameter("schedule");
		String started_at = request.getParameter("selectedDate");
		
		MemberDTO dto = new MemberDTO();
		dto.setSche_content(sche_content);
		dto.setStarted_at(started_at);
		
		System.out.println(sche_content);
		DAO dao = new DAO();
		
		int row =dao.scheduleAdd(dto);
		
		if (row > 0) {
			// request 객체 저장영역
			request.setAttribute("member", dto);
			System.out.println("dto : "+dto);
			RequestDispatcher rd = request.getRequestDispatcher("schedule.jsp");
			rd.forward(request, response);
		}else {
			// 6. 실패했다면 main.jsp redirect 방식 이동
			response.sendRedirect("schedule.jsp");
		}
		
	}

}
