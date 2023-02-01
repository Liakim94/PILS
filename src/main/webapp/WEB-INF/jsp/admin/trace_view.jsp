<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="fx" prefix="fx" %>
<%pageContext.setAttribute("crcf", "\r\n"); %>

<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_admin"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    납품대금연동제란?
                </li>
                <li>
                    걸어온 발자취
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">걸어온 발자취</h1>
            </div>
            <div class="content">
                <div class="write-container">
                    <!-- 컨텐츠 start -->
                    <div class="board-view-wrap01">
                        <input type="hidden" value="${rs.seq}">
                        <div class="board-view-wrap01">
                            <p class="subj"> ${rs.title}</p>
                            <div class="info">
                                <ul>
                                    <li>작성자 : 관리자</li>
                                    <li>작성일 : ${fn:substring(rs.rgst_dt,0,10)}</li>
                                </ul>
                            </div>
                            <div class="file-wrap">
                                <p class="label">첨부파일</p>
                                <ul>
                                    <c:forEach var="attach" items="${attachList}">
                                        <li>
                                            <a href="<c:url value="${FileUploadController.makeDownloadLink(attach.savedFilePath, attach.fileNm)}"/>">
                                                <c:out value="${attach.fileNm}"/>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="cont">
                                ${fx:resetXSSMinimum(rs.cont)}
                            </div>
                        </div>
                    </div>
                    <div class="write-bottom">
                        <a href="<c:url value="/admin/trace/edit.do?seq=${rs.seq}"/>" class="submit">수정</a>
                        <a href="<c:url value="/admin/trace/delete.do?seq=${rs.seq}"/>">삭제</a>
                    </div>
                    <!-- 컨텐츠 end -->
                </div>
            </div>
        </div>
    </div>
</div>
