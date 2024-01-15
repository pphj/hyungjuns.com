<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>형준닷컴</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/2432d5047b.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
@font-face {
	font-family: 'godic';
	src: url('${pageContext.request.contextPath}/font/godic.ttf') format('truetype');
}

body {
	display: flex;
	flex-direction: column;
	font-family: 'godic', sans-serif;
	font-size: 14px;
	line-height: normal;
	color: black;
}

carousel {
	display: inline;
	align-items: center;
	justify-content: end;
	width: 950px;
	margin: auto;
}
	
main {
	display: inline;
	align-items: center;
	justify-content: space-between;
	width: 950px;
	margin: auto;
}

#title {
	padding: 0px 10px;
	width: 100%;
	display: block;
	margin: 15px 0px;
}

#info {
	box-sizing: border-box;
	width: 100%;
	font-size: 1em;
	padding: 0px 10px;
	display: block;
	margin: 15px 0px;
}

div {
	box-sizing: border-box;
    padding: 0;
    margin: 0;
    font: inherit;
    vertical-align: baseline;
    border: 0;
}

p > strong > a {
  text-decoration : none;
  
}


</style>
</head>
<input type="hidden" name="id" id="id" value="${admin.id}" />
<body>
	<jsp:include page="../main/header.jsp"/>
	<main>
		<carousel>
			<div id="demo" class="carousel slide" data-bs-ride="carousel">			
			  <!-- 중앙 구분 버튼 -->
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
			    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			  </div>
			
			  <!-- 사진 -->
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			    	<img src="${pageContext.request.contextPath}/resources/image/gross.jpg" class="d-block w-100" style="height: 250px">
			    </div>
			    <div class="carousel-item">
			    	<img src="${pageContext.request.contextPath}/resources/image/sayles.jpg" class="d-block w-100" style="height: 250px">
			    </div>
			    <div class="carousel-item">
			    	<img src="${pageContext.request.contextPath}/resources/image/vinh.jpg" class="d-block w-100" style="height: 250px">
			    </div>
			  </div>
			
			  <!-- 좌우 버튼 -->
			  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </button>
			</div>
		</carousel>
	
		<section id="title">
			<h2><div>어서오세요! 형준 닷컴에 찾아와주셔서 감사합니다!</div></h2><br>
			<h5>백엔드 개발자를 지망하는 박형준입니다.<br><br>
				23.05 ~ 23.11 기간 동안 Java 기반 클라우드 활용 백엔드 개발자 교육과정을 이수하였습니다.<br>
				교육과정 중 1개월간 웹사이트 구축 4인 프로젝트를 진행하였고 학원내 투표로 1등을 했습니다.<br><br>
				현재는 학원을 다니며 부족하다고 느낀 컴퓨터 전공지식을 깊게 공부하기 위해 정보처리기사를 준비하고 있습니다.
			</h5>
		</section>
		<section id="info">
			<h2 style="text-align: center;"><div>약식 프로필</div></h2>
			<hr>
			<div>
				<h3><i class="fa-solid fa-user"></i>&nbsp;&nbsp;인적사항</h3>
				<p><strong>성명 : 박형준</strong><br>
				   <strong>이메일 : parkhj0209@naver.com</strong><br>
				   <strong>휴대폰 : 010-6789-7216</strong><br>
				</p>
			</div>
			<hr>
			<div>
				<h3><i class="fa-solid fa-paperclip"></i>&nbsp;&nbsp;개인채널</h3>
				<p><strong>ITDA 프로젝트 시연 영상 ->&nbsp;&nbsp;<a href="https://www.youtube.com/watch?v=awDHKsONkD0">보러가기</a></strong><br>
				   <strong>깃 : <a href="https://github.com/pphj/portfolio">https://github.com/pphj/portfolio</a></strong><br>
				</p>
			</div>
			<hr>
			<div>
				<h3><i class="fa-solid fa-flask"></i>&nbsp;&nbsp;기술스택</h3>
				<p><strong>Back-End : Java 11 <i class="fa-brands fa-java"></i> , Spring Boot , myBatis</strong><br>
				   <strong>Front-End :  javaScript <i class="fa-brands fa-js"></i>, aJax, jQuery, Bootstrap <i class="fa-brands fa-bootstrap"></i></strong><br>
				   <strong>DataBase : Oracle</strong><br>
				   <strong>etc : AWS <i class="fa-brands fa-aws"></i>, Jenkins <i class="fa-brands fa-jenkins"></i>, github <i class="fa-brands fa-github"></i></strong><br>
				</p>
			</div>
			<hr>
			<div>
				<h3><i class="fa-solid fa-pen"></i>&nbsp;&nbsp;교육내용</h3>
				<p><strong>기관명 : <a href="https://www.jhta.co.kr/main">중앙 HTA</a></strong><br>
				   <strong>교육명 : Java 기반 백엔드 & 클라우드 활용 개발자 양성과정</strong>&nbsp;&nbsp;&nbsp;&nbsp;<i style="color: #e712f3;">2023.05 ~ 2023.11</i><br>
				</p>
			</div>
			<hr>
			<div>
				<h3><i class="fa-solid fa-book"></i>&nbsp;&nbsp;자격증 및 어학</h3>
				<p><strong>전산회계 1급</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style="color: #e712f3;">2017.11 (22년 갱신)</i><br>
				   <strong>컴퓨터활용능력 2급</strong>&nbsp;&nbsp;&nbsp;<i style="color: #e712f3;">2018.11</i><br>
				   <strong>TOEIC 690</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i style="color: #e712f3;">2023.06</i><br>
				</p>
			</div>
			<hr>
		</section>
	</main>
</body>
</html>