<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ // = $(document).ready(function(){})
	$('#btn1').on('click',function(){
		let len = $('input[type=checkbox]:checked').length;
		alert("선택된 취미는 "+len+"개 입니다")
	})
	$('#btn2').on('click',function(){
		$('input[type=checkbox]').prop('checked',true)
	})
	$('#btn3').on('click',function(){
		$('input[type=checkbox]').prop('checked',false) //prop 속성
	})
})
</script>
</head>
<body>
<button id="btn1">확인</button>
<button id="btn2">전체</button>
<button id="btn3">해제</button>
<p>
<input type="checkbox" checked>낚시
<input type="checkbox" checked>운동
<input type="checkbox" checked>쇼핑
<input type="checkbox" checked>등산
<input type="checkbox" checked>게임
</body>
</html>