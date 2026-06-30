<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=()=>{
	/* let today = new Date()
	let year = today.getFullYear()
	let month = today.getMonth()+1
	let day = today.getDate()
	let week = today.getDay()
	
	let strWeek = ["일","월","화","수","목","금","토"]
	document.write("<h1>오늘은 "+year+"년 "+month+"월 "+day+"일 "+strWeek[week]+"요일</h1>")
	 */
	 
	let str="red,black,green,blue,yellow,pink";
	let colors=str.split(",")
	let html="<ul>"
	colors.forEach((color)=>{
		html+='<li>'+color+'</li>'
	})
	html += '</ul>'
	document.write(html)
}
</script>
</head>
<body>

</body>
</html>