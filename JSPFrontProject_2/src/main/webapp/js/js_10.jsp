<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
	margin-top: 50px;
}
.row{
	margin: 0px auto;
	width: 350px;
}
</style>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="music.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h3 class="text-centers">Music Top200</h3>
			<table class="table">
				<tr>
					<td><input type="text" size=20 class="input-em" id="keyword"></td>
				</tr>
			</table>
			<table class="table" id="user-table">
				<thead>
					<tr>
						<td>순위</td>
						<td></td>
						<td></td>
						<td>곡명</td>
						<td>가수명</td>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>