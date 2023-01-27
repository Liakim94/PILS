<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title>약정서 작성</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
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
                    납품대금연동제 동참하기
                </li>
                <li>
                    약정서 작성
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">약정서 작성</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="agreement" class="content">
                <!-- 컨텐츠 start -->
                <p class="info-text">
                    안내 문구가 들어갈 영역입니다.<br>
                    안내 문구가 들어갈 영역입니다.
                </p>
                <div class="info-link">
                    <a href="<c:url value="/files/agreementDownload.hwp"/>" download="납품대금 연동제 약정서.hwp"><img
                            src="${pageContext.request.contextPath}/images/common/download-icon.png" alt="약정서 다운로드">약정서
                        다운로드</a>
                     <c:if test="${rs eq id}">
                         <a href="${pageContext.request.contextPath}/join/agreeView.do">
                             <img src="${pageContext.request.contextPath}/images/common/document-icon.png" alt="약정서 체험하기">내
                             약정서 확인하기</a>
                    </c:if>
                    <c:if test="${rs eq '0'}">
                    <a href="${pageContext.request.contextPath}/join/agree.do"><img
                            src="${pageContext.request.contextPath}/images/common/document-icon.png" alt="약정서 체험하기">약정서
                        체험하기</a>
                    </c:if>
                </div>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

<script>
    function modalOpen() {
        $(".modal-box").css({
            "top": (($(window).height() - $(".modal-box").outerHeight()) / 2 + $(window).scrollTop()) + "px",
            "left": (($(window).width() - $(".modal-box").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
        });
        $(".modal-background").css("display", "block");
        $(".modal-box").css("display", "block");
        // TODO 이곳에서 상세페이지 이동 기능을 처리하시면 됩니다.
    }

    function modalClose() {
        $(".modal-background").css("display", "none");
        $(".modal-box").css("display", "none");
    }
</script>
