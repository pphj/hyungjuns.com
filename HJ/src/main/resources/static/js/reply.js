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
    
    
    $('#content').on('input', function () {			//댓글 실시간 반영
		let content = $(this).val();
		
		let length = content.length;
		
		if (length > 300) {
			length = 300;
			content = content.substring(0, length);
			$(this).val(content);
		}
		$(".wordCount").text(length + '/300');
	});
	
	$('.submit').click(function () {
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
});

function getList(currentPage) {
	$.ajax({
		type: "post",
		url: "../replyList",
		data: { "boardNum": $("#boardNum").val(), "page": currentPage },
		dataType: "json",
		success: function (rdata) {
			if (rdata.listcount > 0) {
				$("#replys").show();
				$("#replys").empty();

				$(rdata.list).each(function () {
					let output = '';
					let rawDate = new Date(this.creDate);

					let formattedDate = rawDate.getFullYear()
					 + '.' + (rawDate.getMonth() + 1).toString().padStart(2, '0')
					 + '.' + (rawDate.getDate()).toString().padStart(2, '0');

					output += "<div class='reply'>";
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
					output += "                        <button type='button' id='replyRe'><i class='fa-regular fa-comment-dots'></i>댓글</button>";
					output += "                    </div>";
					output += "                    <div class='updateBtn'>";
					output += "                        <button type='button' class='update'><i class='fa-regular fa-pen-to-square'></i>수정</button>";
					output += "                    </div>";
					output += "                    <div class='delete'>";
					output += "                        <button type='button' class='deleteBtn'><i class='fa-solid fa-trash'></i>삭제</button>";
					output += "                    </div>";
					output += "			   		<input type='hidden' name='replyNum' value=" + this.replyNum + " id='replyNum'>";
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
};



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

function submit (url, data) {
	$.ajax({
		type: 'post',
		url: url,
		data: data,
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
});


$('.updateSubmit').click(function () {
	const replyContent = $('#content').val().trim();
	var writerValue = $("#replyWriter").val();
	var passValue = $("#replyPass").val();
	var boardNum = $("#boardNum").val();
	
	if (!replyContent) {
		alert("댓글을 입력하세요");
		return false;
	}
	
	$(".wordCount").text('총 300자까지 가능합니다.');
	
	url = "../replyUpdate";
	data = {
		"replyWriter": writerValue,
		"replyPass": passValue,
		"replyContent": updatedContent,
		"replyNum": replyNum
	};
	
	$.ajax({
		type: 'post',
		url: url,
		data: data,
		success: function (rdata) {
			$("#content").val('');
			
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
	
});


$('.delete').click(function () {		// 댓글 삭제 버튼 클릭 이벤트
	const replyNum = $(this).closest('.reply').find('input[name="replyNum"]').val();
	
	if(!confirm('정말로 삭제하시겠습니까')){
		return;
	}

	$.ajax({
		type: 'post',
		url: "../replyDelete",
		data: { "replyNum": replyNum },
		success: function (result) {
			if (result == 1) {
				alert("댓글이 삭제되었습니다.");
				getList(page);
			} else {
				alert("댓글 삭제 실패");
			}
		}
	});
});


function toggleUpdateCancel(button) {
	if (button.hasClass('update')) {
		button.removeClass('update').addClass('cancel');
		button.text('취소');
	} else {
		button.removeClass('cancel').addClass('update');
		button.text('수정');
	}
};

$('#replys').on('click', '.update', function () {				//댓글 수정 버튼 클릭 이벤트
		
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
	output += '						<i class="fa-regular fa-user"></i>&nbsp;<input name="replyWriter" id="replyWriter" placeholder="닉네임을 입력해주세요">';
	output += '					</div>';
	output += '					<div class="pass">';
	output += '						<i class="fa-solid fa-key"></i>&nbsp;<input name="replyPass" id="replyPass" placeholder="비밀번호를 입력해주세요">';
	output += '					</div>';
	output += '					<div class="updateWordCount">총 300자까지 가능합니다.</div>';
	output += '				</div>';
	output += '			</div>';
	output += '		</div>';
	output += '	</div>';
	
	$(this).closest('.reply').find('#replyEtc').append(output);
	
	toggleUpdateCancel($(this));
	
});


$('#replys').on('click', '.cancel', function () {
	$(this).closest('.replyContainer').remove();
	toggleUpdateCancel($(this));
});