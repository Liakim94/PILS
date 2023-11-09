<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
</head>
<style>
    .article-header .fw700{
        font-size: 46px;
        line-height: normal;
    }
    .temp .example {
        width: 100%;
        border: 1px solid #DDDDDD;
        border-radius: 10px;
        padding: 20px;
        box-sizing: border-box;
        cursor: pointer;
        margin-bottom: 20px;
    }
    .temp .example img {
        float: right;
        position: relative;
        bottom: 5px;
        transform: rotate(180deg);
    }
    .temp .example:focus{
        border: 1px solid #E60024;
    }
    .temp .example h3{
        display: inline-block;
    }
    .temp .example h3 ul{
        padding-left: 20px;
        font-weight: 400;
        text-align: left;
        line-height: 30px;
        letter-spacing: 1px;
        word-break: normal !important;
        font-size: 16px;
    }
    .temp .example img{
        float: right;
        position: relative;
        bottom: 5px;
        transform: rotate(180deg);
    }
    .temp .open img{
        transform: rotate(0deg);

    }
    .temp .example .detail-info{
        margin-top: 41px;
        position: relative;
        display: none;
    }
    .temp .example .detail-info:after{
        position: absolute;
        content: "";
        width: calc(100% + 40px);
        top:-20px;
        left: -20px;
        height: 1px;
        background-color: #dddddd;
    }
    .temp .info-box{
        padding: 0 !important;
        border: none;
    }
    .temp .info-box-box{
        border-radius: unset;
        border-style:solid;
        border-width: thin;
        border-color: #D2D2D2;
        background: #fff;
    }
    .temp .example h3 .table table{
        border: 1px solid #FFC7C7;
        margin-top: 10px;
    }
    .temp .example h3 .table table tr{
        border-bottom: 1px solid #D2D2D2;
    }
    .temp .example h3 .table table td{
        padding: 10px;
        min-height: unset;
        height: auto;
        border-bottom: none;
        font-size: 16px;
        line-height: 26px;
    }
    .temp .example h3 .table table .title{
        background: #FFEFEF;
        border-right: 1px solid #FFC7C7;
    }
    @media (max-width: 1045px) {
        .article-header .fw700{
            font-size: 30px;!important;
        }
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_guide_en"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    What is the delivery price indexation system?
                </li>
                <li>
                    How to make stndard non-indexation contract
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">How to make stndard non-indexation contract</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="agreement" class="content">
                <div class="accordion-container">
                    <!--   미연동 대상 주요 원재료 명칭 -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>1. Name of Major raw material not to be indexed</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; &nbsp;Describe Major raw material decided through the discussion between contractors not to be indexed out of main materials to be used for production by commissioned enterprise.</p>
                                    <ul>
                                        <p class="text mt10">
                                            &#9675; The Major raw material should be indexed in principle, but it may not be indexed when commissioning enterprise and commissioned enterprise agreed for non-indexation.
                                        </p>
                                        <p class="text mt10">
                                            &#9675; It is not needed making non-indexation agreement because the case of no Major raw material is not for indexation of delivery price.
                                        </p>
                                        <p class="text mt10">
                                            &#9675; When the commissioning enterprise is small company according to Article 21 (3) of Act On The Promotion Of Mutually Beneficial Cooperation
                                            Between Large Enterprises and Small and medium Enterprises and terms of transaction effected on consignment and commission is less than 90 days and less than 100 million Korean Won
                                            of receivables, no need of making non-indexation agreement because describing delivery price indexation is not obliged.
                                        </p>
                                    </ul>
                                </section>
                            </div>
                        </div>
                    </div>
                    <!--   협의 개요   -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>2. Overview on Discussion</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; &nbsp;Prime contractor shall discuss sincerely in relation to the indexation.  </p>
                                    <ul>
                                        <p class="text" style="margin-bottom: 0px">&#9675; Describe date, procedures and the name and position of the authorized members of
                                            commissioning enterprise and commissioned enterprise for discussion at making non-indexation agreement. </p>
                                        <p class="text"> - In this case, substantive discussions such as holding meetings and exchanging opinions must take place,
                                            and an authorized representative should participate in the discussions. </p>
                                    </ul>
                                    <div style="background: #FAFAFC; border-radius: 10px;padding: 20px;box-sizing: border-box;">
                                       <h4 class="mb10"> &lt;Act On The Promotion Of Mutually Beneficial Cooperation Between Large Enterprises and Small and medium Enterprises&gt;</h4>
                                        Article 21(Issuance of Written Agreements)<br>
                                        <p style="padding-left: 10px;">(2) A commissioning enterprise shall faithfully consult with a commissioned enterprise in order to enter the matters prescribed in paragraph (1) 4 in the written agreement.<p>
                                        <p style="padding-left: 10px;">(4) No commissioning enterprise shall abuse its position in a transaction regarding transactions effected on consignment and commission in connection with the linkage of
                                        the price of delivered goods, or conduct any act to evade the application of this Article by fraud or other improper means.</p>
                                    </div>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title">Reference)  Illegal action by taking advantage of non-indexation agreement</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:left">&#9634; Penalty point and delay charge may be imposed in case of illegal actions of non-indexation agreement.<br/>
                                                    &#9634; commissioned enterprise may request entering indexation agreement when  commissioning enterprise make illegal action related to
                                                    non-indexation discussion according to Clause 2 Article 3 of standard non-indexation agreement, and commissioning enterprise shall abide by the obligations related to the indexation.
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
                        <h3>3. Reason of non-indexation</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; &nbsp;Commissioning enterprise and commissioned enterprise shall describe the reasons of non-indexation. </p>
                                    <ul style="color: #505050;">
                                        <p class="text">&#9675; However, no need of matching the reasons between contractors when non-indexation is agreed. </p>
                                        &nbsp;&nbsp;* The agreement on non-indexation does not exclude the application of Article 22-2 and Paragraph 4 Clause 1 Article 25 (Points of compliance)
                                        in Act On The Promotion Of Mutually Beneficial Cooperation Between Large Enterprises and Small and medium Enterprises (Adjustment on delivery price depending to supply price fluctuation).
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