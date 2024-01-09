<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

#article {
	display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
    width: 950px;
    min-width: 950px;
}

#article > .sub {
	width: 100%;
	margin-top: 20px;
}

#article .back{
	display: flex;
}

#article .back a {
	padding: 15px 20px;
    font-weight: 700;
    border-radius: 12px;
    text-decoration: none;
}

a {
	text-decoration: none !important;
}

#article > .item {
	box-sizing: border-box;
    display: flex;
    flex-direction: column;
    gap: 10px;
    width: 100%;
    padding: 0 20px;
    border-radius: 12px;
}

#article > .item > .info {
	padding-bottom: 20px;
    border-bottom: 1px solid #80808040;
}

#article > .item > .info > .title {
	display: flex;
    align-items: center;
    margin-bottom: 10px;
}

#article > .item > .info .category {
	display: flex;
    margin-right: 10px;
    color: var(--default-anchor-color);
    word-break: keep-all;
    background-color: #8080803d;
    border-radius: 6px;
}

#article > .item > .info .category span {
	padding: 10px;
    white-space: nowrap;
}

span {
	box-sizing: border-box;
    padding: 0;
    margin: 0;
    font: inherit;
    vertical-align: baseline;
    border: 0;
}

#article>.item>.info h1 {
    display: inline;
    color: var(--default-font-color);
    word-break: break-word;
    box-sizing: border-box;
    width: 100%;
    padding: 15px 0;
}

#article >.item>.info > .etc {
    padding: 5px 0;
    color: var(--alpha-40);
}

#article > .item> .info .etc .left {
    display: flex;
    align-items: center;
    justify-content: flex-start;
}

#article > .item> .info .etc .name {
	position: relative;
    display: flex;
    align-items: center;
}

#article > .item> .info .etc .dot {
	position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 14px;
    height: 100%;
}

#article .customHtml {
	display: flex;
    align-items: center;
    justify-content: center;
}

#article > .item> .content {
    color: var(--default-font-color);
}

.content {
	width: 100%;
	word-break: break-word;
}

.html {
	padding: 0;
    border-radius: 8px;
}

#article > .item .listAndEdit {
	display: flex;
    justify-content: center;
    margin-bottom: 20px;
    font-size: .9em;
}

#article > .item .listAndEdit > div {
	display: flex;
    flex: 1;
    gap: 10px;
}

#article .button {
	display: flex;
    align-items: center;
    width: 100%;
    flex: 1;
}

#article > .item .listAndEdit .left .button {
	justify-content: start;
}

#article .button a {
	display: flex;
    align-items: center;
    justify-content: center;
    width: auto;
    height: 40px;
    padding: 0 20px;
    font-size: 1em;
    color: var(--default-anchor-color);
    background-color: #03df0345;
    border-radius: 8px;
}

#article .item .listAndEdit .center .button {
	justify-content: center;
}

#article .item .listAndEdit .right .button {
	justify-content: right;
}

.replyTitle {
	font-size: 1.2em;
    font-weight: 700;
    color: var(--default-font-color);
}

.reply {

}

.replyContainer {
	display: flex;
    flex: 1;
    flex-direction: column;
    gap: 10px;
    color: var(--default-font-color);
}

</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<main>
		<article id="article">
				<div class="sub">
					<div class="back">
						<a href="${pageContext.request.contextPath}/.com/study"><i class="fa-solid fa-arrow-left-long"></i> 뒤로</a>
					</div>
				</div>
				<div class="item">
					<div class="info">
						<div class="title">
							<div class="category">
								<span>${studyData.cateName }</span>
							</div>
							<span>
								<h2>${studyData.boardTitle }</h2>
							</span>
						</div>
						<div class="etc">
							<div class="left">
								<div class="name">${studyData.id }</div>
								<div class="dot"><i class="fa-regular fa-circle" style="font-size: 5px;"></i></div>
								<div class="name">
									<c:choose>
									    <c:when test="${not empty studyData.creDate}">
									        <c:set var="formattedDate">
									        	<fmt:formatDate value="${studyData.creDate}" pattern="yyyy.MM.dd" />
									        </c:set>
									        <div><c:out value="${formattedDate}" /></div>
									    </c:when>
									</c:choose>
								</div>
								<div class="dot"><i class="fa-regular fa-circle" style="font-size: 5px;"></i></div>
								<div class="viewCount"><i class="fa-regular fa-eye"></i>&nbsp;${studyData.boardView }</div>
							</div>
						</div>
					</div>
					<div class="customHtml"></div>
					<div class="content">${studyData.boardContent }</div>
					<div class="html"></div>
					<div class="customHtml"></div>
					<hr style="color: #808080;">
					<div class="listAndEdit">
						<div class="left">
							<div class="button">
								<a href="#">이전 글</a>
							</div>
						</div>
						<div class="center">
							<div class="button">
								<a href="${pageContext.request.contextPath}/.com/study">목록</a>
							</div>
						</div>
						<div class="right">
							<div class="button">
								<a href="#">다음 글</a>
							</div>
						</div>
					</div>
					<div class="replyTitle">댓글</div>
					<div class="reply" id="reply"></div>
					<div class="replyContainer"></div>
					<div class="listAndEdit">
						<div class="left">
							<div class="button">
								<a href="${pageContext.request.contextPath}/.com/study">목록</a>
							</div>
						</div>
						<div class="right"></div>
					</div>
					<br>
				</div>
		</article>
	</main>
</body>
</html>