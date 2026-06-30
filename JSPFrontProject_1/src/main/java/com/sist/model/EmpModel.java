package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.EmpDAO;
import com.sist.dao.EmpVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 브라우저로 값 전송
@Controller
public class EmpModel {
	@RequestMapping("js/js_8.do")
	public void empListData(HttpServletRequest request, HttpServletResponse response) {
		List<EmpVO> list = EmpDAO.empListData();
		JSONArray arr = new JSONArray(); // List => [{}, {}, {}, ... ] 배열 생성
		
		for(EmpVO vo : list) {
			JSONObject obj = new JSONObject(); // 객체 생성
			obj.put("empno", vo.getEmpno());
			obj.put("ename", vo.getEname());
			obj.put("job", vo.getJob());
			obj.put("dbday", vo.getDbday());
			obj.put("dname", vo.getDvo().getDname());
			obj.put("loc", vo.getDvo().getLoc());
			
			arr.add(obj);
		}
		
		 try {
			response.setContentType("text/plain;charset=UTF-8"); // JSP로 값 전달
			PrintWriter out = response.getWriter();
			out.write(arr.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		System.out.println(arr.toJSONString());
		
	}
}
