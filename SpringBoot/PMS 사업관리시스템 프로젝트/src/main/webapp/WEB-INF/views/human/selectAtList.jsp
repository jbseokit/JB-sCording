<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">출결 관리</h1>

		<div class="panel-heading">
			<button id="regBtn" type="button" class="btn btn-primary">출근 등록</button>
		</div>

		<nav class="navbar bg-light">
			<div class="container-fluid"></div>
		</nav>
		<div class="card mb-4">
			<form class="card-body" action="attend_insert" method="get">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">사번</th>
							<th scope="col">이름</th>
							<th scope="col">출근 시간</th>
							<th scope="col">퇴근 시간</th>
							<th scope="col">출장 여부</th>
							<th scope="col">출장 기간</th>
							<th scope="col">출장 지역</th>
							<th scope="col">파견 여부</th>
							<th scope="col">파견 기간</th>
							<th scope="col">파견 지역</th>
						</tr>
					</thead>

					<!-- DB정보 출력 -->
					<tbody class="table-group-divider">
						<c:forEach items="${humanAttend}" var="attend">
							<tr>
								<td><c:out value="${attend.idx}" /></td>
								<td><a class='move' href='<c:out value="${attend.atd_sn}"/>'><c:out
											value="${attend.atd_sn}" /></a></td>
								<td><c:out value="${attend.atd_nm}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
										value="${attend.atd_gw}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
										value="${attend.atd_lw}" /></td>
								<td><c:out value="${attend.atd_bt}" /></td>
								<td><c:out value="${attend.atd_bt_dt}" /></td>
								<td><c:out value="${attend.atd_bt_ct}" /></td>
								<td><c:out value="${attend.atd_dp}" /></td>
								<td><c:out value="${attend.atd_dp_dt}" /></td>
								<td><c:out value="${attend.atd_dp_ct}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>

			<!-- 페이징 처리 -->
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-end">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a class="page-link"
							href="${pageMaker.startPage-1}">이 전</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="paginate_button" aria-current="page"><a
							class="page-link" href="${num}">${num}</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a class="page-link"
							href="${pageMaker.endPage+1}">다음</a></li>
					</c:if>
				</ul>
			</nav>
		</div>

		<form id='actionForm' action="/human/at-list" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		</form>


	</div>
	<div style="height: 100vh"></div>
	<div class="card mb-4">
		<div class="card-body">When scrolling, the navigation stays at
			the top of the page. This is the end of the static navigation demo.</div>
	</div>
</main>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

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
		

		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='atd_sn' value='" + $(this).attr("href") + "'>");
			actionForm.attr('action', '/human/at');
			actionForm.submit();

		});
		
		$("#regBtn").on("click", function(e){
			self.location="/human/at-register";
		});
		
		
	});
</script>