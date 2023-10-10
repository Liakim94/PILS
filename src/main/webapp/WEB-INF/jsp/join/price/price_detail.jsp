<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>

<head>
    <title>중소벤처기업부 | 원재료 가격정보 제공 사이트</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>

<div id="content">
    <div id="board">
        <page:applyDecorator name="menu2"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    납품대금 연동제 도입하기
                </li>
                <li>
                    원재료 가격정보 제공 사이트
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">원재료 가격정보 제공 사이트</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <div id="company-write" class="content">

                    <!-- 컨텐츠 start -->
                    <div class="board-view-wrap01">
                        <div class="card-news">
                            <span class="card-prev"><i class="fas fa-chevron-left"></i></span>
                            <span class="card-next"><i class="fas fa-chevron-right"></i></span>
                            <div class="card-slide-container">
                                <div class="swiper-wrapper">
                                    <c:forEach var="attach" items="${attachList}">
                                        <div class="swiper-slide">
                                            <img src="<c:url value="${FileUploadController.makeDownloadLink(attach.savedFilePath, attach.fileNm)}"/>">
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="write-container">
                            <div class="line-wrap">
                                <div class="label">사이트명</div>
                                <div class="input-wrap" style="margin:5px">
                                    ${rs.title}
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">URL주소</div>
                                <div class="input-wrap" style="margin:5px">
                                    <a href="http://${rs.siteUrl}"> ${rs.siteUrl}</a>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">확인 가능 정보</div>
                                <div class="input-wrap" style="margin:5px">
                                    ${rs.chkInfo}
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">주요 특징</div>
                                <div class="input-wrap" style="margin:5px">
                                    ${rs.features}
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">유‧무료 여부</div>
                                <div class="input-wrap" style="margin:5px">
                                    ${rs.chrg}
                                </div>
                            </div>
                        </div>
                        <div class="write-bottom">
                            <a class="go-lst" href="<c:url value="/front/join/priceInfoView.do"/>">목록</a>
                        </div>
                    </div>
                    <!-- 컨텐츠 end -->
                </div>
            </div>
        </div>
    </div>
</div>
    <script>
        var cardSlide = new Swiper(".card-slide-container", {
            slidesPerView: 1,
            loop: true,
            speed: 1000,
            observer: true,
            observeParents: true,
            navigation: { // 네비게이션 설정
                nextEl: '.card-next', // 다음 버튼 클래스명
                prevEl: '.card-prev', // 이번 버튼 클래스명
            },
        });
    </script>
