<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	<main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">공지사항</h1>
            <ol class="breadcrumb mb-4">            
                <li class="breadcrumb-item active">공지사항</li>  
            </ol>
            <nav class="navbar bg-light">
			  <div class="container-fluid justify-content-end">
			   	<!-- 검색기능 -->
			    <form id="searchForm" class="d-flex"  action="/board/noticelist" method="get">
			    	<select name="type"  class="form-select me-2" aria-label="Default select example">
					  <option value="TCW" ${pageMaker.cri.type eq 'TCW'?"selected":"" }>전체검색</option>
					  <option value="T" ${pageMaker.cri.type eq 'T'?"selected":"" }>제목</option>
					  <option value="C" ${pageMaker.cri.type eq 'C'?"selected":"" }>내용</option>
					  <option value="W" ${pageMaker.cri.type eq 'W'?"selected":"" }>작성자</option>
					</select>
					<input type="text" name="keyword" value='${pageMaker.cri.keyword }'>
					<input type='hidden' name="pageNum" value='${pageMaker.cri.pageNum }'>
					<input type='hidden' name="amount" value='${pageMaker.cri.amount }'>
			        <button  class="btn btn-outline-success" type="submit">Search</button>
			    </form> 
			  </div>
			</nav>
            <div class="card mb-4">
                <div class="card-body">
                    <table class="table">
					  <thead>
					   	<tr>
					      <th scope="col">번호</th>
					      <th scope="col">제목</th>
					      <th scope="col">내용</th>
					      <th scope="col">작성자</th>
					      <th scope="col">작성시간</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider">
					  	<c:forEach items="${noticelist}" var="nlist">
							<tr >
								<td>
									<c:out value="${nlist.IDX}"/>
								</td>
								<td><a class='move' href='<c:out value="${nlist.IDX}"/>'><c:out value="${nlist.POST_TITLE}"/></a></td>
								<td><c:out value="${nlist.POST_CONTENT}"/></td>
								<td><c:out value="${nlist.POST_WRITER}"/></td>
								<td>
									<fmt:formatDate value="${nlist.POST_REGISTER_TIME}" pattern="yyyy.MM.dd HH:mm "/>
								</td>
							</tr>
						</c:forEach>		   
					  </tbody>
					</table>
					
						<div class="pull-right">
						<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev}">
							 <li class="page-item">
						     	<a class="page-link" href="${pageMaker.startPage -1}" tabindex="-1">이전</a>
						   	 </li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
							<li class='page-item ${pageMaker.cri.pageNum == num?"active":""}'>
								<a class="page-link" href="${num}">${num}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="page-item">
								<a class="page-link" href="${pageMaker.endPage +1}" tabindex="-1">다음</a>
							</li>
						</c:if>	
						</ul>
					</div>
					
					<form id="actionForm" action="/board/noticelist" method="get">
						<input type="hidden" name="pageNum" value='${pageMaker.cri.pageNum}'>
						<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
						<input type="hidden" name="type" value='${pageMaker.cri.type}'>
						<input type="hidden" name="keyword" value='${pageMaker.cri.keyword}'>
					</form> 
					
					<button type="button" class="btn btn-primary " onclick="self.location='	noticeregister'">글쓰기</button>
                </div>
            </div>
            <div style="height: 100vh"></div>
            <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
        </div>
    </main>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>



<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() {
	// 글 번호를 따로 뽑아냄
	var result = '<c:out value="${result}"/>';

	
	var actionForm = $("#actionForm");
		
		$(".page-link").on("click", function(e){
			e.preventDefault();
			
			console.log("test");
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
	$(".move").on("click", function(e) {
		e.preventDefault();
		
		var targetIDX = $(this).attr("href");
		
		console.log(targetIDX);
		
		actionForm.append("<input type='hidden' name='IDX' value='"+targetIDX+"'>'");
		actionForm.attr("action", "/board/noticeget").submit();
	});
	
	
	var searchForm = $("#searchForm");
	
	$("#searchForm button").on("click", function(e) {
		e.preventDefault();
		console.log("..check.............");
		
		searchForm.find("input[name='pageNum']").val(1);
		
		searchForm.submit();
	});
});

</script> 