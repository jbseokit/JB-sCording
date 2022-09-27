<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<main>
        <div class="container-fluid px-4">
        	<!-- 해당 페이지 제목 -->
            <h1 class="mt-4">자유게시판</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item">자유게시판</li>
                <li class="breadcrumb-item active">글 수정</li>
            </ol>
            
            <div class="card mb-4 p-4">       
				<form action="/board/freemodify" method="post" id="form1">
					<input type="hidden" name="pageNum" value="${cri.pageNum}">
					<input type="hidden" name="amount" value="${cri.amount}">
					<input type="hidden" name="type" value="${cri.type}">
					<input type="hidden" name="keyword" value="${cri.keyword}">					
					<div>
						<input type="hidden"  id="IDX" name="IDX" value='<c:out value="${freegettt.IDX}"/>'>
					</div>
					<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="CUM_TITLE" name="CUM_TITLE" placeholder="Password"  value='<c:out value="${freegettt.CUM_TITLE}"/>'>
					  <label>제목</label>
					</div>			
					<div class="form-floating mb-3">
						<textarea class="form-control"  id="CUM_CONTENTS" name="CUM_CONTENTS"  style="height: 300px"><c:out value="${freegettt.CUM_CONTENTS}"/></textarea>
					   <label>내용</label>
					</div>	
					<div class="form-floating mb-3">
					  <input type="text" class="form-control" id="CUM_WRITER" name="CUM_WRITER" placeholder="Password"  value='<c:out value="${freegettt.CUM_WRITER}"/>'>
					  <label>작성자</label>
					</div>
					
					<div class="container-fluid justify-content-end">
						<button data-oper="modify" class=" btn-primary mb-2 btn-lg" >수정완료</button>
						<button data-oper="list" class="btn1 btn-info mb-2 btn-lg">목록보기</button>
						<button data-oper="remove" class="btn1 btn btn-danger mb-2 btn-lg">삭제</button>
					</div>
				</form>						
			    
            </div>
            <div style="height: 100vh"></div>
            <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
        </div>
        
    </main>
	
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
		
$(document).ready(function(){
			
	var form = $("#form1");
	
	$('.btn1').click(function(e) {
		e.preventDefault();	// 기본동작 막기
		
		var operation = $(this).data("oper");
		
		console.log("btn1 click");
		
		if(operation === 'list') {
			self.location ="/board/freelist";
		}  else if(operation === 'remove') {
			form.attr("action", "/board/freeremove");
			form.attr("method", "post");
			form.submit();
		} 
	});
	
});
		
</script>
	
	
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>