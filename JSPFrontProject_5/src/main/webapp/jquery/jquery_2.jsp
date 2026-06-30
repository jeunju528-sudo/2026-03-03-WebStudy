<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
li:hover{
	cursor:pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('img').hover(function(){
		$(this).css({
			'opacity':0.3,
			'cursor':'pointer',
			'border':'2px solid black'
		})
	},function(){
		$(this).css({
			'opacity':1.0,
			'cursor':'none',
			'border':'none'
		})
	})
	
	$('li').on('click',function(){
		let data = $(this).text()
		alert("선택된 과정 : " + data)
		$(this).text(data+"과정")
	})
	
	$('#readBtn').on('click',function(){
		let msg=$('#msg').val()
		let sel=$('#sel').val()
		let t = $('textarea').val()
		alert("text: " + msg + "\n select: "+sel+"\n textarea: "+t )
	})
	
	$('#writeBtn').on('click',function(){
		$('#msg').val("writeBtn : Hello Spring")
		$('#sel').val("Front-End")
		$('textarea').val("writeBtn : 안녕하세요")
	})
	
	$('#htmlBtn').on('click', function(){
		$('#html').html('<font color=red>Hello HTML</font>')
	})
})
</script>
</head>
<body>
	<h1>이미지 스타일 변경</h1>
	<img src="m1.jpg" style="width:150px; height:200px">
	<img src="m2.jpg" style="width:150px; height:200px">
	
	<h1>this 사용</h1>
	<ul>
		<li>자바 : JSP/JDBC/Spring/Spring-boot</li>
		<li>Oracle : 데이터 저장 공간(CRUD, JOIN, SubQuery, Index)</li>
		<li>HTML/CSS : 브라우저 화면 UI</li>
		<li>JavaScript : 동적페이지(client용)</li>
		<li>라이브러리 : Jquery3 / Jquery4 (Ajax 서버연동)</li>
		<li>MVC를 이용한 프로젝트(세미 프로젝트)</li>
		<li>SpringFramework:MVC라이브러리</li>
		<li>우분투 : 호스팅하는 방법 AWS이용 방법</li>
		<li>Spring-boot : JSP/ThymeLeaf</li>
		<li>CI/CD: Git Actions, Docker / Docker-compose</li>
		<li>CI/CD: Jenkins/쿠버네틱스</li>
		<li>최종 프로젝트 : Spring-boot + Thymeleaf:VueJS</li>
		<li>CI/CD: 무중단</li>
		<li>AWS에서 작업</li>
		<li>1. MySQL</li>
		<li>2. JPA</li>
		<li>3. NodeJS</li>
		<li>4. TypeScript</li>
		<li>5. React/Redux</li>
		<li>6. ThanStackQuery: 개인프로젝트</li>
	</ul>
	<p>
	<h1> val() </h1>
	<input type="button" value="읽기" id="readBtn">
	<input type="button" value="쓰기" id="writeBtn"> 
	<input type="button" value="HTML" id="htmlBtn"><br>
	<input type="text" id="msg" size=20 value="Hello javascript">
	<select id="sel">
		<option>Back-End</option>
		<option>Front-End</option>
		<option>Database</option>
	</select><br>
	<textarea rows="3" cols="20">Hello</textarea>
	<br>
	<span id="html"></span>
</body>
</html>