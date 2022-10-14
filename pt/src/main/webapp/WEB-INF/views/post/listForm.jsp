<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
ul li { list-style-type: none; display: inline-block; margin: 3px;}
table {width: 65%; border: 1px solid; text-align: center;}
.paging {padding-left: 400px;}
a {text-decoration: none;}
a:active {
    color: orange;
}
</style>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<main>
        <h2>공지사항</h2>
        <!-- 검색기능 -->
          
    <div class="card mb-4" style="display: inline;">
        <form id="amountForm" action="/notice/list" method="get">
            <button class="ntreg" type="button"
                onclick="self.location='regist'">글쓰기</button>
            <div style="display: inline;">전체 | ${pageMaker.total}</div>
            <div style="display: inline;">
                출력 수 <select class="amount">
                    <option>선택</option>
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="30">30</option>
                </select>
            </div>
            <input type="hidden" name="pageNum">
            <input type="hidden" id="selected" name="amount">
        </form>

        <form id="searchForm" class="search" action="/notice/list"
            method="get">
            <select name="type" class="searchOption"
                style="display: inline;">
                <option value="TCW"
                    ${pageMaker.cri.type eq 'TCW'?"selected":"" }>전체검색</option>
                <option value="T"
                    ${pageMaker.cri.type eq 'T'?"selected":"" }>제목</option>
                <option value="C"
                    ${pageMaker.cri.type eq 'C'?"selected":"" }>내용</option>
                <option value="W"
                    ${pageMaker.cri.type eq 'W'?"selected":"" }>작성자</option>
            </select> <input type="text" name="keyword"
                value='${pageMaker.cri.keyword }'> <input
                type='hidden' name="pageNum"
                value='${pageMaker.cri.pageNum }'> <input
                type='hidden' name="amount"
                value='${pageMaker.cri.amount }'>
            <button type="submit">검색</button>
        </form>

        <form id="actionForm">
            <table class="table" border="1">
                <thead>
                    <tr>
                        <th>상태</th>
                        <th>NO</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>최종 수정일자</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <c:forEach items="${noticeInfo}" var="nlist">
                        <tr>
                            <td style="color: red">
                                <c:out value="${nlist.ntStatus}"/>
                            </td>
                            <td>
                                <c:out value="${nlist.idx}" />
                            </td>
                            <td>
                                <a class='move' href='<c:out value="${nlist.idx}"/>'>
                                    <c:out value="${nlist.ntTitle}" />
                                </a>
                            </td>
                            <td>
                                <c:out value="${nlist.ntWriter}" />
                            </td>
                            <td>
                                <fmt:formatDate value="${nlist.ntRegDate}" pattern="yyyy-MM-dd " />
                            </td>
                       </tr>
                   </c:forEach>
               </tbody>
            </table>
        </form>

            <!-- 페이징 처리 -->
            <div class="paging">
                <ul class="pagination justify-content-center">
                    <c:if test="${pageMaker.prev}">
                        <li>
                            <a class="page-link" href="${pageMaker.startPage -1}">이전</a>
                        </li>
                    </c:if>
                        
                    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
                        <li>
                            <a class="page-link" href="${num}">${num}</a>
                        </li>
                    </c:forEach>
                        
                    <c:if test="${pageMaker.next}">
                        <li class="page-item">
                            <a class="page-link" href="${pageMaker.endPage +1}">다음</a>
                        </li>
                    </c:if>
                </ul>
            </div>
                
            <form id="pagingForm" action="/notice/list" method="get">
               <input type="hidden"  name="pageNum" value='${pageMaker.cri.pageNum}'>
               <input type="hidden"  name="amount" value='${pageMaker.cri.amount}'>
               <input type="hidden"  name="type" value='${pageMaker.cri.type}'>
               <input type="hidden"  name="keyword" value='${pageMaker.cri.keyword}'>
            </form>
        </div>
 
</main>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// 페이징 버튼 클릭 -> 해당 페이지 이동 Form
	var pagingForm = $("#pagingForm");
	
	// 제목 클릭 -> 상세 페이지 Form
	var actionForm = $("#actionForm");
	
	// 출력 수 클릭 -> 선택된 개수만큼 출력 리스트
	var amountForm = $("#amountForm");

	// 제목 클릭 -> 상세 페이지 (콜백함수, 비동기 처리)
	$(".move").on("click", function(e) {
		
		e.preventDefault();
		
		var targetIDX = $(this).attr("href");

		actionForm.append("<input type='hidden' name='idx' value='" + targetIDX + "'>'");

		actionForm.attr("action", "/notice/info").submit();
	
	});
	
	// 페이징 버튼 클릭 시 해당 pageNum 찾아 submit
	$(".page-link").on("click", function(e) {
		
		e.preventDefault();
		
		pagingForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		pagingForm.submit();
		
	});
	
	// 출력 수 옵션 선택 시 값 가져오기
	$(".amount").change(function(e) {
		
		e.preventDefault();
		
		$("#selected").val($(this).val());
		
		amountForm.find("input[name='pageNum']").val(1);
		
		amountForm.submit();
		
	});

	// 검색 기능
 	var searchForm = $("#searchForm");

	$("#searchForm button").on("click", function(e) {
	
		e.preventDefault();

		searchForm.find("input[name='pageNum']").val(1);

		searchForm.submit();
	
	});
	
});
</script>
</html>