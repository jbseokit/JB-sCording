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
    <form id="actionForm" action="/notice/save" method="post" enctype= "multipart/form-data">
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
                    <td colspan="4">
                        <button id="upload" type="button" style="border: 1px solid; outline: none;">파일 추가</button>
                        <input type="file" id="inputFile" name="files" multiple style="display: none;"/> 
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
<script src="/resources/js/common/utils/common.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 등록 창에서 현재 날짜 기본 지정
	$("#regDate").val(new Date().toISOString().substring(0, 10));
	
	// 선택된 파일 검사
	$("#inputFile").on("change", fileCheck);
	
	// 파일 추가버튼 클릭 시 file 버튼 클릭
	$("#upload").click(function (e) {
        
    	e.preventDefault();
        
    	$("#inputFile").click();
    
    });
	
}); 

 var fileCount = 0;

 var totalCount = 5;

 var fileNum = 0;

 var fileList = new Array();

 function fileCheck(e) {
	
 	var files = e.target.files;
	
 	// 파일 Array에 담기
 	var filesArr = Array.prototype.slice.call(files);

	
 	// 파일 개수 확인 및 제한
 	if (fileCount + filesArr.length > totalCount) {
		
 		alert("파일은 최대" + totalCount + "개 까지 첨부할 수 있습니다.");
		
 		return;
		
 	} else {
		
 		fileCount = fileCount + filesArr.length;
		
 	}
	
 	// 파일 이름 길이 및 용량 확인
 	if( files.name > 100) {
			
			alert("파일명이 100자 이상인 파일은 제외됩니다.");
			return false;
			
		} else if (files.size > (5 * 1024 * 1024)) {
			
			alert("첨부파일 당 최대 5MB를 초과한 파일은 제외됩니다.");
			return false;
			
		} else {
			
			return true;
			
		}
 	
 	// 각각의 파일 Array에 담기
 	filesArr.forEach(function (f) {
				
 		fileList.push(f);
		
 		var reader = new FileReader();
		
 		reader.onload = function () {
			
 			$(".file-list").append(
					
 				'<div id="file' + fileNum + ' "onclick="fileDelete(\'file' + fileNum + '\'")> ' 
 					+ f.name + 
 				'</div>'
			
 			);
		
 			fileNum ++;
			
 		};
		
 		reader.readAsDataURL(f);
		
 	});
	
 	//$("#inputFile").val("");
	
 }
</script>
</html>


<!-- function fileDelete(fileNum) { -->
    
<!--     var no = fileNum.replace(/[^0-9]/g, ""); -->
    
<!--     contentFiles[no].is_delete = true; -->
    
<!--     $("#" + fileNum).remove(); -->
    
<!--     fileCount --; -->
    
<!--     console.log("삭제 후 배열 : " + contentFiles); -->
    
<!-- } -->

<!-- //공지사항 정보 및 파일 전송 -->
<!-- $("#save").on("click", registerAction); -->
<!-- function registerAction() { -->
    
<!--     var form = $("form")[0]; -->
    
<!--     var formData = new FormData(form); -->
    
<!--     var actionForm = $("#actionForm"); -->
    
<!--     for (var i=0; i < contentFiles.length; i++) { -->
        
<!--         // 삭제하지 않은 파일만 form에 추가 -->
<!--         if (!contentFiles[i].is_delete) { -->
            
<!--             formData.append("files", contentFiles[i]); -->
            
<!--         } -->
        
<!--     } -->
    
<!--     $.ajax({ -->
        
<!--         type:"POST", -->
<!--         async : true, -->
<!--         enctype: "multipart/form-data", -->
<!--         url : "/notice/save", -->
<!--         data : formData, -->
<!--         success : function (data) { -->
    
<!--             alert("공지사항 등록 완료"); -->
    
<!--             }, -->
<!--         error : function () { -->
            
<!--             alert("서버 내 오류 발생하여 처리가 지연되고 있습니다."); -->
            
<!--         } -->

<!--     });  -->
    
<!-- } -->