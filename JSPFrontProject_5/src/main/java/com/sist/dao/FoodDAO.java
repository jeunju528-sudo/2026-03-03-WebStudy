package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.FoodVO;

public class FoodDAO {
	
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	/*
	<select id="foodListData" resultType="FoodVO" parameterType="int">
		SELECT no, poster, name
		FROM food
		ORDER BY no ASC
		OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY 
	</select>
	*/
	public static List<FoodVO> foodListData(int start){
		List<FoodVO> list = new ArrayList<>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("foodListData",start);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	/*
	<select id="foodTotalPage" resultType="int">
		SELECT count(*)
		FROM food
	</select>
	*/
	public static int foodTotalPage() {
		int total=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("foodTotalPage");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return total;
	}
	/*
	<select id="foodDetailData" resultType="FoodVO" parameterType="int">
		SELECT NO, NAME, TYPE, PHONE, ADDRESS, SCORE, PARKING, POSTER, TIME, CONTENT, THEME, PRICE
		FROM food
		WHERE no = #{no}
	</select>
	*/
	public static FoodVO foodDetailData(int no) {
		FoodVO vo = new FoodVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("foodDetailData", no);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			session.close();
		}
		return vo;
	}

}
