package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.CreateSqlSessionFactory;
import com.sist.vo.FoodVO;

public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	/*
	 * selectOne : 데이터 하나
	 * selectList : row가 여러개
	 * */
	public static List<FoodVO> foodListData(int start){
		List<FoodVO> list = new ArrayList<>();
		SqlSession session = ssf.openSession();
		list = session.selectList("foodListData",start);
		session.close();
		return list;
	}
	
	public static int foodTotalPage() {
		int count = 0;
		SqlSession session = ssf.openSession();
		count = session.selectOne("foodTotalCount");
		session.close();
		return count;
	}
	
	public static FoodVO foodDetailData(int no) {
		FoodVO vo = new FoodVO();
		SqlSession session = ssf.openSession();
		vo = session.selectOne("foodDetailData", no);
		session.close();
		return vo;
	}
	
	public static List<FoodVO> foodFindData(Map map){
		SqlSession session = ssf.openSession();
		List<FoodVO> list = session.selectList("foodFindData", map);
		session.close();
		return list;
	}
	
	public static int foodFindTotalPage(Map map) {
		SqlSession session = ssf.openSession();
		int total = session.selectOne("foodFindTotalPage", map);
		session.close();
		return total;
	}
}
