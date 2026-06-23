package com.sist.dao;

import java.util.Date;

import lombok.Data;

/*
 * 
 이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER       
ENAME    NOT NULL VARCHAR2(50) 
JOB      NOT NULL VARCHAR2(50) 
HIREDATE NOT NULL DATE         
SAL      NOT NULL NUMBER(10,2) 
DEPTNO   NOT NULL NUMBER    
 * */

@Data
public class EmpVO {
	private int empno, sal, deptno;
	private String ename, job, dbday, dbsal;
	private Date hiredate;
	private DeptVO dept;
}
