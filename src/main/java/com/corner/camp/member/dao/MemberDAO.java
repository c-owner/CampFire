package com.corner.camp.member.dao;

import com.corner.camp.member.vo.MemberVO;
import com.corner.mybatis.config.SqlMapConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MemberDAO {

    SqlSession session;
    SqlSessionFactory sessionFactory = SqlMapConfig.getSqlMapInstance();

    public MemberDAO() {
        session = sessionFactory.openSession(true);
    }

    /**
     *
     * @param vo
     * @return
     *
     */
    public boolean join(MemberVO vo) {
        return session.insert("Member.join", vo) == 1;
    }



}

