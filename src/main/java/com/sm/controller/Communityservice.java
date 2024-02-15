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

@WebServlet("/Communityservice")
public class Communityservice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. 한글 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 요청데이터 꺼내오기 (작성자id , 글제목 , 글내용 )
		String mem_id = request.getParameter("mem_id");
		String post_title = request.getParameter("post_title");
		String post_content = request.getParameter("post_content");

		MemberDTO dto = new MemberDTO();
		dto.setMem_id(mem_id);
		dto.setPost_title(post_title);
		dto.setPost_content(post_content);

		DAO dao = new DAO();
		// dao.join을 사용하여 글쓴이 , 글제목 , 글내용 저장
		int row = dao.join(dto);

		if (row > 0) {
			// 내용 저장이 성공 했다면, forward 방식 이동
			request.setAttribute("member", dto);
			System.out.println("작성 완료~!!");
			RequestDispatcher rd = request.getRequestDispatcher("comunity.jsp");
			rd.forward(request, response);

		} else {
			// 실패 했다면 다시 글작성 페이지로 이동(redirect 방식으로 이동)
			response.sendRedirect("community_write.jsp");
			System.out.println("글작성에 실패했습니다. 다시 작성해주세요~");

		}

	}

}
