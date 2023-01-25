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
            <div id="company-write" class="content">
                <!-- 컨텐츠 start -->
                <div class="board-view-wrap01">
                    <input type="hidden" value="${rs.seq}">

                    <p class="subj">제목 : ${rs.title}</p>
                    <p class="subj">등록일자 : ${fn:substring(rs.rgst_dt,0,10)}</p>
                    <div class="cont">
                        ${fx:resetXSSMinimum(rs.cont)}
                    </div>

                </div>
                <!-- 컨텐츠 end -->
                <div class="write-bottom">
                    <a href="<c:url value="/admin/trace/edit.do?seq=${rs.seq}"/>" class="submit">수정</a>
                    <a href="<c:url value="/admin/trace/delete.do?seq=${rs.seq}"/>">삭제</a>
                </div>
            </div>

        </div>

    </div>
</div>

