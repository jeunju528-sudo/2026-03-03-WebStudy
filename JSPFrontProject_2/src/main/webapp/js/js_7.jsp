<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let h1=document.getElementById("h1")
	let gBtn=document.getElementById("green")
	let bBtn=document.getElementById("blue")
	let rBtn=document.getElementById("red")
	
	gBtn.addEventListener('click',function(){
		h1.style.color="green"
	})
	bBtn.addEventListener('click',function(){
		h1.style.color="blue"
	})
	rBtn.addEventListener('click',function(){
		h1.style.color="red"
	})
}
</script>
</head>
<body>
<h1 id="h1">Hello</h1>
<button id="green">초록</button>
<button id="blue">파랑</button>
<button id="red">빨강</button>
</body>
</html>