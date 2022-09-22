<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">기관 정보 입력</h1>
            <ol class="breadcrumb mb-4">
             	<li class="breadcrumb-item active">기관 정보 관리</li>
                <li class="breadcrumb-item"><a href="spend">지출 관리</a></li>
               
            </ol>
            <nav class="navbar bg-light">
			  <div class="container-fluid">
			  	<div class="dropdown">
				  <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				    Dropdown
				  </button>
				  <ul class="dropdown-menu">
				    <li><button class="dropdown-item" type="button">Action</button></li>
				    <li><button class="dropdown-item" type="button">Another action</button></li>
				    <li><button class="dropdown-item" type="button">Something else here</button></li>
				  </ul>
				</div>
			    <form class="d-flex" role="search">
			      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			      <button class="btn btn-outline-success" type="submit">Search</button>
			    </form>
			  </div>
			</nav>
             <form class="card mb-4 p-4" action="" method="">
         		<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
				  <label for="floatingPassword">인덱스</label>
				</div>				
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
				  <label for="floatingPassword">기관명</label>
				</div>			
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
				  <label for="floatingPassword">사업자등록번호</label>
				</div>	
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
				  <label for="floatingPassword">대표자명</label>
				</div>
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
				  <label for="floatingPassword">대표전화번호</label>
				</div>
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
				  <label for="floatingPassword">주소</label>
				</div>
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
				  <label for="floatingPassword">기관 홈페이지 주소</label>
				</div>
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
				  <label for="floatingPassword">담당자명</label>
				</div>
				<div class="form-floating mb-3">
				  <input type="text" class="form-control" id="floatingPassword" placeholder="Password">
				  <label for="floatingPassword">담당자 소속 부서명</label>
				</div>
				<input type="submit" value="완료" class="mb-2">
				<input type="reset" value="취소">
            </form>
            <div style="height: 100vh"></div>
            <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
        </div>
    </main>
	
	
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>