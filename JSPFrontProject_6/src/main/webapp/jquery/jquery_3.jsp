<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.content {
	display: none;
	border: 1px solid #ddd;
}

.content.active{
	display: block; /* 화면에 보여주기 */
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.menu li').on('click',function(){
		$('menu li').removeClass('active')
		$(this).addClass('active')
		
		$('.content').removeClass('active')
		
		const tab = $(this).data("tab")
		$('#tab'+tab).addClass('active')
	})
})
	
</script>
<body>
	<ul class="menu">
		 <!-- data-tab="1" 는 제공하는 속성이 아니고 사용자가 정의해서 사용하는 속성이다. 속성은 사용자 정의가 가능함
		      data- 가 붙으면 사용자 정의 속성임 -->
		<li class="active" data-tab="1">홈</li> 
		<li data-tab="2">회원</li>
		<li data-tab="3">묻고답하기</li>
	</ul>
	<div id="tab1" class="content active">
		HOME
	</div>
	<div id="tab2" class="content">
		MEMBER
	</div>
	<div id="tab3" class="content">
		Q&A
	</div>
</body>
</html>