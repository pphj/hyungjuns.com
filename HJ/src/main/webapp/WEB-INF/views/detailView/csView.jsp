<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>형준닷컴</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
       
<!-- Icon Font Stylesheet -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/2432d5047b.js" crossorigin="anonymous"></script>

<!-- Libraries Stylesheet -->
<link href="${pageContext.request.contextPath}/resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/lib/lightbox/css/lightbox.min.css" rel="stylesheet">


<!-- Customized Bootstrap Stylesheet -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<script>
	var url = "";
	var data = {};
	var updatedContent = "";
	var page = 1;
	const count = parseInt($("#count").text());
	
	$(document).ready(function() {
		
		
		$("#replys").hide();

	    if (count != 0) {
	        getList(1);
	    } else {
	        $("#message").text("댓글이 없습니다.");
	    }
	    
	    $('.submit').click(function () {							//등록 클릭 이벤트
			const replyContent = $('#content').val().trim();
			var writerValue = $("#replyWriter").val();
			var passValue = $("#replyPass").val();
			var boardNum = $("#boardNum").val();
			
			if (!replyContent) {
				alert("댓글을 입력하세요");
				return false;
			}
			
			$(".wordCount").text('총 300자까지 가능합니다.');
			
			url = "../replyInsert";
			data = {
				"replyWriter": writerValue,
				"replyPass": passValue,
				"replyContent": replyContent,
				"boardNum": boardNum
			};
			
			submit(url, data);
		});
	    
	    
	    
	    
	    $('#replys').on('click', '.delete', function () {			//삭제 버튼 클릭시
	    	$(this).closest('.delete').find('.deletePass').css('display','flex');
	    });
	    
	    
	    
	    
	    $('#replys').on('click', '.removeCheck', function () {		//삭제 확인버튼 클릭시
	    	var replyNum = $(this).closest('.replyWrapper').find('#replyNum').val();
	    	var replyRef = $(this).closest('.right').find("#replyRef").val();
			var replyLev = $(this).closest('.replyWrapper').find("#replyLev").val();
			var replySeq = $(this).closest('.replyWrapper').find("#replySeq").val();
	    	var boardNum = $("#boardNum").val();
	    	var deletePass = $(this).closest('.replyWrapper').find("#removePass").val();
	    	
	    	url = "../replyDelete";
			data = {
				"replyNum": replyNum,
				"boardNum": boardNum,
				"deletePass": deletePass,
				"replyRef": replyRef,
				"replyLev": replyLev,
				"replySeq": replySeq
			};
			
			if (deletePass === "") {
				alert("작성시 입력한 비밀번호를 입력해주세요");
			}else {
				if(!confirm('정말로 삭제하시겠습니까')){
					return;
				}else {
					remove(url, data);
				}
			};
			
	    	
	    });
	    
	    
	    
	    $('#replys').on('click', '.updateSubmit', function () {		//수정완료 버튼 클릭시
	    	const replyContent = $('#updateContent').val().trim();
			var writerValue = $("#updateWriter").val();
			var passValue = $("#updatePass").val();
			var replyNum = $(this).closest('.replyWrapper').find("#replyNum").val();
			
			if (!replyContent) {
				alert("수정할 댓글내용을 입력하세요");
				return false;
			}
			
			$(".updateWordCount").text('총 300자까지 가능합니다.');
			
			url = "../replyUpdate";
			data = {
				"replyWriter": writerValue,
				"replyPass": passValue,
				"replyContent": replyContent,
				"replyNum": replyNum
			};
			
			update(url, data);
	    	
	    });
	    
	    
	    $('#replys').on('click', '.reReplySubmit', function () {		//대댓글 등록 버튼 클릭시
	    	const replyContent = $('#reReplyContent').val().trim();
			var writerValue = $("#updateWriter").val();
			var passValue = $("#updatePass").val();
			var replyNum = $(this).closest('.replyWrapper').find("#replyNum").val();
			var replyRef = $(this).closest('.replyWrapper').find("#replyRef").val();
			var replyLev = $(this).closest('.replyWrapper').find("#replyLev").val();
			var replySeq = $(this).closest('.replyWrapper').find("#replySeq").val();
			var boardNum = $("#boardNum").val();
			
			if (!replyContent) {
				alert("댓글내용을 입력하세요");
				return false;
			}
			
			$(".reReplyWordCount").text('총 300자까지 가능합니다.');
			
			url = "../reReplyInsert";
			data = {
				"replyWriter": writerValue,
				"replyPass": passValue,
				"replyContent": replyContent,
				"replyNum": replyNum,
				"boardNum": boardNum,
				"replyRef": replyRef,
				"replyLev": replyLev,
				"replySeq": replySeq
			};
			
			reReply(url, data);
	    	
	    });
	    
	    
	    
	    $('#content').on('input', function () {						//댓글 실시간 반영
			let content = $(this).val();
			
			let length = content.length;
			
			if (length > 300) {
				length = 300;
				content = content.substring(0, length);
				$(this).val(content);
			}
			$(".wordCount").text(length + '/300');
		});
		
	    
	});//ready end
	
	
	
	$(document).on('click', '.removeCancel', function () {		//삭제 취소버튼 클릭시
	    $(this).closest('.deletePass').css('display', 'none');
	});
	
	
	
	$(document).on('click', '.cancel', function () {			//취소 클릭 이벤트
		const replyNum = $(this).data('replyNum');
		
		if (replyNum) {
			$(this).closest('.reply').find('#updateReply').remove();
		}
		toggleUpdateCancel($(this));
	});
	
	
	$(document).on('click', '.reCancel', function () {			//댓글 취소 클릭 이벤트
		const replyNum = $(this).data('replyNum');
		
		if (replyNum) {
			$(this).closest('.reply').find('#updateReply').remove();
		}
		toggleReplyCancel($(this));
	});
	
	
	$(document).on('click', '.update', function () {			//수정 클릭 이벤트
		const replyNum = $(this).closest('.reply').find('input[name="replyNum"]').val();
		$(this).data('replyNum', replyNum);
		
		let output = '';
		
		output += '	<div class="replyContainer" id="updateReply">';
		output += '		<div class="replyContainer">';
		output += '    		<div class="replyInput">';
		output += '        		<div class="replyContent">';
		output += '            		<textarea name="content" id="updateContent" placeholder="댓글을 작성해주세요" maxlength="300"></textarea>';
		output += '        		</div>';
		output += '        		<div class="updateSubmit">';
		output += '            		<button>수정완료</button>';
		output += '        		</div>';
		output += '    		</div>';
		output += '			<div class="replyAttaches">';
		output += '				<div class="attaches">';
		output += '					<div class="writer">';
		output += '						<i class="fa-regular fa-user"></i>&nbsp;<input name="replyWriter" id="updateWriter" placeholder="닉네임을 입력해주세요">';
		output += '					</div>';
		output += '					<div class="pass">';
		output += '						<i class="fa-solid fa-key"></i>&nbsp;<input name="replyPass" id="updatePass" placeholder="비밀번호를 입력해주세요">';
		output += '					</div>';
		output += '					<div class="updateWordCount">총 300자까지 가능합니다.</div>';
		output += '				</div>';
		output += '			</div>';
		output += '		</div>';
		output += '	</div>';
		
		$(this).closest('.reply').find('#replyEtc').append(output);
		
		toggleUpdateCancel($(this));
		
		$('#updateContent').on('input', function () {			//수정 댓글 실시간 반영
			let content = $(this).val();
			
			let length = content.length;
			
			if (length > 300) {
				length = 300;
				content = content.substring(0, length);
				$(this).val(content);
			}
			$(".updateWordCount").text(length + '/300');
		});
		
	});
	
	
	$(document).on('click', '.reReply', function () {			//댓글 클릭시 이벤트
		const replyNum = $(this).closest('.reply').find('input[name="replyNum"]').val();
		$(this).data('replyNum', replyNum);
		
		let output = '';
		
		output += '	<div class="replyContainer" id="updateReply">';
		output += '		<div class="replyContainer">';
		output += '    		<div class="replyInput">';
		output += '        		<div class="replyContent">';
		output += '            		<textarea name="content" id="reReplyContent" placeholder="댓글을 작성해주세요" maxlength="300"></textarea>';
		output += '        		</div>';
		output += '        		<div class="reReplySubmit">';
		output += '            		<button>등록</button>';
		output += '        		</div>';
		output += '    		</div>';
		output += '			<div class="replyAttaches">';
		output += '				<div class="attaches">';
		output += '					<div class="writer">';
		output += '						<i class="fa-regular fa-user"></i>&nbsp;<input name="replyWriter" id="updateWriter" placeholder="닉네임을 입력해주세요">';
		output += '					</div>';
		output += '					<div class="pass">';
		output += '						<i class="fa-solid fa-key"></i>&nbsp;<input name="replyPass" id="updatePass" placeholder="비밀번호를 입력해주세요">';
		output += '					</div>';
		output += '					<div class="reReplyWordCount">총 300자까지 가능합니다.</div>';
		output += '				</div>';
		output += '			</div>';
		output += '		</div>';
		output += '	</div>';
		
		$(this).closest('.reply').find('#replyEtc').append(output);
		
		toggleReplyCancel($(this));
		
		$('#reReplyContent').on('input', function () {			//수정 댓글 실시간 반영
			let content = $(this).val();
			
			let length = content.length;
			
			if (length > 300) {
				length = 300;
				content = content.substring(0, length);
				$(this).val(content);
			}
			$(".reReplyWordCount").text(length + '/300');
		});
		
		
	});
	
	
	
	function getList(currentPage) {			//댓글 목록 ajax
		var token = $("meta[name='_csrf']").attr("content");	
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			type: "post",
			url: "../replyList",
			data: { "boardNum": $("#boardNum").val(), "page": currentPage },
			dataType: "json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (rdata) {
				if (rdata.listcount > 0) {
					$("#replys").show();
					$("#replys").empty();

					$(rdata.list).each(function () {
						var lev = (this.replyLev > 0) ? 30 : 0;
						let output = '';
						let rawDate = new Date(this.creDate);

						let formattedDate = rawDate.getFullYear()
						 + '.' + (rawDate.getMonth() + 1).toString().padStart(2, '0')
						 + '.' + (rawDate.getDate()).toString().padStart(2, '0');

						output += "<div class='reply' style='margin-left: " + lev + "px;'>";
						output += "    <div class='main'>";
						output += "        <div class='replyWrapper'>";
						output += "            <div class='info'>";
						output += "                <div class='left'>";
						output += "                    <div class='nickName'>"
						output += "                    		<div class='text'>"
						output += "                    			<span>" + this.replyWriter + "</span>";
						output += "                    		</div>";
						output += "                    </div>";
						output += "                    <div class='time'>" + formattedDate + "</div>";
						output += "                </div>"
						output += "                <div class='right'>";
						output += "                    <div class='replyRe'>";
						output += "                        <button type='button' class='reReply'><i class='fa-regular fa-comment-dots'></i>댓글</button>";
						output += "                    </div>";
						output += "                    <div class='updateBtn'>";
						output += "                        <button type='button' class='update'><i class='fa-regular fa-pen-to-square'></i>수정</button>";
						output += "                    </div>";
						output += "                    <div class='delete'>";
						output += "                        <button type='button' class='deleteBtn'><i class='fa-solid fa-trash'></i>삭제</button>";
						output += "						   <div class='deletePass' style='display: none;'>";
						output += "						   		<input type='text' name='removePass' id='removePass'>";
						output += "						   		<button type='button' class='removeCheck'>확인</button>";
						output += "						   		<div class='removeCancel'>취소</div>";
						output += "						   </div>";
						output += "                    </div>";
						output += "			   		<input type='hidden' name='replyNum' value=" + this.replyNum + " id='replyNum'>";
						output += "			   		<input type='hidden' name='replySeq' value=" + this.replySeq + " id='replySeq'>";
						output += "			   		<input type='hidden' name='replyLev' value=" + this.replyLev + " id='replyLev'>";
						output += "			   		<input type='hidden' name='replyRef' value=" + this.replyRef + " id='replyRef'>";
						output += "            	   </div>";
						output += "            </div>";
						output += "            <div class='replyContent' id='replyContent'>";
						output += "            		<div>" + this.replyContent + "</div>";
						output += "            </div>";
						output += "            <div class='replyContainer' id='replyEtc'></div>";
						output += "        </div>";
						output += "    </div>";
						output += "</div>";

						$("#replys").append(output);
						
					});
				} else {
					$("#message").text("등록된 댓글이 없습니다.");
					$("#replys").hide();
				}
			}
		});
	};// 댓글목록 end
	
	
	
	
	function submit (url, data) {			//댓글 등록 ajax
		var token = $("meta[name='_csrf']").attr("content");	
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			type: 'post',
			url: url,
			data: data,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (rdata) {
				$("#content").val('');
				
				if (rdata == 1) {
					alert("댓글이 등록되었습니다.");
					$("#replyWriter").val('');
					$("#replyPass").val('');
					getList(page);
				} else {
						alert("댓글 등록 실패");
				}
			}
		});
	};
	
	
	
	
	function update (url, data) {			//댓글 수정 ajax
		var token = $("meta[name='_csrf']").attr("content");	
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			type: 'post',
			url: url,
			data: data,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (rdata) {
				$("#updateContent").val('');
				
				if (rdata == 1) {
					alert("댓글이 수정되었습니다.");
					$(".submit").text("등록");
					$(".cancel").removeClass("cancel");
					$("#replyWriter").val('');
					$("#replyPass").val('');
					getList(page);
				} else {
					alert("댓글 수정 실패");
				}
			}
		});
		
	}
	
	
	
	
	function remove (url, data) {			//댓글 삭제 ajax
		var token = $("meta[name='_csrf']").attr("content");	
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			type: 'post',
			url: url,
			data: data,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (rdata) {
				if (rdata == 1) {
					alert("댓글이 삭제되었습니다.");
					getList(page);
				} else {
					alert("댓글 삭제 실패, 비밀번호를 확인하세요.");
				}
			}
		});
	}
	
	
	function reReply (url, data) {			//대댓글 등록 ajax
		var token = $("meta[name='_csrf']").attr("content");	
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			type: 'post',
			url: url,
			data: data,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success: function (rdata) {
				$("#content").val('');
				
				if (rdata == 1) {
					alert("대댓글이 등록되었습니다.");
					$("#updateWriter").val('');
					$("#updatePass").val('');
					getList(page);
				} else {
					alert("대댓글 등록 실패");
				}
			}
		});
	};
	
	
	
	function toggleUpdateCancel(button) {
		if (button.hasClass('update')) {
			button.removeClass('update').addClass('cancel');
			button.html('<i class="fa-solid fa-xmark"></i> 취소');
		}else {
			button.removeClass('cancel').addClass('update');
			button.html('<i class="fa-regular fa-pen-to-square"></i> 수정');
		}
	};	
	
	
	function toggleReplyCancel(button) {
		if (button.hasClass('reReply')) {
			button.removeClass('reReply').addClass('reCancel');
			button.html('<i class="fa-solid fa-xmark"></i> 취소');
		}else {
			button.removeClass('reCancel').addClass('reReply');
			button.html('<i class="fa-regular fa-comment-dots"></i> 댓글');
		}
	};

	
	
	
	$(function(){
		$(".deleteBoardButton").click(function(){
			$("#deleteBoardModal").modal("show");
		})
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
    background-color: #A9CEC2;
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
    background-color: #ACA9BB;
    border-radius: 8px;
}


#article .deleteBoardButton {
	display: flex;
    align-items: center;
    justify-content: center;
    width: auto;
    height: 40px;
    padding: 0 20px;
    font-size: 1em;
    background-color: #ACA9BB;
    border-radius: 8px;
}

