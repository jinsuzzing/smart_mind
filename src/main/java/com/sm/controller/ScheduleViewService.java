package com.sm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.sm.model.DAO;
import com.sm.model.MemberDTO;

@WebServlet("/ScheduleViewService")
public class ScheduleViewService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String mem_id = (String) session.getAttribute("loggedInUserId");
        
        DAO dao = new DAO();
        List<MemberDTO> schedules = dao.selectUserSchedules(mem_id);
        
        Gson gson = new Gson();
        String schedulesJson = gson.toJson(schedules);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(schedulesJson);
    }
}
