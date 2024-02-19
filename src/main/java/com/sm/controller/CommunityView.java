package com.sm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sm.model.DAO;
import com.sm.model.MemberDTO;

/**
 * Servlet implementation class CommunityView
 */
@WebServlet("/CommunityView")
public class CommunityView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// 1. DAO 생성
		DAO dao = new DAO();
		
		// 2. DAO에서 모든 회원 조회하는 기능 사용
		List<MemberDTO> resultList = dao.communityView();
		
		// 3. request scope에 전체 회원정보를 담아주기
		request.setAttribute("resultList", resultList);
		
		// 4. select.jsp로 foward 방식으로 이동
		RequestDispatcher rd = request.getRequestDispatcher("community.jsp");
		rd.forward(request, response);
		
	
	}

}
