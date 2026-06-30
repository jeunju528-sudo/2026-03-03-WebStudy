<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	let h2=document.querySelector("h2")
	h2.style.color="blue"
	let h3=document.querySelector("h3")
	h3.style.color="green"
	/* 
	let h1=document.querySelectorAll("h1") //여러개 동시 선택 => 배열
	h1.forEach((h)=>{
		h.style.color="yellow"
	})
	h1[0].style.color="red"
	h1[1].style.color="red" */
	
	let colors=["pink","orange"]
	let h1=document.querySelectorAll("h1")
	for(let i=0; i<h1.length; i++){
		h1[i].style.color=colors[i]
	}
	
	let h4_1 = document.getElementById("h4")
	h4_1.style.background="red"
	let h4_2 = document.getElementsByClassName("h4")
	h4_2[0].style.background="blue"
	let h4_3 = document.getElementsByName("h4")
	h4_3[0].style.background="green"
	
	
	
}

</script>
</head>
<body>
<h1>Hello DOM!! -1 </h1>
<h2>Hello DOM!!</h2>
<h3>Hello DOM!!</h3>
<h1>Hello DOM!! -2 </h1>
<h4 id="h4" >Hello DOM!! - ID</h4>
<h4 class="h4" >Hello DOM!! - CLASS</h4>
<h4 class="h4" >Hello DOM!! - CLASS</h4>
</body>
</html>