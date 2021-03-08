package com.corner.camp.member.controller;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;
import com.corner.camp.member.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;

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
        	System.out.println("로그인 성공");
        	forward.setRedirect(true);
        	forward.setPath(req.getContextPath()+"/Main.me");
        } else {
        	System.out.println("로그인 실패");
        	forward.setRedirect(false);
        	forward.setPath("/user/MemberLogin.me?login=false");
        }

        return forward;


    }
}
