package com.sm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sm.model.DAO;
import com.sm.model.MemberDTO;

@WebServlet("/scheduleAddView")
public class scheduleAddView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    
	    DAO dao = new DAO();

	    List<MemberDTO> scheduleList = dao.scheduleView();// DAO를 통해 스케줄 데이터 조회
	    String json = new Gson().toJson(scheduleList); // Gson 라이브러리를 사용하여 JSON으로 변환

	    response.getWriter().write(json); // JSON 데이터 응답
	}

}
