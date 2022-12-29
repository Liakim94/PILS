<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
	
	
</head>
<section class="content-header">
	<h1>접근거부
		<!-- <small>해당 페이지에 접근권한이 없습니다.</small> -->
	</h1>
	 <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">접근거부</li>
      </ol>
</section>
<section class="content">
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
	<div class="error-page">
        <h2 class="headline text-red"><!-- 500 --></h2>

        <div class="error-content">
          <h3><i class="fa fa-warning text-red"></i> 접근거부</h3>

          <p>
            해당 페이지에 접근권한이 없습니다.
            <a href="${pageContext.request.contextPath }/main.do">Dashboard</a>로 돌아가거나<br/> 관리자에게 문의하세요.
          </p>

          <!-- <form class="search-form">
            <div class="input-group">
              <input type="text" name="search" class="form-control" placeholder="Search">

              <div class="input-group-btn">
                <button type="submit" name="submit" class="btn btn-danger btn-flat"><i class="fa fa-search"></i>
                </button>
              </div>
            </div>
            /.input-group
          </form> -->
          <div>
          	<button type="button" class="btn btn-flat btn-primary" onclick="location.href='${pageContext.request.contextPath }/main.do'">메인으로</button>
          	<button type="button" class="btn btn-flat btn-primary" onclick="javascript:history.go(-1);">이전 화면으로</button>
          	<button type="button" class="btn btn-flat btn-info">관리자 문의</button>
          </div>
        </div>
      </div>
      <!-- /.error-page -->   
</section>