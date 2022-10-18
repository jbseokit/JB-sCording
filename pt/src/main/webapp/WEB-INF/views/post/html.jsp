<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/EgovPageLink.do?link=spt/inc/header"/>

<script type="text/javascript">
var mbrNm = '<c:out value="${mbrNm}"/> ';
</script>

<script src="${pageContext.request.contextPath}/html/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/js/spt/support/notice/noticeWrite.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/jquery/datepicker-ko.js" defer></script>

<!-- s:container -->
<div class="page_title">
    <h1>공지사항 관리</h1>
</div>

<div class="table_title">
    <h3 id="title">공지사항 등록</h3>
    <span>* 필수입력항목</span>
</div>

<form id="frm" name="frm" method="post" enctype="multipart/form-data">
<input type="hidden" id="topFix" name="topFix"/>
<input type="hidden" id="ntcSn" name="ntcSn" value="<c:out value="${notice.ntcSn}"/>"/>
<input type="hidden" id="delSnList" name="delSnList"/>
<div class="table_area">
    <table class="conTable1">
        <colgroup>
            <col width="160px">
            <col width="40%">
            <col width="160px">
            <col width="">
        </colgroup>
        <tr>
            <th class="red_dot">제목</th>
            <td><input type="text" class="W100p" id="ntcTtl" name="ntcTtl" maxlength="110" value="<c:out value="${notice.ntcTtl}"/>"></td>
            <th class="red_dot">공지일자</th>
            <td><input type="text" class="date everyDate" name="ntcDate" id="ntcDate" value="<c:out value="${notice.ntcDate}"/>"></td>
        </tr>
        <tr>
            <th class="red_dot">공지구분</th>
            <td colspan="3">
                <div class="table_radio_area">
                    <input type="radio" id="noticeFixN" name="noticeFix" value="N" ${notice.topFix == 'N' ? 'checked':'' }><label for="noticeFixN">일반</label>
                    <input type="radio" id="noticeFixY" name="noticeFix" value="Y" ${notice.topFix == 'Y' ? 'checked':'' }><label for="noticeFixY">상단 고정</label>
                </div>
            </td>
        </tr>
        <tr>
            <th class="red_dot">공지대상</th>
            <td colspan="3">
                <div class="table_radio_area">
                    <input type="radio" id="noticeUser1" name="ntcTrgt" value="NTG001" ${notice.ntcTrgt == 'NTG001' ? 'checked':'' }><label for="noticeUser1">전체</label>
                    <input type="radio" id="noticeUser2" name="ntcTrgt" value="NTG003" ${notice.ntcTrgt == 'NTG003' ? 'checked':'' }><label for="noticeUser2">학습자</label>
                    <input type="radio" id="noticeUser3" name="ntcTrgt" value="NTG002" ${notice.ntcTrgt == 'NTG002' ? 'checked':'' }><label for="noticeUser3">기관</label>
                </div>
            </td>
        </tr>
        <tr>
            <th>작성일자</th>
            <td><input type="text" name="rgtrDate" id="rgtrDate" class="W300 readonly" value="<c:out value="${notice.rgtrDt }"/>" readonly></td>
            <th>작성자</th>
            <td><input type="text" name="rgtrNm" id="rgtrNm" class="W300 readonly" value="<c:out value="${notice.rgtrNm }"/>" readonly></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td colspan="3">
                <div class="table_inputFile_area">
                    <input type="file" id="fileList" name="fileList" style="display:none;" onchange="changeFile();" accept=".pdf, .png, .jpg" multiple>
                    <button type="button" class="btnTable01 btn_grey MgR10" onclick="fileSearch();">파일 첨부</button>
                        <span>* 20MB 이하의 PNG, JPG, PDF 파일만 등록 가능합니다.</span>
                    <div class="table_inputFile_box" id="atchFileList" name="atchFileList">
                        <c:if test="${not empty fileList}">
                            <c:forEach var="file" items="${fileList}" varStatus="status">
                                <p data-value="${status.index}">
                                    <a href="${pageContext.request.contextPath}/file/${file.fileSn}/${file.srvrFileNm}">${file.orgnlFileNm}</a>
                                    <button type='button' onclick="fn_delFile1(this, ${file.fileSn})"><img src="${pageContext.request.contextPath}/images/spt/ico_redClose.png"></button>
                                </p>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <th class="red_dot">내용</th>
            <td colspan="3">
                <textarea name="ntcCn" id="ntcCn" placeholder="공지사항 내용을 입력하세요."><c:out value="${notice.ntcCn}" escapeXml="false"/></textarea>
            </td>
        </tr>
    </table>
</div>

<div class="btn_area">
    <div>
        <button type="button" class="btn01 btn_black_line" onclick="goPage('/spt/center/notice')">취소</button>
    </div>
    <div></div>
    <div>
        <button type="button" class="btn01 btn_blue" onclick="noticeSave()">등록</button>
    </div>
</div>
<!-- e:container -->
</form>
<c:import url="/EgovPageLink.do?link=spt/inc/footer"/>