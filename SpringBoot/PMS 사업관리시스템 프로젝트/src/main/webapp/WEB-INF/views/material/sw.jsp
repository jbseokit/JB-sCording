<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
	
	
	
		<main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">S/W 정보 관리</h1>
            <ol class="breadcrumb mb-4">            
                <li class="breadcrumb-item active">S/W  정보 관리</li>
                <li class="breadcrumb-item"><a href="spend">목록 관리</a></li>
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
            <div class="card mb-4">
                <form class="card-body" action="agency_insert" method="">
                    <table class="table">
					  <thead>
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">이름</th>
					      <th scope="col">사용부서</th>
					      <th scope="col">관리부서</th>
					      <th scope="col">일련번호</th>
					      <th scope="col">제조사</th>
					      <th scope="col">구매일</th>
					      <th scope="col">설치일</th>
					      <th scope="col">갱신일</th>
					      <th scope="col">업체전화번호</th>
					      <th scope="col">구매수량</th>
					      <th scope="col">구매단가</th>
					 
					    </tr>
					  </thead>
					  <c:forEach items="${materialSw}" var="sw">
					  <tbody class="table-group-divider">
					    <tr>
					      <th scope="row">1</th>
					      <td><c:out value="${sw.sw_nm}"/></td>
					      <td><c:out value="${sw.sw_use_dep_cd }"/></td>
					      <td></td>
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td></td>
					      <td></td>
					      <td></td>
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td colspan="2">Larry the Bird</td>
					      <td>@twitter</td>
					    </tr> 
					  </tbody>
					  	</c:forEach>
					</table>
					<input class="btn btn-primary" type="submit" value="생성" >
                </form>
            </div>
            <div style="height: 100vh"></div>
            <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
        </div>
    </main>
 
	

<%-- 		 	<c:forEach items="${materialSw}" var="sw">
		 		<tbody>
		 			<tr>
		 	
		 				<td><c:out value="${sw.sw_nm}"/></td>
		 				<td><c:out value="${sw.sw_use_dep_cd }"/></td>
		 				<td><c:out value="${sw.sw_man_dep_cd }"/></td>
		 				<td><c:out value="${sw.sw_num }"/></td>
		 				<td><c:out value="${sw.sw_com }"/></td>
		 				<td><c:out value="${sw.sw_buy_date }"/></td>
		 				<td><c:out value="${sw.sw_ins_date }"/></td>
		 				<td><c:out value="${sw.sw_renew_date }"/></td>
		 				<td><c:out value="${sw.sw_tel }"/></td>
		 				<td><c:out value="${sw.sw_amount }"/></td>
		 				<td><c:out value="${sw.sw_price }"/></td>
		 	 
		 				
					</tr>
		 		
		 		</tbody>
		 	
		 	</c:forEach> --%>

		
		</table>

	


	
	
	
	
	
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>