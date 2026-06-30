<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.box {
	border: 2px solid black;
	padding: 15px;
	margin-top: 20px;
}
.item{
	color: blue;
	font-weight: bold;
}

.high{
	background-color: orange;
	padding: 5px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let count=1
$(function(){
	$('#appendBox').on('click',function(){
		let newItem = $('<li class="item"> New Item '+count+'</li>')
		$('#list').append(newItem)
		count++
	})
	$('#prependBtn').on('click',function(){
		let newItem = $('<li class="item"> New Item '+count+'</li>')
		$('#list').prepend(newItem)
		count++
	})
	$('#afterBox').on('click',function(){
		let newText=$('<p style="color:red">외부에 추가</p>')
		$('#targetBox').after(newText)
	})
})
</script>
</head>
<body>
	<h3> 동적 객체(태그) 생성</h3>
	<button id="appendBox">뒤에 추가</button>
	<button id="prependBtn">앞에 추가</button>
	<button id="afterBox">박스 다음에 추가</button>
	<div class="box" id="targetBox">
		<p class="high">박스 영역</p>
		<ul id="list">
			<li>기존 아이템</li>
		</ul>
	</div>
</body>
</html>