package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.ReplyVO;

public class ReplyDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	public static List<ReplyVO> replyListData(int fno){
		SqlSession session = ssf.openSession();
		List<ReplyVO> list = new ArrayList<>();
		list = session.selectList("replyListData", fno);
		session.close();
		return list;
	}
	
	public static void replyInsert(ReplyVO vo) {
		SqlSession session = ssf.openSession();
		session.insert("replyInsert",vo);
		session.commit();
		session.close();
	}
	
	public static void replyUpdate(Map map){
		SqlSession session = ssf.openSession(true);
		session.update("replyUpdate",map);
		session.close();
	}
	
	public static void replyDelete(int no) {
		SqlSession session = ssf.openSession(true);
		session.delete("replyDelete",no);
		session.close();
	}
}
