package com.sist.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.dao.ReplyDAO;
import com.sist.vo.FoodVO;
import com.sist.vo.ReplyVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FoodModel {
	@RequestMapping("food/detail.do")
	public String foodDetail(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		FoodVO vo = FoodDAO.foodDetailData(Integer.parseInt(no));
		request.setAttribute("vo", vo);

		List<ReplyVO> list = ReplyDAO.replyListData(Integer.parseInt(no));
		request.setAttribute("rList", list);
		request.setAttribute("rcount", list.size());
		
		request.setAttribute("main_jsp", "../food/detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("food/detail_before.do")
	public String food_detail_before(HttpServletRequest request, HttpServletResponse response) {
		
		String no = request.getParameter("no");
		Cookie cookie = new Cookie("food_"+no,no);
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		response.addCookie(cookie);
		return "redirect:../food/detail.do?no="+no;
	}
	
	@RequestMapping("food/find.do")
	public String foodFind(HttpServletRequest request, HttpServletResponse response) {
		
	    request.setAttribute("main_jsp", "../food/find.jsp");
	    return "../main/main.jsp";
		
	}
	@RequestMapping("food/find_ajax.do")
	public void foodFindAjax(HttpServletRequest request, HttpServletResponse response) {
		String fd = request.getParameter("fd");
		if(fd == null) {
			fd = "마포";
		}

		String column = request.getParameter("col");
		if(column == null) {
			column = "address";
		}
		
		String page = request.getParameter("page");
		if(page == null) {
			page = "1";
		}
		
		int curPage = Integer.parseInt(page);
		
		Map map = new HashMap();
		map.put("column", column);
		map.put("fd", fd);
		map.put("start", (curPage*12)-12);
				
		List<FoodVO> list = FoodDAO.foodFindData(map);
		int totalpage = FoodDAO.foodFindTotalPage(map);
		
		// 블록별 페이지
		final int BLOCK = 10;
		int startPage = ((curPage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curPage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage > totalpage){
			endPage = totalpage;
		}
		if(totalpage == 0) { // 방어 코드 추가
	        endPage = 1;
	    }
		
		try {
			// List > JSONArray
			JSONArray arr = new JSONArray(); // [{},{},..]
			int j = 0;
			// VO > JSONObject
			for(FoodVO vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("no", vo.getNo());
				obj.put("name", vo.getName());
				obj.put("poster", vo.getPoster());
				obj.put("address", vo.getAddress());
				if(j==0) {
					obj.put("curPage", curPage);
					obj.put("totalpage", totalpage);
					obj.put("startPage", startPage);
					obj.put("endPage", endPage);
				}
				arr.add(obj);
				j++;
			}
			
			// arr에 있는 데이터를 Ajax(Javascript> 방식으로 보내야함 => Restful 
			System.out.println(arr.toJSONString());
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(arr.toJSONString());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("food/movie.do")
	public String food_movie(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../food/movie.jsp");
		return "../main/main.jsp";
	}
}
