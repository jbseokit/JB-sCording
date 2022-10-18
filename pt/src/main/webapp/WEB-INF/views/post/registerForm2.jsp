<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
</head>
<body>
    <h1>공지사항 등록</h1>
    <form id="actionForm" action="/notice/save" method="post" enctype="multipart/form-data">
        <table class="table" border="1"
            style="border: 1px solid; text-align: left;">
            <thead>
                <tr>
                    <td colspan="5" style="color: orange; text-align: right;"><b>(*)필수입력항목</b></td>
                </tr>
            </thead>
            <tbody class="table-group-divider">
                <tr>
                    <td width="150"> <span style="color: orange;"><b>(*)</b></span> 제목 </td>
                    <td> <input type="text" id="title" name='ntTitle' size="50" required> </td>
                    <td width="150"> <span style="color: orange;"><b>(*)</b></span> 상단공지 여부 </td>
                    <td> <input type="radio" name="ntStatus" value="고정" required> 예 
                         <input type="radio" name="ntStatus" value="" required> 아니오 </td>
                </tr>
                <tr>
                    <td width="150"> <span style="color: orange;"><b>(*)</b></span> 작성자 </td>
                    <td width="150"> <input type="text" id="writer" name="ntWriter" size="30" value="${mbrNm}" readonly></td>
                    <td width="150"> <span style="color: orange;"><b>(*)</b></span> 작성일자 </td>
                    <td><input type="date" id="regDate" name="ntRegDate"></td>
                </tr>
                <tr>
                    <td width="150"> <span style="color: orange;"><b>(*)</b></span> 내용 </td>
                    <td colspan="3"> <textarea cols="100%" rows="10" name="ntContent" required></textarea> </td>
                </tr>
                <tr>
                    <td width="150"> 영상파일 </td>
                    <td colspan="3">  </td>
                </tr>
                <tr>
                    <td width="150"> 첨부파일 </td> 
                    <td colspan="4"> <input type="file" id="files" onchange="$.addFile($(this).val());" multiple/> 
                        <span style="color: blue;">※ 첨부파일 당 최대 5MB까지 업로드 가능하며, 최대 5개까지 등록할 수 있습니다.</span>
                    </td>
                </tr>
                <tr>
                   <td> </td>
                   <td colspan="3" height="150px"> <div class="file-list"> </div> </td>
                </tr>
            </tbody>
        </table>
        <button onclick="history.back(-1)">취소</button>
        <button id="save">저장</button>
    </form>

</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 등록 창에서 현재 날짜 기본 지정
	$("#regDate").val(new Date().toISOString().substring(0, 10));
	
	var actionForm = $("#actionForm");
	
	var fileNo = 0;
	
	var filesArr = new Array();
	
	$.addFile = function(obj) {
		
		console.info("this : " + obj);
		console.info("obj size : " + obj.length);
		
		// 첨부파일 최대 개수
		var maxFileCnt = 5;
		// 기존 추가된 첨부파일 개수
		var attFileCnt = $(".filebox").length;
		console.info("기존 추가된 첨부파일 개수 : " + attFileCnt);
		// 추가로 첨부 가능한 개수
		var remainFileCnt = maxFileCnt - attFileCnt;
		console.info("추가로 첨부가능 한 개수 : " + remainFileCnt);
		// 현재 선택된 첨부파일 개수
		var currentFileCnt = 0;
		
		if (obj.length > 0) {
			
			currentFileCnt += 1;
			
		}
		
		console.info("현재 선택된 파일 개수 : " + currentFileCnt);
		
		// 첨부파일 개수 확인
		if (currentFileCnt > remainFileCnt) {
			
			alert("첨부파일은 최대" + maxFileCnt + "개 까지 첨부 가능합니다. ");
			
		}
		
		for (var i=0; i<Math.min(currentFileCnt, remainFileCnt); i++) {
			
			const file = obj.files[i];
			
			// 첨부파일 검증
			if ($.validation(file)) {
				
				// 파일 배열에 담기
				var reader = new FileReader();
				
				// onload : 읽기 동작이 성공적으로 완료되었을 때 발생
				reader.onload = function () {
					
					filesArr.push(file);	
					
				};
				
				// readAsDataURL : 바이너리 파일을 Base64 Encode 문자열로 반환
				reader.readAsDataURL(file);
				
				
				// 등록 창에 선택된 첨부파일 목록 추가
				let htmlData = '';
				
				htmlData += '<div id="file' + fileNo + '" class="filebox">';
				
				htmlData += '<p class="name">' + file.name + '</p>';
				
				htmlData += '<a class="delete" onclick="$.deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
				
				htmlData += '</div>';
				
				$(".file-list").append(htmlData);
				
			} else {
				
				continue;
				
			} // end of if-else

		} // end of for
		
		// 배열에 파일 담고 기존 파일 초기화
		$("#files").val('');
				
	} // end of $.addFile
	
	// 첨부파일 검증
	$.validation = function(obj) {
		
		if(obj.name.length > 100) {
			
			alert("파일명이 100자 이상인 파일은 제외됩니다.");
			return false;
			
		} else if (obj.size > (5 * 1024 * 1024)) {
			
			alert("첨부파일 당 최대 5MB를 초과한 파일은 제외됩니다.");
			return false;
			
		} else {
			
			return true;
			
		}
		
	}
	
	// 첨부파일 삭제
	$.deleteFile = function(num) {
		
		$("#file" + num).remove();
		
		filesArr[num].is_delete = true;
		
	}
	
	// 공지사항 내용 및 첨부파일 전송
	$("#save").on("click", function(e) {
		
		var form = $("#actionForm")[0];
		
		var formData = new FormData(form);
		
		for (var i=0; i < filesArr.length; i++) {
			
			// 삭제되지 않은 파일만 formData에 추가
			if (!filesArr[i].is_delete) {
				
				formData.append("files", filesArr[i]);
				
			}
			
		}
		
		$.ajax({
			
			method : "POST",
			url : "/notice/save",
			dataType : "json",
			data : formData,
			async : true,
			timeout : 5000,
			contentType : "multipart/form-data;",
			success : function () {
				
				alert("저장이 완료되었습니다.")
				
			},
			error : function () {
				
				alert("에러가 발생 했습니다.");
				
				return;
				
			}

		});

	});
	
	
}); 
</script>
</html>