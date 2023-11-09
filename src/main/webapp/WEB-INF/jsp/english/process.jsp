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
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="/">홈</a></li>
                <li>
                    What is the delivery price indexation system?
                </li>
                <li>
                    Learn about the price indexation process
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">Learn about the price indexation process</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <section class="font16 point4-text">
                    <div class="pc-process-wrap">
                        <img class="process" src="<c:url value="/images/common/process1.png"/>">
                        <img class="next" src="<c:url value="/images/common/next.png"/>">
                        <img class="process" src="<c:url value="/images/common/process2.png"/>">
                        <img class="next" src="<c:url value="/images/common/next.png"/>">
                        <img class="process" src="<c:url value="/images/common/process3.png"/>">
                        <img class="next" src="<c:url value="/images/common/next.png"/>">
                        <img class="process" src="<c:url value="/images/common/process4.png"/>">
                    </div>
                    <div class="mobile-process-wrap mobile">
                        <div class="img-wrap">
                            <img class="process" src="<c:url value="/images/common/process1.png"/>">
                        </div>
                        <div class="img-wrap">
                            <img class="process" src="<c:url value="/images/common/process2.png"/>">
                        </div>
                        <div class="img-wrap">
                            <img class="process" src="<c:url value="/images/common/process4.png"/>">
                        </div>
                        <div class="img-wrap">
                            <img class="process" src="<c:url value="/images/common/process3.png"/>">
                        </div>
                    </div>
                    <h2 class="title">① Provision of Indexation Agreement</h2>
                    <h4>
                      <ul class="disc">
                          <li class="mb20">
                              For the Major raw materials included trade of deliver price indexation, the commissioning enterprise shall make
                              the indexation agreement through sincere discussion with commissioned enterprise at the consigned production of goods. At this time,
                              commissioning enterprise and commissioned enterprise may use Standard Indexation Contract
                          </li>
                          <li class="mb20">
                              The indexation agreement shall include all descriptions* defined in Paragraph 4 Clause 1 Article 21 of Act On The Promotion Of Mutually Beneficial Cooperation
                              Between Large Enterprises and Small and medium Enterprises and Clause 1 Article 14 in Enforcement Decree Of The Act On The Promotion Of Mutually Beneficial
                              Cooperation Between Large Enterprises And Small And Medium Enterprises
                          </li>
                          <li class="mb20" style="list-style: none; padding-left: 4px;">
                              ▲Name of goods to be indexed for delivery price, ▲Major raw material to be indexed for delivery price, ▲Adjustment condition for delivery price indexation system,
                              basic index for Major raw material price, ▲Formula for delivery price indexation, ▲ Base time and comparison time for calculating change rate on Major raw material price
                              ▲Adjustment date, adjustment period and adjusted price reflection date for delivery price indexation
                          </li>
                          <li class="mb20">
                              All descriptions in sub-contractor price indexation table shall be filled out sincerely when
                              Standard Indexation Agreement is used because it includes the points to be described in indexation agreement.
                          </li>
                          <li class="mb20">
                              The Commissioning enterprise and Commissioned enterprise each retain one copy after signing or endorsing the indexation Agreement (or Standard Indexation Contract)
                          </li>
                      </ul>
                    </h4>
                    <h2 class="title mt40">② Check the Raw materials price change rate and calculating·adjustment on Delivery Price adjusted portion</h2>
                    <h4>
                        <ul class="disc">
                            <li class="mb20">
                                Commissioning enterprise and Commissioned enterprise shall check the rate of change between base and comparison time at each adjustment date specified in indexation agreement
                                and calculate the delivery price of the goods to be adjusted according to the index formula if the rate of change meets the adjustment requirements.
                            </li>
                            <li class="mb20">
                                Commissioning enterprise shall adjust the delivery price of the goods based on the calculated based on the calculated amount and applies
                                the adjusted delivery price on the date of reflection of the adjustment price.
                            </li>
                        </ul>
                    </h4>
                    <h2 class="title mt40">③ Making 「Deliver Price Change Table」 </h2>
                    <h4>
                        <ul class="disc">
                            <li class="mb20">
                                When the delivery price is adjusted, Commissioning enterprise and Commissioned enterprise shall write the date of reflection of the adjustment price,
                                the base price of the major raw materials to be linked at the time of comparison, and the adjusted delivery price in the
                                "Delivery Price Change Table" and sign (including electronic signatures pursuant to Article 2, No. 2 of the Electronic Signature Act) or sign and seal.
                            </li>
                        </ul>
                    </h4>
                    <h2 class="title mt40">④ Payment of Adjusted Delivery Price</h2>
                    <h4>
                        <ul class="disc">
                            <li class="mb20">
                                Commissioning enterprise shall pay the delivery price based on the adjusted price for the goods to be delivered after
                                adjusted price reflection date written on the Standard Indexation Contract.
                            </li>
                            <li class="">
                                At this time, Articles 6 (1) through (4) of the Standard indexation Contract shall not apply to the part that has been
                                implemented after the date of reflection of the adjustment price due to the delay in implementation due to reasons attributable to the commissioned enterprise.
                            </li>
                        </ul>
                    </h4>
                    <h2 class="title mt40">⑤ Document Furnish</h2>
                    <h4>
                        <ul class="disc">
                            <li class="mb20">
                                Commissioning enterprise and Commissioned enterprise shall furnish indexation agreement (Or Standard Indexation Contract) and annexed document
                                (｢Delivery price indexation table｣ and ｢Deliver Price Change Table｣) for 3 years according to Article 39 of Act On The Promotion Of Mutually Beneficial Cooperation
                                Between Large Enterprises and Small and medium Enterprises and Article 11 of Implementation Rule of said law.
                            </li>
                        </ul>
                    </h4>
                </section>
                <!-- 컨텐츠 end -->
                <br>
            </div>
        </div>
    </div>
</div>
