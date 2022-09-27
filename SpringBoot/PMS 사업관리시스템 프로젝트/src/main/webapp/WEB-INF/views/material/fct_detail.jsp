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
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">시설 세부 정보</h3></div>
                                    <div class="card-body">
                                        
                                            
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="idx" value="${facility.idx}" readonly="readonly" />
                                                        <label>번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="fct_nm" value="${facility.fct_nm}" readonly="readonly" />
                                                        <label>시설 이름</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="fct_user_sn" value="${facility.fct_user_sn}" readonly="readonly" />
                                                        <label>시설 사용자</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="fct_str" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${facility.fct_str}" />' readonly="readonly"/>
                                                        <label>시설 사용 일자</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <div>
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" name="fct_end" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${facility.fct_end}" />' readonly="readonly"/>
                                                        <label>시설 사용 종료 일자</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                                	<div>
	                                                	<button data-oper = "modify" class="btn btn-primary" onclick = "location.href = '/material/fct/modify?idx=${facility.idx}'">수정</button>
		            									<button data-oper = "remove" class="btn btn-danger" onclick = "location.href = '/material/fct/remove?idx=${facility.idx}'">삭제</button>
	                                                	<button data-oper = "list" class="btn btn-primary" onclick = "location.href = '/material/fct/list'">목록</button>
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
			operForm.attr("action","/material/fct/list");
			operForm.submit();
		});
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action","/material/fct/modify");
			operForm.submit();
		});
		
		$("button[data-oper='remove']").on("click", function(e){
			e.preventDefault();
			operForm.attr("action","/material/fct/remove").submit();
		});
		
		});
		</script>
		
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>