<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<script>
	$(function(){
		$("#logoutBtn").click(function(e){
			e.preventDefault();
			$("form[name=logout]").submit();
		})
		
	});
	
	$(function(){
		$("#loginBtn").click(function(){
			$("#loginModal").modal("show");
		})
	})
</script>
<style>
@font-face {
	font-family: 'godic';
	src: url('${pageContext.request.contextPath}/font/godic.ttf') format('truetype');
}

body {
	font-family: 'godic', sans-serif;
}
</style>
</head>
<body>
	<!-- Navbar start -->
        <div class="container-fluid sticky-top px-0">
            <div class="container-fluid">
                <div class="container px-0">
                    <nav class="navbar navbar-light navbar-expand-xl" id="navBar">
                        <a href="${pageContext.request.contextPath}/page/main" class="navbar-brand">
                            <h4 class="text-primary display-6 fw-bold mb-0">형준닷컴</h4>
                        </a>
                        <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                            <span class="fa fa-bars text-primary"></span>
                        </button>
                        <div class="collapse navbar-collapse py-3" id="navbarCollapse">
                            <div class="navbar-nav mx-auto border-top">
                                <a href="${pageContext.request.contextPath}/page/main" class="nav-item nav-link" id="mainGo">메인으로</a>
                                <a href="${pageContext.request.contextPath}/page/project" class="nav-item nav-link" id="projectGo">프로젝트</a>
                                <a href="${pageContext.request.contextPath}/page/cs" class="nav-item nav-link" id="csGo">CS 공부</a>
                                <a href="${pageContext.request.contextPath}/page/coding" class="nav-item nav-link" id="codingGo">코딩 풀이</a>
                                <a href="${pageContext.request.contextPath}/page/study" class="nav-item nav-link" id="studyGo">정보처리기사</a>
                            </div>
                            <div class="d-flex align-items-center flex-nowrap pt-xl-0">
                            	<sec:authorize access="isAnonymous()">
                                	<button class="btn btn-primary btn-primary-outline-0 py-2 px-4 ms-4" id="loginBtn">로그인</button>
                            	</sec:authorize>
                            	<sec:authorize access="isAuthenticated()">
									<sec:authentication property="principal" var="pinfo" />
										<form action="${pageContext.request.contextPath}/page/logout" method="post" name="logout">
											<a class="logoutBtn" href="#" id="logoutBtn">
												<span id="loginid">${pinfo.username }</span>(로그아웃)
											</a>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										</form>
								</sec:authorize>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->
        <%-- 로그인 모달 시작 --%>
 			<div class="modal" id="loginModal">
 				<div class="modal-dialog">
 					<div class="modal-content">
 						<div class="modal-body">	<%-- 모달 바디 --%>
 							<form name="login" action="${pageContext.request.contextPath}/page/loginProcess" method="post">
 								<input type='text' class='dropdown-item' id='id' name='id' placeholder=" 아이디">
								<input type='text' class='dropdown-item' id='pw' name='pw' placeholder=" 비밀번호" style="margin-bottom: 10px;">
 								<button type="submit" class="btn btn-primary">확인</button>
 								<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
 								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 							</form>
 						</div>
 					</div>
 				</div>
 			</div>
 		<%-- 로그인 모달 끝 --%>
</body>
</html>