<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title>관리자 | 상담하기 연락처 관리</title>
</head>
<script>
    function fn_submit() {
        var frm = document.getElementById('post');

        if (frm.instNm.value == "") {
            alert("담당기관명을 입력하세요.");
            return false;
        }
        if (frm.contact.value == "") {
            alert("전화번호를 입력하세요.");
            return false;
        }
        if (frm.sortSeq.value == "") {
            alert("정렬순서를 입력하세요.");
            return false;
        }
        if(만frm.sortSeq.value)){
            alert("정렬순서는 숫자만 입력하세요.");
            return false;
        }

        frm.submit();
    }
</script>
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
                    관리자페이지
                </li>
                <li>
                    상담하기 연락처 관리
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">상담하기 연락처 관리</h1>
                <div class="side-wrap"></div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <div class="write-container">
                    <form:form modelAttribute="post" action="conPost.do" method="post">
<%--                        <form:hidden path="bbsId"/>--%>
                        <div class="write-wrap">
                            <div class="line-wrap">
                                <div class="label">
                                    담당기관
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="instNm" />
                                </div>
                            </div>

                            <div class="line-wrap">
                                <div class="label">
                                    전화번호
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="contact" />
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    정렬순서
                                </div>
                                <div class="input-wrap">
                                    <form:input type="text" path="sortSeq" />
                                </div>
                            </div>

                        </div>
                    </form:form>
                </div>
                <div class="write-bottom">
                    <input id="submit" class="submit" value="게시" onclick="fn_submit()" style="width: 135px"/>
                    <a href="<c:url value="/admin/qna/contact.do"/>" class="back">취소</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- row end -->


