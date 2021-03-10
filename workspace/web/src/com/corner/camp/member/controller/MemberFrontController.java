package com.corner.camp.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.corner.action.ActionForward;

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
        
     
        if (command.equals("/user/MemberJoin.me")) {
            try {
            	String join = req.getParameter("join");
                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setPath("/user/join.jsp" + (join != null ? "?join=false" : ""));
            } catch (Exception e) {
                ;
            }
        } else if (command.equals("/user/MemberJoinOk.me")) {
            try {
                forward = new MemberJoinOkAction().execute(req, resp);
            } catch (Exception e) {
                ;
            }
        }  else if (command.equals("/user/MemberCheckIdOkAction.me")) {
            try {
                forward = new MemberCheckIdOkAction().execute(req, resp);
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
            	String type = req.getParameter("type");
                forward = new ActionForward();
                forward.setRedirect(false);
				forward.setPath("/index.jsp" +  (type != null ? "?type=login" : ""));
            } catch (Exception e) {;}
        } else if (command.equals("/user/emailAccess.me")) {
        	try {
        		   String code = null;
        			if(req.getParameter("code") != null ) {
        				code = req.getParameter("code");
        				forward = new MemberEmailAccessAction().execute(req, resp);
        			}
			} catch (Exception e) {;}
        } else if (command.equals("/user/MemberLogout.me")) {
        	try {
				forward = new MemberLogoutAction().execute(req, resp);
			} catch (Exception e) {;}
        	
        }  else if(command.equals("/user/emailSend.me")) { 
        	try {
				forward = new MemberEmailSendAction().execute(req, resp);
			} catch (Exception e) {;}
        } else if (command.equals("/user/MemberFindIdCheck.me")) {
        	try {
					forward = new MemberEmailFindIdCheckAction().execute(req, resp);
			} catch (Exception e) {;}
        } else if(command.equals("/user/MemberFindId.me")) { 
        	try {
				forward = new MemberEmailFindIdAction().execute(req, resp);
			} catch (Exception e) {;}
        } else if (command.equals("/user/MemberFindPwCheck.me")) {  
        	try {
				forward = new MemberEmailFIndPwCheckAction().execute(req, resp);
			} catch (Exception e) {;}
        } else if (command.equals("/user/MemberFindPw.me")) { 
        	try {
				forward = new MemberEmailFindPwAction().execute(req, resp);
			} catch (Exception e) {;}
        } else if (command.equals("/user/MemberUpdate.me")) { 
        	
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