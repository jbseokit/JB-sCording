<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>    

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">사원 조회</h1>
			<div>   
	        	<button data-oper = "modify" class="btn btn-primary" onclick = "location.href = '/human/hr-modify?mbr_sn=${human.mbr_sn}'">수정</button>
	            <button data-oper = "list" class="btn btn-info" onclick = "location.href = '/human/hr-list'">목록</button>
	            <button data-oper = "remove" class="btn btn-danger" onclick = "location.href = '/human/hr-remove?mbr_sn=${human.mbr_sn}'">삭제</button>
            </div><p>
			
			<div class="card mb-2">
			      	<div class="form-group">
			      		<label>사번</label> <input class="form-control" name='mbr_sn' value='${human.mbr_sn}' readonly>
			    	</div><br>
			
			      	<div class="form-group">
			      		<label>이름</label> <input class="form-control" name='mbr_nm' value='${human.mbr_nm}' readonly>
				  	</div><br>
					
					<div class="form-group">
			            <label>사내번호</label> <input class="form-control" name='mbr_tel' value='${human.mbr_tel}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>전화번호</label> <input class="form-control" name='mbr_phone' value='${human.mbr_phone}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>이메일</label> <input class="form-control" name='mbr_em' value='${human.mbr_em}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>주소</label> <input class="form-control" name='mbr_addr_bx' value='${human.mbr_addr_bx}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>상세주소</label> <input class="form-control" name='mbr_addr_dtl' value='${human.mbr_addr_dtl}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>우편번호</label> <input class="form-control" name='mbr_addr_post' value='${human.mbr_addr_post}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>부서코드</label> <input class="form-control" name='mbr_dep_cd' value='${human.mbr_dep_cd}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>입사일</label> <input class="form-control" name='mbr_hired_d' 
			            		value='<fmt:formatDate pattern="yyyy/MM/dd" value="${human.mbr_hired_d}" />' readonly> 
			        </div><br>
			        
			        <div class="form-group">
			            <label>아이디</label> <input class="form-control" name='mbr_id' value='${human.mbr_id}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>비밀번호</label> <input class="form-control" name='mbr_pw' value='${human.mbr_pw}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>직급코드</label> <input class="form-control" name='mbr_cls_cd' value='${human.mbr_cls_cd}' readonly>
			    	</div><br>  
		          	
					<form id="operForm" action="/board/modify" method="get">
			      		<input type='hidden' id='mbr_sn' name='mbr_sn' value='${human.mbr_sn}'>
						<input type='hidden' name='pageNum' value='${cri.pageNum}'>
						<input type='hidden' name='amount' value='${cri.amount}'>
			      	</form>
			</div>
		
			<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">ㄹㅇ 삭제?</h4>
						</div>
						<div class="modal-body">삭제 완료</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">확인</button>
							<!-- <button type="button" class="btn btn-primary">Save
								changes</button> -->
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
		
		<div style="height: 5vh"> </div>
	</div>
</main>

<script type="text/javascript">
	$(document).ready(function (){
		var operForm = $("#operForm");
		
		$("button[data-oper='list']").on("click", function(e){
			e.preventDefault();
			operForm.find("#mbr_sn").remove();
			operForm.attr("action","/human/hr-list");
			operForm.submit();
		});
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action","/human/modifyHr");
			operForm.submit();
		});
		
		$("button[data-oper='remove']").on("click", function(e){
			e.preventDefault();
			operForm.attr("action","/human/hr-remove").submit();
		});
		
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		function checkModal(result) {
			if(result === ''){
				return; 
			}
			
			$(".modal-body").html(result + "님의 정보가 삭제되었습니다.");
			$("#myModal").modal("show");
		}
	});
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>