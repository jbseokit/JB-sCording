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
      
        <div class = "panel-heading">Project Modify Page</div>
        <!-- /.panel-heading -->
        <div class="panel-body">       
          <form role="form" action="/project/modify" method="post">
              
              <!-- 추가 -->
              <input type = 'hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
              <input type = 'hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
              	
              <div class ="form-group">
             <label>Idx</label> 
             <input class = "form-control" name='idx'
             	value='<c:out value="${project.idx }"/>' readonly="readonly">
             </div>
                               
              <div class ="form-group">
             <label>프로젝트 이름</label> 
             <input class = "form-control" name='prjinfo_prjnm'
             	value='<c:out value="${project.prjinfo_prjnm }"/>'>
             </div>
            
              <div class ="form-group">
             <label>프로젝트 기대효과</label> <input class = "form-control" name='prjinfo_ef'
             	value='<c:out value="${project.prjinfo_ef }"/>'>
             </div> 
             
              <div class ="form-group">
             <label>프로젝트 관련업체</label> <input class = "form-control" name='prjinfo_cp'
             	value='<c:out value="${project.prjinfo_cp }"/>'>
             </div>
            
              <div class ="form-group">
             <label>프로젝트 수행과제</label> <input class = "form-control" name='prjinfo_task'
             	value='<c:out value="${project.prjinfo_task }"/>'>
             </div>
             
              <div class ="form-group">
             <label>프로젝트 요청사항</label> <input class = "form-control" name='prjinfo_req'
             	value='<c:out value="${project.prjinfo_req }"/>'>
             	
             </div>
             
              <div class ="form-group">
             <label>프로젝트 기대매출액</label> <input class = "form-control" name='prjinfo_sales'
             	value='<c:out value="${project.prjinfo_sales }"/>'>
             </div>
             
              <div class ="form-group">
             <label>프로젝트 사용 툴</label> <input class = "form-control" name='prjinfo_tool'
             	value='<c:out value="${project.prjinfo_tool }"/>'>
             </div>
              
              <div class ="form-group">
             <label>관련업체 담당자</label> <input class = "form-control" name='prjinfo_cpmanager'
             	value='<c:out value="${project.prjinfo_cpmanager }"/>'>
             </div>
             
              <div class ="form-group">
             <label>관련업체 연락처</label> <input class = "form-control" name='prjinfo_cptel'
             	value='<c:out value="${project.prjinfo_cptel }"/>'>
             </div>
             
              <div class ="form-group">
             <label>관련업체 팩스</label> <input class = "form-control" name='prjinfo_cpfax'
             	value='<c:out value="${project.prjinfo_cpfax }"/>'>
             </div>
             

              <button type="submit" data-oper='modify' class="btn btn-default">수정</button>
              <button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
              <button type="submit" data-oper='info' class="btn btn-info">정보</button>	
             
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
    	
    	var formObj = $("form");
    	
    	$('button').on("click", function(e){
    		
    		e.preventDefault();
    		
    		var operation = $(this).data("oper");
    		
    		console.log(operation);
    		
    		if(operation === 'remove'){
    			formObj.attr("action", "/project/remove");
    		}else if(operation === 'info'){
    			//move to info
    			formObj.attr("action", "/project/info").attr("method","get");
    			var pageNumTag = $("input[name='pageNum']").clone();
    			var amountTag = $("input[name='amount']").clone();
    			
    			formObj.empty();
    			formObj.append(pageNumTag);
    			formObj.append(amountTag);
    			
    		}
    	
    		formObj.submit();
    			
    	 });
    });
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>

</html>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>  