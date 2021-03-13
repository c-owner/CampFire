package com.corner.camp.member.controller;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;

public class MemberVerifyEmailCheckAction implements Action {
	
    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setCharacterEncoding("UTF-8");
        
        int verify = Integer.parseInt(req.getParameter("verify"));
        MemberVerifyEmailAction mv = null;
        
        MemberDAO dao = new MemberDAO();
        PrintWriter out = resp.getWriter();
        
        resp.setContentType("text/html;charset=utf-8");
        ActionForward forward = null;
        String num = forward.getVerify();
        int dice = Integer.parseInt(num);
        if (verify == dice) {
        	out.println("ok");
        } else {
        	out.println("not-ok");
        }
        out.close();


        return null;

    }
}
