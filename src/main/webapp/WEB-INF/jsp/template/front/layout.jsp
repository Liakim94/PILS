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
    <%@include file="/WEB-INF/jsp/common/cms/message_inc.jsp" %>
    <decorator:head />
    <style>
        .smes_wrapper {
            display: table;
            width: 100%;
            height: 100%;
            background-color: #e3ecf3;
            position: absolute;
            z-index: 10000
        }
		.smes_wrapper .v-box {
            display: table-cell;
            width: 100%;
            height: 100%;
            vertical-align: middle;
            text-align: center
        }
        .logo-element {
            display: inline-block;
            width: 500px;
        }
        .inner {
            border-bottom: 1px solid #acc0d0;
            padding-bottom: 35px
        }
        .error-txt {
            margin-top: 50px;
            font-size: 20px;
            color: #003964;
            line-height: 35px
        }
    </style>           
</head>	             
<body class="homepage" id="body">

    <div id="skipNavigation" title="스킵내비게이션">
        <a href="#gnb">상단메뉴 바로가기 </a>
        <a href="#contents"> 본문 내용 바로가기 </a>
    </div>

    <div class="wrapper sub">
        <page:applyDecorator name="header" />
        <div class="normal-wrap">
            <decorator:body />
        </div>
    </div>
    <page:applyDecorator name="footer" />
</body>
</html>