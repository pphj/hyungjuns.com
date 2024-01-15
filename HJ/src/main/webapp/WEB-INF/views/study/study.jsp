<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<script>
	$(document).ready(function(){
		$('.projectWbtn').click(function () {
			location.href = "${pageContext.request.contextPath}/.com/write";
		});
	})
</script>
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
	
main {
	display: inline;
	align-items: center;
	justify-content: space-between;
	width: 950px;
	margin: auto;
}

#board {
	box-sizing: border-box;
	width: 100%;
	font-size: 1em;
	padding: 0px 10px;
}

#board > a {
	background-color: #E1FFFA;
	text-decoration: none;
}

#board > .item {
	display: flex;
	justify-content: space-between;
	padding: 5px 10px;
	border-bottom: 1px solid black;
	height: 50px;
    font-size: 16px;
}

.info {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	flex: 1;
	gap: 3px;
	width: 80%;
}

.titleContainer {
	display: flex;
	align-items: center;
	padding: 2px 0px;
	overflow: hidden;
}

.category {
	box-sizing: border-box;
    padding: 4px 6px;
    margin-right: 8px;
    font-size: .9em;
    color: black;
    word-break: keep-all;
    white-space: nowrap;
    background-color: #A9CEC2;
    border: solid 1px;
    border-radius: 6px;
}

.title {
	display: flex;
	align-items: center;
	overflow: hidden;
	color: black;
}

