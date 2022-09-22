<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "../includes/header.jsp" %>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Register</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">게시판 등록</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" action="/board/register" method="post">
      	<div class="form-group">
      		<label>제 목</label>	<input class="form-control" name='title'>
    	</div>

      	<div class="form-group">
      		<label>내 용</label>	<textarea class="form-control" rows="3" name='content'></textarea>
	  	</div>

		<div class="form-group">
            <label>작성자</label> <input class="form-control" name='writer'>
        </div>
        
          <button type="submit" class="btn btn-default">등록</button>
          <button type="reset" class="btn btn-default">취소</button>
      </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<%@include file = "../includes/footer.jsp"%>