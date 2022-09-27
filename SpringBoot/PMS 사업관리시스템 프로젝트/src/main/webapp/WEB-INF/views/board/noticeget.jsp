<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
    
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<main>
        <div class="container-fluid px-4">
        	<!-- 해당 페이지 제목 -->
            <h1 class="mt-4">공지사항</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item">공지사항</li>
                <li class="breadcrumb-item active">글 조회</li>
            </ol>
          
            <div class="card mb-4 p-4">
             	<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="IDX" disabled value='<c:out value="${noticegettt.IDX}"/>'>
				  <label for="floatingPassword">번호</label>
				</div>				
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="POST_TITLE" disabled value='<c:out value="${noticegettt.POST_TITLE}"/>'>
				  <label for="floatingPassword">제목</label>
				</div>			
				<div class="form-floating mb-3">
				  <textarea class="form-control" id="POST_CONTENT" disabled style="height: 300px"><c:out value="${noticegettt.POST_CONTENT}"/></textarea>
				  <label for="floatingPassword">내용</label>
				</div>	
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="POST_WRITER" disabled value='<c:out value="${noticegettt.POST_WRITER}"/>'>
				  <label for="floatingPassword">작성자</label>
				</div>
			
				
				<form id="actionForm" action="/board/noticelist" method="get">
						<input type="hidden" name="pageNum" value='${cri.pageNum}'>
						<input type="hidden" name="amount" value='${cri.amount}'>
						<input type="hidden" name="IDX" value='${freegettt.IDX}'>
						<input type="hidden" name="type" value='${cri.type}'>
						<input type="hidden" name="keyword" value='${cri.keyword}'>
				</form> 

				<div class="container-fluid justify-content-end">
				
					<button type="button" class="btn btn-default listBtn">
						<a href="/board/noticelist">목록보기</a>
					</button> 
					<button type="button" class="btn btn-default btn-info modBtn">
						<a href='/board/noticemodify?IDX=<c:out value="${noticegettt.IDX}"/>'>수정하기 </a>
				 	</button> 
				</div>
            </div>
            <div style="height: 100vh"></div>
            <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
        </div>
    </main>
	
	
	
	
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>


<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	
	var actionForm = $("#actionForm");
	
	$(".listBtn").click(function(e) {
		e.preventDefault();
		actionForm.find("input[name='IDX']").remove();
		actionForm.submit();
	});
	
	$(".modBtn").click(function(e) {
		e.preventDefault();
		actionForm.attr("action", "/board/noticemodify");
		actionForm.submit();
	}); 
	
	

</script>
