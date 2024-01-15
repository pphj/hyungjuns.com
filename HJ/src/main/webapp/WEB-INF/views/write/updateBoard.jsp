<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>형준 닷컴</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder: '내용을 입력하세요.',
			minHeight: 400
		});
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
	
main {
	display: inline;
	align-items: center;
	justify-content: space-between;
	width: 950px;
	margin: auto;
}

article {
	display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
}

article h1 {
	box-sizing: border-box;
    width: 100%;
    padding: 15px 0;
    color: var(--default-font-color);
}

article form {
	display: flex;
    flex-direction: column;
    gap: 15px;
    width: 100%;
}

article .subContainer {
	display: flex;
    flex-direction: column;
    gap: 10px;
}

article form > div {
	width: 100%;
}

article .subContainer > .mainMinorSubject {
	display: flex;
    flex-direction: row;
    gap: 10px;
    justify-content: space-between;
}

article .categoryContainer {
	display: flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    font-weight: bold;
    border-radius: 8px;
    width: 100%;
}

article select {
	width: 100%;
    padding: 10px;
    font-size: 1em;
    color: var(--default-font-color);
    background-color: var(--default-background-color);
    border: 1px solid #0000008f;
    border-radius: 8px;
}

article .boardTitle {
	display: flex;
    width: 100%;
}

#boardTitle {
	width: 100%;
	padding: 0 10px;
}

article input[type="text"] {
	box-sizing: border-box;
    width: 100%;
    height: 40px;
    font-size: 1em;
    color: var(--default-font-color);
    background-color: var(--default-background-color);
    border: 1px solid #0000008f;
    border-radius: 8px;
}

article .boardContent {
	color: var(--default-font-color);
    border-radius: 8px;
}

.boardContent {
	width: 100%;
    word-break: break-word;
}

article .boardContent .textareaContainer {
	width: 100%;
}

article .button {
	flex: 1;
	border: 1px solid #0000008f;
    border-radius: 35px;
}

article #boardWrite {
	box-sizing: border-box;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 50px;
    padding: 10px;
    font-size: 1em;
    color: var(--default-anchor-color);
    background-color: var(--alpha-5);
    border: 0;
    border-radius: 8px;
}

</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<main>
		<article>
			<h1>글쓰기</h1>
			<form action="${pageContext.request.contextPath}/.com/updateBoard" method="post" enctype="multipart/form-data">
				<div class="subContainer">
					<div class="mainMinorSubject">
						<div class="categoryContainer">
							<select name="cateName" id="cateName">
								<option>카테고리 선택</option>
								<option>세미 프로젝트</option>
								<option>파이널 프로젝트</option>
								<option>개인 프로젝트</option>
								<option>CS 공부</option>
								<option>코딩 풀이</option>
								<option>정보처리기사</option>
							</select>
						</div>
					</div>
				</div>
				<div class="title">
					<input type="text" name="boardTitle" id="boardTitle" placeholder="제목" maxlength="50" value="${board.boardTitle }">					
				</div>
				<div class="content">
					<div class="textareaContainer">
						<textarea name="boardContent" id="summernote" maxlength="4000">${board.boardContent }</textarea>
					</div>
				</div>
				<div class="key">
					<input type="text" name="key" id="key" placeholder=" 게시글 키" maxlength="20" value="${board.key }">	
				</div>
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal" var="pinfo" />
					<input type="hidden" name="id" id="id" value="${pinfo.username}">
					<input type="hidden" name="boardNum" value="${board.boardNum}" id="boardNum">
				</sec:authorize>
				<div class="button">
					<button id="boardWrite">수정</button>
				</div>
				<br>
				<br>
				<br>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</article>
	</main>
</body>
</html>