<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#login').on('click', function(){
		let id = $('#id').val()
		if(id.trim()=== ""){
			$('#id').focus()
			return
		}
		let pwd = $('#pwd').val()
		if(pwd.trim()=== ""){
			$('#pwd').focus()
			return
		}
		
		$.ajax({
			type:'post',
			url:'../member/login.do',
			data:{"id":id, "pwd":pwd},
			success:function(result){
				if(result.trim()==="NOID"){
					alert("아이디가 존재하지 않습니다.")
					$('#id').val("")
					$('#pwd').val("")
					$('#id').focus()
				}
				else if(result.trim()==="NOPWD"){
					alert("비밀번호가 틀립니다.")
					$('#pwd').val("")
					$('#pwd').focus()
				}
				else{
					location.href="../main/main.do"
				}
			
			}
			
		})
	})
	$('#logout').on('click', function(){
		$.ajax({
			type:'post',
			url:'../member/logout.do',
			success:function(result){
				if(result.trim()==="yes"){
					location.href="../main/main.do"
				}
			}
		})
	})
})
</script>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="../main/main.do">Ajax/동적쿼리</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="../main/main.do">HOME</a></li>
				<li><a href="../food/find.do">맛집검색</a></li>
				<li><a href="../food/movie.do">동영상검색</a></li>
				<li><a href="../board/list.do">커뮤니티</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row text-right">
			<c:if test="${sessionScope.id == null}">
				<!-- <form method="POST" action="../member/login.do"> -->
					<table class="table">
						<tr>
							<td>
							ID: <input type="text" id="id" size=15 class="input-sm">
							PW: <input type="password" id="pwd" size=15 class="input-sm">
							<button class="btn-sm btn-danger" id="login" type="button">로그인</button>
							</td>
						</tr>
					</table>
				<!-- </form> -->
			</c:if>
			<c:if test="${sessionScope.id != null }">
				<!-- <form method="POST" action="../member/logout.do"> -->
					<table class="table">
						<tr>
							<td>${sessionScope.name }님 로그인되었습니다.
								<button class="btn-sm btn-primary" id="logout">로그아웃</button>
							</td>
						</tr>
					</table>
				<!-- </form> -->
			</c:if>
		</div>
	</div>
</body>
</html>