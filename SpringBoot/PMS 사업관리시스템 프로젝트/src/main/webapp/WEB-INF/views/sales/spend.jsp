<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

	<main>
        <div class="container-fluid px-4">
            <h1 class="mt-4 text-center">지출 관리</h1>
            <ol class="breadcrumb mb-4">
               
                <li class="breadcrumb-item"><a href="agency">기관 정보 관리</a></li>
                 <li class="breadcrumb-item active">지출 관리</li>
            </ol>
            <div class="card mb-4">
                <form class="card-body" action="spend_insert" method="">
                    <table class="table">
					  <thead>
					    <tr class="text-center">
					      <th scope="col">#</th>
					      <th scope="col">일자</th>
					      <th scope="col">지출부서</th>
					      <th scope="col">담당자</th>
					      <th scope="col">거래처</th>
					      <th scope="col">계정과목</th>
					      <th scope="col">적요</th>
					      <th scope="col">금액</th>
					      <th scope="col">비용처리수단</th>
					      <th scope="col">메모</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider">
					    <tr>
					      <th scope="row">1</th>
					      <td>Mark</td>
					      <td>Otto</td>
					      <td>@mdo</td>
					      <td>@mdoasdfasdfashfkjasdhfk</td>
					      <td>@mdo</td>
					      <td>@mdo대구 광역시 서ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ</td>
					      <td>@mdo</td>
					      <td>@mdo</td>
					      <td>@mdoasdadasdasdasfdsvasdvlksavjlklkj</td>
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>Jacob</td>
					      <td>Thornton</td>
					      <td>@fat</td>
					      <td>@fat</td>
					      <td>@fat</td>
					      <td>@fat</td>
					      <td>@fat</td>
					      <td>@fat</td>
					      <td>@fat</td>
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td>@twitter</td>
					      <td>@twitter</td>
					      <td>@twitter</td>
					      <td>@twitter</td>
					      <td>@twitter</td>
					      <td>@twitter</td>
					      <td>@twitter</td>
					      <td>@twitter</td>
					      <td>@twitter</td>
					    </tr>
					  </tbody>
					</table>
					<input class="btn btn-primary" type="submit" value="생성">
                </form>
            </div>
            <div style="height: 100vh"></div>
            <div class="card mb-4"><div class="card-body">When scrolling, the navigation stays at the top of the page. This is the end of the static navigation demo.</div></div>
        </div>
    </main>
	
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>