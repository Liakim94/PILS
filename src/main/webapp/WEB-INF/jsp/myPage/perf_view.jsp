<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <title>중소벤처기업부 | 동행기업 실적 제출</title>
</head>
<style>
    .line-wrap .file {
        font-size: 14px;
        color: #333;
        display: table-cell;
        min-height: 30px;
        line-height: 1.2;
        vertical-align: middle;
        padding: 5px 20px;
        border: 1px solid #ccc;
    }
    .ul{
        margin-left: 9px;
        margin-top: 13px;
    }
    @media (max-width: 1024px) {
        .content .write-container .line-wrap {
            flex-wrap: inherit !important;
        }
    }
</style>
<script>
    function deleteMem() {
        if (confirm("정말 삭제하시겠습니까?")) {
            $("#frmDelete").submit();
        } else {
            return false;
        }
    }
</script>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_myPage"/>
        <form:form modelAttribute="frmDelete" method="POST" action="delete.do">
                <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    마이페이지
                </li>
                <li>
                    동행기업 실적 제출
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 실적 제출</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="company-write" class="content">
                <input type="hidden" value="${rs.seq}" name="seq"/>
                <div class="write-container">
                    <div class="line-wrap">
                            <div class="label" style="width:202px;">
                                (위탁)기업명
                            </div>
                            <div class="input-wrap">
                                ${rs.cmp_nm}
                            </div>
                    </div>
                    <div class="line-wrap">
                            <div class="label" style="width:202px;">
                                연동 계약 기간
                            </div>
                            <div class="input-wrap">
                                <td>
                                    ${rs.cntr_pd}
                            </div>
                        </div>
                    <div class="line-wrap">
                            <div class="label"style="width:202px;">
                                연동약정 계약 건 수(총합)
                            </div>
                            <div class="input-wrap">
                                ${rs.cntr_numb}
                            </div>
                    </div>
                    <div class="line-wrap">
                            <div class="label"style="width:202px;">
                                연동 약정체결 (수탁)기업 수
                            </div>
                            <div class="input-wrap">
                                ${rs.cmp_numb}
                            </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label" style="width:192px;">연동표</div>
                        <ul class="ul">
                            <c:if test="${rs.intrlck ne null && rs.intrlck ne ''}">
                                <a href="<c:url value="${FileUploadController.makeDownloadLink(rs.intrlck)}"/>"
                                class="file"  download="<c:out value="${rs.intrlck_file_nm}"/>">
                                <c:out value="${rs.intrlck_file_nm}"/>
                                </a>
                            </c:if>
                        </ul>
                    </div>
                    <div class="line-wrap">
                        <div class="label" style="width:192px;">변동표</div>
                        <ul class="ul">
                            <c:if test="${rs.change ne null && rs.change ne ''}">
                                <a href="<c:url value="${FileUploadController.makeDownloadLink(rs.change)}"/>"
                                 class="file" download="<c:out value="${rs.change_file_nm}"/>">
                                    <c:out value="${rs.change_file_nm}"/>
                                </a>
                            </c:if>
                        </ul>
                    </div>
                    <div class="line-wrap">
                        <div class="label" style="width:192px;">연동실적</div>
                        <ul class="ul">
                            <c:if test="${rs.intrlck_perf ne null && rs.intrlck_perf ne ''}">
                                <a href="<c:url value="${FileUploadController.makeDownloadLink(rs.intrlck_perf)}"/>"
                                   class="file" download="<c:out value="${rs.intrlck_perf_file_nm}"/>">
                                    <c:out value="${rs.intrlck_perf_file_nm}"/>
                                </a>
                            </c:if>
                        </ul>
                    </div>
                    <div class="line-wrap">
                        <div class="label" style="width:192px;">기타</div>
                        <ul class="ul">
                            <c:if test="${rs.etc ne null && rs.etc ne ''}">
                                <a href="<c:url value="${FileUploadController.makeDownloadLink(rs.etc)}"/>"
                                   class="file" download="<c:out value="${rs.etc_file_nm}"/>">
                                    <c:out value="${rs.etc_file_nm}"/>
                                </a>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
            </form:form>
            <div class="write-bottom">
                <a href="${pageContext.request.contextPath}/main/perf/edit.do?seq=${rs.seq}" class="submit">수정</a>
                <a onclick="javascript:deleteMem();return false;" class="submit">삭제</a>
                <a href="${pageContext.request.contextPath}/main/perf/list.do" class="back">취소</a>
            </div>
        </div>
    </div>
</div>
