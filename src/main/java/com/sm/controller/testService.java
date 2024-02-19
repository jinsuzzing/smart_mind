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

/**
 * Servlet implementation class testService
 */
@WebServlet("/testService")
public class testService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 한글 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 요청데이터 꺼내오기 (작성자id , 글제목 , 글내용 )
		String mem_id = request.getParameter("mem_id");
		String test_answer = request.getParameter("test_answer");
		String mem_answer = request.getParameter("mem_answer");
		
		
		System.out.println(mem_answer);
		MemberDTO dto = new MemberDTO();
		if(mem_answer.equals(test_answer)) {
			System.out.println("정답");
			dto.setTest_corr("1");
		} else {
			System.out.println("오답");
			dto.setTest_corr("0");
		}
		dto.setMem_id(mem_id);
		dto.setTest_answer(test_answer);
		dto.setMem_answer(mem_answer);
		
		DAO dao = new DAO();
		// dao.join을 사용하여 글쓴이 , 글제목 , 글내용 저장
		int row = dao.test(dto);

		if (row > 0) {
			// 내용 저장이 성공 했다면, forward 방식 이동
			request.setAttribute("test", dto);
			System.out.println("row : "+row);
			RequestDispatcher rd = request.getRequestDispatcher("studyKorean.jsp");
			rd.forward(request, response);

		} else {
			// 실패 했다면 다시 글작성 페이지로 이동(redirect 방식으로 이동)
			response.sendRedirect("community_write.jsp");
			System.out.println("row : "+row);

		}
	}

}
