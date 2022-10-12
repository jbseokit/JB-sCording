<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<main>
    <div>
        <h2>공지사항</h2>
        <!-- 검색기능 -->
        <%--         <form id="searchForm" class="d-flex" action="/board/noticelist"
            method="get">
            <select name="type" class="form-select me-2"
                aria-label="Default select example">
                <option value="TCW"
                    ${pageMaker.cri.type eq 'TCW'?"selected":"" }>전체검색</option>
                <option value="T"
                    ${pageMaker.cri.type eq 'T'?"selected":"" }>제목</option>
                <option value="C"
                    ${pageMaker.cri.type eq 'C'?"selected":"" }>내용</option>
                <option value="W"
                    ${pageMaker.cri.type eq 'W'?"selected":"" }>작성자</option>
            </select> <input type="text" name="keyword"
                value='${pageMaker.cri.keyword }'> <input
                type='hidden' name="pageNum"
                value='${pageMaker.cri.pageNum }'> <input
                type='hidden' name="amount"
                value='${pageMaker.cri.amount }'>
            <button class="btn btn-outline-success" type="submit">Search</button>
        </form> --%>
    </div>
    <div class="card mb-4">
        <div class="card-body">
            <form id="actionForm">
                <button type="button" onclick="self.location='regist'">글쓰기</button>
                <table class="table" border="1"
                    style="border: 1px solid; text-align: center;">
                    <thead>
                        <tr>
                            <th>상태</th>
                            <th>NO</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>최종 수정일자</th>
                        </tr>
                    </thead>
                    <tbody class="table-group-divider">
                        <c:forEach items="${noticeInfo}" var="nlist">
                            <tr>
                                <td style="color: red"><c:out
                                        value="${nlist.ntStatus}"/></td>
                                <td><c:out value="${nlist.idx}" /></td>
                                <td><a class='move' style="text-decoration: none"
                                    href='<c:out value="${nlist.idx}"/>'><c:out
                                            value="${nlist.ntTitle}" /></a></td>
                                <td><c:out
                                        value="${nlist.ntWriter}" /></td>
                                <td><fmt:formatDate
                                        value="${nlist.ntRegDate}"
                                        pattern="yyyy-MM-dd " /></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </form>

            <!-- 페이징 처리 -->
            <%-- <div class="pull-right">
                    <ul class="pagination justify-content-center">
                        <c:if test="${pageMaker.prev}">
                            <li class="page-item"><a
                                class="page-link"
                                href="${pageMaker.startPage -1}"
                                tabindex="-1">이전</a></li>
                        </c:if>
                        <c:forEach begin="${pageMaker.startPage}"
                            end="${pageMaker.endPage}" var="num">
                            <li
                                class='page-item ${pageMaker.cri.pageNum == num?"active":""}'>
                                <a class="page-link" href="${num}">${num}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${pageMaker.next}">
                            <li class="page-item"><a
                                class="page-link"
                                href="${pageMaker.endPage +1}"
                                tabindex="-1">다음</a></li>
                        </c:if>
                    </ul>
                </div> 
                
                 <form id="actionForm" action="/board/noticelist"
                    method="get">
                    <input type="hidden" name="pageNum"
                        value='${pageMaker.cri.pageNum}'> <input
                        type="hidden" name="amount"
                        value='${pageMaker.cri.amount}'> <input
                        type="hidden" name="type"
                        value='${pageMaker.cri.type}'> <input
                        type="hidden" name="keyword"
                        value='${pageMaker.cri.keyword}'>
                </form> --%>
        </div>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 글 번호를 따로 뽑아냄
						var result = '<c:out value="${result}"/>';

						var actionForm = $("#actionForm");

/* 						$(".page-link").on(
								"click",
								function(e) {
									e.preventDefault();

									console.log("test");

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								}); */

						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();

											var targetIDX = $(this)
													.attr("href");

											console.log(targetIDX);

											actionForm
													.append("<input type='hidden' name='idx' value='"+targetIDX+"'>'");
											actionForm.attr("action",
													"/notice/info")
													.submit();
										});
// 검색 기능
/* 						var searchForm = $("#searchForm");

						$("#searchForm button").on("click", function(e) {
							e.preventDefault();
							console.log("..check.............");

							searchForm.find("input[name='pageNum']").val(1);

							searchForm.submit();
						}); */
					});
</script>
</html>