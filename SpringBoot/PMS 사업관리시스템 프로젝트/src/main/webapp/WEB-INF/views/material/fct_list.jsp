<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">시설 정보 관리</h1>
		
		<div class="dropdown">
               <form action="/material/fct/list/combo" method="get">
                 <select id= "cbbox" name="fct_nm" onchange="this.form.submit()">
	                 <option value="none" selected="selected" disabled>===시설명 목록=== </option>
	                 	<c:forEach items="${comboList}" var="combo" >
	                 <option value="${combo.fct_nm}">${combo.fct_nm} </option>
	                 	</c:forEach>
                 </select>
               </form>
            </div>
		

		<nav class="navbar bg-light">
			<div class="container-fluid">
			</div>
		</nav>
		<div class="card mb-4">
			
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#번호</th>
							<th scope="col">시설 이름</th>
							<th scope="col">시설 사용자명</th>
							<th scope="col">시설 사용 시작시간</th>
							<th scope="col">시설 사용 종료시간</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach items="${fctList}" var="facility">
							<tr>
								<td><a class= "move" href='<c:out value="${facility.idx}" />'><c:out value="${facility.idx}" /></a></td>
								<td><c:out value="${facility.fct_nm}" /></td>
								<td><c:out value="${facility.fct_user_sn}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${facility.fct_str }"/></td>
					            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${facility.fct_end }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
					<div><button id="regBtn" class="btn btn-primary" type="button">등록</button></div>
				</div>
				
					           <!-- 페이징 처리  ------------------------------------------>
                          <nav aria-label="Page navigation">
				<ul class="pagination justify-content-end">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a class="page-link"
							href="${pageMaker.startPage-1}">이 전</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button" aria-current="page">
							<a class="page-link" href="${num}">${num}</a>
						</li>
					</c:forEach>
					
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a class="page-link"
							href="${pageMaker.endPage+1}">다음</a></li>
					</c:if>
				</ul>
			</nav>

                            <!-- / 페이징 처리  -->
                            
                            <!-- 페이징 처리 위한 form 태그  ------------------------>
                            <form id = 'actionForm' action="/material/fct/list" method='get'>
                            	<input type = 'hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
                            	<input type = 'hidden' name='amount' value='${pageMaker.cri.amount }'>
                            </form>
                            <!-- / 페이징 처리 위한 form 태그  -->
		        
				<div style="height: 100vh"></div>
				<div class="card mb-4">
					<div class="card-body">When scrolling, the navigation stays at
						the top of the page. This is the end of the static navigation demo.</div>
				</div>
			</div>
</main>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log("click");
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		}); 
		
		$('.move').on('click', function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='idx' value='" + $(this).attr("href")+"'>");
			actionForm.attr("action","/material/fct/detail");
			actionForm.submit(); 
		});
		
		$("#regBtn").on("click", function(){
			self.location = "/material/fct/reg";
		});
		
	});
</script>   

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>