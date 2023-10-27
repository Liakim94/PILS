<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"				prefix="fmt" 		%>
<%@ taglib uri="fx"                                             prefix="fx"         %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page"      prefix="page" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<style>
    #company-detail section .img-flex {
        flex-wrap: wrap;
    }
    #company-detail section .promotion-wrap {
        flex-wrap: wrap;
    }
    .no-video {
        border: 1px solid #eee;
        text-align: center;
        min-height: 470px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
</style>
<div id="content" class="bg-top">
    <div id="company-detail" class="pr40 pl40">
        <div class="logo-wrap">
            <img class="logo"
                 src="<c:url value="${FileUploadController.makeDownloadLink(company.logoImgPath)}"/>"
<%--                 alt="<c:out value="${company.logoFileName}"/>"--%>
                 onerror="this.src='<c:url value="/images/no-image.jpg"/>'"/>
        </div>
        <h1 class="company-name tc mb30">${company.cmpNm}</h1>
        <div class="video-container">
            <div class="video-wrap">
                <%--
                <c:set var="mainMovieUrl" value="${company.mainMovieUrl}"/>
                <c:if test="${mainMovieUrl eq null or mainMovieUrl eq ''}">
                    <c:url var="mainMovieUrl" value="/images/no-image.jpg"/>
                </c:if>
                --%>
                <c:choose>
                    <c:when test="${company.mainMovieUrl eq null or company.mainMovieUrl eq ''}">
                        <div class="no-video">
                            등록된 동영상이 없습니다.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <iframe width="560" height="315" src="<c:out value="${company.mainMovieUrl}"/>"
                                title="YouTube video player" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                allowfullscreen></iframe>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <section>
            <h1 class="title">납품대금 연동제 적용 현황</h1>
            <h4 class="info-text">
                <span class="bold">${company.cmpNm}은(는) ${fn:substring(company.appdate,0,4)}년 ${fn:substring(company.appdate,5,7)}월 부터</span>
                납품대금 연동제에 참여하여 따뜻한 연대를 실천하고 있습니다.
<%--                <span class="bold">${company.joinCmp}개</span>--%>
<%--                중소기업과 동행하고 있습니다.--%>
            </h4>
            <div class="table">
                <div class="label">
                    <h4>주요 원재료</h4>
                </div>
                <div class="value">
                    ${company.material}
                </div>
                <div class="label">
                    <h4>주요 적용 제품</h4>
                </div>
                <div class="value">
                    ${company.mainProduct}
                </div>
            </div>
        </section>
        <section>
            <h1 class="title">주요 제품</h1>
            <div class="table">
                <div class="label">
                    <h4>주요 제품</h4>
                </div>
                <div class="value">
                    <h4>${company.product}</h4>
                </div>
            </div>
            <div class="img-flex">
                <c:forEach var="prod" items="${company.prodImageList}">
                    <img class="logo"
                         src="<c:url value="${FileUploadController.makeDownloadLink(prod.savedFilepath, prod.fileName)}"/>"
                         alt="<c:out value="${prod.fileName}"/>"
                         onerror="this.src='<c:url value="/images/no-image.jpg"/>'"/>
                </c:forEach>
            </div>
        </section>
<%--        <section>--%>
<%--            <h1 class="title">기업홍보</h1>--%>
<%--            <div class="promotion-wrap">--%>
<%--                <c:if test="${company.subMovieUrl ne null and company.subMovieUrl ne ''}">--%>
<%--                    <div class="item">--%>
<%--                        <div class="video-wrap">--%>
<%--                            <iframe width="560" height="315"--%>
<%--                                    src="<c:out value="${company.subMovieUrl}"/>"--%>
<%--                                    title="YouTube video player" frameborder="0"--%>
<%--                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"--%>
<%--                                    allowfullscreen></iframe>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </c:if>--%>
<%--                <c:forEach var="prmt" items="${company.prmtImageList}">--%>
<%--                    <div class="item">--%>
<%--                        <img class="logo"--%>
<%--                             src="<c:url value="${FileUploadController.makeDownloadLink(prmt.savedFilepath, prmt.fileName)}"/>"--%>
<%--                             alt="<c:out value="${prod.fileName}"/>"--%>
<%--                             onerror="this.src='<c:url value="/images/no-image.jpg"/>'"/>--%>
<%--                    </div>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--        </section>--%>
        <section>
            <h1 class="title">기업정보</h1>
            <div class="company-info-wrap">
                <div class="logo-wrap">
                    <img class="logo"
                         src="<c:url value="${FileUploadController.makeDownloadLink(company.logoImgPath)}"/>"
                         alt="<c:out value="${company.logoFileName}"/>"
                         onerror="this.src='<c:url value="/images/no-image.jpg"/>'"/>
                </div>
                <div class="table">
                    <div class="label">
                        <h4>기업명</h4>
                    </div>
                    <div class="value">
                        <c:out value="${company.cmpNm}"/>
                    </div>
                    <div class="label">
                        <h4>대표자명</h4>
                    </div>
                    <div class="value">
                        <c:out value="${company.ceo}"/>
                    </div>
                    <div class="label">
                        <h4>설립일자</h4>
                    </div>
                    <div class="value">
                        <c:out value="${company.fdate}"/>
                    </div>
                    <div class="label">
                        <h4>업종</h4>
                    </div>
                    <div class="value">
                        <c:out value="${company.bizType}"/>
                    </div>
                    <div class="label">
                        <h4>본사 소재지</h4>
                    </div>
                    <div class="value">
                        <c:out value="${company.address}"/>
                        <c:out value="${company.address_dtl}"/>
                    </div>
                </div>
            </div>
        </section>
        <div class="button-group">
            <a href="<c:url value="/front/guide/company/list.do"/>" class="button">목록</a>
            <c:if test="${sessionId ne null && (sessionId eq 'admin' || sessionBizNo eq company.bizNo)}">
                <a href="<c:url value="/front/guide/company/edit.do?bizNo=${company.bizNo}"/>" class="button button-color-red">수정하기</a>
            </c:if>
        </div>
<%--        </c:forEach>--%>
    </div>
</div>

</body>
</html>
