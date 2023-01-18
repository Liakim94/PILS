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
            <img class="logo" src="${pageContext.request.contextPath}/images/common/logo.png" alt="중소벤처기업부"/>
            <img class="slogan" src="${pageContext.request.contextPath}/images/common/slogan.png"
                 alt="다시 도약하는 대한민국 함께 잘사는 국민의 나라"/>
        </div>
        <nav class="nav-wrap">
            <div class="wrapper">
                <a class="font18" href="">납품대금 연동제란?</a>
                <div class="submenu">
                    <a href="">도입배경</a>
                    <a href="">개념</a>
                    <a href="">적용대상</a>
                    <a href="">관련 법령</a>
                    <a href="">주요 통계</a>
                </div>
            </div>
            <div class="wrapper">
                <a class="font18" href="${pageContext.request.contextPath}/join/joinList.do">납품대금 연동제 동참하기</a>
                <div class="submenu">
                    <a href="#">연동 절차</a>
                    <a href="${pageContext.request.contextPath}/join/agreeMain.do">약정서 작성</a>
                    <a href="${pageContext.request.contextPath}/join/joinList.do">동행기업 신청</a>
                    <a href="#">기업들이 준비할 일</a>
                </div>
            </div>
            <div class="wrapper">
                <a class="font18" href="<c:url value="/front/board/11/list.do"/>">소통마당</a>
                <div class="submenu">
                    <a href="<c:url value="/front/board/11/list.do"/>">공지사항</a>
                    <a href="<c:url value="/front/board/7/list.do"/>">자주 묻는질문</a>
                    <a href="${pageContext.request.contextPath}/cmm/qnaList.do">질의응답 게시판</a>
                    <a href="<c:url value="/front/consulting/apply.do"/>">컨설팅 신청</a>
                    <a href="<c:url value="/front/consulting/confirm.do"/>">컨설팅 신청 확인</a>
                </div>
            </div>
        </nav>
        <div class="side-wrap">
            <c:if test="${sessionId eq null }">
                <a class="login font14 point2-text" href="${pageContext.request.contextPath}/main/login.do">로그인</a>
            </c:if>
            <c:if test="${sessionId ne null }">
                <div>
                <a class="login font14 point2-text" href="${pageContext.request.contextPath}/main/myPage.do"
                   >마이페이지</a>
                </div>
                <div>
                <a class="login font14 point2-text" href="${pageContext.request.contextPath}/main/logout.do"
                   >로그아웃</a>
                </div>
            </c:if>
            <div class="mobile-menu" onclick="mobileMenuOpen(this)">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <div class="mobile-gnb-container">
        <div class="mobile-gnb-wrap">
            <div class="head">
                <c:if test="${sessionId eq null }">
                    <a class="login font14 point2-text" href="${pageContext.request.contextPath}/main/login.do">로그인</a>
                </c:if>
                <c:if test="${sessionId ne null }">
                    <div>
                        <a class="login font14 point2-text" href="${pageContext.request.contextPath}/main/myPage.do"
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
                    <p onclick="menuToggleMobile(this)">납품대금 연동제란?</p>
                    <div class="toggle">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="submenu">
                        <a href="">도입배경</a>
                        <a href="">개념</a>
                        <a href="">적용대상</a>
                        <a href="">관련 법령</a>
                        <a href="">주요 통계</a>
                    </div>
                </div>
                <div class="menu">
                    <p onclick="menuToggleMobile(this)">납품대금 연동제 동참하기</p>
                    <div class="toggle">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="submenu">
                        <a href="#">연동 절차</a>
                        <a href="${pageContext.request.contextPath}/join/agreeMain.do">약정서 작성</a>
                        <a href="${pageContext.request.contextPath}/join/joinList.do">동행기업 신청</a>
                        <a href="#">기업들이 준비할 일</a>
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
                        <a href="<c:url value="/front/board/7/list.do"/>">자주 묻는질문</a>
                        <a href="${pageContext.request.contextPath}/cmm/qnaList.do">질의응답 게시판</a>
                        <a href="<c:url value="/front/consulting/apply.do"/>">컨설팅 신청</a>
                        <a href="<c:url value="/front/consulting/confirm.do"/>">컨설팅 신청 확인</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</header>