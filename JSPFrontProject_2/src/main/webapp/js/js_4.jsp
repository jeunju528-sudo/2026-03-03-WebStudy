<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
		let a = document.getElementById("a")
		a.textContent="<font color=red>a:문자조작</font>"
		let b = document.querySelector("#b")
		b.innerHTML="<font color=red>b:문자조작</font>"
		
		let btn = document.querySelectorAll("button")
		btn[0].textContent = "취소"
}
</script>
</head>
<body>
	<button type="button">글자변경</button>
	<button type="button">HTML추가</button>
	<h1 id="a"></h1>
	<h1 id="b"></h1>
	<!-- 
	 자바스크립트 : id 중복되면 오류 발생
	 CSS : id 중복되어도 구동(적용)
	 id => 반드시 중복없게 만들어야함
	 -->
</body>
</html>