package com.corner.camp.member.controller;


import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;

public class MemberVerifyCheckAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");
        MemberDAO dao = new MemberDAO();
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/html;charset=utf-8");
        
	  
        if (dao.checkEmail(email)) {
        	out.println("not-ok");
        } else {
        	out.println("ok");
        }
        out.close();


        return null;

    }
}
