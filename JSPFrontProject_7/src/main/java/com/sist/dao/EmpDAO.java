package com.sist.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.EmpVO;

public class EmpDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			ssf = CreateSqlSessionFactory.getSsf();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static List<EmpVO> empFindData(EmpVO vo){
		SqlSession session = ssf.openSession();
		List<EmpVO> list = session.selectList("empFindData", vo);
		session.close();
		return list;
	}
}
