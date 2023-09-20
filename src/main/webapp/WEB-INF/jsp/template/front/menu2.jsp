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
        <h2>납품대금 연동제 도입하기</h2>
        <ul>
            <li class="<c:if test="${URI.contains('/join/ready.do')}">on</c:if>">
                <a href ="<c:url value="/join/ready.do"/>">도입 준비하기</a>
            </li>
            <li class="<c:if test="${URI.contains('/join/process')}">on</c:if>">
                <a href ="<c:url value="/join/process/info.do"/>">연동 절차 알아보기</a>
            </li>
            <li class="<c:if test="${URI.contains('/join/ex')}">on</c:if>">
                <a href="<c:url value="/join/ex/temp.do"/>">연동표 작성 예시 보기</a>
            </li>
            <li class="<c:if test="${URI.contains('/join/contract')}">on</c:if>">
                <a href="<c:url value="/join/contract.do"/>">표준 미연동계약서 작성하기</a>
            </li>
            <li class="<c:if test="${URI.contains('/join/notice')}">on</c:if>">
                <a href="<c:url value="/join/notice.do"/>">납품대금 연동 관련 유의사항</a>
            </li>
            <li class="<c:if test="${URI.contains('/join/agree')}">on</c:if>">
                <a href="<c:url value="/join/agreeMain.do"/>">연동표 작성하기</a>
            </li>
        </ul>
    </div>
</aside>





