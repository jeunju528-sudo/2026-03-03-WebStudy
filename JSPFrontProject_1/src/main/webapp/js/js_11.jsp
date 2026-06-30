<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let names=["홍길동","심청이"];
	console.log(names)
	names.push("을지문덕")
	console.log(names)
	let names2 = names.slice(2)
	console.log(names2.length)
	let names4 = [...names,"춘향이"]
	console.log(names4)
}
</script>
</head>
<body>

</body>
</html>