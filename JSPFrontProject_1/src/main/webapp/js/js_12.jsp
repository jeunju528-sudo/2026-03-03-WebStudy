<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let sawons = [
	{sabun:1, name:"홍길동1", dept:"개발부", job:"대리", pay:3600, loc:"서울"},
	{sabun:2, name:"홍길동2", dept:"개발부", job:"대리", pay:3600, loc:"서울"},
	{sabun:3, name:"홍길동3", dept:"개발부", job:"대리", pay:3600, loc:"서울"},
	{sabun:4, name:"홍길동4", dept:"개발부", job:"대리", pay:3600, loc:"서울"},
	{sabun:5, name:"홍길동5", dept:"개발부", job:"대리", pay:3600, loc:"서울"}
];

const sawonList=()=>{
	document.write("<h3>사원 목록</h3>");
	document.write("<ul>");
	sawons.map((sa)=>{
		document.write("<li>"+sa.name+"</li>")
	})
	document.write("</ul>");
	
}

const sawonInsert=()=>{
	sawons.push({sabun:6, name:"홍길동6", dept:"개발부", job:"대리", pay:3600, loc:"서울"})
}

const sawonDetail=(sabun)=>{
	document.write("<h3>사원 상세</h3>")
	let sawon = sawons.find(sa=>sa.sabun===sabun)
	document.write("사번:"+sawon.sabun+"<p>");
	document.write("이름:"+sawon.name+"<p>");
	document.write("부서:"+sawon.dept+"<p>");
	document.write("직위:"+sawon.job+"<p>");
	document.write("연봉:"+sawon.pay+"<p>");
	document.write("근무지:"+sawon.loc+"<p>");
}
window.onload=function(){
	sawonList()
	//sawonInsert()
	//sawonList()
	sawonDetail(3)
}
</script>
</head>
<body>

</body>
</html>