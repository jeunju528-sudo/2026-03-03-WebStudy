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
.container {
	margin-top: 50px;
}

.row {
	margin: 0px auto;
	width: 600px;
}
h1{
	text-align: center;
}
#chatArea{
	width:300px;
	height:300px;
	overflow-y:auto;
	border: 1px solid black;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery4.0.0.min.js"></script> 
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>  -->
<script type="text/javascript">
$(function(){
	$('#sendMsg').on('keydown',function(key){
		if(key.keyCode===13){ //enter
			let msg = $(this).val()
			if(msg.trim()===''){
				$(this).focus()
				return
			}
			$('#recvMsg').append(msg+"<br>")
			$(this).val("")
			$(this).focus()
			
			let ch=$('#chatArea').height()
			let m=$('#recvMsg').height()-ch
			$('#chatArea').scrollTop(m)
		}
	})
})
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1>채팅</h1>
			<table class="table">
				<tr>
					<td>
						<div id="chatArea">
							<div id="recvMsg"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" size=35 id="sendMsg">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>