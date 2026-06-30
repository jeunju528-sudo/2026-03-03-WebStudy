<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 바닐라JS : 순수하게 javascript만 가지고 만드는 것 -->
<script type="text/javascript">
	let sawon = {
		name : "홍길동",
		getName : function() {
			//document.write("이름:" + this.name)
			let h1=document.querySelector("h1")
			h1.style.color="red"
			h1.style.background="yellow"
			h1.textContent=this.name
			/* h1.innerHTML=this.name */
		},
		setName : function(name) {
			this.name = name
		}
	}
	
	window.onload=()=>{
		sawon.setName("심청이")
		sawon.getName()
	}
</script>
</head>
<body>
<h1></h1>
</body>
</html>