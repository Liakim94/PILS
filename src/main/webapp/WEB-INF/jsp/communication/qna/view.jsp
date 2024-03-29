<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%pageContext.setAttribute("crcf", "\r\n"); %>
<head>
    <title>중소벤처기업부 | 온라인 상담</title>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>

</head>

<div id="content">
    <div id="board">
        <page:applyDecorator name="menu"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    소통·상담
                </li>
                <li>
                    온라인 상담
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700"> 온라인 상담</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <div id="company-write" class="content">
                    <!-- 컨텐츠 start -->

                    <input type="hidden" id="no" name="no" value="${rs.no}"/>
                    <div class="board-view-wrap01">
                        <p class="subj">작성자 : ${rs.name }</p>
                        <c:if test="${rs.depth eq 0}">
                            <p class="subj">이메일 : ${rs.email }</p>
                        </c:if>
                        <p class="subj">제목 : ${rs.title }</p>
                        <div class="cont">
                            ${fx:resetXSSMinimum(rs.body)}
                        </div>
                    </div>
                    <div class="write-bottom">
                        <c:if test="${sessionId eq 'admin' }">
                            <a href="<c:url value="/front/qna/delete.do?no=${rs.no}"/>" class="submit">삭제</a>
                            <a href="<c:url value="/front/qna/repost.do?no=${rs.no}"/>" class="submit">답변달기</a>
                        </c:if>
                        <a href="<c:url value="/front/qna/list.do"/>" class="back">목록</a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>