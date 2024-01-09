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
	background-color: #80808029;
	text-decoration: none;
}

#board > .item {
	display: flex;
	justify-content: space-between;
	padding: 5px 10px;
	border-bottom: 1px solid black;
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
    background-color: #8080803d;
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
    color: red;
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
    background-color: #00ffe54f;
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
    background-color: #03df0345;
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
    background-color: #03df0345;
    border: 0;
    border-radius: 8px;
}

.search > button {
	box-sizing: border-box;
    height: 40px;
    padding: 0 20px;
    margin: 0;
    font-size: 1em;
    color: var(--default-font-color);
    background-color: #03df0345;
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
    background-color: #03df0345;
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
			<h1><div>프로젝트 관련 게시물 리스트</div></h1><br>
			<c:if test="${listcount > 0}">
				<c:set var="num" value="${listcount-(page-1)*limit}" />
				<c:forEach var="F" items="${projectList}">
					<a class="item" href="${pageContext.request.contextPath}/.com/project/${F.boardNum}">
						<div class="info">
							<div class="titleContainer">
								<span class="category">${F.cateName }</span>
								<span class="title">
									<span class="text">${F.boardTitle }</span>
									<span class="commentCount">${F.replyCount}</span>
								</span>
							</div>
							<div class="etc">
								<div class="id">${F.id }</div>
								<div class="dot"><i class="fa-regular fa-circle" style="font-size: 5px;"></i></div>
								<div class="viewCount"><i class="fa-regular fa-eye"></i>&nbsp;${F.boardView }</div>
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
			 					<a class="pageNumber" href="project?page=${page-1}"><i class="fa fa-chevron-left" aria-hidden="true"></i>;</a>
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
			 						<a class="pageNumber" href="project?page=${a}">${a}</a>
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
			 					<a class="pageNumber" href="project?page=${page+1}"><i class="fa fa-chevron-right" aria-hidden="true"></i></a>
			 				</li>
			 			</c:if>
			 		</ul>
			 	</div>
			</c:if>
			<c:if test="${listcount == 0}">
				<h3 style="text-align: center">등록된 글이 없습니다.</h3>
			</c:if>
		</section>
		<div class="searchArea">
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
				<button type="button" id="projectWbtn" class="projectWbtn">글쓰기</button>
			</div>
		</div>
	</main>
</body>
</html>