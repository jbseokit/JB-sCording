<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %> <!-- 시간 -->
    
<%@include file = "../includes/header.jsp" %>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">게시판 조회</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">조회</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <!-- <form role="form" action="/board/register" method="post"> -->
      
      	<form id="operForm" action="/board/modify" method="get">
      		<input type='hidden' id='bno' name='bno' value='${board.bno}'>
			<input type='hidden' name='pageNum' value='${cri.pageNum}'>
			<input type='hidden' name='amount' value='${cri.amount}'>
      	</form>
      	
        <div class="form-group">
            <label>bno</label> <input class="form-control" name='bno' value = '${board.bno}' readonly>
        </div>
        
      	<div class="form-group">
      		<label>제 목</label>	<input class="form-control" name='title' value = '${board.title}' readonly>
    	</div>

      	<div class="form-group">
      		<label>내 용</label>	<textarea class="form-control" rows="3" name='content' readonly>${board.content}</textarea>
	  	</div>

		<div class="form-group">
            <label>작성자</label> <input class="form-control" name='writer' value = '${board.writer}' readonly>
        </div>
        
        <div class="form-group">
            <label>등록일</label> <input class="form-control" name='regdate' value = '<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>' readonly>
        </div>
        
        <div class="form-group">
            <label>수정일</label> <input class="form-control" name='updateDate' value = '<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate}"/>' readonly>
        </div>
        
          <%-- <button data-oper = "modify" class="btn btn-defalut" onclick = "location.href = '/board/modify?bno=${board.bno}'">수정</button>
          <button data-oper = "list" class="btn btn-info" onclick = "location.href = '/board/list'">목록</button>
          <button data-oper = "remove" class="btn btn-danger" onclick = "location.href = '/board/remove?bno=${board.bno}'">삭제</button> --%>
          
          <button data-oper="modify" class="btn btn-default">수정</button>
          <button data-oper="list" class="btn btn-info">목록</button>
          <button data-oper="remove" class="btn btn-danger">삭제</button>
      <!-- </form> -->

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
	$(document).ready(function (){
		var operForm = $("#operForm");
		
		$("button[data-oper='list']").on("click", function(e){
			operForm.find("#bno").remove();
			operForm.attr("action","/board/list");
			operForm.submit();
		});
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action","/board/modify");
			operForm.submit();
		});
		
		$("button[data-oper='remove']").on("click", function(e){
			operForm.attr("action","/board/remove").submit();
		});
		
	});
</script>

<%@include file = "../includes/footer.jsp"%>

