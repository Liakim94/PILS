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
        width: 50px;
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
            width: 50px;
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
            width: 50px;
            color: #716eb7;
            margin-top: -2px;
            margin-left: -23px;
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
                <a class="font18 menu" href="<c:url value="/en/guide/concept.do"/>"> what is the delivery price indexation system?</a>
                <div class="submenu" style="left: 95px;">
                    <a href="<c:url value="/en/guide/concept.do"/>">Concept</a>
                    <a href="<c:url value="/en/guide/process.do"/>">Learn about the price indexation process</a>
                    <a href="<c:url value="/en/guide/notice.do"/>">Notes regarding the price indexation system</a>
                    <a href="<c:url value="/en/guide/notice.do"/>">How to Make Indexation Table like subcontract payment</a>
                    <a href="<c:url value="/en/guide/contract.do"/>">How to make stndard non-indexation contract</a>
                    <a href="<c:url value="/en/guide/ordinance.do"/>">Related laws</a>
                </div>
            </div>
            <div class="wrapper">
                <a class="font18 menu" href="${pageContext.request.contextPath}/en/join/concept.do">Partner company</a>
                <div class="submenu">
                    <a href="<c:url value="/en/join/concept.do"/>">What is a partner company?</a>
                    <a href="<c:url value="/en/join/incentive.do"/>">Incentive offered to partner company</a>
                    <a href="<c:url value="/en/join/apply.do"/>">Partner company application</a>
                </div>
            </div>
        </nav>
        <div class="side-wrap">
            <c:if test="${sessionId eq null }">
            <a class="login font14 point2-text inline-focus" tabindex="0"
               href="${pageContext.request.contextPath}/main/login.do">LOGIN</a><br>
            <div class="mobile-menu" tabindex="0" onclick="mobileMenuOpen(this)">
                <span></span>
                <span></span>
                <span></span>
            </div>
            <div class="english-wrap">
                <a href="${pageContext.request.contextPath}/main/index.do" target="_blank">
                    <i class="ri-earth-line"></i>
                    <span style="color: #716eb7;">KOR</span>
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
                <a href="${pageContext.request.contextPath}/main/index.do">
                    <i class="ri-earth-line"></i>
                    <span style="color: #716eb7;">KOR</span>
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
                <a href="${pageContext.request.contextPath}/en/index.do" target="_blank">
                    <i class="ri-earth-line"></i>
                    <span style="color: #716eb7;">KOR</span>
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
                       href="${pageContext.request.contextPath}/main/login.do">LOGIN</a>
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
            </div>
            <nav>
                <div class="menu">
                    <p onclick="menuToggleMobile(this)">what is the delivery <br>price indexation system?</p>
                    <div class="toggle">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="submenu">
                        <a href="<c:url value="/en/guide/concept.do"/>">Concept</a>
                        <a href="<c:url value="/en/guide/process.do"/>">Learn about the price indexation process</a>
                        <a href="<c:url value="/en/guide/notice.do"/>">Notes regarding the price indexation system</a>
                        <a href="<c:url value="/en/guide/notice.do"/>">How to Make Indexation Table like subcontract payment</a>
                        <a href="<c:url value="/en/guide/contract.do"/>">How to make stndard non-indexation contract</a>
                        <a href="<c:url value="/en/guide/ordinance.do"/>">Related laws</a>
                    </div>
                </div>
                <div class="menu">
                    <p onclick="menuToggleMobile(this)">Partner company</p>
                    <div class="toggle">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="submenu">
                        <a href="<c:url value="/en/join/concept.do"/>">What is a partner company?</a>
                        <a href="<c:url value="/en/join/incentive.do"/>">Incentive offered to partner company</a>
                        <a href="<c:url value="/en/join/apply.do"/>">Partner company application</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</header>