<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>    

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">휴가 등록</h1>
			  <div class="panel-heading">
              		*는 필수입력 항목입니다
              </div>
					<nav class="navbar bg-light">
						<div class="container-fluid">
						</div>
					</nav>
			<div class="card mb-4">
				<form role="form" action="/human/va-register" method="post">
			      	<div class="form-group">
			      		<label>*사번</label> <input class="form-control" name='vac_sn'>
			    	</div><br>
			
			      	<div class="form-group">
			      		<label>*이름</label> <input class="form-control" name='vac_nm'>
				  	</div><br>
					
					<div class="form-group">
			            <label>휴가 시작일</label> <input placeholder="0000/00/00" class="form-control" name='vac_str'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>휴가 종료일</label> <input placeholder="0000/00/00" class="form-control" name='vac_end'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>휴가 유형</label> 
						 <select name="vac_type" >
						   <option value="none">=== 선택 ===</option>
						   <option value="연차">연차</option>
						   <option value="공가">공가</option>
						   <option value="육아">육아</option>
						   <option value="기타">기타</option>
						 </select>
						
			        </div><br>
    
		        	<button type="submit" class="btn btn-primary">완료</button>
		        	<button type="reset" class="btn btn-danger" onclick="history.back(-1)" >취소</button>
				</form>
			</div>
			<div style="height: 100vh"></div>
	</div>
</main>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>