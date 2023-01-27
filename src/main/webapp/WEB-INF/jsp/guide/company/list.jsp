<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>

<head>
    <title>참여 기업 현황</title>
</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="guide_menu"/>
        <div class="article">
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="/">홈</a></li>
                <li>
                    납품대금연동제란?
                </li>
                <li>
                    참여 기업 현황
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">참여 기업 현황</h1>
            </div>
            <div id="main">
                <!-- 컨텐츠 start -->
                <section>
                    <div class="company-list-container">
                        <c:forEach var="company" items="${list }" varStatus="status">
                            <div class="list-item">
                                <a href="<c:url value="/front/guide/company/details.do?bizNo=${company.bizNo}"/>">
                                    <div class="list-wrapper">
                                        <div class="img-wrap">
                                            <img src="<c:url value="${FileUploadController.makeDownloadLink(company.logoImgPath)}"/>"
                                                 alt="<c:out value="${company.cmpNm}"/>"
                                                 onerror="this.src='<c:url value="/images/no-image.jpg"/>'"/>
                                        </div>
                                        <p class="company-name">${company.cmpNm}</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
</div>