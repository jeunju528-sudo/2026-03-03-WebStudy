<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menu {
	list-style: none; /* li의 . 없앨 때 사용 */
	display: flex; /* 옆으로 정렬 */
	gap: 10px;
}
.item {
	padding: 10px 15px;
	cursor: pointer;
	background: #eee;
}
.item.active {
	background: #007bff;
	color: white;
	font-weight: bold;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0-rc.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.item').on('click', function(){
		$('.item').removeClass('active')
		$(this).addClass('active')
	})
	
})

</script>
</head>
<body>
	<ul class="menu">
	<!-- removeClass : 클래스명 지우는 것 removeClass('active') -->
	<!-- addClass : 클래스명 추가하는 것 -->
		<li class="item active">홈</li>
		<li class="item">회원</li>
		<li class="item">맛집</li>
		<li class="item">여행</li>
		<li class="item">레시피</li>
	</ul>
</body>
</html>