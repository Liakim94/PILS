<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script>
var fail_common_msg		=	"<spring:message code='fail.common.msg'		/>";
var fail_common_sql		=	"<spring:message code='fail.common.sql' 	/>";
var info_nodata_msg		=	"<spring:message code='info.nodata.msg' 	/>";
var errors_prefix		=	"<spring:message code='errors.prefix' 		/>"; 
var errors_suffix		=	"<spring:message code='errors.suffix' 		/>";
var errors_required		=	"<spring:message code='errors.required' 	/>";
var errors_minlength	=	"<spring:message code='errors.minlength' 	/>";
var errors_maxlength	=	"<spring:message code='errors.maxlength' 	/>";
var errors_invalid		=	"<spring:message code='errors.invalid' 		/>";
var errors_byte			=	"<spring:message code='errors.byte' 		/>";
var errors_short		=	"<spring:message code='errors.short' 		/>";
var errors_integer		=	"<spring:message code='errors.integer' 		/>";
var errors_long			=	"<spring:message code='errors.long' 		/>";
var errors_float		=	"<spring:message code='errors.float' 		/>";
var errors_double		=	"<spring:message code='errors.double' 		/>";
var errors_date			=	"<spring:message code='errors.date' 		/>";
var errors_range		=	"<spring:message code='errors.range' 		/>";
var errors_creditcard	=	"<spring:message code='errors.creditcard' 	/>";
var errors_email		=	"<spring:message code='errors.email' 		/>";
var errors_ihidnum		=	"<spring:message code='errors.ihidnum' 		/>";
var errors_korean		=	"<spring:message code='errors.korean' 		/>";
</script>