#article .deleteBoardButton a {
    color: black;
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

.replyContainer .updateSubmit {
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

.replyContainer .updateSubmit button {
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

.replyContainer .reReplySubmit {
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

.replyContainer .reReplySubmit button {
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

.replyAttaches .attaches .updateWordCount {
	width: 150px;
    height: 30px;
    margin: 0 0 0 325px;
    font-size: .8em;
}

.replyAttaches .attaches .reReplyWordCount {
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
    background-color: #aca9bb2e;
}

.replys #replyLev0 {
	margin: 0px;
}

.replys #replyLev1 {
	margin: 0px 0px 0px 30px;
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

.reply .info .right .updateBtn {
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

.reply .deletePass {
	overflow: hidden;
    position: absolute;
    width: 218px;
    height: 31px;
    border: 2px solid #29367c;
    margin-left: -175px;
}   

.reply #removePass {

    float: left;
    width: 129px;
    height: 31px;
    line-height: 34px;
    padding: 0 5px;
    border: 0;
    background: #fff;
    font-size: 14px;
}    

.reply .removeCheck {
	float: left;
    width: 49px;
    height: 31px;
    line-height: 32px;
    background: #3b4890;
    color: #fff;
    font-weight: bold;
    text-shadow: 0px 1px #1d2761;

}

.reply .removeCancel {
	float: left;
    width: 49px;
    height: 31px;
    line-height: 32px;
    background: #3b4890;
    color: #fff;
    font-weight: bold;
    text-shadow: 0px 1px #1d2761;
}
    
    
</style>
</head>
<body>
	<jsp:include page="../main/navbar.jsp"/>
	<main>
		<input type="hidden" name="num" value="${csData.boardNum}" id="boardNum">
		<article id="article">
				<div class="sub">
					<div class="back">
						<a href="${pageContext.request.contextPath}/page/cs"><i class="fa-solid fa-arrow-left-long"></i> 뒤로</a>
					</div>
				</div>
				<div class="item">
					<div class="info">
						<div class="title">
							<div class="category">
								<span>${csData.cateName }</span>
							</div>
							<span>
								<h2>${csData.boardTitle }</h2>
							</span>
						</div>
						<div class="etc">
							<div class="left">
								<div class="name">${csData.id }</div>
								<div class="dot"><i class="fa-regular fa-circle" style="font-size: 5px;"></i></div>
								<div class="name">
									<c:choose>
									    <c:when test="${not empty csData.creDate}">
									        <c:set var="formattedDate">
									        	<fmt:formatDate value="${csData.creDate}" pattern="yyyy.MM.dd" />
									        </c:set>
									        <div><c:out value="${formattedDate}" /></div>
									    </c:when>
									</c:choose>
								</div>
								<div class="dot"><i class="fa-regular fa-circle" style="font-size: 5px;"></i></div>
								<div class="viewCount"><i class="fa-regular fa-eye"></i>&nbsp;${csData.boardView }</div>
							</div>
						</div>
					</div>
					<div class="customHtml"></div>
					<div class="content">${csData.boardContent }</div>
					<div class="html"></div>
					<div class="customHtml"></div>
					<hr style="color: #808080;">
					<div class="listAndEdit">
						<div class="left">
							<div class="button">
								<c:if test="${countDown != 0}">
									<a href="${pageContext.request.contextPath}/page/cs/${countDown}">이전 글</a>
								</c:if>
							</div>
						</div>
						<div class="center">
							<div class="button">
								<a href="${pageContext.request.contextPath}/page/cs">목록</a>
							</div>
						</div>
						<div class="right">
							<div class="button">
								<c:if test="${countUp != 0}">
									<a href="${pageContext.request.contextPath}/page/cs/${countUp}">다음 글</a>
								</c:if>
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
								<a href="${pageContext.request.contextPath}/page/cs">목록</a>
							</div>
						</div>
						<div class="right">
							<sec:authorize access="isAuthenticated()">
							<div class="button">
								<a href="${pageContext.request.contextPath}/page/updateBoard/${csData.boardNum}">수정</a>
							</div>
							<div class="deleteBoardButton">
								<a href="#">삭제</a>
							</div>
							</sec:authorize>
						</div>
					</div>
					<br>
				</div>
		</article>
		<%-- 삭제 모달 시작 --%>
 			<div class="modal" id="deleteBoardModal">
 				<div class="modal-dialog">
 					<div class="modal-content">
 						<div class="modal-body">	<%-- 모달 바디 --%>
 							<form name="deleteBoardForm" action="${pageContext.request.contextPath}/page/deleteBoard" method="post">
 								<input type="hidden" name="boardNum" value="${projectData.boardNum}" id="boardNum">
 								<button type="submit" class="btn btn-primary">삭제</button>
 								<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
 								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
 							</form>
 						</div>
 					</div>
 				</div>
 			</div>
 		<%-- 삭제 모달 끝 --%>
	</main>
</body>
</html>