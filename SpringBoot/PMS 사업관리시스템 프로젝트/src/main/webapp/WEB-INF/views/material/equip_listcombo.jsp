<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%> 


<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">#번호</th>
							<th scope="col">장비명</th>
							<th scope="col">사용부서</th>
							<th scope="col">관리부서</th>
							<th scope="col">장비 일련번호</th>
							<th scope="col">제조사</th>
							<th scope="col">장비 구매날짜</th>
							<th scope="col">장비 설치날짜</th>
							<th scope="col">제조사 번호</th>
							<th scope="col">장비 수리날짜</th>
							<th scope="col">장비 수리완료날짜</th>
							<th scope="col">수량</th>
							<th scope="col">가격</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach items="${comboListPage}" var="combo">
							<tr>
								<td><a class= "move" href='<c:out value="${combo.idx}" />'><c:out value="${combo.idx}" /></a></td>
								<td><c:out value="${combo.eqm_nm}" /></td>
								<td><c:out value="${combo.eqm_use_dep}" /></td>
								<td><c:out value="${combo.eqm_man_dep}" /></td>
								<td><c:out value="${combo.eqm_num}" /></td>
								<td><c:out value="${combo.eqm_com}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${combo.eqm_buy_date }"/></td>
					            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${combo.eqm_ins_date }"/></td>
								<td><c:out value="${combo.eqm_tel}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${combo.eqm_rep_req_date }"/></td>
					            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${combo.eqm_rep_com_date }"/></td>
								<td><c:out value="${combo.eqm_amount}" /></td>
								<td><c:out value="${combo.eqm_price}" /></td>
							</tr>
						</c:forEach>
					</tbody>
					
					<div><button style="background-color: gray; border:none" id="regBtn" data-oper = "list" class="btn btn-primary" onclick = "location.href = '/material/equip/list'">목록</button></div>
				</table>






<%@ include file="/WEB-INF/views/includes/footer.jsp"%>  