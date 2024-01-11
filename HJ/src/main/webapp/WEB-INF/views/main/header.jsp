<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>형준닷컴</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<script>
	$(function(){
		$("#logoutBtn").click(function(e){
			e.preventDefault();
			$("form[name=logout]").submit();
		})
		
	});
</script>
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
	height: 50px;
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

#sub ul a {
	display: flex;
    padding: 10px;
    color: black;
    text-decoration: none;
}

#sub ul li {
	width: 100%;
    display: flex;
    flex-direction: row-reverse;
}

#sub ul li form {
	display: flex;
	align-items: center;
}

#sub ul li form input {
	width: 90%;
	height: 25px;
	font-size: 14px;
	border: 1px solid black;
	border-radius: 8px;
	background: #0000ff21;
}

#sub ul li form #pw {
	margin-left: 5px;
}

#sub ul li form .loginSubmit {
	height: 25px;
    font-size: .8em;
    color: var(--default-anchor-color);
    word-break: keep-all;
    background-color: #8080803d;
    border: 0;
    border-radius: 6px;
    margin-left: 5px;
}
</style>
</head>
<body>
	<header>
		<section id="sub">
			<ul>
				<sec:authorize access="isAnonymous()">
				<li>
					<div class='loginContainer'>
						<form action="${pageContext.request.contextPath}/.com/loginProcess" method="post" name="login">
							<input type='text' class='dropdown-item' id='id' name='id' placeholder="아이디">
							<input type='text' class='dropdown-item' id='pw' name='pw' placeholder="비밀번호">
							<button type="submit" class="loginSubmit">로그인</button>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
					</div>
				</li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="pinfo" />
						<form action="${pageContext.request.contextPath}/.com/logout" method="post" name="logout">
							<a class="logoutBtn" href="#" id="logoutBtn">
								<span id="loginid">${pinfo.username }</span>(로그아웃)
							</a>
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
				</sec:authorize>
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