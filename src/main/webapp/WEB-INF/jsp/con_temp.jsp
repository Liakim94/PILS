<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title>중소벤처기업부 | 컨설팅 신청</title>
</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_consulting"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    컨설팅 신청
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">컨설팅 신청</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="agreement" class="content">
                <!-- 컨텐츠 start -->
                <p class="info-text">
                    납품대금 연동 약정 체결에 어려움을 겪는 기업을 대상으로 전문 컨설팅을 제공할 예정입니다.<br>
                    2023년 6월 업데이트 예정입니다.<br>
                </p>
                <p class="info-text">
                    <img src="<c:url value="/images/common/tempImage.png"/>">
                </p>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

