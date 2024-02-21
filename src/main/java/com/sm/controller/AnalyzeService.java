package com.sm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sm.model.DAO;
import com.sm.model.MemberDTO;

@WebServlet("/AnalyzeService")
public class AnalyzeService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 한글 인코딩
		request.setCharacterEncoding("UTF-8");
		// 2. 요청 데이터 꺼내오기(2개, Email, pw)
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
	
		// 3. 데이터 하나로 묶어주기(MemberDTO)
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(mem_id);
		dto.setMem_pw(mem_pw);
		dto.setMem_name(mem_name);
		
		// 4. DAO 생성
		DAO dao = new DAO();
		// 5. DAO에 있는 로그인 기능 사용
		MemberDTO result = dao.login(dto);
		
		// 6-1. 로그인에 성공했다면 email, tel, address session 담아서
		if(result != null) {
			HttpSession session = request.getSession();
			// session에 데이터 담기
			session.setAttribute("result", result);
			response.sendRedirect("studyKorean.jsp");
			System.out.println(result);
		}
		else {
			response.sendRedirect("loginError.jsp");
		}
	}

}