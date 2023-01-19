<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>

<head>
    <title>참여 기업 현황</title>
</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="guide_menu"/>
        <div class="article">
            <br>
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
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <section>
                    <div class="row">
                        <div class="col-md-12">
                            <c:forEach var="list" items="${list }" varStatus="status">
                            <div class="ico-list">
                                <div class="container-logo">
                                        <img src=""/>
                                </div>
                                <div class="corp-name">
                                    <a href="<c:url value="/front/guide/cmpDetail.do?bizNo=${list.bizNo}"/>">
                                    <span>${list.cmpNm}</span>
                                    </a>
                                </div>
                            </div>
                                </c:forEach>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>