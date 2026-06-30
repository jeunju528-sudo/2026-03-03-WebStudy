<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chocolate Theme</title>
<link rel="stylesheet" type="text/css" href="../style/style_sheet.css" media="screen">
</head>
<body>

	<div id="wrapper">
		<!--####  wrapper  ###-->

		<div id="top_strip"></div>
		<!--top strip end-->


		<%-- header --%>
		<jsp:include page="header.jsp"></jsp:include>
		<%-- 화면 --%>
		<jsp:include page="home.jsp"></jsp:include>
		<%-- footer --%>
		<jsp:include page="footer.jsp"></jsp:include>


		<div class="clr"></div>
	</div>
	<!--####  wrapper  ###-->

</body>
</html>
