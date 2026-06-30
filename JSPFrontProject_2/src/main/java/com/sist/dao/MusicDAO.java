package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MusicDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public static List<MusicVO> musicListData(){
		List<MusicVO> list = new ArrayList<>();
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			list = session.selectList("musicListData");
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if(session != null) {
				session.close();
			}
		}
		
		return list;
	}
}
