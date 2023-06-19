<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<head>
    <title>중소벤처기업부 | 동행기업 신청</title>
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
                    동행기업 신청
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 신청</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <div class="info-link">
                                        <div class="item">
                                            <a href="${pageContext.request.contextPath}/join/joinApply.do">
                                                <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" alt="약정서 체험하기">
                                                <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>" alt="약정서 체험하기">
                                                동행기업 신청</a>
                                        </div>

                    <div class="item">
                        <a href="<c:url value="/files/(동행기업)신청서.zip"/>" download="동행기업 참여 신청 필요서류 양식.zip">
                            <img class="hover" src="<c:url value="/images/common/download-icon2.png"/>" >
                            <img class="unhover" src="<c:url value="/images/common/download-icon.png"/>" >
                            필요서류 양식</a>
                    </div>
                                        <div class="item">
                                            <a href="${pageContext.request.contextPath}/join/recom.do">
                                                <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" alt="약정서 체험하기">
                                                <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>" alt="약정서 체험하기">
                                                동행기업 참여 추천</a>
                                        </div>
                </div>
                <h2 class="title">동행기업 신청 및 선정</h2>
                <h4>
                    <ul class="disc">
                        <li class="mb20">
                            위탁기업이 납품대금 연동 약정을 체결할 수탁기업들과 협의하여 참여 신청서를 제출하면 심사를 거쳐 동행기업으로 선정될 수 있습니다.<br>
                            · 위탁기업: 제조, 공사, 가공, 수리, 판매, 용역을 업으로 하면서 물품 등의 제조, 공사, 가공, 수리, 용역 또는 기술개발을 다른 중소기업에게 위탁하는 기업<br>
                            · 수탁기업: 위탁기업으로부터 물품 등의 제조, 공사, 가공, 수리, 용역 또는 기술개발을 위탁받아 전문적으로 이를 수행하는 기업
                            <p class="tip">
                                ※ 참여기업 선정 결과 통보 : 신청일로부터 1개월 이내 개별 통보
                            </p>
                        </li>
                        <li class="mb20">
                            참여를 희망하는 위탁기업은 모집공고문을 확인한 후 홈페이지 또는 이메일을 통해 필요 서류를 제출하시기 바랍니다.<br>
                            · 홈페이지 신청: 상단의 ‘동행기업 신청’ 버튼 클릭<br>
                            · 이메일 신청: med@win-win.or.kr로 송부
                        </li>
                        <li class="">
                            필요 서류<br>
                            1. 납품대금 연동제 동행기업 참여 신청서<br>
                            2. 납품대금 연동제 운영 계획서<br>
                            3. 개인·기업정보 활용 동의서<br>
                            4. 사업자등록증
                        </li>
                    </ul>
                </h4>
            </div>
        </div>
    </div>
</div>