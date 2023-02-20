<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title>중소벤처기업부 | 상담하기</title>
</head>

<div id="content">
    <div id="board">
        <page:applyDecorator name="menu"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    소통·상담
                </li>
                <li>
                    상담하기
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700"> 상담하기</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                지방청 및 재단 담당자 번호~~
                <div class="info-link">
                    <div class="item">
                        <a href="${pageContext.request.contextPath}/front/qna/list.do">
                            <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" >
                            <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>">
                            온라인 상담 신청</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>