<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>    

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">사원 등록</h1>
			  <div class="panel-heading">
              		*는 필수입력 항목입니다
              </div>
					<nav class="navbar bg-light">
						<div class="container-fluid">
						</div>
					</nav>
			<div class="card mb-4">
				<form role="form" action="/human/hr-register" method="post">
<!-- 			      	<div class="form-group">
			      		<label>*사번</label> <input class="form-control" name='mbr_sn'>
			    	</div><br> -->
			
			      	<div class="form-group">
			      		<label>*이름</label> <input class="form-control" name='mbr_nm'>
				  	</div><br>
					
					<div class="form-group">
			            <label>사내번호</label> <input class="form-control" name='mbr_tel'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>*전화번호</label> <input  placeholder="숫자만 입력" class="form-control" name='mbr_phone'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>이메일</label> <input class="form-control" name='mbr_em'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>*주소</label> <input class="form-control" name='mbr_addr_bx'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>상세주소</label> <input class="form-control" name='mbr_addr_dtl'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>*우편번호</label> <input placeholder="5자리" class="form-control" name='mbr_addr_post'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>*부서코드</label> <input class="form-control" name='mbr_dep_cd'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>입사일</label> <input  placeholder="0000/00/00" class="form-control" name='mbr_hired_d'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>*아이디</label> <input class="form-control" name='mbr_id'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>*비밀번호</label> <input class="form-control" name='mbr_pw'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>직급코드</label> <input class="form-control" name='mbr_cls_cd'>
			    	</div>
		        	<br>      
		        <button type="submit" class="btn btn-primary">완료</button>
		        <button type="reset" class="btn btn-danger" onclick="history.back(-1)">취소</button>
			</form>
		</div>
		<div style="height: 100vh"></div>
	</div>
</main>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>