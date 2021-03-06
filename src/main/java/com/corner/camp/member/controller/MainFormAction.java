package com.corner.camp.member.controller;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;
import com.corner.camp.member.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class MainFormAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        req.setCharacterEncoding("UTF-8");

        ActionForward forward = null;
        forward.setRedirect(false);
        forward.setPath("./index.jsp");

        return forward;
    }
}

