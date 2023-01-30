<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 	prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 			prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<c:set var="URI" value="${requestScope['javax.servlet.forward.request_uri']}" />
<!DOCTYPE html>
<html lang="ko" class="ko">
<head>
    <%--
        WildRain 추가 2023-01-17
        https://www.smes.go.kr/pis-dev 사이트 검색엔진 색인 방지
    --%>
    <c:set var="showTestGuide" value="false"/>
    <c:if test="${fn:endsWith(pageContext.request.contextPath, '-dev') or fn:endsWith(pageContext.request.contextPath, '-test')}">
        <meta name="robots" content="noindex">
        <c:if test="${cookie.TESTHIDE.value ne 'true'}">
            <c:set var="showTestGuide" value="true"/>
        </c:if>
    </c:if>
    <%--@include file="/WEB-INF/jsp/common/cms/meta_inc.jsp" --%>
    <title><decorator:title default="납품대금 연동제" /></title>
    <%@include file="/WEB-INF/jsp/common/front/css_inc.jsp" %>
    <%@include file="/WEB-INF/jsp/common/front/javascript_inc.jsp" %>

    <decorator:head />

</head>
<%--<body class="homepage" id="body">--%>
<body class="<c:if test="${showTestGuide eq 'true'}">show-test-noti</c:if>">
    <c:if test="${showTestGuide eq 'true'}">
        <script src="<c:url value="/js/jquery.cookie.js"/>"></script>
        <style>
            .show-test-noti {
                padding-top: 50px;
            }
            .test-noti {
                font-size: 1.1em; color: white; height: 50px; line-height: 50px;
                text-align: center; position: fixed; left: 0; right: 0; top: 0; z-index: 10000; background-color: #282b32;
                overflow: hidden;
            }
            .test-noti a { font-weight: bold; color: #63a5fb;}
            .test-noti strong { color: #ff0000; }
            .test-noti .close-icon { float: right; margin: 10px 20px 10px 10px; cursor: pointer; }
        </style>
        <script>
            $(document).ready(function() {
                var testHide = $.cookie('TESTHIDE');
                if (testHide === 'true') {
                    $('body').removeClass("show-test-noti");
                    $('#test-noti').hide();
                }
               $('#test-noti .close-icon').on('click', function() {
                   $('#test-noti').hide();
                   $('body').removeClass("show-test-noti");
                   $.cookie('TESTHIDE', 'true', { path: '/' });
               });
            });
        </script>
        <div id="test-noti" class="test-noti">
            이곳은 <strong>개발/테스트용</strong> 사이트입니다.
            중소벤처기업부 납품연동제 홈페이지에 방문하시려면
            <a href="https://www.smes.go.kr/pis">https://www.smes.go.kr/pis</a>로 이동하세요.
            <img class="close-icon" src="<c:url value="/images/common/del-icon.png"/>" alt="close"/>
        </div>
    </c:if>
<%--    <div class="wrapper sub">--%>
        <page:applyDecorator name="header" />
        <div class="normal-wrap">
            <decorator:body />
        </div>
<%--    </div>--%>
    <page:applyDecorator name="footer" />
</body>
</html>