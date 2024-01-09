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
<script src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
<script>
	var result = "${result}";
	if (result == 'passFail') {
		alert("닉네임과 비밀번호를 확인하세요");
	}
</script>
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

.replyContainer {
	display: flex;
    flex: 1;
    flex-direction: column;
    gap: 10px;
    color: var(--default-font-color);
}

.replyContainer .replyContainer {
	display: flex;
    flex-direction: column;
    margin-top: 3px;
    background-color: #0d0b0b21;
    border-radius: 8px;
}

.replyContainer .replyInput {
    display: flex;
    flex-direction: row;
}

.replyContainer .replyContent {
    flex: .9;
}

.replyContainer textarea {
	flex: 1;
    width: 100%;
    height: 60px;
    font-size: 1em;
    color: var(--default-font-color);
    resize: none;
    background-color: transparent;
    border: 0;
    margin: 10px;
}

.replyInput .attached {
	display: flex;
    flex-direction: row;
    gap: 0;
}

.replyContainer .submit {
	display: flex;
    flex: .1;
    align-items: start;
    justify-content: center;
    margin: 10px;
    font-size: 1em;
    font-weight: 700;
    border: 0;
    border-radius: 15px;
}

.replyContainer .submit button {
	height: 60px;
	box-sizing: border-box;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 70%;
    padding: 10px;
    font-size: 1em;
    color: var(--default-anchor-color);
    background-color: #80808054;
    border: 0;
    border-radius: 8px
}

.replyAttaches {
	display: flex;
    flex-direction: column;
}

.replyAttaches .attaches {
	display: flex;
    justify-content: start;
    margin: 0px 10px 0px 10px;
}

.replyAttaches .attaches input {
	width: 145px;
}

.replyAttaches .attaches .writer {
	width: 170px;
    height: 30px;
    margin: 0 0 0 5px;
    font-size: .8em;
}

.replyAttaches .attaches .pass {
	width: 170px;
    height: 30px;
    margin: 0 0 0 5px;
    font-size: .8em;
}

.replyAttaches .attaches .wordCount {
	width: 150px;
    height: 30px;
    margin: 0 0 0 325px;
    font-size: .8em;
}


.reply {
	display: flex;
    flex: 1;
    flex-direction: column;
    gap: 3px;
}

.reply .main {
	display: flex;
    padding: 10px;
    border-bottom: 1px solid #20202d1a;
}

.reply .replyWrapper {
	width: 100%;
}

.reply .info {
	display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 5px;
    font-size: .9em;
    white-space: nowrap;
}

.reply .info .left {
	display: flex;
    gap: 5px;
    align-items: center;
    justify-content: center;
}

.reply .nickName {
	position: relative;
    display: flex;
    flex-flow: wrap;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    color: var(--default-font-color);
    white-space: nowrap;
}

.reply .nickName .text {
	display: flex;
    flex-flow: wrap;
    gap: 3px;
    align-items: center;
    justify-content: start;
}

.reply .time {
	display: flex;
    align-items: center;
    justify-content: center;
    margin-left: 10px;
}

.reply .info .right {
	position: relative;
    cursor: pointer;
}

.reply .main .right {
	flex-direction: row;
    display: flex;
    align-items: center;
}

.reply .info .right .replyRe {
	margin-right: 3px;
}

.reply .info .right .update {
	margin-right: 3px;
}

.reply .info .right .cancel {
	margin-right: 3px;
}

.reply .main .right button {
	height: 30px;
    font-size: .8em;
    color: var(--default-anchor-color);
    word-break: keep-all;
    background-color: #8080803d;
    border: 0;
    border-radius: 6px;
}

.reply .replyContent {
	display: flex;
    flex-direction: column;
    gap: 5px;
    color: var(--default-font-color);
    word-break: break-word;
}

.reply .replyContent div {
	display: flex;
    flex-wrap: wrap;
    max-width: 100%;
    min-height: 14px;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<main>
		<input type="hidden" name="num" value="${projectData.boardNum}" id="boardNum">
		<article id="article">
				<div class="sub">
					<div class="back">
						<a href="${pageContext.request.contextPath}/.com/project"><i class="fa-solid fa-arrow-left-long"></i> 뒤로</a>
					</div>
				</div>
				<div class="item">
					<div class="info">
						<div class="title">
							<div class="category">
								<span>${projectData.cateName }</span>
							</div>
							<span>
								<h2>${projectData.boardTitle }</h2>
							</span>
						</div>
						<div class="etc">
							<div class="left">
								<div class="name">${projectData.id }</div>
								<div class="dot"><i class="fa-regular fa-circle" style="font-size: 5px;"></i></div>
								<div class="name">
									<c:choose>
									    <c:when test="${not empty projectData.creDate}">
									        <c:set var="formattedDate">
									        	<fmt:formatDate value="${projectData.creDate}" pattern="yyyy.MM.dd" />
									        </c:set>
									        <div><c:out value="${formattedDate}" /></div>
									    </c:when>
									</c:choose>
								</div>
								<div class="dot"><i class="fa-regular fa-circle" style="font-size: 5px;"></i></div>
								<div class="viewCount"><i class="fa-regular fa-eye"></i>&nbsp;${projectData.boardView }</div>
							</div>
						</div>
					</div>
					<div class="customHtml"></div>
					<div class="content">${projectData.boardContent }</div>
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
								<a href="${pageContext.request.contextPath}/.com/project">목록</a>
							</div>
						</div>
						<div class="right">
							<div class="button">
								<a href="#">다음 글</a>
							</div>
						</div>
					</div>
					<div class="replyTitle">댓글
						<span id="count">${count}</span>
					</div>
					<div id="message"></div>
					<div class="replys" id="replys"></div>
					<div class="replyContainer" id="newReply">	<!-- 댓글 입력 영역 -->
						<div class="replyContainer">
							<div class="replyInput">
								<div class="replyContent">
									<textarea name="content" id="content" placeholder="댓글을 작성해주세요" maxlength="300"></textarea>
									<div class="attached"></div>
								</div>
								<div class="submit">
									<button>등록</button>
								</div>
							</div>
							<div class="replyAttaches">
								<div class="attaches">
									<div class="writer">
										<i class="fa-regular fa-user"></i>&nbsp;<input name="replyWriter" id="replyWriter" placeholder="닉네임을 입력해주세요">
									</div>
									<div class="pass">
										<i class="fa-solid fa-key"></i>&nbsp;<input name="replyPass" id="replyPass" placeholder="비밀번호를 입력해주세요">
									</div>
									<div class="wordCount">총 300자까지 가능합니다.</div>
								</div>
							</div>
						</div>
					</div>
					<div class="listAndEdit">
						<div class="left">
							<div class="button">
								<a href="${pageContext.request.contextPath}/.com/project">목록</a>
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