<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
	<%@include file="/WEB-INF/jsp/common/cms/meta_inc.jsp" %>
	<title>페이지 없음</title>
	<%@include file="/WEB-INF/jsp/common/front/css_inc.jsp" %>
	<%@include file="/WEB-INF/jsp/common/front/javascript_inc.jsp" %>
	<%@include file="/WEB-INF/jsp/common/cms/message_inc.jsp" %>
		
</head>
<section class="">	
	<div class="d-flex align-items-lg-center min-height-lg-100vh justify-content-center">
		<div class="row">
			<div class="col-12">
				<h2 class="text-center">페이지없음</h2>
				<p class="text-center">해당 페이지를 찾을 수 없습니다.</p>
				<div class="buttons text-center"><button class="btn btn-primary" onclick="location.href='/'">메인으로</button> <button class="btn btn-secondary" onclick="javascript:history.go(-1);">이전화면</button></div>
			</div>	
		</div>
    </div>    
</section>