package com.corner.camp.member.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.corner.camp.member.vo.MemberVO;
import com.corner.mybatis.config.SqlMapConfig;
import com.corner.util.SHA256;

public class MemberDAO {

    private static final int KEY = 3;

    SqlSessionFactory sessionFactory = SqlMapConfig.getSqlMapInstance();
    SqlSession session;

    public MemberDAO() {
        session = sessionFactory.openSession(true);
    }

    /**
     * @param vo
     * @return true : insert Success <br> false : insert Failed
     * @Constributors Corner
     */
	public boolean join(MemberVO member) {
		member.setMemberPw(encrypt(member.getMemberPw()));
		member.setMemberEmailHash(SHA256.getSHA256(member.getMemberEmail()));
		member.setMemberEmailChecked(0);
		return session.insert("Member.join", member) == 1;
	}

    /**
     * Id Overlap Check
     *
     * @param id
     * @return true : overlap <br> false : Available
     */
    public boolean checkId(String id) {
        return (Integer) session.selectOne("Member.checkId", id) == 1;
    }

    /**
     * Password Encrypt
     *
     * @param pw
     * @return String en_pw;
     */
	public String encrypt(String pw) {
		String en_pw = "";
		for (int i = 0; i < pw.length(); i++) {
			en_pw += (char) (pw.charAt(i) * KEY);
		}
		return en_pw;
	}

	//로그인
	/**
	 * 
	 * @param id
	 * @param pw
	 * @return
	 * true (1) : success <br> false (!1) : failed 
	 */
	public boolean login(String id, String pw) {
		HashMap<String, String> member = new HashMap<>();
		
		member.put("id", id);
		member.put("pw", encrypt(pw));
		return (Integer)session.selectOne("Member.login", member) == 1;
	}
}

