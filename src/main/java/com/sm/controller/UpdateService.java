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

@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		// 2.요청데이터 꺼내오기(3개)
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String mem_type = request.getParameter("mem_type");
		
		// 3. session 안에 있는 로그인한 email 꺼내오기
		// 3-1. session 꺼내오기
		HttpSession session = request.getSession();
		// 3-2. session 안에 저장되어있는 로그인한 사용자 정보 가져오기
		MemberDTO LoginDto = (MemberDTO) session.getAttribute("result");
		// 3-3. email 정보만 가져오기
		String mem_id = LoginDto.getMem_id();
		
		// 4. 데이터를 하나로 묶어주기
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(mem_id); // 로그인한 이메일 주소
		dto.setMem_pw(mem_pw); // 바꿔줄 비밀번호
		dto.setMem_name(mem_name); // 바꿔줄 전화번호
		dto.setMem_type(mem_type); // 바꿔줄 주소
		
		// 5. DAO 생성
		
		DAO dao = new DAO();

		// 6. DAO에 있는 update기능 사용해서 DB에 있는 값을 변경
		
		int row = dao.update(dto);

		// 7. 만약에 변경에 성공한다면, session 안에 있는 데이터를 변경 데이터로 바꾸기
		
		if(row>0) {
			session.setAttribute("result",dto);
		}
		
		// 8. redirect 방식으로 main.jsp로 이동
		response.sendRedirect("main.jsp");
	
	}

}
