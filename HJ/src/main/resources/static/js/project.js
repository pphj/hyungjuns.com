
	function setPaging(href, digit) {		//페이징 링크를 생성시키는 함수
		let active = "";
		let gray = "";
		
		if (href == "") {					//href가 빈 문자열일 경우
			if (isNaN(digit)){				//digit이 숫자가 아닌 경우
				gray = "gray";				//href가 빈 문자열일 경우 + digit이 숫자가 아닌 경우 = 버튼색을 회색으로 바꾼다
			}else {
				active = "active";			//href가 빈 문자열일 경우 + digit이 숫자인경우 = 버튼에 active를 준다
			}
		}//if end
		
		let output = `<li class="page-item ${active}">`;
		
		//let anchor = "<a class='page-link " + gray + "'" + href + ">" + digit + "</a></li>"; 와 같은 의미
		let anchor = `<a class="page-link ${gray}" ${href}>${digit}</a></li>`;
		
		output += anchor;
		return output;
	}
	

		
	
	function project_ajax(sdata) {
		let token = $("meta[name='_csrf']").attr("content");	
		let header = $("meta[name='_csrf_header']").attr("content");

		$.ajax({
			type : "post",
			data : sdata,
			url	 : "project_ajax",
			dataType : "json",
			cache : false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				if (data.listcount > 0) {
					$("#board").remove();

					let num = data.listcount - (data.page - 1) * data.limit;
					let output = "<section id='board'>";
						output += '<h1><div>프로젝트 관련 게시물 리스트</div></h1><br>';

					$(data.itdaNoticeList).each(
						function(index, item) {
							let boardTitle = item.boardTitle;
							if (boardTitle.length >= 25) {
								boardTitle = boardTitle.substr(0, 25) + "...";		//0부터 20개 부분 문자열 추출
							}

							var Date = '';
							if (item.modiDate == null) {
								Date = item.creDate;
							}else {
								Date = item.modiDate;
							}
							

							output += '<a class="item" href="project/' + item.boardNum + '">';
								   	+ '	<div class="info">';
									+ '		<div class="titleContainer">';
									+ '			<span class="category">' + item.cateName + '</sapn>';
									+ '			<span class="title">' + boardTitle + '</span>'
									+ '		</div>'
									+ '		<div class="etc">';
									+ '			<div class="id">' + item.cateName + '</div>';
									+ '			<div class="dot"><i class="fa-regular fa-circle" style="font-size: 5px;"></i></div>';
									+ '			<div class="viewCount">' + item.boardView + '</div>';
									+ '			<div class="dot"><i class="fa-regular fa-circle" style="font-size: 5px;"></i></div>';
									+ '			<div class="boardDate">' + Date + '</div>';
									+ '		</div>';
									+ '	</div>'
									+ '</a>'
					})//each end
					output += "</section>"

					$('main').append(output);
					
					$(".pagination").empty();			//페이징 처리 영역 내용 제거
					output = "";
					
					let digit = '<i class="fa fa-chevron-left" aria-hidden="true"></i>'
					let href = "";
					
					if (data.page > 1) {											//이전 버튼의 링크 설정
						href = 'href=javascript:go(' + (data.page - 1) + ')';		//go function 실행
					}			//현재 페이지가 3인 상태에서 이전 버튼을 누르면 href=javascript:go(2)가 되는 것
					output += setPaging(href, digit);
					
					for (let i = data.startpage; i <= data.endpage; i++) {
						digit = i;
						href = "";
						
						if (i != data.page) {										//현재 페이지가 아닌 페이지 번호들
							href = 'href=javascript:go(' + i + ')';					//go function 실행
						}
						output += setPaging(href, digit);
						
					}//for end
					
					digit = '<i class="fa fa-chevron-right" aria-hidden="true"></i>';
					href = "";
					
					if (data.page < data.maxpage) {									//다음 버튼의 링크 설정
						href = 'href=javascript:go(' + (data.page + 1) + ')';		//go function 실행
					}
					output += setPaging(href, digit);
					
					$('.pagination').append(output);
						 
				}
				
			},//success end
			
			error : function(){
				console.log('에러')
			}
			
		})//ajax end
		
	}//ready end
	
	
	$(document).ready(function() {
		let selectedValue = $('input[name=search_field]').val();
		
		if (selectedValue == undefined) {
			selectedValue = 0;
		}else if (selectedValue != '-1') {
			$("#viewcount2").val(selectedValue);
		}
   		
		const $input = $("input[name=search_word]");			//$input을 모든 이벤트에서 사용
		const message = ["제목", "날짜"]
	   	
		$input.attr("placeholder", message[selectedValue] + "을(를) 입력하세요");
	   	
		
		$('#viewcount2').change(function() {						//검색창에 placeholder를 나타나게 하는 이벤트
			selectedValue = $(this).val();
			$input.val('').attr("placeholder", message[selectedValue] + "을(를) 입력하세요");
	   	
		})//change end
	   	
	   	
		$("#search_but").on("click", function() {	//검색버튼 클릭시 이벤트
			if ($input.val() == "") {				//검색창에 아무것도 없는 경우
				alert("검색어를 입력하세요.");
				$input.focus();
				return false;
			}
		})//click end
		
	});