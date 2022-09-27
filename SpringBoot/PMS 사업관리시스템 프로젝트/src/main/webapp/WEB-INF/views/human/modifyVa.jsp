<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">휴가 정보 수정</h1>

		<nav class="navbar bg-light">
			<div class="container-fluid"></div>
		</nav>
		<div class="card mb-2">
			<form role="form" action="/human/va-modify" method="post">
				<div>
					<button type="submit" class="btn btn-primary">수정</button>
					<button type="reset" class="btn btn-danger" onclick="history.back(-1)">취소</button>
				</div>
				<div class="form-group">
			      		<label>사번</label> <input class="form-control" name='vac_sn' value='${vacation.vac_sn}' readonly>
			    	</div><br>
			
			      	<div class="form-group">
			      		<label>이름</label> <input class="form-control" name='vac_nm' value='${vacation.vac_nm}' readonly>
				  	</div><br>
					
					<div class="form-group">
			            <label>휴가 시작일</label> <input class="form-control" name='vac_str' 
			            		value='<fmt:formatDate pattern="yyyy/MM/dd" value="${vacation.vac_str}" />' readonly> 
			        </div><br>
			        
			        <div class="form-group">
			            <label>휴가 종료일</label> <input class="form-control" name='vac_end' 
			            		value='<fmt:formatDate pattern="yyyy/MM/dd" value="${vacation.vac_end}" />'> 
			        </div><br>
			        
			        <div class="form-group">
			            <label>휴가 유형</label> <input class="form-control" name='vac_type' value='${vacation.vac_type}'>
			        </div><br>
			        
			       <%--  <div class="form-group">
			            <label>휴가 사용일</label> <input class="form-control" name='vac_cnt' value='${vacation.vac_cnt}'>
			        </div><br> --%>
			</form>
		</div>
	</div>
</main>



<%@ include file="/WEB-INF/views/includes/footer.jsp"%>