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
    <form id="actionForm" action="/notice/save" method="post">
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
                    <td> <input type="radio" name="ntStatus" value="고정" name="ntStatus" required> 예 
                         <input type="radio" name="ntStatus" value="" name="ntStatus" required> 아니오 </td>
                </tr>
                <tr>
                    <td width="150"> <span style="color: orange;"><b>(*)</b></span> 작성자 </td>
                    <td width="150"> <input type="text" id="writer" name="ntWriter" size="30" required></td>
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
                    <td colspan="4"> <button type="button"><b>파일선택</b></button> 
                    ※ 첨부파일 당 최대 5MB까지 업로드 가능하며, 최대 5개까지 등록할 수 있습니다. </td>
                </tr>
            </tbody>
        </table>
        <button onclick="history.back(-1)">취소</button>
        <button>저장</button>
    </form>

</body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 등록 창에서 현재 날짜 기본 지정
	$("#regDate").val(new Date().toISOString().substring(0, 10));
	
}); 

</script>
</html>