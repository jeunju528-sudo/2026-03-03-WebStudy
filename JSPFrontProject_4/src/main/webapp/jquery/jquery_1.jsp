<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> <!-- jquery 3버전  -->
<%-- <script type="text/javascript" src="http://code.jquery.com/jquery-4.0.0.min.js"></script> --%>
<script type="text/javascript">
/* $(document).ready(){
	
}
 */
$(function(){
    $('#h1').css("color", "yellow");
    $('.h1').css("backgroundColor", "aqua");
    $('#h2').css("color", "blue");
    $('h2:eq(0)').css("color", "magenta").css("backgroundColor", "black");
    $('h2:eq(1)').css({
        "color": "pink",
        "backgroundColor": "blue"
    });
    $('h2:eq(2)').css("color", "green");
    $('h2:eq(3)').css("color", "gray");
    $('h2:eq(4)').css("color", "cyan");
	
	$('img').css({
		"width":"120px",
		"height":"180px"
	})
	
	
	$('img').hover(function(){
		$(this).css({
			"cursor":"pointer",
			"border":"3px solid green"
		})
	})
	
})
</script>
 </head>
<body>
<h1 id="h1">hello java</h1>
<h1 class="h1">hello java</h1>
<h1 class="h1">hello java</h1>
<h1 id="h2">hello java</h1>
<h1 id="h3">hello java</h1>
<h2>hello java</h2>
<h2>hello java</h2>
<h2>hello java</h2>
<h2>hello java</h2>
<h2>hello java</h2>
<img src="https://img.megabox.co.kr/SharedImg/2026/05/13/zlk6dycnwuPdVuSH40RVickv2CYYCrcU_420.jpg">
<img src="https://img.megabox.co.kr/SharedImg/2026/05/19/Xya2c40b4Yck7jNWa2l0NWUpIuoZkPAV_420.jpg">
<img src="https://img.megabox.co.kr/SharedImg/2026/05/21/ysq28y1C9Y3yJdnIIwb3kacb7Sx6omLV_420.jpg">
<img src="https://img.megabox.co.kr/SharedImg/2026/06/09/KohW1eBmK8OyASrtmtTWAK51aqk448re_420.jpg">
</body>
</html>