package com.corner.camp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.corner.action.Action;
import com.corner.action.ActionForward;

public class MemberLogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		session.invalidate();
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath("/Main.me");
		
		return forward;
	}
	

}
