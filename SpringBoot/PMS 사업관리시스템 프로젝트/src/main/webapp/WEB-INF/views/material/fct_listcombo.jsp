<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%> 


<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#번호</th>
							<th scope="col">시설 이름</th>
							<th scope="col">시설 사용자명</th>
							<th scope="col">시설 사용 시작시간</th>
							<th scope="col">시설 사용 종료시간</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach items="${comboListPage}" var="combo">
							<tr>
								<td><a href='<c:out value="${combo.idx}" />'><c:out value="${combo.idx}" /></a></td>
								<td><c:out value="${combo.fct_nm}" /></td>
								<td><c:out value="${combo.fct_user_sn}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${combo.fct_str }"/></td>
					            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${combo.fct_end }"/></td>
							</tr>
						</c:forEach>
					</tbody>
					<div><button style="background-color: gray; border:none" id="regBtn" data-oper = "list" class="btn btn-primary" onclick = "location.href = '/material/fct/list'">목록</button></div>
				</table>





<%@ include file="/WEB-INF/views/includes/footer.jsp"%>  