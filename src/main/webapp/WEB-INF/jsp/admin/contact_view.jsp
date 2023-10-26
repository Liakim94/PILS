<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>

<head>
    <title>관리자 | 상담하기 연락처 관리</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/temp.css"/>">
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>

</head>
<script>
    function deleteContact() {
        if (confirm("정말 삭제하시겠습니까?")) {
            $("#delete").submit();
        } else {
            return false;
        }
    }
</script>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_admin"/>
        <form:form modelAttribute="delete"  method="POST" action="delete.do">
        <form:hidden path="seq"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>관리자페이지</li>
                <li> 상담하기 연락처 관리</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700"> 상담하기 연락처 관리</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
            <div id="company-write" class="content">
                <div class="write-container">
                    <div class="line-wrap">
                        <div class="label">담당기관</div>
                        <div class="input-wrap">${rs.instNm}</div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">전화번호</div>
                        <div class="input-wrap">${rs.contact}</div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">정렬순서</div>
                        <div class="input-wrap">${rs.sortSeq}</div>
                    </div>
                </div>
                <div class="write-bottom">
                    <a href="${pageContext.request.contextPath}/admin/qna/conEdit.do?seq=${rs.seq}" class="submit">수정</a>
                    <a onclick="javascript:deleteContact();return false;" class="submit">삭제</a>
                    <a href="${pageContext.request.contextPath}/admin/qna/contact.do" class="back">목록</a>
                </div>
                </form:form>
            </div>
            </div>
        </div>
    </div>
</div>