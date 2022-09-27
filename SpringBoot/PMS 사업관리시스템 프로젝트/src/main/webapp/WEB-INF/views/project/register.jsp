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
    <h1 class = "page-header">Project Register</h1>
    </div>
    <!-- /.col-lg-12-->
  </div>
  <!-- /.row-->

  <div class = "row">
    <div class = "col-lg-12">
      <div class = "panel panel-default">
      
        <div class = "panel-heading">Project Register</div>
        <!-- /.panel-heading -->
        <div class="panel-body">
        
          <form role = "form" action="/project/register" method="post">
                          
              <div class ="form-group">
             <label>프로젝트 이름</label> <input class = "form-control" name='prjinfo_prjnm'>
             </div>
            
              <div class ="form-group">
             <label>프로젝트 기대효과</label> <input class = "form-control" name='prjinfo_ef'>
             </div> 
             
              <div class ="form-group">
             <label>프로젝트 관련업체</label> <input class = "form-control" name='prjinfo_cp'>
             </div>
            
              <div class ="form-group">
             <label>프로젝트 수행과제</label> <input class = "form-control" name='prjinfo_task'>
             </div>
             
              <div class ="form-group">
             <label>프로젝트 요청사항</label> <input class = "form-control" name='prjinfo_req'>
             </div>
             
              <div class ="form-group">
             <label>프로젝트 기대매출액</label> <input class = "form-control" name='prjinfo_sales'>
             </div>
             
              <div class ="form-group">
             <label>프로젝트 사용 툴</label> <input class = "form-control" name='prjinfo_tool'>
             </div>
              
              <div class ="form-group">
             <label>관련업체 담당자</label> <input class = "form-control" name='prjinfo_cpmanager'>
             </div>
             
              <div class ="form-group">
             <label>관련업체 연락처</label> <input class = "form-control" name='prjinfo_cptel'>
             </div>
             
              <div class ="form-group">
             <label>관련업체 팩스</label> <input class = "form-control" name='prjinfo_cpfax'>
             </div>
             

              <button type="submit" class="btn btn-default">Submit Button</button>
              <button type="reset" class="btn btn-default">Reset Button</button>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>

</html>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>  