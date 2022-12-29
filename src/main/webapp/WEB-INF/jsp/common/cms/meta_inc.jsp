<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

	<% if (request.getContextPath().endsWith("-dev") || request.getContextPath().endsWith("-test")) { %>
		<meta name="robots" content="noindex">
	<% } %>

	<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
	<!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
