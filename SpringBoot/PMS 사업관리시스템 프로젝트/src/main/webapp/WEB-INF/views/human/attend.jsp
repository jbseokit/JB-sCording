<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<main class="container-fluid px-4">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">출결 관리</h1>
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
					<th>출근 시간</th>
					<th>퇴근 시간</th>
					<th>출장 여부</th>
					<th>출장 기간</th>
					<th>출장 지역</th>
					<th>파견 여부</th>
					<th>파견 기간</th>
					<th>파견 지역</th>
				</tr>
			</thead>
	
			<!-- DB정보 출력 -->
			<c:forEach items="${humanAttend}" var="attend">
				<tr>
					<td><c:out value="${attend.idx}" /></td>
					<td><c:out value="${attend.atd_sn}" /></td>
					<td><c:out value="${attend.atd_nm}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH24:MM:SS" 
										value="${attend.atd_gw}" /></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH24:MM:SS" 
										value="${attend.atd_lw}" /></td>
					<td><c:out value="${attend.atd_bt}" /></td>
					<td><c:out value="${attend.atd_bt_dt}" /></td>
					<td><c:out value="${attend.atd_bt_ct}" /></td>
					<td><c:out value="${attend.atd_dp}" /></td>
					<td><c:out value="${attend.atd_dp_dt}" /></td>
					<td><c:out value="${attend.atd_dp_ct}" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</main>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>