<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title>중소벤처기업부 | 표준 미연동계약서 작성하기</title>
</head>
<style>
    .button {


    }
    .button-border {
        border: 1px solid #E60024;
        border-radius: 50px;
        padding: 7px 10px;
        display: inline-block;
        font-size: 16px;
        box-sizing: border-box;
        line-height: 32px;
        text-align: center;
        width: 100%;
        color: #E60024!important;
        background-color: white!important;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu2"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    납품대금 연동제 도입하기
                </li>
                <li>
                    표준 미연동계약서 작성하기
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">표준 미연동계약서 작성하기</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="agreement" class="content">
                <!-- 컨텐츠 start -->
<%--                <h3 >위탁기업과 수탁기업은 다음 사항에 대해 충분히 협의하여 약정서에 기재해야 합니다.</h3>--%>
<%--                <p class="tip mb40">※ 다음 사항은 중소벤처기업부‧공정거래위원회에서 공동으로 마련하여 배포하는 표준 연동계약서를 기준으로 작성되었습니다.<br/>--%>
<%--                    ※ 주의<br/>--%>
<%--                &nbsp;&nbsp;&nbsp;&nbsp;이하에서 (표) 형태로 제시하는 수치 또는 내용은 모두 가상의 상황을 가정하여 작성한 예시로서 실제 계약 시 내용은 계약당사자가 협의하여 정하여야 합니다.--%>
<%--                </p>--%>
                <div class="accordion-container">
                    <!--   미연동 대상 주요 원재료 명칭 -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>1. 미연동 대상 주요 원재료 명칭</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; &nbsp;수탁기업이 물품등의 제조에 사용할 주요 원재료 중 납품대금 미 연동을 하기로 계약당사자가 협의하여 정한 주요 원재료를 기재합니다.</p>
                                    <ul>
                                        <p class="text mt10">&#9675;원칙적으로 주요 원재료는 연동 대상이나, 위·수탁기업이 납품대금 연동을 하지 않기로 합의한 경우에는 납품대금 연동을 적용하지 않을 수 있습니다.</p>
                                        <p class="text mt10">&#9675;주요 원재료가 없는 경우에는 납품대금 연동의 적용 대상이 아니 므로 별도로 미연동 계약서를 작성할 필요는 없습니다.</p>
                                        <p class="text mt10">&#9675;또한, 상생협력법 제21조제3항에 따라 위탁기업이 소기업인 경우, 수탁‧위탁거래의 기간이 90일 이내인 경우,
                                        납품대금이 1억원 이하인 경우에도 납품대금 연동에 관한 사항을 적을 의무가 없으므로 별도로 미연동 계약서를 작성할 필요는 없습니다.</p>
                                    </ul>
                                </section>
                            </div>
                        </div>
                    </div>
                    <!--   협의 개요   -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>2. 협의 개요</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; &nbsp;연동에 관한 협의와 관련하여 원사업자는 성실한 협의 의무를 이행할 필요가 있습니다. </p>
                                    <ul>
                                        <p class="text" style="margin-bottom: 0px">&#9675; 표준 미연동계약서 작성 시, 협의 일시·방법과 위·수탁기업의 협의 책임자 성명·직위를 기재합니다. </p>
                                        <p class="text"> - 이때 회의 개최, 의견 교환 등 실질적인 협의가 진행되어야 하며, 권한 있는 책임자가 협의에 참여할 필요가 있습니다.</p>
                                    </ul>
                                    <div style="background: #FAFAFC; border-radius: 10px;padding: 20px;box-sizing: border-box;">
                                        <strong>* 상생협력법 제21조(약정서의 발급)</strong><br>
                                        ② 위탁기업은 약정서에 제1항제4호의 사항을 적기 위하여 수탁기업과 성실히 협의하여야 한다.<br>
                                        ④ 위탁기업은 납품대금 연동과 관련하여 수탁ㆍ위탁거래에 관한 거래상 지위를 남용하거나 거짓 또는 그 밖의 부정한 방법으로 이 조의 적용을 피하려는 행위를 하여서는 아니 된다.
                                    </div>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title">참고) 미연동 합의를 악용한 탈법행위</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:left">&#9634; 미연동 합의를 하는 유형의 탈법행위를 하는 경우 벌점, 과태료 부과 등이 가능<br/>
                                                    &#9634; 표준 미연동계약서 제3조제2항에 따라 위탁기업이 미연동 합의와 관련한 탈법행위를 하는 경우 수탁기업은 연동계약의 체결을 요구할 수 있으며 위탁기업은 이에 응하여 연동 관련 의무를 준수해야 함
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <!--   미연동 사유  -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>3. 미연동 사유</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; &nbsp;미연동 사유는 위·수탁기업이 각각 기재합니다. </p>
                                    <ul>
                                        <p class="text">&#9675; 다만, 납품대금 연동을 하지 않기로 합의가 이루어진 경우, 양 당사자간 그 사유까지 일치할 필요는 없습니다.</p>
                                        &nbsp;&nbsp;* 미연동 합의는 상생협력법 제22조의2(공급원가 변동에 따른 납품대금의 조정) 및 제25조(준수사항)제1항제4호의 적용을 배제하지 않음
                                    </ul>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

<script>
    function detailOpen(d) {
        if (!$(d).hasClass("open")) {
            $(d).find(".info-box").show();
            $(d).find(".detail-info").slideDown();
            $(d).addClass("open");
        } else {
            $(d).find(".detail-info").slideUp();
            $(d).removeClass("open");
        }
    }
</script>