<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 	prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 			prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<html lang="ko" class="ko">
<head>
<%--    <%@include file="/WEB-INF/jsp/common/cms/meta_inc.jsp" %>--%>
    <%@include file="/WEB-INF/jsp/common/front/javascript_inc.jsp" %>
    <title><decorator:title default="사용자화면" /></title>
    <%@include file="/WEB-INF/jsp/common/front/css_inc.jsp" %>
    <decorator:head />

</head>	             
<%--<body class="homepage" id="body">--%>
<body>
<%--    <div class="wrapper sub">--%>
        <page:applyDecorator name="header" />
        <div class="normal-wrap">
            <decorator:body />
        </div>
<%--    </div>--%>
    <page:applyDecorator name="footer" />
</body>
</html>