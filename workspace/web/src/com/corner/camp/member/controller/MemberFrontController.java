package com.corner.camp.member.controller;

import com.corner.action.ActionForward;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

//@WebServlet(name = "MemberFrontController", value = "/")
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
        System.out.println("uri " + requestURI);

        if (command.equals("/user/MemberJoin.me")) {
            try {
                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setPath("/user/join.jsp");
            } catch (Exception e) {
                ;
            }
        } else if (command.equals("/user/MemberJoinOk.me")) {
            try {
                forward = new MemberJoinOkAction().execute(req, resp);
                System.out.println("프론트 컨트롤러 : 회원가입 forward");
            } catch (Exception e) {
                ;
            }
        }  else if (command.equals("/user/MemberCheckIdOkAction.me")) {
            try {
                forward = new MemberCheckIdOkAction().execute(req, resp);
                System.out.println("중복 검사 끝");
            } catch (Exception e) {
                ;
            }
        } else if (command.equals("/user/MemberLogin.me")) {
        	try {
        		String login = req.getParameter("login");
    			forward = new ActionForward();
    			forward.setRedirect(false);
				forward.setPath("/user/login.jsp" +  (login != null ? "?login=false" : ""));
			} catch (Exception e) {;}
        } else if (command.equals("/user/MemberLoginOk.me")) {
            try {
                forward = new MemberLoginOkAction().execute(req, resp);
            } catch (Exception e) {
                ;
            }
        } else if (command.equals("/Main.me")) {
            try {
                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setPath("./index.jsp");
            } catch (Exception e) {
                ;
            }
        } else {
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/404error.jsp");
        }
        if (forward != null) {
            if (forward.isRedirect()) {
                resp.sendRedirect(forward.getPath());
            } else {
                RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
                dispatcher.forward(req, resp);
            }
        }


    }


}