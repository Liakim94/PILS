<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.xicom.cmmn.web.EgovWebUtil"                                  %>
<%@ page import="kr.co.xicom.cmmn.web.EgovProperties"                               %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"  %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page"      prefix="page"       %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c"          %>
<%@ taglib uri="http://egovframework.gov/ctl/ui"                prefix="ui"         %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn"         %>
<%@ taglib uri="http://www.springframework.org/tags"            prefix="spring"     %>
<%
String uploadPath = "";
uploadPath = EgovWebUtil.nvl(EgovProperties.getProperty("UploadPath").toString().trim()).equals("")?"upload":EgovProperties.getProperty("UploadPath").toString();
%>


<aside class="sidebar">
    <div class ="lnb">
        <h2>납품대금연동제 동참하기</h2>
        <ul>
            <li><a href ="#" >연동 절차</a></li>
            <li><a href ="${pageContext.request.contextPath}/join/agree.do" >약정서 작성</a></li>
            <li><a href ="${pageContext.request.contextPath}/join/joinList.do" >동행기업 신청</a></li>
            <li><a href ="#" >기업들이 준비할 일</a></li>
        </ul>
    </div>
</aside>





