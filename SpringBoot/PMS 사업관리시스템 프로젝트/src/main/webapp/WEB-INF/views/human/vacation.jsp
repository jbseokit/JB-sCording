<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<main class="container-fluid px-4">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">휴가 관리</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<div class="panel-body">
		<table width="100%"
			class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>사번</th>
					<th>이름</th>
					<th>휴가 시작일</th>
					<th>휴가 종료일</th>
					<th>휴가 유 형</th>
					<th>휴가 사용일</th>
				</tr>
			</thead>
	
			<!-- DB정보 출력 -->
			<c:forEach items="${humanVacation}" var="vacation">
				<tr>
					<td><c:out value="${vacation.idx}" /></td>
					<td><c:out value="${vacation.vac_sn}" /></td>
					<td><c:out value="${vacation.vac_nm}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" 
										value="${vacation.vac_str}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" 
										value="${vacation.vac_end}" /></td>
					<td><c:out value="${vacation.vac_type}" /></td>
					<td><c:out value="${vacation.vac_cnt}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</main>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>