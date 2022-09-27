<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>    

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">출결 등록</h1>
			  <div class="panel-heading">
              		*는 필수입력 항목입니다
              </div>
					<nav class="navbar bg-light">
						<div class="container-fluid">
						</div>
					</nav>
			<div class="card mb-4">
				<form role="form" action="/human/at-register" method="post">
			      	<div class="form-group">
			      		<label>*사번</label> <input class="form-control" name='atd_sn'>
			    	</div><br>
			
			      	<div class="form-group">
			      		<label>*이름</label> <input class="form-control" name='atd_nm'>
				  	</div><br>
			        
			        <div class="form-group">
			            <label>출장 여부</label><br> 
			        	<input type="radio" name="atd_bt" value="Y">Y  &nbsp;&nbsp;
			        	<input type="radio" name="atd_bt" value="N">N
			        </div><br>
			        
			        <div class="form-group">
			            <label>출장 기간</label> <input placeholder="0000/00/00 ~ 0000/00/00" class="form-control" name='atd_bt_dt'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>출장 지역</label> <input class="form-control" name='atd_bt_ct'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>파견 여부</label><br>
			            <input type="radio" name="atd_dp" value="Y">Y  &nbsp;&nbsp;
			        	<input type="radio" name="atd_dp" value="N">N
			        </div><br>
			        
			        <div class="form-group">
			            <label>파견 기간</label> <input placeholder="0000/00/00 ~ 0000/00/00" class="form-control" name='atd_dp_dt'>
			        </div><br>
			        
			        <div class="form-group">
			            <label>파견 지역</label> <input class="form-control" name='atd_dp_ct'>
			        </div><br>    
		        <button type="submit" class="btn btn-primary">완료</button>
		        <button type="reset" class="btn btn-danger" onclick="history.back(-1)">취소</button>
			</form>
		</div>
		<div style="height: 100vh"></div>
	</div>
</main>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>