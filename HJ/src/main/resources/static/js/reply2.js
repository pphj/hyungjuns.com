$(function () {
    $("#reply").hide();
    let page = 1;
    const count = parseInt($("#count").text());

    if (count != 0) {
        getList(1);
    } else {
        $("#message").text("댓글이 없습니다.");
    }

    function getList(currentPage) {
        $.ajax({
            type: "post",
            url: "../replyList",
            data: { "boardNum": $("#boardNum").val(), "page": currentPage },
            dataType: "json",
            success: function (rdata) {
                if (rdata.listcount > 0) {
                    $("#reply").show();
                    $("#reply").empty();

                    $(rdata.list).each(function () {
                        let output = '';
                        let rawDate = new Date(this.creDate);

                        let formattedDate = rawDate.getFullYear()
						 + '.' + (rawDate.getMonth() + 1).toString().padStart(2, '0')
						 + '.' + (rawDate.getDate()).toString().padStart(2, '0');

                        output += "<div class='comment'>";
                        output += "    <div class='main'>";
                        output += "        <div class='commentWrapper'>";
                        output += "            <div class='info'>";
                        output += "                <div class='left'>";
                        output += "                    <div class='nickName'>" + this.replyWriter + "</div>";
                        output += "                    <div class='time'>" + formattedDate + "</div>";
                        output += "                </div>"
                        output += "                <div class='right'>";
                        output += "                    <div class='commentRe'>";
                        output += "                        <button id='commnetRe'><i class='fa-regular fa-comment-dots'></i>댓글</button>";
                        output += "                    </div>";
                        output += "                    <div class='update'>";
                        output += "                        <button class='updateBtn'><i class='fa-regular fa-pen-to-square'></i>수정</button>";
                        output += "                    </div>";
                        output += "                    <div class='delete'>";
                        output += "                        <button class='deleteBtn'><i class='fa-solid fa-trash'></i>삭제</button>";
                        output += "                    </div>";
                        output += "			   		<input type='hidden' name='replyNum' value=" + this.replyNum + " id='replyNum'>";
                        output += "            </div>";
                        output += "            <div class='commentContent' id='commentContent'>";
                        output += "            		" + this.replyContent + "";
                        output += "            </div>";
                        output += "            <div class='commentContainer' id='commentEtc'></div>";
                        output += "        </div>";
                        output += "    </div>";
                        output += "</div>";

                        $("#reply").append(output);
                    });

                    // 댓글 수정 버튼 클릭 이벤트
                    $('.updateBtn').on('click', function () {
                        let output = '';
						
						output += '<div class="replyContainer" id="updateReply">';
                        output += '		<div class="replyContainer">';
                        output += '    		<div class="replyInput">';
                        output += '        		<div class="replyContent">';
                        output += '            		<textarea name="content" class="updatedContent" placeholder="댓글을 작성해주세요" maxlength="300"></textarea>';
                        output += '        		</div>';
                        output += '        		<div class="submit">';
                        output += '            		<button class="updateCompleteBtn">수정완료</button>';
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
						output += '					<div class="wordCount">총 300자까지 가능합니다.</div>';
						output += '				</div>';
						output += '			</div>';
						output += '		</div>';

                        $(this).closest('.comment').find('#commentEtc').html(output);
						
						$('.updateBtn').addClass('cancel').removeClass('updateBtn');
						$('.cancel').text('취소');
                    });


                    // 댓글 수정 완료 버튼 클릭 이벤트
                    $(document).on('click', '.updateCompleteBtn', function () {
                        const updatedContent = $(this).closest('.comment').find('.updatedContent').val().trim();
                        const replyNum = $(this).closest('.comment').find('input[name="replyNum"]').val();

                        if (!updatedContent) {
                            alert("수정할 내용을 입력하세요");
                            return false;
                        }

                        $.ajax({
                            type: "post",
                            url: "../updateReply",
                            data: {
                                "replyContent": updatedContent,
                                "replyNum": replyNum
                            },
                            dataType: "json",
                            success: function (result) {
                                if (result == 1) {
                                    alert("댓글이 수정되었습니다.");
                                    getList(page);
                                } else {
                                    alert("댓글 수정 실패");
                                }
                            }
                        });
                    });

                   // 댓글 삭제 버튼 클릭 이벤트 등록
				   $('.deleteBtn').on('click', function () {
					const replyNum = $(this).closest('.comment').find('input[name="replyNum"]').val();
					const confirmation = confirm("정말로 삭제하시겠습니까?");

					if (confirmation) {
						$.ajax({
							type: "post",
							url: "../deleteReply",
							data: { "replyNum": replyNum },
							dataType: "json",
							success: function (result) {
								if (result == 1) {
									alert("댓글이 삭제되었습니다.");
									getList(page);
								} else {
									alert("댓글 삭제 실패");
								}
							}
						});
					}
				});

			} else {
				$("#message").text("등록된 댓글이 없습니다.");
				$("#reply").hide();
			}
		}
	});
}


					
$('#content').on('input', function () {
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

	$.ajax({
		type: "post",
		url: "../replyInsert",
		data: {
			"replyWriter": writerValue,
			"replyPass": passValue,
			"replyContent": replyContent,
			"boardNum": boardNum
		},
		dataType: "json",
		success: function (rdata) {
			$("#content").val('');
			if (rdata == 1) {
				alert("댓글이 등록되었습니다.");
				getList(page);
			} else {
				alert("댓글 등록 실패");
			}
		}
	});
})
});