<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="kr.co.xicom.cmmn.web.EgovWebUtil" %>
<%@ page import="kr.co.xicom.cmmn.web.EgovProperties" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    String uploadPath = "";
    uploadPath = EgovWebUtil.nvl(EgovProperties.getProperty("UploadPath").toString().trim()).equals("") ? "upload" : EgovProperties.getProperty("UploadPath").toString();
%>

<head>
    <script>
        function getCookie(name) {
            var cookieName = name + "=";
            var i = 0;
            while (i <= document.cookie.length) {
                var c = (i + cookieName.length);
                if (document.cookie.substring(i, c) == cookieName) {
                    if ((lastCharCookie = document.cookie.indexOf(";", c)) == -1) lastCharCookie = document.cookie.length;
                    return encodeURI(document.cookie.substring(c, lastCharCookie));
                }

                i = document.cookie.indexOf(" ", i) + 1
                if (i == 0) break;
            }
            return "";
        }

        function setCookie(name, value, expire) {
            var today = new Date();
            today.setDate(today.getDate() + expire);
            document.cookie = name + "=" + encodeURI(value) + "; expires=" + today.toGMTString() + "; path=/;";
        }

    </script>
    <%-- inc에 추가--%>
    <%--	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/front/reset.css" />--%>
    <%--	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/front/common.css" />--%>
    <%--	<script type="text/javascript" src="${pageContext.request.contextPath }/js/front/jquery-2.2.2.min.js"></script>--%>
    <%--	<script type="text/javascript" src="${pageContext.request.contextPath }/js/common/common.js"></script>--%>

</head>
<style>
    .ri-earth-line:before {
        content: url('https://api.iconify.design/ri/earth-line.svg');
        color: #716eb7;
    }
    .english-wrap{
        padding: 1px 10px;
        border: 1px solid #716eb7;
        border-radius: 18px;
        width: 43px;
        text-align: left;
        color: #716eb7;
        margin-top: 3px;
        margin-left: 10px;
    }
    @media (max-width: 1181px) {
        .english-wrap {
            padding: 1px 4px;
            border: 1px solid #716eb7;
            border-radius: 18px;
            width: 47px;
            color: #716eb7;
            margin-top: 2px;
            margin-left: 2px;
        }
    }
    @media (max-width: 768px) {
        .english-wrap {
            padding: 0px 4px;
            border: 1px solid #716eb7;
            border-radius: 18px;
            width: 41px;
            color: #716eb7;
            margin-top: 1px;
            margin-left: -14px;
        }
    }
