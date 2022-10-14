<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세내용</title>
</head>
<body>
    <h1>공지사항 상세내용</h1>
    <form id="actionForm">
        <button type="button" onclick="self.location='list'"> 목록 </button>
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
                    <td> <input type="text" id="title" name='ntTitle' size="50" value="${noticeInfoOne.ntTitle }" required> </td>
                    <td width="150"> <span style="color: orange;"><b>(*)</b></span> 상단공지 여부 </td>
                    <td> <input type="radio" name="ntStatus" value="고정" 
                    <c:if test = "${noticeInfoOne.ntStatus eq '고정'}">checked</c:if> > 예 
                         <input type="radio" name="ntStatus" value=""
                    <c:if test = "${noticeInfoOne.ntStatus eq ''}">checked</c:if> > 아니오 </td>
                </tr>
                <tr>
                    <td width="150"> <span style="color: orange;"><b>(*)</b></span> 작성자 </td>
                    <td width="150"> <input type="text" id="writer" name="ntWriter" size="30" value="${noticeInfoOne.ntWriter }" readonly></td>
                    <td width="150"> <span style="color: orange;"><b>(*)</b></span> 작성일자 </td>
                    <td><input type="date" id="ntRegDate" readonly
                    value="<fmt:formatDate value='${noticeInfoOne.ntRegDate}' pattern='yyyy-MM-dd'/>"></td>
                </tr>
                <tr>
                    <td width="150"> <span style="color: orange;"><b>(*)</b></span> 내용 </td>
                    <td colspan="3"> <textarea cols="100%" rows="10" placeholder="${noticeInfoOne.ntContent }"></textarea> </td>
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
    </form>
</body>
<script type="text/javascript">

</script>
</html>