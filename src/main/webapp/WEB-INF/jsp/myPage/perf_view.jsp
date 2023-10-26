<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<head>
    <title>중소벤처기업부 | 동행기업 실적 제출</title>
    <script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>
</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_myPage"/>
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
            <div id="about" class="content">
                <div class="info-link">
                    <div class="item">
                        <a href="<c:url value="/files/(양식)납품대금 연동제 시범운영 실적 작성표.xlsx"/>" download="(양식)납품대금 연동제 시범운영 실적 작성표.xlsx">
                            <img class="hover" src="<c:url value="/images/common/download-icon2.png"/>" >
                            <img class="unhover" src="<c:url value="/images/common/download-icon.png"/>" >
                            필수 제출 양식</a>
                    </div>
                </div>
            </div>
            <div id="company-write" class="content">
                <div class="write-container">
                    <div class="line-wrap">
                            <div class="label" style="width:200px;">
                                (위탁)기업명
                            </div>
                            <div class="input-wrap non-flex">
                                ${rs.cmp_nm}
                            </div>
                    </div>
                    <div class="line-wrap">
                            <div class="label" style="width:200px;">
                                연동 계약 기간
                            </div>
                            <div class="input-wrap non-flex">
                                <td>
                                    ${rs.cntr_pd}
                            </div>
                        </div>
                    <div class="line-wrap">
                            <div class="label"style="width:200px;">
                                연동약정 계약 건 수(총합)
                            </div>
                            <div class="input-wrap non-flex">
                                ${rs.cntr_numb}
                            </div>
                    </div>
                    <div class="line-wrap">
                            <div class="label"style="width:200px;">
                                연동 약정체결 (수탁)기업 수
                            </div>
                            <div class="input-wrap non-flex">
                                ${rs.cmp_numb}
                            </div>
                    </div>
                    <div class="file-wrap">
                        <p class="label">연동표</p>
                        <ul>
                            <a href="<c:url value="${FileUploadController.makeDownloadLink(rs.intrlck_path)}"/>">
                                <c:out value="${rs.intrlck}"/>
                            </a>
                        </ul>
                    </div>
                    <div class="file-wrap">
                        <p class="label">변동표</p>
                        <ul>
                            <a href="<c:url value="${FileUploadController.makeDownloadLink(rs.change_path)}"/>">
                                <c:out value="${rs.change}"/>
                            </a>
                        </ul>
                    </div>
                    <div class="file-wrap">
                        <p class="label">연동실적</p>
                        <ul>
                            <a href="<c:url value="${FileUploadController.makeDownloadLink(rs.intrlck_perf_path)}"/>">
                                <c:out value="${rs.intrlck_perf}"/>
                            </a>
                        </ul>
                    </div>
                    <div class="file-wrap">
                        <p class="label">기타</p>
                        <ul>
                            <a href="<c:url value="${FileUploadController.makeDownloadLink(rs.etc_path)}"/>">
                                <c:out value="${rs.etc}"/>
                            </a>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="write-bottom">
                <button id="apply" class="submit" style="width:130px">등록</button>
                <a href="${pageContext.request.contextPath}/main/perf/list.do" class="back">취소</a>
            </div>
        </div>
    </div>
</div>
