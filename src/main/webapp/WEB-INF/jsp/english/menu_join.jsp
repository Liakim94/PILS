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
        <h2>Partner company</h2>
        <ul>
            <li class="<c:if test="${URI.contains('/en/join/concept.do')}">on</c:if>">
                <a href="<c:url value="/en/join/concept.do"/>">What is a partner company?</a>
            </li>
            <li class="<c:if test="${URI.contains('/en/join/incentive.do')}">on</c:if>">
                <a href="<c:url value="/en/join/incentive.do"/>">Incentive offered to partner company</a>
            </li>
            <li class="<c:if test="${URI.contains('/en/join/apply.do')}">on</c:if>">
                <a href="<c:url value="/en/join/apply.do"/>">Partner company application</a>
            </li>
        </ul>
    </div>
</aside>





