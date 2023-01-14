<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
	<%@include file="/WEB-INF/jsp/common/cms/meta_inc.jsp" %>
	<title>오류</title>
	<%@include file="/WEB-INF/jsp/common/front/css_inc.jsp" %>
	<%@include file="/WEB-INF/jsp/common/front/javascript_inc.jsp" %>
<%--	<%@include file="/WEB-INF/jsp/common/cms/message_inc.jsp" %>--%>
</head>

<body>
        <div class="error-element">
            <div class="error-inner">
                <p class="large-text">일시적 오류가 발생했습니다.</p>
                <p class="small-text">
                   서비스 이용에 불편을 끼쳐드려 죄송합니다. 메인 페이지로 이동 후, 다시 이용해 주시길 바랍니다.</p>
            </div>
        </div>
        <div class="btn-wrap">
            <a href="<c:url value="/" />" class="btn blue">메인 페이지</a>
        </div>
        
</body>
</html>



