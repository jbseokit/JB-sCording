<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">인적 정보 관리</h1>
		
		<nav class="navbar bg-light">
			<div class="container-fluid">
			</div>
		</nav>
		<div class="card mb-4">
			<form class="card-body" action="info_insert" method="get">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">사번</th>
							<th scope="col">이름</th>
							<th scope="col">전화번호</th>
							<th scope="col">휴대폰 번호</th>
							<th scope="col">이메일</th>
							<th scope="col">주소</th>
							<th scope="col">상세주소</th>
							<th scope="col">우편번호</th>
							<th scope="col">부서코드</th>
							<th scope="col">입사일</th>
							<th scope="col">아이디</th>
							<th scope="col">비밀번호</th>
							<th scope="col">직급코드</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach items="${humanInfo}" var="info">
							<tr>
								<td><c:out value="${info.idx}" /></td>
								<td><c:out value="${info.mbr_sn}" /></td>
								<td><c:out value="${info.mbr_nm}" /></td>
								<td><c:out value="${info.mbr_tel}" /></td>
								<td><c:out value="${info.mbr_phone}" /></td>
								<td><c:out value="${info.mbr_em}" /></td>
								<td><c:out value="${info.mbr_addr_bx}" /></td>
								<td><c:out value="${info.mbr_addr_dtl}" /></td>
								<td><c:out value="${info.mbr_addr_post}" /></td>
								<td><c:out value="${info.mbr_dep_cd}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${info.mbr_hired_d}" /></td>
								<td><c:out value="${info.mbr_id}" /></td>
								<td><c:out value="${info.mbr_pw}" /></td>
								<td><c:out value="${info.mbr_cls_cd}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<input class="btn btn-primary" type="submit" value="생성">
			</form>
		</div>
		<div style="height: 100vh"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</div>
</main>


<%@ include file="/WEB-INF/views/includes/footer.jsp"%>