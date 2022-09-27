<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    

<%@ include file="/WEB-INF/views/includes/header.jsp"%>


        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">장비 세부 정보</h3></div>
                                    <div class="card-body">
                                        
                                            
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="idx" value="${equip.idx}" readonly="readonly" />
                                                        <label>번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="eqm_nm" value="${equip.eqm_nm}" readonly="readonly" />
                                                        <label>장비명</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="eqm_use_dep" value="${equip.eqm_use_dep}" readonly="readonly" />
                                                        <label>사용 부서</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="eqm_man_dep" value="${equip.eqm_man_dep}" readonly="readonly" />
                                                        <label>관리 부서</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="eqm_num" value="${equip.eqm_num}" readonly="readonly"/>
                                                        <label>장비 번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="eqm_com" value="${equip.eqm_com}" readonly="readonly"/>
                                                        <label>제조사</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="eqm_buy_date" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${equip.eqm_buy_date}" />' readonly="readonly"/>
                                                        <label>구매 일자</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="eqm_ins_date" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${equip.eqm_ins_date}" />' readonly="readonly"/>
                                                        <label>설치 일자</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="eqm_tel" value="${equip.eqm_tel}" readonly="readonly"/>
                                                        <label>제조사 전화번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="eqm_rep_req_date" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${equip.eqm_rep_req_date}" />'  readonly="readonly"/>
                                                        <label>수리 의뢰일</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="eqm_rep_com_date" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${equip.eqm_rep_com_date}" />' readonly="readonly"/>
                                                        <label>수리 완료일</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="eqm_amount" value="${equip.eqm_amount}" readonly="readonly"/>
                                                        <label>수량</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="eqm_price" value="${equip.eqm_amount}" readonly="readonly"/>
                                                        <label>가격</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                                	<div>
                                                		<button data-oper = "modify" class="btn btn-primary" onclick = "location.href = '/material/equip/modify?idx=${equip.idx}'">수정</button>
	            										<button data-oper = "remove" class="btn btn-danger" onclick = "location.href = '/material/equip/remove?idx=${equip.idx}'">삭제</button>
	            										<button data-oper = "list" class="btn btn-primary" onclick = "location.href = '/material/equip/list'">목록</button>
	            									</div>
                                            	</div>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>

		<script type="text/javascript">
		$(document).ready(function (){
		var operForm = $("#operForm");
		
		$("button[data-oper='list']").on("click", function(e){
			e.preventDefault();
			operForm.find("#idx").remove();
			operForm.attr("action","/material/equip/list");
			operForm.submit();
		});
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action","/material/equip/modify");
			operForm.submit();
		});
		
		$("button[data-oper='remove']").on("click", function(e){
			e.preventDefault();
			operForm.attr("action","/material/equip/remove").submit();
		});
		
		});
		</script>
		
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>