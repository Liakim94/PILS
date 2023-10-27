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
        <h2>관리자 페이지</h2>
        <ul>
            <li class="<c:if test="${URI.contains('/admin/join')}">on</c:if>">
            <a href ="${pageContext.request.contextPath}/admin/join/list.do">동행기업 신청 현황</a>
            </li>
            <li class="<c:if test="${URI.contains('/admin/recom')}">on</c:if>">
                <a href ="${pageContext.request.contextPath}/admin/recom/list.do">동행기업 참여 추천 현황</a>
            </li>
            <li class="<c:if test="${URI.contains('/admin/consulting')}">on</c:if>">
                <a href ="${pageContext.request.contextPath}/admin/consulting/list.do">컨설팅 신청 현황</a>
            </li>
            <li class="<c:if test="${URI.contains('/admin/trace')}">on</c:if>">
                <a href ="${pageContext.request.contextPath}/admin/trace/list.do">걸어온 발자취 관리</a>
            </li>
            <li class="<c:if test="${URI.contains('/admin/ready')}">on</c:if>">
                <a href ="${pageContext.request.contextPath}/admin/ready/list.do">카드뉴스 관리</a>
            </li>
            <li class="<c:if test="${URI.contains('/admin/price')}">on</c:if>">
                <a href ="${pageContext.request.contextPath}/admin/price/list.do">원재료 사이트 관리</a>
            </li>
            <li class="<c:if test="${URI.contains('/admin/banner')}">on</c:if>">
                <a href ="${pageContext.request.contextPath}/admin/banner/list.do">메인 배너 관리</a>
            </li>
            <li class="<c:if test="${URI.contains('/admin/management')}">on</c:if>">
                <a href ="${pageContext.request.contextPath}/admin/management/list.do">담당자 관리</a>
            </li>
            <li class="<c:if test="${URI.contains('/admin/qna')}">on</c:if>">
                <a href ="${pageContext.request.contextPath}/admin/qna/contact.do">상담하기 연락처 관리</a>
            </li>
            <li class="<c:if test="${URI.contains('/admin/perf')}">on</c:if>">
                <a href ="${pageContext.request.contextPath}/admin/perf/list.do">동행기업 실적 제출 현황</a>
            </li>
        </ul>
    </div>
</aside>