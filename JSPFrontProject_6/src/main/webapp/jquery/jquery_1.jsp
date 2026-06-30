<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// let hide = document.querySelector('#hideBtn')
	// hide.addEventListener('click', function(){})
	$('#hideBtn').on('click',function(){
		$('#id').hide()
	})
	$('#showBtn').on('click',function(){
		$('#id').show()
	})
	$('#toggle').on('click',function(){
		$('#id').toggle()
	})
})
</script>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggle">Toggle</button>
	<div>
		<input type="text" id="id" size=20></input>
	</div>
</body>
</html>