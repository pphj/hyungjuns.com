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
body {
	display: flex;
	flex-direction: column;
	font-size: 14px;
	line-height: normal;
	color: black;
}
	
header {
	display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 100%;
	margin: auto;
}

#sub {
	position: relative;
	display: flex;
	align-items: center;
	justify-content: flex-end;
	width: 100%;
	border-bottom: 1px solid;
}

#sub > ul {
	display: flex;
	gap: 10px;
	align-items: center;
	justify-content: end;
	width: 950px;
	margin: auto;
}

#main {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 950px;
	padding: 0px;
	margin: 5px 0px 15px 0px;
}

#nav {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: green;
}

nav {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 950px;
}

nav > ul {
	display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: start;
    height: 35px;
}

nav > ul > li {
	position: relative;
    flex: 0 0 auto;
}

ul {
	list-style-type: none;
}

li a {
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

div {
	box-sizing: border-box;
    padding: 0;
    margin: 0;
    font: inherit;
    vertical-align: baseline;
    border: 0;
}
</style>
</head>
<body>
	<header>
		<section id="sub">
			<ul>
				<li>
					<a href="#">닉네임</a>
				</li>
				<li>
					<a href="#">로그아웃</a>
				</li>
			</ul>
		</section>
		<section id="main">
			<div class="logo">
				<a href="${pageContext.request.contextPath}/.com/main">
					<img alt="형준닷컴" src="${pageContext.request.contextPath}/resources/image/logo.png" style="width:400px;height: 80px;
					margin: 10px 0px 0px 0px;">
				</a>
			</div>
		</section>
		<section id="nav">
			<div class="navWrap">
				<nav>
					<ul>
						<li>
							<div class="menu">
								<a href="${pageContext.request.contextPath}/.com/project">프로젝트 보기</a>
							</div>
						</li>
						<li>
							<div class="menu">
								<a href="${pageContext.request.contextPath}/.com/cs">CS 공부</a>
							</div>
						</li>
						<li>
							<div class="menu">
								<a href="${pageContext.request.contextPath}/.com/coding">코딩 풀이</a>
							</div>
						</li>
						<li>
							<div class="menu">
								<a href="${pageContext.request.contextPath}/.com/study">정처기 공부일기</a>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</section>
	</header>
</body>
</html>