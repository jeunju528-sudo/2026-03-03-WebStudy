<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">

	let movie=[]
	window.onload=function(){
		movieList(1)
	}
	function movieList(no) {
		// AXIOS : 서버가 JSON 데이터를 반환하면 자바스크립트가 읽을 수 있는 객체(Object) 형태로 자동 변환하여 response.data에 넣어줌
		axios.get('movie_list.do', {
			params : {
				no : no
			}
		}).then(response=>{
			movie=response.data
			console.log(movie)
			//tbody로 전송할 데이터 생성
			let html='';
			movie.forEach((m)=>{
				html+='<tr onmouseover="movieDetail('+m.rank+')">'
				+'<td class="text-center">'+m.rank+'</td>'
				+'<td class="text-center"><img src="https://www.kobis.or.kr'+m.thumbUrl+'"></td>'
				+'<td >'+m.movieNm+'</td>'
				+'<td >'+m.director+'</td>'
				+'<td >'+m.genre+'</td>'
				+'</tr>'
			})
			
			document.querySelector("#list tbody").innerHTML = html;
		})
	}
	//const movieDetail=function(mno){} 익명함수
	//const movieDetail=(mno)=>{}
	function movieDetail(mno) {
		let table=document.querySelector("#detail")
		table.style.display=''
		let m = movie.find(m=>m.rank===mno)
		console.log(m)
		let img = document.querySelector("#poster")
		img.src="https://www.kobis.or.kr"+m.thumbUrl
		
		let name = document.querySelector("#name")
		name.textContent = m.movieNm
		let director = document.querySelector("#director")
		director.textContent = m.director
		let genre = document.querySelector("#genre")
		genre.textContent = m.genre
		let grade = document.querySelector("#grade")
		grade.textContent = m.watchGradeNm
		let story = document.querySelector("#story")
		story.textContent = m.synop
		
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row text-center">
			<button class="btn-lg btn-warning" onclieck="movieList(1)">박스오피스</button>
			<button class="btn-lg btn-info" onclick="movieList(2)">실시간예매율</button>
			<button class="btn-lg btn-success" onclick="movieList(3)">좌석점유율</button>
		</div>
		<div class="row" style="margin-top: 20px">
			<div class="col-sm-8">
				<table class="table" id="list">
					<thead>
						<tr class="success">
							<th class="text-center">순위</th>
							<th class="text-center"></th>
							<th class="text-center">영화명</th>
							<th class="text-center">감독</th>
							<th class="text-center">장르</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
			<div class="col-sm-4">
				<table class="table" id="detail" style="display: none;">
					<tbody>
						<tr>
							<td colspan="2" class="text-center"><img src=""
								style="width: 360px; height: 250px; object-fit: cover"
								id="poster"></td>
						</tr>
						<tr>
							<td width=25%>영화명</td>
							<td width=75% id="name"></td>
						</tr>
						<tr>
							<td width=25%>감독</td>
							<td width=75% id="director"></td>
						</tr>
						<tr>
							<td width=25%>장르</td>
							<td width=75% id="genre"></td>
						</tr>
						<tr>
							<td width=25%>등급</td>
							<td width=75% id="grade"></td>
						</tr>
						<tr>
							<td colspan="2" id="story"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>