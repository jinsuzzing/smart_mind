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
	System.out.println("회원가입");
	// 1. 한글 인코딩(post 방식이기 때문에)
	request.setCharacterEncoding("UTF-8");
	// 2. 요청 데이터 꺼내오기 (4개)
	String mem_id = request.getParameter("mem_id");
	String mem_pw = request.getParameter("mem_pw");
	String mem_name = request.getParameter("mem_name");
	String mem_birthdate = request.getParameter("mem_birthdate");
	String mem_gender = request.getParameter("mem_gender");
	
	MemberDTO dto = new MemberDTO();
	dto.setMem_id(mem_id);
	dto.setMem_pw(mem_pw);
	dto.setMem_name(mem_name);
	dto.setMem_birthdate(mem_birthdate);
	dto.setMem_gender(mem_gender);
	System.out.println("JoinService 입장 :"+mem_id+mem_pw+mem_name+mem_birthdate+mem_gender);
	// DAO 생성하기
	DAO dao = new DAO();
	// DAO가 가지고 있는 기능중에 회원가입 기능 호출
	int row = dao.join(dto);
	// 회원가입에 성공했다면 join_success.jsp forward 방식 이동
	if (row > 0) {
		// request 객체 저장영역
		System.out.println("회원가입 성공");
		request.setAttribute("member", dto);
		System.out.println("dto : "+dto);
		RequestDispatcher rd = request.getRequestDispatcher("joinSuccess.jsp");
		rd.forward(request, response);
	}else {
		// 6. 실패했다면 main.jsp redirect 방식 이동
		response.sendRedirect("main.jsp");
		System.out.println("회원가입 실패");
	}
	
	
	}

}
