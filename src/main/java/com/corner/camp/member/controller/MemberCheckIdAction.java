package com.corner.camp.member.controller;

import com.corner.action.Action;
import com.corner.action.ActionForward;
import com.corner.camp.member.dao.MemberDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class MemberCheckIdAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setCharacterEncoding("UTF-8");

        String id = req.getParameter("id");
        MemberDAO dao = new MemberDAO();
        PrintWriter out = resp.getWriter();

        if(dao.checkId(id)){
            out.println("not-ok");
        } else {
            out.println("ok");
        }

        return null;

    }
}
