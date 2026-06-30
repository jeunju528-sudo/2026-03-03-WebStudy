<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 선언적 함수
function plus(a,b){
	return a+b
}
// 익명의 함수
let plus2 = function(a,b){
	return a+b
}
// 화살표 함수
let plus3=(a,b)=>{return a+b}
let plus4=(a,b)=>a+b

window.onload=()=>{
	let a=10
	let b=20
	
	let c=plus(a,b)
	let d=plus2(a,b)
	let e=plus3(a,b)
	let f=plus4(a,b)
	
	document.write("c="+c+", type="typeof plus+"<br>")
	document.write("c="+d+", type="typeof plus2+"<br>")
	document.write("c="+e+", type="typeof plus3+"<br>")
	document.write("c="+f+", type="typeof plus4+"<br>")
	
	
}

</script>
</head>
<body>

</body>
</html>