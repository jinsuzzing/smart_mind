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

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	// 1. 한글 인코딩(post 방식이기 때문에)
	request.setCharacterEncoding("UTF-8");
	// 2. 요청 데이터 꺼내오기 (4개)
	String mem_id = request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	String mem_name = request.getParameter("mem_name");
	String mem_type = request.getParameter("mem_type");
	
	// 2-2. 요청받은 데이터를 하나로 묶어주는 작업
	MemberDTO dto = new MemberDTO();
	dto.setMem_id(mem_id);
	dto.setMem_pw(mem_pw);
	dto.setMem_name(mem_name);
	dto.setMem_type(mem_type);
	// 3. DAO 생성하기
	DAO dao = new DAO();
	// 4. DAO가 가지고 있는 기능중에 회원가입 기능 호출
	int row = dao.join(dto);
	// 5. 회원가입에 성공했다면 join_success.jsp forward 방식 이동
	if (row > 0) {
		// request 객체 저장영역
		request.setAttribute("member", dto);
		RequestDispatcher rd = request.getRequestDispatcher("join_success.jsp");
		rd.forward(request, response);
	}else {
		// 6. 실패했다면 main.jsp redirect 방식 이동
		response.sendRedirect("main.jsp");
	}
	
	
	}

}
