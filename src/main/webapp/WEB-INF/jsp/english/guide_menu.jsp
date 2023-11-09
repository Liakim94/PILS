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
        <h2>what is the delivery price indexation system?</h2>
        <ul>
            <li class="<c:if test="${URI.contains('/en/guide/concept')}">on</c:if>">
                <a href="<c:url value="/en/guide/concept.do"/>">Concept</a>
            </li>
            <li class="<c:if test="${URI.contains('/en/guide/process')}">on</c:if>">
                <a href="<c:url value="/en/guide/process.do"/>">Learn about the price indexation process</a>
            </li>
            <li class="<c:if test="${URI.contains('/en/guide/notice')}">on</c:if>">
                <a href="<c:url value="/en/guide/notice.do"/>">Notes regarding the price indexation system</a>
            </li>
            <li class="<c:if test="${URI.contains('/en/guide/agree')}">on</c:if>">
                <a href="<c:url value="/en/guide/agree.do"/>">How to Make Indexation Table like subcontract payment</a>
            </li>
            <li class="<c:if test="${URI.contains('/en/guide/contract')}">on</c:if>">
                <a href="<c:url value="/en/guide/contract.do"/>">How to make stndard non-indexation contract</a>
            </li>
            <li class="<c:if test="${URI.contains('/en/guide/ordinance')}">on</c:if>">
                <a href="<c:url value="/en/guide/ordinance.do"/>">Related laws</a>
            </li>
        </ul>
    </div>
</aside>