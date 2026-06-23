package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpDAO {

	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";

	public EmpDAO()

	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr", "happy");
		} catch (Exception ex) {
		}
	}

	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close(); 
		} catch (Exception ex) {
		}
	}

	public List<EmpVO> empListData(int page) {
		List<EmpVO> list = new ArrayList<EmpVO>();
		try {
			getConnection();
			String sql = "SELECT empno, ename, job, to_char(hiredate,'YYYY-MM-DD') as hiredate, to_char(sal,'99,999') as sal, e.deptno, d.dname, d.loc "
					+ "FROM emp2 e join dept2 d on e.deptno = d.deptno "
					+ "ORDER BY empno DESC "
					+ "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, (page * 10) - 10);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				EmpVO vo = new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setDbsal(rs.getString(5));
				vo.setDeptno(rs.getInt(6));
				
				DeptVO dept = new DeptVO();
				dept.setDeptno(rs.getInt(6));
				dept.setDname(rs.getString(7));
				dept.setLoc(rs.getString(8));
				
				vo.setDept(dept);
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}

	public int empRowCount() {
		int count = 0;
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM emp2";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return count;
	}

}