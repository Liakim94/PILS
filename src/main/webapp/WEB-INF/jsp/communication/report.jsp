<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title>중소벤처기업부 | 불공정거래신고하기</title>
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
                    불공정거래신고하기
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700"> 불공정거래신고하기</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
                <div class="info-link">
                    <div class="item" style="width: 30%" >
                        <a href="https://www.smes.go.kr/poll/policy/policyDefine.do">
                            <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" >
                            <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>">
                            수·위탁 분쟁 조정 신청하기</a>
                    </div>
                    <div class="item" style="width: 30%">
                        <a href="">
                            <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" >
                            <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>">
                            납품대금연동제 익명제보센터</a>
                    </div>
                </div>
                <section>
                    <h2 class="title">불공정거래 신고센터란?</h2>
                    <h3>기업 간 불공정거래행위로 어려움을 겪고 있는 중소기업에게 도움을 드리는 곳입니다.
                        불공정거래행위로 피해를 입은 경우, 불공정거래신고센터로 연락주세요.</h3>
                    <li class="mb10 mt13">
                        불공정거래신고센터 지원내용
                    </li>
                    <h4 class="mb40">
                        - (불공정거래 상담) 수탁·위탁기업의 불공정거래 행위에 대한 상담·신고(접수)·피해구제 방법(제도) 안내<br>
                        - (법률자문 지원) 불공정거래 행위에 대하여 법률 검토 및 법적 구제 절차 등에 대한 전문 변호사 무료 법률자문 지원<br>
                        <p class="tip mt3"* 대·중소기업·농어업협력재단 ☏1357+내선9<br>
                        - (사전분쟁조정 지원) 수위탁분쟁조정협의회를 통해 수탁·위탁기업간 분쟁사안에 대한 자율적이고 합리적인 조정 지원<br>
                        - (불공정거래 분쟁조정 신청 접수 및 조치) 불공정거래행위(상생협력법 위반행위)에 대한 조사 후, 법 위반 혐의가 인정될 때에는 행정조치
                    </h4>
                    <div>
                        <img src="<c:url value="/images/policy_center.png"/>">
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>