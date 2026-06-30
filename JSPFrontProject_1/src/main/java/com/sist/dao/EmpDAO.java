package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class EmpDAO {

	private static SqlSessionFactory ssf;	
	static {
		try {
			//XML 파싱
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader); //emp-mapper.xml 포함됨
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static List<EmpVO> empListData(){
		List<EmpVO> list = new ArrayList<>();
		
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("empListData");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) {
				session.close(); // POOL 반환
			}
			
		}
		return list;
	}
}
