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
<header class="gnb-container">
    <div class="gnb-wrap">
        <div class="logo-wrap">
            <a href="<c:url value="/main/index.do"/>">
                <img class="logo" src="${pageContext.request.contextPath}/images/common/logo.png" alt="중소벤처기업부"/></a>
            <img class="slogan" src="${pageContext.request.contextPath}/images/common/slogan.png"
                 alt="다시 도약하는 대한민국 함께 잘사는 국민의 나라"/>
        </div>
        <%-- 23.01.18 DO 메뉴 구성 변경 --%>
        <nav class="nav-wrap">
            <div class="wrapper">
                <a class="font18 menu" href="<c:url value="/front/guide/background.do"/>">납품대금 연동제란?</a>
                <div class="submenu">
                    <a href="<c:url value="/front/guide/background.do"/>">도입배경</a>
                    <a href="<c:url value="/front/guide/concept.do"/>">개념</a>
                    <a href="<c:url value="/front/guide/trace.do"/>">걸어온 발자취</a>
                    <a href="<c:url value="/front/guide/company/list.do"/>">참여기업 현황</a>
                    <a href="<c:url value="/front/guide/ordinance.do"/>">관련 법령</a>
                    <a href="<c:url value="/front/guide/statistics.do"/>">시범운영 분석 결과</a>
                </div>
            </div>
            <div class="wrapper">
                <a class="font18 menu" href="${pageContext.request.contextPath}/join/process/info.do">납품대금 연동제 동참하기</a>
                <div class="submenu">
                    <a href="<c:url value="/join/process/info.do"/>">납품대금 연동 절차 알아보기</a>
                    <a href="<c:url value="/join/ex/temp.do"/>">실제 사례 보기</a>
                    <a href="<c:url value="/join/agreeMain.do"/>">약정서 작성하기</a>
                    <a href="<c:url value="/join/joinMain.do"/>">동행기업 신청하기</a>
                </div>
            </div>
            <div class="wrapper">
                <a class="font18 menu" href="<c:url value="/front/board/11/list.do"/>">소통마당</a>
                <div class="submenu">
                    <a href="<c:url value="/front/board/11/list.do"/>">공지사항</a>
                    <a href="<c:url value="/front/board/ready/list.do"/>">카드뉴스</a>
                    <a href="<c:url value="/front/board/7/list.do"/>">자주 묻는 질문</a>
                    <a href="<c:url value="/front/qna/list.do"/>">질의응답 게시판</a>
                    <%--                    <c:if test="${sessionId eq 'admin' }">--%>
                    <%--                    <a href="<c:url value="/front/consulting/apply.do"/>">컨설팅 신청</a>--%>
                    <%--                    <a href="<c:url value="/front/consulting/confirm.do"/>">컨설팅 신청 확인</a--%>
                    <%--                    </c:if>--%>
                </div>
            </div>
            <div class="wrapper">
                <a class="font18 menu" href="<c:url value="/front/consulting/temp.do"/>">컨설팅 신청</a>
            </div>
            <div class="wrapper">
                <a class="font18 menu" href="<c:url value="/front/material/temp.do"/>">원재료 정보</a>
            </div>
            <div class="wrapper">
                <a class="font18 menu" href="<c:url value="/front/report/temp.do"/>">신고센터</a>
            </div>
        </nav>
        <div class="side-wrap">
            <c:if test="${sessionId eq null }">
            <a class="login font14 point2-text inline-focus" tabindex="0"
               href="${pageContext.request.contextPath}/main/login.do">로그인</a>

            <div class="mobile-menu" tabindex="0" onclick="mobileMenuOpen(this)">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
        </c:if>
        <c:if test="${sessionId ne null  && sessionId ne 'admin'}">
            <div>
                <a class="login font14 point2-text inline-focus" tabindex="0"
                   href="${pageContext.request.contextPath}/main/myPage.do"
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
            </div>
        </c:if>
        <c:if test="${sessionId eq 'admin' }">
            <div>
                <a class="login font14 point2-text inline-focus" tabindex="0"
                   href="${pageContext.request.contextPath}/admin/join/list.do"
                >관리자 페이지</a>
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
                        <a class="login font14 point2-text" href="${pageContext.request.contextPath}/main/myPage.do"
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
                        <a href="<c:url value="/front/guide/background.do"/>">도입배경</a>
                        <a href="<c:url value="/front/guide/concept.do"/>">개념</a>
                        <a href="<c:url value="/front/guide/trace.do"/>">걸어온 발자취</a>
                        <a href="<c:url value="/front/guide/company/list.do"/>">참여기업 현황</a>
                        <a href="<c:url value="/front/guide/ordinance.do"/>">관련 법령</a>
                        <a href="<c:url value="/front/guide/statistics.do"/>">시범운영 분석 결과</a>
                    </div>
                </div>
                <div class="menu">
                    <p onclick="menuToggleMobile(this)">납품대금 연동제 동참하기</p>
                    <div class="toggle">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="submenu">
                        <a href="<c:url value="/join/process/info.do"/>">납품대금 연동 절차 알아보기</a>
                        <a href="<c:url value="/join/ex/temp.do"/>">실제 사례 보기</a>
                        <a href="<c:url value="/join/agreeMain.do"/>">약정서 작성하기</a>
                        <a href="<c:url value="/join/joinMain.do"/>">동행기업 신청하기</a>
                    </div>
                </div>
                <div class="menu">
                    <p onclick="menuToggleMobile(this)">소통마당</p>
                    <div class="toggle">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="submenu">
                        <a href="<c:url value="/front/board/11/list.do"/>">공지사항</a>
                        <a href="<c:url value="/front/board/ready/list.do"/>">카드뉴스</a>
                        <a href="<c:url value="/front/board/7/list.do"/>">자주 묻는질문</a>
                        <a href="<c:url value="/front/qna/list.do"/>">질의응답 게시판</a>
                        <%--                        <a href="<c:url value="/front/consulting/apply.do"/>">컨설팅 신청</a>--%>
                        <%--                        <a href="<c:url value="/front/consulting/confirm.do"/>">컨설팅 신청 확인</a>--%>
                    </div>
                </div>
                <div class="menu">
                    <p><a href="<c:url value="/front/consulting/temp.do"/>">컨설팅 신청</a></p>

                </div>
                <div class="menu">
                    <p><a href="<c:url value="/front/material/temp.do"/>">원재료 정보</a></p>
                </div>
                <div class="menu">
                    <p><a href="<c:url value="/front/report/temp.do"/>">신고센터</a></p>
                </div>
            </nav>
        </div>
    </div>
</header>