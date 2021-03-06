package com.corner.camp.member.controller;

import com.corner.action.ActionForward;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "MemberFrontController", value = "/MemberFrontController")
public class MemberFrontController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doProcess(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doProcess(req, resp);
    }

    protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestURI = req.getRequestURI();
        String contextPath = req.getContextPath();
        String command = requestURI.substring(contextPath.length());

        ActionForward forward = null;

        if(command.equals("/member/MemberJoine.me")){
            try {
                forward = new MemberJoinAction().execute(req, resp);
            } catch (Exception e) {;}
        }


    }


}