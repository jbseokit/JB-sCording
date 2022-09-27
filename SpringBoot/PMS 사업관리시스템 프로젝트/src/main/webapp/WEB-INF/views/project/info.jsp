<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
   <%@ include file="/WEB-INF/views/includes/prj_header.jsp" %>
</head>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="quthor" content="">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<!-- <div class = "row">
  <div class = "col-lg-12">
    <h1 class = "page-header">Tables</h1>
    </div>
    /.col-lg-12
  </div>
  /.row -->

  
      <div class = "panel panel-default">
        <div class = "panel-heading">
        <button id = 'regBtn' type="button" class="btn btn-primary btn" onclick="location.href='/project/register'">프로젝트등록</button>
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
          <table class = "table table-scripted table-bordered table-hover">
            <thead>
              <tr>
                <th>#No</th>
                <th>프로젝트 이름</th>
                <th>프로젝트 기대효과</th>
                <th>프로젝트 관련업체</th>
                <th>프로젝트 수행과제</th>
                <th>프로젝트 요청사항</th>
                <th>프로젝트 기대매출액</th>
                <th>프로젝트 사용툴</th>
                <th>관련업체 담당자</th>
                <th>관련업체 연락처</th>
                <th>관련업체 팩스</th>
              </tr>
            </thead>
            
            <c:forEach items="${info}" var="project">
            <tr>
             <td><c:out value="${project.idx}" /></td>
             <td><c:out value="${project.prjinfo_prjnm}" /></td>
             <td><c:out value="${project.prjinfo_ef}" /></td>
             <td><c:out value="${project.prjinfo_cp}" /></td>
             <td><c:out value="${project.prjinfo_task}" /></td>
             <td><c:out value="${project.prjinfo_req}" /></td>
             <td><c:out value="${project.prjinfo_sales}" /></td>
             <td><c:out value="${project.prjinfo_tool}" /></td>
             <td><c:out value="${project.prjinfo_cpmanager}" /></td>
             <td><c:out value="${project.prjinfo_cptel}" /></td>
             <td><c:out value="${project.prjinfo_cpfax}" /></td>
            </c:forEach>
          		</table>
          
        		<div class='pull-right'>
           		
        		  <nav aria-label="Page navigation example">
					  <ul class="pagination">
					  	<c:if test="${pageMaker.prev }">
					    	<li class="page-item"><a class="page-link" href="${pageMaker.startPage -1}">Previous</a></li>
					    </c:if>
					    
					    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage }">
					    	<li class="page-item"><a class='page-link ${pageMaker.cri.pageNum == num ? "active":"" }/>' href="${num}">${num}</a></li>
					    </c:forEach>
					    
					    <c:if test="${pageMaker.next }">
					    	<li class="page-item"><a class="page-link" href="#">Next</a></li>
					  	</c:if>
					  </ul>
				</nav>
					        		
        		
              </div>
     	 <form id = 'actionForm' action="/project/info" method ='get'>
	         <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
	         <input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
        </form>
      </div>
    </div>
     
     <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <!-- /.row -->
    <!-- JavaScript Bundle with Popper -->
    <script type="text/javascript">
    $(document).ready(function() {
    	  
    	  var result = '<c:out value="${result}"/>';
    	  
    	  checkModal(result);
    	  
    	  history.replaceState({},null,null);
    	  
    	  function checkModal(result) {
    		  
    		  if (result === '' || history.state) {
    			  return;
    		  }
    		  
    		  if (parseInt(result) > 0) {
    			 $(".modal-body").html(
    					 "게시글 " + parseInt(result) + " 번이 등록되었습니다."); 
    			 
    		  }
    		  
    		  $("#myModal").modal("show");
    	  }
    	  
    	  $("#regBtn").on("click", function() {
    		  
    		  self.location = "/project/register";
    	  
    	  });
    	  
    	  var actionForm = $("#actionForm");
    	  
    	  $(".page-link").on("click",function(e) {
    		
    		  e.preventDefault();
    		  
    		  console.log('click');
    		  
    		  actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    		  actionForm.submit();
    		  
    	  });
      });
    
    $(".move").on("click", function(e){
    	
    	e.preventDefault();
    	actionForm.append("<input type='hidden' name='idx' value='"+ $(this).attr("href")+"'>");
    	actionForm.attr("action","/project/get");
    	actionForm.submit();
    });
      </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  </body>

</html>



<%@ include file="/WEB-INF/views/includes/footer.jsp"%>