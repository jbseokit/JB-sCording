<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">사원 정보 수정</h1>

		<nav class="navbar bg-light">
			<div class="container-fluid"></div>
		</nav>
		<div class="card mb-2">
			<form role="form" action="/human/hr-modify" method="post">

				<div class="panel-heading">*는 필수입력 항목입니다</div>
				<div class="form-group">
					<label>*사번</label> <input class="form-control" name='mbr_sn'
						value='${human.mbr_sn}' readonly>
				</div>
				<br>

				<div class="form-group">
					<label>*이름</label> <input class="form-control" name='mbr_nm'
						value='${human.mbr_nm}' readonly>
				</div>
				<br>

				<div class="form-group">
					<label>사내번호</label> <input class="form-control" name='mbr_tel'
						value='${human.mbr_tel}' readonly>
				</div>
				<br>

				<div class="form-group">
					<label>*전화번호</label> <input class="form-control" name='mbr_phone'
						value='${human.mbr_phone}'>
				</div>
				<br>

				<div class="form-group">
					<label>이메일</label> <input class="form-control" name='mbr_em'
						value='${human.mbr_em}'>
				</div>
				<br>

				<div class="form-group">
					<label>*주소</label> <input class="form-control" name='mbr_addr_bx'
						value='${human.mbr_addr_bx}'>
				</div>
				<br>

				<div class="form-group">
					<label>상세주소</label> <input class="form-control" name='mbr_addr_dtl'
						value='${human.mbr_addr_dtl}'>
				</div>
				<br>

				<div class="form-group">
					<label>*우편번호</label> <input class="form-control"
						name='mbr_addr_post' value='${human.mbr_addr_post}'>
				</div>
				<br>

				<div class="form-group">
					<label>*부서번호</label> <input class="form-control" name='mbr_dep_cd'
						value='${human.mbr_dep_cd}'>
				</div>
				<br>

				<div class="form-group">
					<label>입사일</label> <input class="form-control" name='mbr_hired_d'
						value='<fmt:formatDate pattern="yyyy/MM/dd" value="${human.mbr_hired_d}" />'
						readonly>
				</div>
				<br>

				<div class="form-group">
					<label>*아이디</label> <input class="form-control" name='mbr_id'
						value='${human.mbr_id}' readonly>
				</div>
				<br>

				<div class="form-group">
					<label>*비밀번호</label> <input class="form-control" name='mbr_pw'
						value='${human.mbr_pw}'>
				</div>
				<br>

				<div class="form-group">
					<label>직급코드</label> <input class="form-control" name='mbr_cls_cd'
						value='${human.mbr_cls_cd}'>
				</div>
				<br>
				<div>
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="reset" class="btn btn-danger"
						onclick="history.back(-1)">취소</button>
				</div>
			</form>
		</div>
	</div>
</main>



<%@ include file="/WEB-INF/views/includes/footer.jsp"%>