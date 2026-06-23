package com.sist.dao;

import lombok.Data;

/*
 * 이름     널?       유형           
------ -------- ------------ 
DEPTNO NOT NULL NUMBER       
DNAME           VARCHAR2(20) 
LOC             VARCHAR2(20) 
 * */
@Data
public class DeptVO {
	private int deptno;
	private String dname, loc;
}
