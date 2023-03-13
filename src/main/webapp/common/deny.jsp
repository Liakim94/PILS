<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <%@include file="/WEB-INF/jsp/common/cms/meta_inc.jsp" %>
    <title>접근금지</title>
    <%@include file="/WEB-INF/jsp/common/front/css_inc.jsp" %>
    <%@include file="/WEB-INF/jsp/common/front/javascript_inc.jsp" %>
    <%--	<%@include file="/WEB-INF/jsp/common/cms/message_inc.jsp" %>--%>

</head>

<div class="content mt70" style="text-align : center">
	<div id="company-write" class="content">
        <img src="<c:url value="/images/deny.png"/> " style="width: 150px"/>
        <h1 class="inner_title mt40"><strong>접근거부</strong></h1>
        <h3>해당페이지에 접근권한이 없습니다.</h3>

        <div class="write-bottom" style="text-align : center;">
            <a class="submit" href="${pageContext.request.contextPath }/">메인으로</a>
            <a class="back" href="javascript:history.go(-1);"  style="padding:12px 40px" >이전 화면으로</a>
        </div>
        <!-- /.error-page -->
    </div>
</div>