</style>
<header class="gnb-container">
    <div class="gnb-wrap">
        <div class="logo-wrap">
            <a href="<c:url value="/main/index.do"/>">
                <img class="logo" src="${pageContext.request.contextPath}/images/common/logo.png" alt="중소벤처기업부"/></a>
        </div>
        <%-- 23.01.18 DO 메뉴 구성 변경 --%>
        <nav class="nav-wrap">
            <div class="wrapper">
                <a class="font18 menu" href="<c:url value="/front/guide/background.do"/>">납품대금 연동제란?</a>
                <div class="submenu">
                    <%-- 2024-01-08 중기부 요청으로 인사말 메뉴 제거
                    <a href="<c:url value="/front/guide/greeting.do"/>" class="">인사말</a>
                    --%>
                    <a href="<c:url value="/front/guide/background.do"/>">추진경과</a>
                    <a href="<c:url value="/front/guide/concept.do"/>">개념</a>
                    <%-- 2024-01-08 중기부 요청으로 걸어온 발자취 메뉴 제거
                    <a href="<c:url value="/front/guide/trace.do"/>">걸어온 발자취</a>
                    --%>
                    <a href="<c:url value="/front/guide/ordinance.do"/>">관련 법령</a>
                    <a href="<c:url value="/front/guide/statistics.do"/>">시범운영 분석 결과</a>
                </div>
            </div>
            <div class="wrapper">
                <a class="font18 menu" href="${pageContext.request.contextPath}/join/process/info.do">납품대금 연동제 도입하기</a>
                <div class="submenu">
                    <a href="<c:url value="/join/ready.do"/>">도입 준비하기</a>
                    <a href="<c:url value="/join/process/info.do"/>">연동 절차 알아보기</a>
                    <a href="<c:url value="/join/ex/list.do"/>">연동표 작성 예시 보기</a>
                    <a href="<c:url value="/join/notice.do"/>">납품대금 연동 관련 유의사항</a>
                    <a href="<c:url value="/join/agreeMain.do"/>">연동표 작성하기</a>
                    <a href="<c:url value="/join/contract.do"/>">표준 미연동계약서 작성하기</a>
                    <a href="<c:url value="/join/priceInfo.do"/>">원재료 가격정보 제공 사이트</a>
                </div>
            </div>
            <div class="wrapper">
                <a class="font18 menu" href="${pageContext.request.contextPath}/join/concept.do">동행기업</a>
                <div class="submenu">
                    <a href="<c:url value="/join/concept.do"/>">제도 설명</a>
                    <a href="<c:url value="/front/guide/company/list.do"/>">참여기업 현황</a>
                    <%-- 2024-01-08 중기부 요청으로 동행기업 신청 메뉴 제거
                    <a href="<c:url value="/join/joinMain.do"/>">동행기업 신청</a>
                    --%>
                    <a href="<c:url value="/join/perf/main.do"/>">동행기업 실적 제출</a>
                </div>
            </div>
            <div class="wrapper">
                <a class="font18 menu" href="<c:url value="/front/board/11/list.do"/>">소통·상담</a>
                <div class="submenu" style="left: -65px;">
                    <a href="<c:url value="/front/board/11/list.do"/>">공지사항</a>
                    <a href="<c:url value="/front/board/ready/list.do"/>">카드뉴스</a>
                    <a href="<c:url value="/front/board/7/list.do"/>">자주 묻는 질문</a>
                    <a href="<c:url value="/front/qna/main.do"/>">상담하기</a>
                    <a href="<c:url value="/front/report.do"/>">불공정거래신고하기</a>
                    <%--                    <c:if test="${sessionId eq 'admin' }">--%>
                    <%--                    <a href="<c:url value="/front/consulting/apply.do"/>">컨설팅 신청</a>--%>
                    <%--                    <a href="<c:url value="/front/consulting/confirm.do"/>">컨설팅 신청 확인</a--%>
                    <%--                    </c:if>--%>
                </div>
            </div>
        </nav>
        <div class="side-wrap">
            <c:if test="${sessionId eq null }">
            <a class="login font14 point2-text inline-focus" tabindex="0"
               href="${pageContext.request.contextPath}/main/login.do">로그인</a><br>
            <a class="login font14 point2-text inline-focus" tabindex="0"
               href="${pageContext.request.contextPath}/main/mbrApply.do">담당자등록</a>
            <div class="mobile-menu" tabindex="0" onclick="mobileMenuOpen(this)">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <div class="english-wrap">
                <a href="${pageContext.request.contextPath}/en/index.do">
                    <i class="ri-earth-line"></i>
                    <span style="color: #716eb7;">EN</span>
                </a>
            </div>
        </div>
        </c:if>
        <c:if test="${sessionId ne null  && sessionId ne 'admin'}">
            <div>
                <a class="login font14 point2-text inline-focus" tabindex="0"
                   href="${pageContext.request.contextPath}/main/mem/management.do"
                >마이페이지</a>
            </div>
            <div>
                <a class="login font14 point2-text inline-focus" tabindex="0"
                   href="${pageContext.request.contextPath}/main/logout.do"
                >로그아웃</a>
            </div>
            <div class="mobile-menu" tabindex="0" onclick="mobileMenuOpen(this)">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <div class="english-wrap">
                <a href="${pageContext.request.contextPath}/en/index.do">
                    <i class="ri-earth-line"></i>
                    <span style="color: #716eb7;">EN</span>
                </a>
            </div>
        </div>
        </c:if>
        <c:if test="${sessionId eq 'admin' }">
            <div>
                <a class="login font14 point2-text inline-focus" tabindex="0"
                   href="${pageContext.request.contextPath}/admin/join/list.do"
                >관리자</a>
            </div>
            <div>
                <a class="login font14 point2-text inline-focus" tabindex="0"
                   href="${pageContext.request.contextPath}/main/logout.do"
                >로그아웃</a>
            </div>
            <div class="mobile-menu" tabindex="0" onclick="mobileMenuOpen(this)">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <div class="english-wrap">
                <a href="${pageContext.request.contextPath}/en/index.do">
                    <i class="ri-earth-line"></i>
                    <span style="color: #716eb7;">EN</span>
                </a>
            </div>
        </div>
        </c:if>
    </div>
    <div class="mobile-gnb-container">
        <div class="mobile-gnb-wrap">
            <div class="head">
                <c:if test="${sessionId eq null }">
                    <a class="login font14 point2-text inline-focus" tabindex="0"
                       href="${pageContext.request.contextPath}/main/login.do">로그인</a>
                </c:if>
                <c:if test="${sessionId ne null && sessionId ne 'admin' }">
                    <div>
                        <a class="login font14 point2-text" href="${pageContext.request.contextPath}/main/mem/management.do"
                        >마이페이지</a>
                    </div>
                    <div>
                        <a class="login font14 point2-text" href="${pageContext.request.contextPath}/main/logout.do"
                        >로그아웃</a>
                    </div>
                </c:if>
                <c:if test="${sessionId eq 'admin' }">
                    <div>
                        <a class="login font14 point2-text" href="${pageContext.request.contextPath}/admin/join/list.do"
                        >관리자 페이지</a>
                    </div>
                    <div>
                        <a class="login font14 point2-text" href="${pageContext.request.contextPath}/main/logout.do"
                        >로그아웃</a>
                    </div>
                </c:if>
            </div>
            <nav>
                <div class="menu">
                    <p onclick="menuToggleMobile(this)">납품대금 연동제란?</p>
                    <div class="toggle">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="submenu">
                        <%-- 2024-01-08 중기부 요청으로 인사말 메뉴 제거
                        <a href="<c:url value="/front/guide/greeting.do"/>" class="">인사말</a>
                        --%>
                        <a href="<c:url value="/front/guide/background.do"/>">추진경과</a>
                        <a href="<c:url value="/front/guide/concept.do"/>">개념</a>
                        <%-- 2024-01-08 중기부 요청으로 걸어온 발자취 메뉴 제거
                        <a href="<c:url value="/front/guide/trace.do"/>">걸어온 발자취</a>
                        --%>
                        <a href="<c:url value="/front/guide/company/list.do"/>">참여기업 현황</a>
                        <a href="<c:url value="/front/guide/ordinance.do"/>">관련 법령</a>
                        <a href="<c:url value="/front/guide/statistics.do"/>">시범운영 분석 결과</a>
                    </div>
                </div>
                <div class="menu">
                    <p onclick="menuToggleMobile(this)">납품대금 연동제 도입하기</p>
                    <div class="toggle">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="submenu">
                        <a href="<c:url value="/join/ready.do"/>">도입 준비하기</a>
                        <a href="<c:url value="/join/process/info.do"/>">연동 절차 알아보기</a>
                        <a href="<c:url value="/join/ex/list.do"/>">연동표 작성 예시 보기</a>
                        <a href="<c:url value="/join/notice.do"/>">납품대금 연동 관련 유의사항</a>
                        <a href="<c:url value="/join/agreeMain.do"/>">연동표 작성하기</a>
                        <a href="<c:url value="/join/contract.do"/>">표준 미연동계약서 작성하기</a>
                        <a href="<c:url value="/join/priceInfo.do"/>">원재료 가격정보 제공 사이트</a>
                    </div>
                </div>
                <div class="menu">
                    <p onclick="menuToggleMobile(this)">동행기업</p>
                    <div class="toggle">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="submenu">
                        <a href="<c:url value="/join/concept.do"/>">제도 설명</a>
                        <a href="<c:url value="/front/guide/company/list.do"/>">참여기업 현황</a>
                        <%-- 2024-01-08 중기부 요청으로 동행기업 신청 메뉴 제거
                        <a href="<c:url value="/join/joinMain.do"/>">동행기업 신청</a>
                        --%>
                        <a href="<c:url value="/join/perf/main.do"/>">동행기업 실적 제출</a>
                    </div>
                </div>
<%--                <div class="menu">--%>
<%--                    <p><a href="<c:url value="/front/material/temp.do"/>">원재료 정보</a></p>--%>
<%--                </div>--%>
<%--                <div class="menu">--%>
<%--                    <p><a href="<c:url value="/front/consulting/temp.do"/>">컨설팅 신청</a></p>--%>
<%--                </div>--%>
                <div class="menu">
                    <p onclick="menuToggleMobile(this)">소통·상담</p>
                    <div class="toggle">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="submenu">
                        <a href="<c:url value="/front/board/11/list.do"/>">공지사항</a>
                        <a href="<c:url value="/front/board/ready/list.do"/>">카드뉴스</a>
                        <a href="<c:url value="/front/board/7/list.do"/>">자주 묻는질문</a>
                        <a href="<c:url value="/front/qna/main.do"/>">상담하기</a>
                        <a href="<c:url value="/front/report.do"/>">불공정거래신고하기</a>
                    <%--                        <a href="<c:url value="/front/consulting/apply.do"/>">컨설팅 신청</a>--%>
                        <%--                        <a href="<c:url value="/front/consulting/confirm.do"/>">컨설팅 신청 확인</a>--%>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</header>