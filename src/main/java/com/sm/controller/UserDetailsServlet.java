package com.sm.controller;
import com.google.gson.JsonObject; // 정확한 import 구문
import com.sm.model.DAO;
import com.sm.model.MemberDTO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/UserDetailsServlet")
public class UserDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mem_id = request.getParameter("mem_id");
        
        DAO dao = new DAO();
        MemberDTO userDetails = dao.selectUserDetails(mem_id);

        // userDetails 객체를 request attribute에 설정
        request.setAttribute("analyze", userDetails);
        
        // userDetails.jsp로 데이터와 함께 forward
        request.getRequestDispatcher("study_analyze.jsp").forward(request, response);
    }
}
  
