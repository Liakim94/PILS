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
    .li-mark{
        font-weight: 400;
        color: #767676;
        padding-left: 10px;
    }
    .li-mark::marker {
        content: '\203B';
    }
    .ul-box .li-box {
        padding-left: 10px;
        margin-bottom: 15px;
    }
    .li-box::marker {
        content: '\25A2';
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
                    How to Make Indexation Table like subcontract payment
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">How to Make Indexation Table like subcontract payment</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <h3 >The commissioning enterprise and the commissioned enterprise must fully consult on the following and enter it in the indexation table.</h3>
                <ul class="disc" style="padding-left: 15px;">
                    <li class="li-mark">
                        The following items are based on standard linked contracts jointly prepared
                        and distributed by the Ministry of SMEs and Startups and the Fair Trade Commission.
                    </li>
                    <li class="li-mark" style="padding-bottom: 30px;"> Caution<br/>
                        The figures and contents presented in the form of (table) below are all examples prepared assuming
                        a hypothetical situation, and the contents of the actual contract shall be determined by the contracting parties through consultation.
                    </li>
                </ul>

                <div class="accordion-container">
                    <!--   물품등의 명칭   -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>Indexation Table like subcontract payment</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <ul class="ul-box">
                                <li class="li-box">
                                    The prime contractor and the subcontractor shall be determined as follows to index subcontracting payments
                                    for subcontracting transactions or transaction effected on consignment and commission
                                </li>
                            </ul>
                            <div class="flex-item">
                                <div class="">
                                    <table class="company-table font14 point4-text">
                                        <tr class="fw500 font16 point7-text ">
                                            <td class="t-head" style="width: 50%;">Classification</td>
                                            <td class="t-head tc">Description</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                1. Name of subject matter, etc. to be indexed like  subcontract payment
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  style="text-align: left;">
                                                2. Major raw material to be indexed like  subcontract payment
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  style="text-align: left;">
                                                3. Basic index of raw material price
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  style="text-align: left;">
                                                4. Base time and comparison time  for calculating change rate on raw material price
                                            </td>
                                            <td>
                                                base time:<br>
                                                comparison time :
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  style="text-align: left;">
                                                5. Adjustment condition
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                6. Adjustment period
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  style="text-align: left;">
                                                7. Adjustment date
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  style="text-align: left;">
                                                8. Adjustment price reflection date
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                9. Indexation formula like subcontractor's receivable
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                9.1. Reflection rate
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                10. Others
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <ul class="disc" style="padding-left: 50px;">
                                <li class="li-mark">
                                    In principle, it shall be made respectively for raw material to be indexed like subcontract payment, but a single indexation table may be made for the case of having common points across 3 and 10 for the raw material to be used in same subject matter, etc. and indexed.
                                </li>
                            </ul>
                            <li class="info-box mt10" style="">
                                <p>
                                    <strong> ※ Caution</strong><br>
                                    All figures and contents shown in the following &lt;Table&gt; are examples made in assuming the situation, and the details at the actual agreement shall be discussed and decided by contracting parties.
                                </p>
                            </li>
                        </div>
                    </div>
                </div>
            </div>
            <div id="agreement" class="content">
                <div class="accordion-container">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>1. Name of subject matter, etc. to be indexed like subcontract payment</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                            <section>
                                <p class="text">&#9634; &nbsp;Write down the name of the subject matter to index according to the delivery price indexation agreement.</p>
                                <p class="text mt10">&#9675; ‘Subject matter, etc’ means subject matter(goods), parts, semi-product and raw materials. </p>
                                <ul>- For example, write "Coating solution" for the subject matter, etc. of delivery price indexation when "coating solution"
                                    is delivered to commissioning enterprise by commissioned enterprise.
                                </ul>
                                <div class="table">
                                    <table>
                                        <tr>
                                            <td class="title">Classification</td>
                                            <td class="title">Description</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                1. Name of subject matter, etc. to be indexed like  subcontract payment
                                            </td>
                                            <td>Coating solution</td>
                                        </tr>
                                    </table>
                                    <ul>
                                        <p class="text mt10">
                                            - All products may be written for a few specifications in one product group in which same indexation rule is applied.
                                        </p>
                                    </ul>

                                    <table>
                                        <tr>
                                            <td class="title">Classification</td>
                                            <td class="title">Description</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                1. Name of subject matter, etc. to be indexed like  subcontract payment
                                            </td>
                                            <td>Lubricant (LO-001), Lubricant (LO-002), Lubricant (LO-003), Lubricant (LO-004) </td>
                                        </tr>
                                    </table>
                                </div>
                            </section>
                            </div>
                        </div>
                    </div>
                    <!--   주요 원재료   -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>2.  Major raw material to be indexed like subcontract payment </h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; &nbsp;Describe Major raw material amounted more than 10/100 of delivery price.</p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title">Reference) Scope of Raw Material  </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:left">&#9634; Cost of  subcontract payment are composed of raw material cost, labor cost and expenses.<br/>
                                                    &#9634; Raw material corresponds to material cost, and labor cost (Wages, etc.)
                                                    and expense (Transportation, fuel, etc.) are not the subject matter, etc.s of indexation system.
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br/>
                                    <p class="text">&#9634; Raw materials do not include gratuitous materials for which the subcontracting company does not bear the cost,
                                        but they do include chargeable materials for which costs are incurred.)</p>
                                    <ul style="color: #505050;">
                                        * (Ex): Payment-based supplied material cost=For 1,000 Korean Won (Assumed as cost for one raw material),
                                        subcontractor's price before deducting payment-based supplied material=10,000 Korean Won, the raw material is categorized as over 10% of subcontractor's price
                                        because payment-based supplied material cost is 10% of subcontractor's price.
                                    </ul>
                                    <p class="text mt10">&#9675; However, the indexation system may be applied by deciding as raw material
                                        to be indexed through mutual agreement even though the raw material is not categorized as Major raw material. </p>
                                    <ul>
                                        <p class="text"> - For example, "nickel" may be decided as a raw material to be indexed by the agreement between commissioning enterprise
                                            and commissioned enterprise in spite that the cost of "nickel" is less than 10% of coating solution supplied to commissioning enterprise by commissioned enterprise. </p>
                                    </ul>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title">Classification</td>
                                                <td class="title">Description</td>
                                            </tr>
                                            <tr>
                                                <td>2. Major raw material to be indexed like  subcontract payment</td>
                                                <td>Nickel</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <ul>
                                        <p class="text mt10">
                                            - In principle, separate delivery price indexation table shall be made for more than two materials,
                                            but one indexation table may be made when indexation criteria are same for the raw materials to be used for the same subject matter, etc..
                                        </p>
                                    </ul>
                                </section>
                            </div>
                        </div>
                    </div>
                    <!--   원재료 가격 기준지표   -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>3. Basic Index of Raw Material Price </h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; &nbsp;Describe the indexes which become criteria to measure the portion of increase
                                        or decrease in 'price of subject matter, etc. of raw material' related to delivery price indexation.</p>
                                    <p class="text">&#9675; The criteria index shall be decided by the index or equivalent level index noticed periodically by authoritative agencies. </p>
                                    <p class="text"> <strong>(Example)</strong> The indexes notified in public by London Metal Exchange (LME), Bank of Korea (www.bok.or.kr), e-Naraindex (www.index.go.kr),
                                        Public Procurement Service (www.pps.go.kr), Ministry of Trade, Industry and Energy (www.motle.go.kr) and professional price investigation agencies registered to Minister of Economy and Finance.
                                    </p>

                                    <div class="table mb10">
                                        <table>
                                            <tr>
                                                <td class="title">Classification</td>
                                                <td class="title">Description</td>
                                            </tr>
                                            <tr>
                                                <td>3. Basic Index of Raw Material Price</td>
                                                <td>LME Nickel Official Price, Cash, Offer, USD/ton</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <ul> - The price in Korean Won by reflecting exchange ratio may be set for the basic price in case of using international indexes. </ul>
                                    <div class="table mb10">
                                        <table>
                                            <tr>
                                                <td class="title">Classification</td>
                                                <td class="title">Description</td>
                                            </tr>
                                            <tr>
                                                <td>3. Basic Index of Raw Material Price</td>
                                                <td>LME Nickel Official Price × Exchange ratio of Korean Won and US dollar of Bank A, Korean Won/ton</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <ul style="color: #505050;">
                                        ※ Exchange rates may also be considered in the subsequent delivery price indexation formula.<br/>
                                        &nbsp; &nbsp;· If the exchange rate is reflected in the basic index, exchange rate fluctuations can be reflected in the determination of indexation requirements<br/>
                                        &nbsp; &nbsp;· However, when exchange rates are included in the indexation formula, exchange rate fluctuations do not affect the determination of indexation requirements
                                    </ul>
                                    <p class="text mt10">
                                        &#9634; However, any of the following may be chosen when improper indexes noticed in public by authoritative agencies or there are no indexes.
                                    </p>
                                    <ul style="color: #505050;">
                                        ① Price directly negotiated by the prime contractor with the seller of raw materials or Price sold by the prime contractor to the subcontractor. <br/>
                                        &nbsp; &nbsp; - The case of payment-based raw material supply may be decided as follows.
                                    </ul>
                                    <div class="table mb10">
                                        <table>
                                            <tr>
                                                <td class="title">Classification</td>
                                                <td class="title">Description</td>
                                            </tr>
                                            <tr>
                                                <td>3. Basic Index of Raw Material Price</td>
                                                <td>The price stipulated at the raw material trade agreement between  commissioning enterprise and commissioned enterprise</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <ul style="color: #505050;">
                                        ② Price that can be verified by the commissioning enterprise as the selling price
                                        per unit of the raw material sold by the seller of the raw material to the relevant commissioned enterprise<br/>
                                        &nbsp; &nbsp;- The following indexation methods may be decided when actual raw material purchasing price is
                                        modified by reflecting actual manufacturing cost of commissioned enterprise.<br/>
                                        &nbsp; &nbsp;- Commissioned enterprise shall cooperate with commissioning enterprise to check the unit price of raw material like offering the breakdown of cost.<br/>
                                        &nbsp; &nbsp; * In this case, the Commissioned enterprise must submit proof of raw material costs in good faith,
                                        and thecommissioning enterprise must actively cooperate to protect the submitted data from being used for purposes other than the indexation contract.<br/>
                                        <p class="mt10" style="color: #505050;">
                                            ③ The price determined based on the mutually agreed data (Agreement, cost breakdown and quotation sheet)
                                        </p>
                                        &nbsp; &nbsp;- The contractors may establish the basic indexes under free discussion like the case of using any of the market prices, international index and mixed price of actual purchasing cost and international index.
                                    </ul>
                                    <p class="text mt10">&#9675; In case of more than two raw materials for indexation, all of them shall be described as follows. </p>
                                    <div class="table mb10">
                                        <table>
                                            <tr>
                                                <td class="title" style="width: 29%;">Classification</td>
                                                <td class="title" colspan="3">Description</td>
                                            </tr>
                                            <tr>
                                                <td>2. Major raw material to be indexed like  subcontract payment</td>
                                                <td>Nickel</td>
                                                <td>Aluminum</td>
                                                <td>Copper</td>
                                            </tr>
                                            <tr>
                                                <td>3. Raw material price basic index</td>
                                                <td>LME Nickel Official Price, Cash, Offer, USD/ton</td>
                                                <td>LME Aluminium Offical Price, Cash, Offer, USD/ton</td>
                                                <td>LME Copper Offical Price, Cash, Offer, USD/ton</td>
                                            </tr>
                                        </table>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <!--   원재료 기준가격의 변동률 산정을 위한 기준시점 및 비교시점   -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>4. Base time and comparison time for calculating change rate on raw material price</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; &nbsp;Describe 'base time' and 'comparison time ' to calculate the fluctuation rate of raw material basic price* on adjustment date. </p>
                                    <ul>
                                        <p class="text">* Unit price of raw material at particular time according to raw material price basic index</p>
                                    </ul>
                                    <p class="text">&#9675; The rate of change in the basic price of raw materials refers to the rate of change in the price of raw materials between "base time" and "comparison time."</p>
                                    <ul  style="color: #505050;padding-bottom: 5px;">
                                        - For example,  when the raw material basic price of “copper” is 10,000 Korean Won/kg, and  12,000 Korean Won/kg at comparison time , the fluctuation rate is
                                        <img class="math" src="<c:url value="/images/common/math.png"/>" alt="수식">* 100 = 20%
                                    </ul>
                                    <p class="text">&#9675; Previous adjustment date may be decided for 'base time' and current adjustment date may be decided for 'comparison time ." </p>
                                    <ul>
                                        <p class="text">- For the following case, the comparison time  is April 2023 when current adjustment date is May 10, 2023,
                                            and January 2023 becomes the base time when the previous adjustment date is February 10, 2023.</p>
                                    </ul>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="40%">Classification</td>
                                                <td class="title" width="60%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    4. base time and comparison time  to establish raw material price fluctuation rate
                                                </td>
                                                <td>-base time:  Previous month of the previous adjustment date<br> (Agreement date in case of no changes in price)
                                                    <br/>
                                                    -comparison time : Previous month of the adjustment date (Average)
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt10">&#9675; Describe in all as follows when more than two materials are to be indexed and base time and comparing are differently decided. </p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="34%">Classification</td>
                                                <td class="title" colspan="3">Description</td>
                                            </tr>
                                            <tr>
                                                <td>2. Major raw material to be indexed like  subcontract payment</td>
                                                <td>Nickel</td>
                                                <td>Aluminum</td>
                                                <td>Copper</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    4. base time and comparison time  to establish raw material price fluctuation rate
                                                </td>
                                                <td>-base time: Previous adjustment date of previous month (In case of no changes in price, agreement date) (Average)
                                                    <br/>
                                                    -comparison time : Previous month of the adjustment date (Average)
                                                </td>
                                                <td colspan="2">-base time: Previous adjustment date of previous quarter (In case of no changes in price, agreement date) (Average)
                                                    <br/> -comparison time : Previous quarter of the adjustment date (Average)
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <!--   조정요건   -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>5.  Adjustment condition </h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; Adjustment condition shall be described by deciding
                                        less than 10/100  between the commissioning enterprise and the Commissioned enterprise</p>
                                    <p class="text">
                                        &#9675; For example, in case of deciding over 3% or under -3%, the delivery price shall be adjusted
                                        when the fluctuation rate between base time and comparing falls on adjustment condition, otherwise, the delivery price may not be adjusted.
                                    </p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>5. Adjustment condition</td>
                                                <td>Over 3% or under -3%</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt10">&#9675; Regardless of the rate of change, commissioning enterprise
                                        and commissioned enterprise can also decide to adjust the subcontract price on each adjustment day.</p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>5. Adjustment condition</td>
                                                <td>0% or indexation in all</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt10">&#9675; The case of selling of raw material to subcontracting company by contracting company may be decided as follows.</p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>5. Adjustment condition</td>
                                                <td>Indexation in all at the change of raw material selling price</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt10">&#9675;Describe all as follows when more than two raw materials to be indexed and adjustment conditions are different.</p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="34%">Classification</td>
                                                <td class="title" colspan="3">Description</td>
                                            </tr>
                                            <tr>
                                                <td>2. Major raw material to be indexed like  subcontract payment</td>
                                                <td>Nickel</td>
                                                <td>Aluminum</td>
                                                <td>Copper</td>
                                            </tr>
                                            <tr>
                                                <td>5. Adjustment condition</td>
                                                <td>Over 3% or under -3%</td>
                                                <td>Over 5% or under -5%</td>
                                                <td>Indexation in all</td>
                                            </tr>
                                        </table>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <!--   조정 주기   -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>6. Adjustment period </h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; Describe adjustment period for deciding Y/N for delivery price
                                        indexation depending on the satisfaction of raw material basic price fluctuation rate to adjustment condition.</p>
                                    <p class="text">&#9675; Adjustment period may be decided like, day, week, quarter, half year and year.</p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>6. Adjustment period </td>
                                                <td>1 month</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt10">&#9675; The case of selling raw material by contracting company to commissioning enterprise may be decided as follows. </p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>6. Adjustment period </td>
                                                <td>At each entrance into raw material trade agreement</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt10">&#9675; It may be adjusted at each satisfaction to adjustment condition. </p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>6. Adjustment period </td>
                                                <td>Random or at the satisfaction to adjustment condition</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt10">
                                        &#9675; Describe all as follows when more than two raw materials to be indexed and adjustment periods are different.
                                    </p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="34%">Classification</td>
                                                <td class="title" colspan="3">Description</td>
                                            </tr>
                                            <tr>
                                                <td>2. Major raw material to be indexed like  subcontract payment</td>
                                                <td>Nickel</td>
                                                <td>Aluminum</td>
                                                <td>Copper</td>
                                            </tr>
                                            <tr>
                                                <td>6. Adjustment period</td>
                                                <td>1 month</td>
                                                <td colspan="2">Quarter</td>
                                            </tr>
                                        </table>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <!--   조정일   -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>7. Adjustment date </h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; Describe the date for deciding delivery price indexation according to adjustment period. </p>
                                    <p class="text">&#9675; It may be decided as '1st day of every month' when adjustment period is 1 month or '10th of the first month of each quarter' when adjustment period is a quarter.
                                    </p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>7. Adjustment date</td>
                                                <td>1st day of every month</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt10">&#9675;The case of selling of raw material to commissioned enterprise by commissioning enterprise may be decided as follows. </p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>7. Adjustment date</td>
                                                <td>Date of raw material trade agreement</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt10">&#9675; Describe all as follows when more than two raw materials to be indexed and adjustment dates are different.</p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="34%">Classification</td>
                                                <td class="title" colspan="3">Description</td>
                                            </tr>
                                            <tr>
                                                <td>2. Major raw material to be indexed like  subcontract payment</td>
                                                <td>Nickel</td>
                                                <td>Aluminum</td>
                                                <td>Copper</td>
                                            </tr>
                                            <tr>
                                                <td>7. Adjustment date</td>
                                                <td>1st day of every month</td>
                                                <td colspan="2">1st day of every quarter</td>
                                            </tr>
                                        </table>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <!--     조정대금 반영시점      -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>8. Adjusted price reflection date </h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; Describe the date of applying adjusted delivery price on the goods, etc.</p>
                                    <p class="text">&#9675; Contracting company shall pay based on adjusted amount according to delivery price
                                        indexation on the goods to be delivered after adjusted price reflection date according to Clause 4 Article 6 of Standard Indexation Agreement. </p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="50%">Classification</td>
                                                <td class="title" width="50%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>8. Adjusted price reflection date</td>
                                                <td>1st day of every month</td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <td class="title" width="50%">Classification</td>
                                                <td class="title" width="50%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>8. Adjusted price reflection date</td>
                                                <td>Within 7 days from adjustment date</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text">&#9675; Describe all as follows when more than two raw materials to be indexed and adjustment price reflection dates are different.</p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="34%">Classification</td>
                                                <td class="title" colspan="3">Description</td>
                                            </tr>
                                            <tr>
                                                <td>2. Major raw material to be indexed like  subcontract payment</td>
                                                <td>Nickel</td>
                                                <td>Aluminum</td>
                                                <td>Copper</td>
                                            </tr>
                                            <tr>
                                                <td>8. Adjusted price reflection date</td>
                                                <td>1st day of every month</td>
                                                <td colspan="2">1st day of every quarter</td>
                                            </tr>
                                        </table>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <!--     납품대금 연동 산식      -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>9. Indexation formula like  subcontract payment </h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; Describe formula for estimating delivery price to be adjusted according to delivery price indexation.</p>
                                    <p class="text">&#9675; In case of indexing the delivery price in consideration of basic price and weight of the raw material, it may be decided as follows. </p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>9. Indexation formula like  subcontract payment</td>
                                                <td>
                                                    ㅇ Delivery price = Basic price of copper at comparison time  × Weight of copper (2kg) + 5,000 Korean Won
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt10">&#9675; In case of multiple raw materials to be indexed, it may be decided as follows. </p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>9. Indexation formula like  subcontract payment</td>
                                                <td>
                                                    ㅇ Delivery price = Basic price of copper at comparison time  × Weight of copper (2kg) + Basic price of steel at comparison time
                                                    × Weight of steel (2kg)+ 10,000 Korean Won
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt10">&#9675; It may be decided as follows when the points of delivery price indexation
                                        for a few specification details on single item are defined in one indexation agreement</p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="24%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>9. Indexation formula like  subcontract payment</td>
                                                <td>
                                                    ㅇ Delivery price = Basic price of copper at comparison time  × Weight of copper + 5,000 Korean Won
                                                    <br/>
                                                    ※ The weight of cooper shall be subject to the weight described in product specifications of purchasing system of contracting company.
                                                </td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <td class="title" width="24%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>9. Indexation formula like  subcontract payment</td>
                                                <td>
                                                    ㅇ Delivery price = Basic price of copper at comparison time  × Weight of copper + Basic price of steel at comparison time  × Weight of steel + Other points
                                                    <br/>
                                                    ※ The weight of cooper and steel and other points shall be subject to the weight described in product specifications of purchasing system of contracting company.
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>9.1. Reflection rate </h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>
                                    <p class="text">&#9634; It may be decided as follows in case of using reflection rate concept like partial reflection of fluctuation rate of raw material price. </p>
                                    <ul style="color: #505050;">
                                        * Deciding 100% of reflection rate meets the purport of introducing delivery price indexation, but it may be decided differently in consideration of the independent situation
                                        of contracting company and subcontracting company. However, only the agreement with over 50% of reflection rate is approved at the penalty score estimation according to 3. A, 6 of [Table 3]
                                        in Enforcement Decree Of The Act On The Promotion Of Mutually Beneficial Cooperation Between Large Enterprises And Small And Medium Enterprises.
                                    </ul>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%" colspan="3">Description</td>
                                            </tr>
                                            <tr>
                                                <td>9. Indexation formula like  subcontract payment</td>
                                                <td colspan="3">ㅇ Subcontracting price = Previous subcontracting price + (Basic price of lubricant at comparison time  – (Basic price of lubricant at base time) × Weight of lubricant ×  Reflection rate (100%)</td>
                                            </tr>
                                            <tr>
                                                <td>9.1. Reflection rate</td>
                                                <td colspan="3">100%</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <ul style="color: #505050;">※ The above formula may be expressed as follows. </ul>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%" colspan="3">Description</td>
                                            </tr>
                                            <tr>
                                                <td>9. Indexation formula like  subcontract payment</td>
                                                <td colspan="3">ㅇ Reflect 100% of the lubricant unit price change to subcontracting price between base time and comparison time.</td>
                                            </tr>
                                            <tr>
                                                <td>9.1. Reflection rate</td>
                                                <td colspan="3">100%</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt20 mb20">&#9634; In case of difficulty for direct clarifying the weight and unit price of raw material
                                        (Due to issues like management information, etc.), it may be decided by reflecting fixed ratio (in consideration of the ratio of unit price out of delivery price) to delivery price. </p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%" colspan="3">Description</td>
                                            </tr>
                                            <tr>
                                                <td>9. Indexation formula like  subcontract payment</td>
                                                <td colspan="3">ㅇ Subcontracting price = Previously adapted subcontracting price × (1+ Fluctuation rate of basic price of lubricant × Reflection rate (50%))</td>
                                            </tr>
                                            <tr>
                                                <td>9.1. Reflection rate</td>
                                                <td colspan="3">50%</td>
                                            </tr>
                                            </tr>
                                        </table>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <!--     기타 사항     -->
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>10. Others</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="info-box">
                                <section>

                                    <p class="text">&#9634; Describe the points required for delivery price indexation out of the points in the above.
                                        (Criteria on delivery price truncation, etc.)</p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="35%">Classification</td>
                                                <td class="title" width="65%">Description</td>
                                            </tr>
                                            <tr>
                                                <td>10. Others </td>
                                                <td>ㅇ Truncation less than 0.01 Korea Won at the estimation of delivery price</td>
                                            </tr>
                                        </table>
                                    </div>
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