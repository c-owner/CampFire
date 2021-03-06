package com.corner.camp.member.dao;

import com.corner.camp.member.vo.MemberVO;
import com.corner.mybatis.config.SqlMapConfig;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class MemberDAO {

    private static int KEY = 3;

    SqlSession session;
    SqlSessionFactory sessionFactory = SqlMapConfig.getSqlMapInstance();

    public MemberDAO() {
        session = sessionFactory.openSession(true);
    }

    /**
     *
     * @param vo
     * @return
     * true : insert Success <br> false : insert Failed
     * @Constributors Corner
     */
    public boolean join(MemberVO vo) {
        vo.setMemberPw(encrypt(vo.getMemberPw()));
        return session.insert("Member.join", vo) == 1;
    }
    /**
     * Id Overlap Check
     * @param id
     * @return
     * true : overlap <br> false : Available
     */
    public boolean checkId(String id){
        return (Integer) session.selectOne("Member.checkId", id) == 1;
    }

    /**
     * Password Encrypt
     * @param pw
     * @return
     * String en_pw;
     */
    public String encrypt(String pw) {
        String en_pw = "";
        for(int i = 0; i < pw.length(); i++ ) {
            en_pw += (char) (pw.charAt(i) * KEY );
        }
        return en_pw;
    }



}