.text {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.commentCount {
	display: flex;
    align-items: center;
    justify-content: center;
    height: 16px;
    margin-left: 5px;
    font-size: .9em;
    font-weight: 700;
    color: #d500ffba;
    text-align: center;
    border-radius: 3px;
}

.etc {
	display: flex;
    align-items: center;
    justify-content: start;
    padding: 2px 0;
    font-size: .8em;
    color: black;
    white-space: nowrap;
}

.dot {
	position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 14px;
    height: 100%;
}

.pagination {
    margin: 32px 0;
}

.prev {
	box-sizing: border-box;
    width: 30px;
    height: 30px;
    margin: 0 5px;
}

.number {
	display: flex;
    align-items: center;
    justify-content: center;
}

.pageNumber {
	box-sizing: border-box;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 30px;
    height: 30px;
    margin: 0 5px;
    border-right: 0;
    border-radius: 4px;
    color: #E1FFFA;
    background-color: #ACA9BB;
}

.next {
	box-sizing: border-box;
    width: 30px;
    height: 30px;
    margin: 0 5px;
}

.searchArea {
	display: flex;
    justify-content: space-between;
    width: 100%;
    margin: 30px 0;
	padding: 0 10px;
}

.searchArea > div {
	display: flex;
    flex: 1;
    align-items: center;
    justify-content: center;
}

.searchArea > form {
	display: flex;
    flex: 1;
    align-items: center;
    justify-content: center;
    width: 440px;
    height: 40px;
}

.search {
	display: flex;
    flex: 1;
}

.search > select {
	box-sizing: border-box;
    height: 40px;
    padding: 0 20px;
    font-size: 1em;
    color: var(--default-anchor-color);
    cursor: pointer;
    background-color: #ACA9BB;
    border: 0;
    border-radius: 8px;
    appearance: none;
}

.search > input {
	box-sizing: border-box;
    flex: 1;
    height: 40px;
    padding: 0 16px;
    margin: 0 14px;
    font-size: 1em;
    background-color: #ACA9BB;
    border: 0;
    border-radius: 8px;
	width: 190px;
}

.search > button {
	box-sizing: border-box;
    height: 40px;
    padding: 0 20px;
    margin: 0;
    font-size: 1em;
    color: var(--default-font-color);
    background-color: #ACA9BB;
    border: 0;
    border-radius: 8px;
}

.write {
	display: flex;
    justify-content: flex-end;
}

.projectWbtn {
	display: flex;
    align-items: center;
    justify-content: center;
    height: 40px;
    padding: 0 20px;
    font-size: 1em;
    background-color: #ACA9BB;
    border-radius: 8px;
    text-decoration: none;
    border: none;
}

</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<main>
		<br>
		<br>
		<br>
		<section id="board">
			<h1><div>정보처리기사 관련 게시물 리스트</div></h1><br>
			<c:if test="${listcount > 0}">
				<c:set var="num" value="${listcount-(page-1)*limit}" />
				<c:forEach var="F" items="${studyList}">
					<a class="item" href="${pageContext.request.contextPath}/.com/study/${F.boardNum}">
						<div class="info">
							<div class="titleContainer">
								<span class="category">${F.cateName }</span>
								<span class="title">
									<c:if test="${F.boardTitle.length() >= 25}">
										<span class="text">${F.boardTitle.substring(0,25)}...</span>
									</c:if>
									<c:if test="${F.boardTitle.length() < 25}">
										<span class="text">${F.boardTitle}</span>
									</c:if>
									<span class="commentCount">${F.replyCount}</span>
								</span>
							</div>
							<div class="etc">
								<div class="id">${F.id }</div>
								<div class="dot"><i class="fa-regular fa-circle" style="font-size: 5px;"></i></div>
								<div class="viewCount"><i class="fa-regular fa-eye"></i>&nbsp;${F.boardView }</div>
								<div class="dot"><i class="fa-regular fa-circle" style="font-size: 5px;"></i></div>
								<c:choose>   
								    <c:when test="${not empty F.modiDate}">
										<fmt:formatDate value="${F.modiDate}" pattern="yyyy-MM-dd" var="formattedDate" />
									    <div class="boardDate"><c:out value="${formattedDate}" /></div>
									</c:when>
									<c:otherwise>
										<fmt:formatDate value="${F.creDate}" pattern="yyyy-MM-dd" var="formattedDate" />
										<div class="boardDate"><c:out value="${formattedDate}" /></div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</a>
				</c:forEach>
				
				<div class="center-block">
			 		<ul class="pagination justify-content-center">
			 			<c:if test="${page <= 1}">
			 				<li class="prev">
			 					<a class="pageNumber gray"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
			 				</li>
			 			</c:if>
			 			<c:if test="${page > 1}">
			 				<li class="prev">
			 					<a class="pageNumber" href="study?page=${page-1}"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
			 				</li>
			 			</c:if>
			 			
			 			<c:forEach var="a" begin="${startpage}" end="${endpage}">
			 				<c:if test="${a == page}">
			 					<li class="number active">
			 						<a class="pageNumber">${a}</a>
			 					</li>
			 				</c:if>
			 				<c:if test="${a != page}">
			 					<li class="number">
			 						<a class="pageNumber" href="study?page=${a}">${a}</a>
			 					</li>
			 				</c:if>
			 			</c:forEach>
			 			
			 			
			 			<c:if test="${page >= maxpage}">
			 				<li class="next">
			 					<a class="pageNumber gray"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
			 				</li>
			 			</c:if>
			 			<c:if test="${page < maxpage}">
			 				<li class="next">
			 					<a class="pageNumber" href="study?page=${page+1}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
			 				</li>
			 			</c:if>
			 		</ul>
			 	</div>
			</c:if>
			<c:if test="${listcount == 0}">
				<h3 style="text-align: center">등록된 글이 없습니다.</h3>
			</c:if>
		</section>
		<div class="write">
			<sec:authorize access="isAuthenticated()">
			<button type="button" id="projectWbtn" class="projectWbtn">글쓰기</button>
			</sec:authorize>
		</div>
		<br>
		<br>
		<br>
		<!-- <div class="searchArea">
			<div></div>
			<div>
				<form action="project" method="post" id="project_Form">
					<div class="search">
						<select id="viewcount2" name="search_field">
							<option value="0" selected>제목</option>
							<option value="1">날짜</option>
						</select>
						<input name="search_word" type="text" class="form-control"
						 placeholder="검색어를 입력하세요" value="${search_word}">
						<button class="btn btn-primary btn-sm" type="submit"
						 id="search_but"><i class="fa fa-search" aria-hidden="true"></i></button>
					</div>
				</form>
			</div>
			<div class="write">
				<sec:authorize access="isAuthenticated()">
				<button type="button" id="projectWbtn" class="projectWbtn">글쓰기</button>
				</sec:authorize>
			</div>
		</div>
		-->
	</main>
</body>
</html>