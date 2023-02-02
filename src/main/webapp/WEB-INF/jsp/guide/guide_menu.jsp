<%--
  Created by IntelliJ IDEA.
  User: neo
  Date: 2023/01/18
  Time: 6:30 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="URI" value="${requestScope['javax.servlet.forward.request_uri']}" />
<aside class="sidebar">
    <div class="lnb">
        <h2>납품대금 연동제란?</h2>
        <ul>
            <li class="<c:if test="${URI.contains('/front/guide/background')}">on</c:if>">
                <a href="<c:url value="/front/guide/background.do"/>" class="">도입배경</a>
            </li>
            <li class="<c:if test="${URI.contains('/front/guide/concept')}">on</c:if>">
                <a href="<c:url value="/front/guide/concept.do"/>" class="">개념</a>
            </li>
            <li class="<c:if test="${URI.contains('/front/guide/trace')}">on</c:if>">
                <a href="<c:url value="/front/guide/trace.do"/>" class="">걸어온 발자취</a>
            </li>
            <li class="<c:if test="${URI.contains('/front/guide/company')}">on</c:if>">
                <a href="<c:url value="/front/guide/company/list.do"/>">참여기업 현황</a>
            </li>
            <li class="<c:if test="${URI.contains('/front/guide/ordinance')}">on</c:if>">
                <a href="<c:url value="/front/guide/ordinance.do"/>" class="">관련 법령</a>
            </li>
            <li class="<c:if test="${URI.contains('/front/guide/statistics')}">on</c:if>">
                <a href="<c:url value="/front/guide/statistics.do"/>" class="">시범운영 분석 결과</a>
            </li>
        </ul>
    </div>
</aside>