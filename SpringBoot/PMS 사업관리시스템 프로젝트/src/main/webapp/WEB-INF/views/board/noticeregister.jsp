<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">공지사항 글쓰기</h1>
            <ol class="breadcrumb mb-4">
             	<li class="breadcrumb-item active">공지사항</li>
                <li class="breadcrumb-item">글쓰기</li>
               
            </ol>
            
             <form class="card mb-4 p-4" action="/board/noticeregister" method="post">
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="POST_TITLE" name="POST_TITLE">
				  <label for="floatingPassword">제목</label>
				</div>			
				<div class="form-floating mb-3">
					<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" name="POST_CONTENT" style="height: 300px"></textarea>
	  				<label for="floatingTextarea">내용</label>
				 
				</div>	
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="floatingPassword" name="POST_WRITER">
				  <label for="floatingPassword">작성자</label>
				</div>
			
				<input type="submit" value="완료" class="btn btn-primary mb-2 btn-lg">
				<input type="button" onClick="history.back();" value="취소">
            </form>
            <div style="height: 100vh"></div>
            <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
        </div>
    </main>
	
	
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>