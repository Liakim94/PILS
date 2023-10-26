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
<c:set var="URI" value="${requestScope['javax.servlet.forward.request_uri']}" />

<aside class="main-sidebar">
    <div class ="lnb">
        <h2>마이페이지</h2>
        <ul>
            <li class="<c:if test="${URI.contains('/main/myPage')}">on</c:if>">
                <a href ="${pageContext.request.contextPath}/main/myPage.do">동행기업 신청 정보</a>
            </li>
            <li class="<c:if test="${URI.contains('/main/mem')}">on</c:if>">
                <a href ="${pageContext.request.contextPath}/main/mem/management.do">담당자 관리</a>
            </li>
            <li class="<c:if test="${URI.contains('/main/perf')}">on</c:if>">
                <a href ="${pageContext.request.contextPath}/main/perf/list.do">동행기업 실적 제출</a>
            </li>
        </ul>
    </div>
</aside>





