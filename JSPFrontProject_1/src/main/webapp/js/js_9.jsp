<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	/*
	[] : object => 배열
	{} : object => 객체 => JSON
	*/
	let arr=[]
	console.log("arr="+typeof arr)
	let names=["홍길동","심청이","박문수","이순신","춘향이"]
	document.write("<h1>인덱스 사용</h1>")
	document.write("<ul>")
	document.write("<li>"+names[0]+"</li>")
	document.write("<li>"+names[1]+"</li>")
	document.write("<li>"+names[2]+"</li>")
	document.write("<li>"+names[3]+"</li>")
	document.write("<li>"+names[4]+"</li>")
	document.write("</ul>")
	
	document.write("<hr>")
	
	document.write("<ul>")
	for(let name of names){
		document.write("<li>"+name+"</li>")
	}
	document.write("</ul>")
	
	// foreach
	document.write("<hr>")
	
	document.write("<ul>")
	names.forEach(name=>{
		document.write("<li>"+name+"</li>")
	})
	document.write("</ul>")
	


}

</script>
</head>
<body>

</body>
</html>