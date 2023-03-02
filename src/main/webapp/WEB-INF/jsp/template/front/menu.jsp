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
    <div class="lnb">
        <h2>소통·상담</h2>
        <ul>
            <li class="<c:if test="${URI.contains('/front/board/11')}">on</c:if>">
                <a href="<c:url value="/front/board/11/list.do"/>">공지사항</a>
            </li>
            <li class="<c:if test="${URI.contains('/front/board/ready')}">on</c:if>">
                <a href="<c:url value="/front/board/ready/list.do"/>">카드뉴스</a>
            </li>
            <li class="<c:if test="${URI.contains('/front/board/7')}">on</c:if>">
                <a href="<c:url value="/front/board/7/list.do"/>">자주 묻는 질문</a>
            </li>
            <li class="<c:if test="${URI.contains('/front/qna')}">on</c:if>">
                <a href="<c:url value="/front/qna/main.do"/>">상담하기</a>
            </li>
            <li class="<c:if test="${URI.contains('/front/policy.do')}">on</c:if>">
                <a href="<c:url value="/front/policy.do"/>">개인정보처리방침</a>
            </li>
<%--<c:if test="${sessionId eq 'admin' }">--%>

<%--            <li class="<c:if test="${URI.contains('/front/consulting/apply')}">on</c:if>">--%>
<%--                <a href="<c:url value="/front/consulting/apply.do"/>">컨설팅 신청</a>--%>
<%--            </li>--%>
<%--            <li class="<c:if test="${URI.contains('/front/consulting/confirm')}">on</c:if>">--%>
<%--                <a href="<c:url value="/front/consulting/confirm.do"/>">컨설팅 신청 확인</a>--%>
<%--            </li>--%>
<%--</c:if>--%>
        </ul>
    </div>
</aside>





