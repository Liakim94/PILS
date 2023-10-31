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
    <title>중소벤처기업부 | 상담하기</title>
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
                    상담하기
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700"> 상담하기</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
                <div class="info-link">
                    <div class="item">
                        <a href="${pageContext.request.contextPath}/front/qna/list.do">
                            <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" >
                            <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>">
                            온라인 상담 신청</a>
                    </div>
                    <div class="item">
                        <a href="<c:url value="/front/consulting/apply.do"/>">
                            <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" >
                            <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>">
                            원가분석 컨설팅 신청</a>
                    </div>
                </div>
                <section>
                    <h2 class="title">납품대금 연동제 문의 및 상담 안내</h2>
                    <h4 class="mb40">
                        ① 관련 법·제도 문의 및 상담 : 중소벤처기업부 불공정거래개선과<br>
                        ② 납품대금 연동제 일반 문의 및 상담 : 지방중소벤처기업청 소상공인과/지역혁신과<br>
                        ③ 동행기업 참여 관련 문의 및 상담 : 협력재단 납품대금연동·확산지원TF<br>
                    </h4>
                    <div class="s-table-wrap">
                        <table class="s-table c-table" id="textTable" >
                            <thead>
                            <th class="c-th" width="15%">연번</th>
                            <th class="c-th">담당기관</th>
                            <th class="c-th">전화번호</th>
                            </thead>
                            <tbody>
                            <c:forEach var="rs" items="${rs }" varStatus="status">
                                <tr>
                                    <td class="tbody">${rs.sortSeq}</td>
                                    <td class="">${rs.instNm}</td>
                                    <td class="">${rs.contact}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>