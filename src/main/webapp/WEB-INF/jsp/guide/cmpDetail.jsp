<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"				prefix="fmt" 		%>
<%@ taglib uri="fx"                                             prefix="fx"         %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page"      prefix="page" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<div id="content" class="bg-top">
    <div id="company-detail" class="pr40 pl40">
<%--        <c:forEach var="list" items="${list }" varStatus="status">--%>
        <div class="logo-wrap">
            <img class="logo" src="<c:url value="/images/company/logo-temp.png"/>" alt="회사 로고">
        </div>
        <h1 class="company-name tc mb30">${list.cmpNm}</h1>
        <div class="video-container">
            <div class="video-wrap">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/93nQ2F4PdY4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
            </div>
        </div>
        <section>
            <h1 class="title">주요 생산품</h1>
            <div class="table">
                <div class="label">
                    <h4>주요 생산품</h4>
                </div>
                <div class="value">
                    <h4>${list.product}</h4>
                </div>
            </div>
            <div class="img-flex">
                <img class="logo" src="<c:url value="/images/company/product-temp1.png"/>" alt="(주)한샘 주요생산품1">
                <img class="logo" src="<c:url value="/images/company/product-temp2.png"/>" alt="(주)한샘 주요생산품2">
                <img class="logo" src="<c:url value="/images/company/product-temp3.png"/>" alt="(주)한샘 주요생산품3">
                <img class="logo" src="<c:url value="/images/company/product-temp4.png"/>" alt="(주)한샘 주요생산품4">
            </div>
        </section>
        <section>
            <h1 class="title">납품대금 연동제 적용 현황</h1>
            <h4 class="info-text"><span class="bold">${list.cmpNm}은 2022년 9월부터</span> 납품대금 연동제에 참여하며 <span class="bold">${list.joinCmp}개</span> 중소기업과 동행하고 있습니다.</h4>
            <div class="table">
                <div class="label">
                    <h4>주요 원재료</h4>
                </div>
                <div class="value">
                        ${list.material}
                </div>
                <div class="label">
                    <h4>주요 적용 제품</h4>
                </div>
                <div class="value">
                        ${list.mainProduct}
                </div>
            </div>
        </section>
        <section>
            <h1 class="title">기업홍보</h1>
            <div class="promotion-wrap">
                <div class="item">
                    <div class="video-wrap">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/93nQ2F4PdY4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    </div>
                </div>
                <div class="item">
                    <img class="logo" src="<c:url value="/images/company/logo-temp.png"/>" alt="(주)한샘 홍보이미지">
                </div>
            </div>
        </section>
        <section>
            <h1 class="title">기업정보</h1>
            <div class="company-info-wrap">
                <div class="logo-wrap">
                    <img class="logo" src="<c:url value="/images/company/logo-temp.png"/>" alt="(주)한샘 로고">
                </div>
                <div class="table">
                    <div class="label">
                        <h4>기업명</h4>
                    </div>
                    <div class="value">
                            ${list.cmpNm}
                    </div>
                    <div class="label">
                        <h4>대표자명</h4>
                    </div>
                    <div class="value">
                            ${list.ceo}
                    </div>
                    <div class="label">
                        <h4>설립일자</h4>
                    </div>
                    <div class="value">
                            ${list.fdate}
                    </div>
                    <div class="label">
                        <h4>업종</h4>
                    </div>
                    <div class="value">
                            ${list.bizType}
                    </div>
                    <div class="label">
                        <h4>본사 소재지</h4>
                    </div>
                    <div class="value">
                        ${list.address}&nbsp;${list.address_dtl}
                    </div>
                </div>
            </div>
        </section>
<%--        </c:forEach>--%>
    </div>
</div>

</body>
</html>
