package com.sist.model;

import java.util.HashMap;
import java.util.Map;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReplyDAO;
import com.sist.vo.ReplyVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ReplyModel {
	@RequestMapping("reply/insert.do")
	public String replyInsert(HttpServletRequest request, HttpServletResponse response) {
		String fno = request.getParameter("fno");
		String msg = request.getParameter("msg");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id"); //사용자 아이디
		String name = (String)session.getAttribute("name"); //사용자 이름
		
		ReplyVO vo = new ReplyVO();
		vo.setFno(Integer.parseInt(fno));
		vo.setMsg(msg);
		vo.setId(id);
		vo.setName(name);
		
		ReplyDAO.replyInsert(vo);
		
		return "redirect:../food/detail.do?no="+fno;
	}
	
	@RequestMapping("reply/update.do")
	public String replyUpdate(HttpServletRequest request, HttpServletResponse response) {
		String fno = request.getParameter("fno");
		String no = request.getParameter("no");
		String msg = request.getParameter("msg");
		
		Map map = new HashMap();
		map.put("no", no);
		map.put("msg", msg);
		
		ReplyDAO.replyUpdate(map);
		
		return "redirect:../food/detail.do?no="+fno;
		
	}
	
	@RequestMapping("reply/delete.do")
	public String replyDelete(HttpServletRequest request, HttpServletResponse response) {
		String fno = request.getParameter("fno");
		String no = request.getParameter("no");
			
		ReplyDAO.replyDelete(Integer.parseInt(no));
		
		return "redirect:../food/detail.do?no="+fno;
		
	}
}
