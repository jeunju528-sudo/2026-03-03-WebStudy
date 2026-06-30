package com.sist.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.dao.MemberDAO;
import com.sist.vo.FoodVO;
import com.sist.vo.MemberVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if(page == null)
			page = "1";
		int curPage = Integer.parseInt(page);

		List<FoodVO> list = FoodDAO.foodListData((curPage*12)-12);
		int totalPage = FoodDAO.foodTotalPage();
		
		// 블록별 페이지
		final int BLOCK = 10;
		int startPage = ((curPage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curPage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage > totalPage){
			endPage = totalPage;
		}
		
		//출력에 필요한 데이터 보냄
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		request.setAttribute("main_jsp","../food/list.jsp");
		
		//Cookie 읽기
		Cookie[] cookies = request.getCookies();
		List<FoodVO> cList = new ArrayList<FoodVO>();
		int j=0;
		if(cookies != null) {
			for(int i=cookies.length-1;i>=0;i--) {
				if(cookies[i].getName().startsWith("food_")) {
					if(j>=9) break;
					String no = cookies[i].getValue();
					FoodVO vo = FoodDAO.foodDetailData(Integer.parseInt(no));
					cList.add(vo);
					j++;
				}
			}
		}
		
		request.setAttribute("cList", cList);
		request.setAttribute("size", cList.size());
		
		return "../main/main.jsp";
	}
	
	@RequestMapping("member/login.do")
	public void member_login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberVO vo = MemberDAO.memberLogin(id, pwd);
		if("OK".equals(vo.getMsg())) {
			HttpSession session = request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
		}
		
		try {
			response.setContentType("text/plain;charset=UTF-8"); // JSP로 값 전달
			PrintWriter out = response.getWriter();
			out.println(vo.getMsg());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("member/logout.do")
	public void member_logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate(); // 모든 메모리 해제
		try {
			response.setContentType("text/plain;charset=UTF-8"); // JSP로 값 전달
			PrintWriter out = response.getWriter();
			out.println("yes");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
