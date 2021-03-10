package com.corner.camp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;

public class MemberLoginOkAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        
        ActionForward forward = new ActionForward();
        MemberDAO dao = new MemberDAO();
        
        String id = req.getParameter("memberId");
        String pw = req.getParameter("memberPw");
        resp.setContentType("text/html;charset=utf-8");
        
        if (dao.login(id, pw)) {
        	session.setAttribute("memberId", id);
        	forward.setRedirect(true);
        	forward.setPath(req.getContextPath()+"/Main.me?type=login");
        } else {
        	forward.setRedirect(false);
        	forward.setPath("/user/MemberLogin.me?type=false");
        }

        return forward;


    }
}
