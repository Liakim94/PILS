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
</head>
<style>
    .accordion-container .item-wrap .detail-info h4 .table{
        border: 1px solid #FFC7C7;
        margin-top: 10px;
    }
    .accordion-container .item-wrap .detail-info h4 .table table tr{
        border-bottom: 1px solid #D2D2D2;
    }
    .accordion-container .item-wrap .detail-info h4 .table table td{
        padding: 10px;
        min-height: unset;
        height: auto;
        border-bottom: none;
        font-size: 16px;
        line-height: 26px;
    }
    .accordion-container .item-wrap .detail-info h4 .table table .t{
        background: #FFEFEF;
        border-right: 1px solid #FFC7C7;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_join_en"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    Partner company
                </li>
                <li>
                    What is a partner company?
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">What is a partner company?</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <h2 class="title">What is a partner company?</h2>
                <div class="box-container">
                    <ul class="disc">
                        <li class="mb20"  style="font-size: 18px; line-height: 28px;">
                            It is a company which enters and operates delivery price indexation agreement at transaction effected on consignment and commission (Including  subcontract transaction) for win-win both commissioning enterprise and commissioned enterprise.
                        </li>
                        <li class=""  style="font-size: 18px; line-height: 28px;">
                            The partner company autonomously enters** into the delivery price indexation system agreement at transaction effected on consignment and commission by using* "Standard Indexation Agreement"
                            provided by Ministry of SMEs and Startups and Fair Trade Commission, adjusts the delivery price according to the definitions in indexation agreement.
                            <p class="tip">
                                * Available for using after partial modification
                            </p>
                            <p class="tip">
                            ** Available for adding special terms to the current agreement
                            </p>
                        </li>
                    </ul>
                </div>
                <h2 class="title mt40">Procedure</h2>
                <div class="company-process">
                    <div class="prwrap">
                        <img src="<c:url value="/images/english/company-process1.png"/>" alt="참여 신청·접수"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/english/company-process2.png"/>" alt="참여기업 선정" />
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/english/company-process3.png"/>" alt="연동 약정 체결"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/english/company-process4.png"/>" alt="표준 연동계약서 제출"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/english/company-process8.png"/>" alt="우수기업 선정,포상"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/english/company-process7.png"/>" alt="조정 실적 제출"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/english/company-process6.png"/>" alt="참여확인서 제출 및 인센티브 부여"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/english/company-process5.png"/>" alt="참여확인서 발급"/>
                    </div>
                </div>
                <div class="accordion-container">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>Details</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h3 class="mb20">Sub procedures for indexation agreement entrance and submission of adjustment achievements</h3>
                            <h4 class="mb20">
                                ① <strong>(Submission of Standard Indexation Agreement)</strong>
                                Submission of the parts corresponding to indexation agreement out of the agreement entered by and between commissioning enterprise and commissioned enterprise.
                                <p class="pl10 tip">* Exclude the business secrecies and include the information on person in charge at commissioning enterprise and commissioned enterprise.</p>
                            </h4>
                            <h4 class="mb20">
                                ② <strong>(Issuance of involving certificate)</strong>
                                Issue 'certificate of partner companies involved into delivery price indexation system' at the request of contracting company after submitting Standard Indexation Agreement
                            </h4>
                            <h4 class="mb20">
                                ③ <strong>(Granting incentive)</strong>
                                The involving company submits 'certificate of partner companies involved into delivery price indexation system' to competent agencies for grating 'incentive offered at the involvement of partner company'’ (Refer to ☞ 5p)
                            </h4>
                            <h4 class="">
                                ④ <strong>(Submission of adjustment achievements)</strong>
                                The contracting company submits the adjusted and paid statement on delivery price according to delivery price indexation agreement
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function detailOpen(d){
        if(!$(d).hasClass("open")){
            $(d).find(".detail-info").slideDown();
            $(d).addClass("open");
        }
        else{
            $(d).find(".detail-info").slideUp();
            $(d).removeClass("open");
        }
    }
</script>