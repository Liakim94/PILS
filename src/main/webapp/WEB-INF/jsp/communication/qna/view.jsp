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
    <title></title>
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
                    소통마당
                </li>
                <li>
                    질의응답 게시판
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700"> 질의응답 게시판</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->

                <input type="hidden" id="no" name="no" value="${rs.no}"/>
                <div class="board-view-wrap01">
                    <p class="subj">작성자 : ${rs.name }</p>
                    <p class="subj">제목 : ${rs.title }</p>
                    <div class="cont">
                        ${fn:replace(rs.body, crcf, "<br>") }
                    </div>
                    <div class="write-bottom">
                        <c:if test="${sessionId eq 'admin' }">
                            <a href='${pageContext.request.contextPath}/cmm/qnaRepost.do?no=${rs.no}' class="go-lst"
                               style="width: 115px">답변달기</a>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/cmm/qnaDelete.do?no=${rs.no}" class="go-lst">삭제</a>
                        <a href="${pageContext.request.contextPath}/cmm/qnaList.do" class="go-lst">목록</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>