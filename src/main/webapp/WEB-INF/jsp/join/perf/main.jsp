<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title>중소벤처기업부 | 동행기업 실적 제출</title>
</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_join"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    동행기업
                </li>
                <li>
                    동행기업 실적 제출
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 실적 제출</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
<%--                <c:if test="${sessionId ne null && auth_cd eq 'M101'}">--%>
<%--                    <a href="<c:url value="/join/perf/edit.do"/>" class="button button-color-red">수정하기</a>--%>
<%--                </c:if>--%>
                <!-- 컨텐츠 start -->
                <div class="info-link">
                    <div class="item">
                        <a href="<c:url value="/files/(양식)납품대금 연동제 시범운영 실적 작성표.xlsx"/>" download="(양식)납품대금 연동제 시범운영 실적 작성표.xlsx">
                            <img class="hover" src="<c:url value="/images/common/download-icon2.png"/>" >
                            <img class="unhover" src="<c:url value="/images/common/download-icon.png"/>" >
                            필수 제출 양식</a>
                    </div>
                </div>
                <h2 class="title"> 동행기업 연동 실적 제출</h2>
                <h4 style="    margin: 0 auto 40px;">
                    <ul class="disc">
                        <li class="mb20">
                            동행기업이 수탁기업과 연동약정을 체결하고 연동대금을 지급한 실적 제출<br>
                            &nbsp; - 약정 체결 후 변동 대금을 실제로 지급한 실적만 제출(미연동 실적 제출X)
                        </li>
                        <li class="mb20">
                            제출 필수 서류 <br>
                            &nbsp;1. (필수)하도급대금 등 연동표 <br>
                            &nbsp;2. (필수)납품단가 변동표<br>
                            &nbsp;2. (필수)연동실적 파일 (상단 필수 제출 양식 다운)<br>
                        </li>
                        <li class="">
                            제출 방법<br>
                            &nbsp; - 상단의 필수 제출 양식에 있는 파일을 다운하여 실적 입력 후 납품단가 변동표(스캔본),
                            연동표와 함께 제출<br>
                            &nbsp; - 하단의 '동행기업 실적 제출하기'를 클릭하여 자료 제출(업로드)하기
                            <p class="tip">
                                ※ 실적 제출 시 기업 담당자 로그인 필요
                            </p>
                        </li>
                    </ul>
                </h4>
                <div class="info-link">
                    <div class="item" style="width: 30%">
                        <a href="${pageContext.request.contextPath}/main/perf/apply.do">
                            <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" alt="약정서 체험하기">
                            <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>" alt="약정서 체험하기">
                            동행기업 실적 제출하기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

