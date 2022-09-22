<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<main>
        <div class="container-fluid px-4">
        	<!-- 제목 입력 -->
            <h1 class="mt-4 text-center">기관 정보 관리</h1>
            <ol class="breadcrumb mb-4">            
                <li class="breadcrumb-item active">기관 정보 관리</li>
                <li class="breadcrumb-item"><a href="spend">지출 관리</a></li>
            </ol>
           
            <div class="card mb-4 ">
                <form class="card-body" action="agency_insert" method="">
                    <table class="table ">
					  <thead>
					    <tr class="text-center">
					      <th scope="col">#</th>
					      <th scope="col">기관명</th>
					      <th scope="col">대표자명</th>
					      <th scope="col">기관코드번호</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider">
					  <c:forEach items="${list}" var="board">
					    <tr>
					      <th scope="row">1</th>
					      <td value="${board. }"><a href="agency_read">Mark</a></td>
					      <td>Otto</td>
					      <td>@mdo</td>
					    </tr>
						</c:forEach>
					  </tbody>
					</table>
					<input class="btn btn-primary" type="submit" value="생성" >
                </form>
            </div>
            <div style="height: 100vh"></div>
            <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
        </div>
    </main>
 

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>