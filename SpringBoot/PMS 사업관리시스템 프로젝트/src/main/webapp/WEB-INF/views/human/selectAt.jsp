<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>    

<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">퇴근</h1>
			<div>   
	        	<button data-oper = "modify" class="btn btn-primary" onclick = "location.href = '/human/at-modify?atd_sn=${attend.atd_sn}'">퇴근</button>
	            <button data-oper = "list" class="btn btn-info" onclick = "location.href = '/human/at-list'">목록</button>
            </div><p>
			
			<div class="card mb-2">
			      	<div class="form-group">
			      		<label>사번</label> <input  class="form-control" name='atd_sn' value='${attend.atd_sn}' readonly>
			    	</div><br>
			
			      	<div class="form-group">
			      		<label>이름</label> <input  class="form-control" name='atd_nm' value='${attend.atd_nm}' readonly>
				  	</div><br>
					
					<div class="form-group">
			            <label>출장 여부(Y/N)</label> <input  class="form-control" name='atd_bt' value='${attend.atd_bt}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>출장 기간</label> <input  class="form-control" name='atd_bt_dt' value='${attend.atd_bt_dt}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>출장 지역</label> <input  class="form-control" name='atd_bt_ct' value='${attend.atd_bt_ct}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>파견 여부(Y/N)</label> <input  class="form-control" name='atd_dp' value='${attend.atd_dp}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>파견 기간</label> <input  class="form-control" name='atd_dp_dt' value='${attend.atd_dp_dt}' readonly>
			        </div><br>
			        
			        <div class="form-group">
			            <label>파견 지역</label> <input  class="form-control" name='atd_dp_ct' value='${attend.atd_dp_ct}' readonly>
			        </div><br>
		          	
					<form id="operForm" action="/board/modify" method="get">
			      		<input type='hidden' id='mbr_sn' name='mbr_sn' value='${attend.atd_sn}'>
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