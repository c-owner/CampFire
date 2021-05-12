package com.corner.camp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;
import com.corner.camp.member.vo.MemberVO;
import com.corner.util.SHA256;

public class MemberJoinOkAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        ActionForward forward = null;

        MemberVO vo = new MemberVO();
        MemberDAO dao = new MemberDAO();
        
        vo.setMemberId(req.getParameter("memberId"));
        vo.setMemberPw(req.getParameter("memberPw"));
        vo.setMemberEmail(req.getParameter("memberEmail"));
        vo.setMemberEmailHash(req.getParameter("memberEmail"));
        vo.setMemberEmailChecked(1);
        if (!dao.join(vo)) {
        	forward = new ActionForward();
        	forward.setRedirect(false);
        	forward.setPath("/user/MemberJoin.me?join=false");
        } else {
	        	String id = vo.getMemberId();
	        	session.setAttribute("memberId", id);
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/user/emailSend.me");
        }

        return forward;
    }
}
