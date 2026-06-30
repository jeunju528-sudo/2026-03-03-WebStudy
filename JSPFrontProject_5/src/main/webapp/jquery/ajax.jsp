<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let httpRequest=null
function getXMLHttpRequest(){
	if(window.XMLHttpRequest){
		return new XMLHttpRequest() // 브라우저에서 내장 객체 가지고옴
	}
	else{
		return null
	}
}
//서버에 전송 => $.ajax({method:...})
function sendRequest(url, params, callback, method){
	// 1. 객체 생성
	httpRequest = getXMLHttpRequest()
	// 2. method방식 지정
	let httpMethod = method?method:'GET' //method가 null 이면 기본으로 GET방식을 사용함
	if(httpMethod!='GET' && httpMethod!='POST'){
		httpMethod='GET'
	}
	// 3. params 처리 => ?id=admin
	let httpParams=(params===null || params==="")?null:params
	// 4. url변경
	let httpUrl = url
	// 4-1. GET방식
	if(httpMethod === 'GET' && httpParams != null){
		httpUrl = httpUrl + "?" + httpParams
	}
	// 4-2. POST방식
	
	// 5. 서버 연결
	httpRequest.open(httpMethod,httpUrl, true)
	
	// 6. 데이터 전송, 한글처리 필요
	httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
	
	// 7. 결과값을 읽어오는 함수를 지정 => 자동 호출 => callback
	httpRequest.onreadystatechange=callback
	
	// 8. 데이터 전송
	httpRequest.send(httpMethod==='POST'?httpParams:null)
	
	// 9. 값을 읽은 경우 : 
	
}

function send(){
	sendRequest('sub.jsp',null,ok,'POST')
	
}
function ok(){
	
	/*
	readyState
	0 = 서버 연결 준비
	1 = 서버연결 => open()
	2 = 서버 연결 완료
	3 = 데이터 전송 준비 => send()
	4 = 데이터 전송 완료
	
	status
	200 = 서버에서 정상 수행
	404 / 405 / 500 = 에러..
	*/
	if(httpRequest.readyState===4){
		if(httpRequest.status===200){
			let div = document.querySelector('#print')
			div.innerHTML=httpRequest.responseText
		}
	}
}

</script>
</head>
<body>
	<button onclick="send()">전송</button>
	<div id="print">
	</div>
</body>
</html>