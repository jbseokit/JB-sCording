<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
	<%@ include file="/WEB-INF/views/includes/prj_header.jsp" %>
</head>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 등록창</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<div class = "row">
  <div class = "col-lg-12">
    <h1 class = "page-header">Project Read</h1>
    </div>
    <!-- /.col-lg-12-->
  </div>
  <!-- /.row-->

  <div class = "row">
    <div class = "col-lg-12">
      <div class = "panel panel-default">
      
        <div class = "panel-heading">Project Read Page</div>
        <!-- /.panel-heading -->
        <div class="panel-body">
                   
              <div class ="form-group">
             <label>Idx</label> <input class = "form-control" name='idx'
             	value='<c:out value="${project.idx }"/>' readonly="readonly">
             </div>
                               
              <div class ="form-group">
             <label>프로젝트 이름</label> <input class = "form-control" name='prjinfo_prjnm'
             	value='<c:out value="${project.prjinfo_prjnm }"/>' readonly="readonly">
             </div>
            
              <div class ="form-group">
             <label>프로젝트 기대효과</label> <input class = "form-control" name='prjinfo_ef'
             	value='<c:out value="${project.prjinfo_ef }"/>' readonly="readonly">
             </div> 
             
              <div class ="form-group">
             <label>프로젝트 관련업체</label> <input class = "form-control" name='prjinfo_cp'
             	value='<c:out value="${project.prjinfo_cp }"/>' readonly="readonly">
             </div>
            
              <div class ="form-group">
             <label>프로젝트 수행과제</label> <input class = "form-control" name='prjinfo_task'
             	value='<c:out value="${project.prjinfo_task }"/>' readonly="readonly">
             </div>
             
              <div class ="form-group">
             <label>프로젝트 요청사항</label> <input class = "form-control" name='prjinfo_req'
             	value='<c:out value="${project.prjinfo_req }"/>' readonly="readonly">
             	
             </div>
             
              <div class ="form-group">
             <label>프로젝트 기대매출액</label> <input class = "form-control" name='prjinfo_sales'
             	value='<c:out value="${project.prjinfo_sales }"/>' readonly="readonly">
             </div>
             
              <div class ="form-group">
             <label>프로젝트 사용 툴</label> <input class = "form-control" name='prjinfo_tool'
             	value='<c:out value="${project.prjinfo_tool }"/>' readonly="readonly">
             </div>
              
              <div class ="form-group">
             <label>관련업체 담당자</label> <input class = "form-control" name='prjinfo_cpmanager'
             	value='<c:out value="${project.prjinfo_cpmanager }"/>' readonly="readonly">
             </div>
             
              <div class ="form-group">
             <label>관련업체 연락처</label> <input class = "form-control" name='prjinfo_cptel'
             	value='<c:out value="${project.prjinfo_cptel }"/>' readonly="readonly">
             </div>
             
              <div class ="form-group">
             <label>관련업체 팩스</label> <input class = "form-control" name='prjinfo_cpfax'
             	value='<c:out value="${project.prjinfo_cpfax }"/>' readonly="readonly">
             </div>
             

              <button data-oper='modify' class="btn btn-default">수정</button>
              <button data-oper='info' class="btn btn-info">프로젝트 정보</button>
              
              <form id='operForm' action="/project/modify" method="get">
              	<input type = 'hidden' id='idx' name='idx' value='<c:out value="${project.idx}"/>'>
              	<input type = 'hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
              	<input type = 'hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
              </form>
             
             </div> 
             <!-- end panel-body --> 
             
           </div> 
           <!-- end panel-body -->    
      </div>
      <!-- end panel -->
    </div>
    <!-- /.row -->
    <!-- JavaScript Bundle with Popper -->
    <script type="text/javascript">
    $(document).ready(function() {
    	
    	var operForm = $("#operForm");
    	
    	$("button[data-oper='modify']").on("click", function(e){
    		
    		operForm.attr("action", "/project/modify").submit();
    	});
    	
    	
    	$("button[data-oper='info']").on("click", function(e){
    		
    		operForm.find("#idx").remove();
    		operForm.attr("action","/project/info")
    		operForm.submit();
    	});
    });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>

</html>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>  