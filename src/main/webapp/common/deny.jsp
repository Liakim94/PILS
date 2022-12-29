<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<%@include file="/WEB-INF/jsp/common/cms/message_inc.jsp" %>

</head>

<div class="article">   

<div class="content">
		     <h1 class ="inner_title">접근거부</h1>           
            <p>해당페이지에 접근권한이 없습니다.<p>

	<!-- <div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header card-header-icon card-header-bg card-header-bg-rose">
                	<i class="fa fa-eye-slash fa-2x fa-inverse"></i>
                </div>
                <div class="card-content">
		        	<h4 class="card-title">접근거부</h4>
		        	<div class="p-50 text-center">
		        		<p><i class="fa fa-warning fa-3x"></i> 해당페이지에 접근권한이 없습니다.<p>
		        		<p><button type="button" class="btn btn-flat btn-primary">메인으로</button></p>
		        	</div>
		        </div>
			</div>
		</div>
	</div> -->

          <div class="btn-wrap">
          	<a class="btn blue" href="${pageContext.request.contextPath }/">메인으로</a>
          	<a class="btn blue" href="javascript:history.go(-1);">이전 화면으로</a>
          	<!-- <button type="button" class="btn btn-flat btn-info">관리자 문의</button> -->
          </div>
      <!-- /.error-page -->
</div>
</div>