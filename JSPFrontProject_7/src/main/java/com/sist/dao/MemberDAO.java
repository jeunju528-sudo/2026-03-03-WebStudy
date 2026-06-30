package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.MemberVO;

public class MemberDAO {
	
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static MemberVO memberLogin(String id, String pwd) {
		MemberVO vo = new MemberVO();
		SqlSession session = ssf.openSession();
		
		/*
		 <select id="memberIdCount" resultType="MemberVO" parameterType="String">
		SELECT COUNT(*)
		FROM member
		WHERE id=#{id}
		</select>
		<select id="memverGetPassword" resultType="MemberVO" parameterType="string">
			SELECT id, name, pwd 
			FROM member
			WHERE id=#{id}
		</select> 
		 */
		int count = session.selectOne("memberIdCount", id);
		// 아이디 존재여부 점검
		if(count==0) {
			vo.setMsg("NOID");
		}else {
			// ID 존재 > PW 점검 > SESSION에 저장된 데이터를 가지고온다
			MemberVO dbVO = session.selectOne("memberGetPassword", id);
			if(pwd.equals(dbVO.getPwd())) {
				vo.setId(dbVO.getId());
				vo.setName(dbVO.getName());
				vo.setMsg("OK");
			}
			else {
				vo.setMsg("NOPWD");
			}
		}
		session.close();
		return vo;
	}

}
