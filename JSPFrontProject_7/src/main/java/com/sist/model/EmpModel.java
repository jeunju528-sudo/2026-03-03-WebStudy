package com.sist.model;

import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.EmpDAO;
import com.sist.vo.EmpVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class EmpModel {
	@RequestMapping("emp/if_where.do")
	public String emp_if(HttpServletResponse response, HttpServletRequest request) {
		EmpVO vo = new EmpVO();
		vo.setEname(null);
		vo.setDeptno(0);
		vo.setEmpno(7788);
		List<EmpVO> list = EmpDAO.empFindData(vo);
		request.setAttribute("list", list);
		return "../emp/if_where.jsp";
	}
}
