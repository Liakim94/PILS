<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.xicom.cmmn.web.EgovWebUtil"                                  %>
<%@ page import="kr.co.xicom.cmmn.web.EgovProperties"                               %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"  %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page"      prefix="page"       %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c"          %>
<%@ taglib uri="http://egovframework.gov/ctl/ui"                prefix="ui"         %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn"         %>
<%@ taglib uri="http://www.springframework.org/tags"            prefix="spring"     %>
<c:set var="URI" value="${requestScope['javax.servlet.forward.request_uri']}" />
<%
String uploadPath = "";
uploadPath = EgovWebUtil.nvl(EgovProperties.getProperty("UploadPath").toString().trim()).equals("")?"upload":EgovProperties.getProperty("UploadPath").toString();
%>


<aside class="sidebar">
    <div class ="lnb">
        <h2>동행기업</h2>
        <ul>
            <li class="<c:if test="${URI.contains('/join/concept.do')}">on</c:if>">
                <a href="<c:url value="/join/concept.do"/>">제도 설명</a>
            </li>
            <li class="<c:if test="${URI.contains('/front/guide/company')}">on</c:if>">
                <a href="<c:url value="/front/guide/company/list.do"/>">참여기업 현황</a>
            </li>
            <%-- 2024-01-08 중기부 요청으로 동행기업 신청 메뉴 제거
            <li class="<c:if test="${URI.contains('/join/join')}">on</c:if>">
                <a href="<c:url value="/join/joinMain.do"/>">동행기업 신청</a>
            </li>
            --%>
            <li class="<c:if test="${URI.contains('/join/perf')}">on</c:if>">
                <a href="<c:url value="/join/perf/main.do"/>">동행기업 실적 제출</a>
            </li>
        </ul>
    </div>
</aside>





