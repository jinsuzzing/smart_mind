package com.sm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sm.model.DAO;
import com.sm.model.MemberDTO;

@WebServlet("/ScheduleViewService")
public class ScheduleViewService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        DAO dao = new DAO();
        List<MemberDTO> scheduleList = dao.scheduleView(); // DB에서 스케줄 정보를 조회

        Gson gson = new Gson();
        String json = gson.toJson(scheduleList); // 조회된 스케줄 정보를 JSON으로 변환
        
        System.out.println("json : " + json);

        try (PrintWriter out = response.getWriter()) {
            out.print(json); // JSON 데이터를 응답으로 전송
        }
    }
}
