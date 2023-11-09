<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<head>
</head>
<style>
    .pl30{
        padding-left: 30px;
    }
    .ul-box{
        margin-top: 33px;
        margin-bottom: 15px;
        padding-left: 30px;!important;
    }
    .ul-box .li-box {
        padding-left: 10px;
    }
    .li-box::marker {
        content: '\25A2';
    }
    .li-pb15{
        padding-bottom: 15px;
    }
    .li-minus::marker {
        content: '\002D';
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
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    What is the delivery price indexation system?
                </li>
                <li>
                    Concept
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">Concept</h1>
            </div>
            <div id="about" class="content concept">
                <section class="font16 point4-text">
                    <h2 class="title"> What is the delivery price indexation system?</h2>
                    <div class="box-container">
                        <p class="mb20 m-text">
                            <b class="text-red">The delivery price indexation system</b> is a system in which the commissioning enterprise enters into a written agreement
                            that includes adjusting the delivery price in conjunction with the change when the price of major raw materials such as goods supplied
                            to Commissioned enterprise changes above a certain level.
                        </p>
                       <p class="mt20 mb20 m-text">
                           You can contribute to stabilizing the supply chain by adjusting the delivery price
                           for changes in raw material prices that cannot be predicted at the time of signing the contract.
                       </p>
                        </p>
                        <div class="accordion-container">
                            <div class="item-wrap" onclick="detailOpen(this)" tabindex="1" >
                                <h3 class="ar-title">1. What is delivery price indexation?</h3>
                                <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                                <div class="detail-info">
                                    <ul>
                                        <li>
                                            The term "Delivery price indexations" means adjusting the price of delivered goods
                                            in proportion to the fluctuation, where the price of major raw materials changes between a commissioning enterprise
                                            and a commissioned enterprise by at least the agreed ratio not exceeding 10/100.
                                            <p class="font14 mt10 mb30 point9-text tip">
                                                (Clause 13 Article 2 in Act On The Promotion Of Mutually Beneficial Cooperation Between Large Enterprises and Small and medium Enterprises)
                                            </p>
                                        </li>
                                        <li>
                                            The term "major raw materials" means raw materials used to manufacture goods, etc.
                                            in transactions effected on consignment and commission, which account for at least 10/100 of the price of delivered goods.
                                            <p class="font14 mt10 point9-text tip">
                                                (Clause 12 Article 2 in Act On The Promotion Of Mutually Beneficial Cooperation Between Large Enterprises and Small and medium Enterprises)
                                            </p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="accordion-container">
                                <div class="item-wrap mt20" onclick="detailOpen(this)" tabindex="1">
                                    <h3 class="ar-title">2. Trade in Delivery price indexation : Transaction effected on consignment and commission Major Raw Materials </h3>
                                    <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>">
                                    <div class="detail-info">
                                        <h4 style="padding-bottom: 11px;">1. Major raw meterials</h4>
                                        <ul class="pl30">
                                            <li>
                                                It includes raw materials (Natural material, compound, processed material and intermediate goods but not limited thereto)
                                                to be used for production of goods by comissioned enterprise, and means the raw materials of which cost are over 10% of the delivery price.
                                                <div>
                                                    <p class="mt20">
                                                        ① Natural materials
                                                    </p>
                                                    <p class="info-box mt10">
                                                       &lt;Examples of natural material&gt;<br>
                                                        Natural Materials : Gold, copper, aluminum, natural rubber, lead, zinc, tin, nickel, coal, crude oil, hardwood etc.
                                                    </p>
                                                    <p class="mt20">
                                                        ② Compounds
                                                    </p>
                                                    <p class="info-box mt10">
                                                        &lt;Examples of compounds&gt;<br>
                                                            Polyethylene, polypropylene and polyvinyl chloride chloride (PVC) etc.
                                                    </p>
                                                    <p class="mt20">
                                                        ③ Substances made of natural materials or compounds for industrial supplies
                                                    </p>
                                                    <p class="info-box mt10">
                                                        &lt;Examples of natural material or compound which is processed for industrial purpose&gt;<br>
                                                        Metal, metal plate, aggregate, Timber cement, ready-mixed concrete, concrete, pig iron, asphalt, chemical fiber, synthetic resin and etc.
                                                    </p>
                                                    <p class="mt20">
                                                        ④ Intermediate goods purchased by the comissioned enterprise for use in the process of carrying out entrusted manufacturing
                                                    </p>
                                                    <p class="info-box mt10">
                                                        &lt;Examples of Intermediate goods purchased for use in the manufacturing process&gt;<br>
                                                    Automobile parts, electric and electronic parts, mechanical parts, petrochemicals, steel, screws, tires, electric sensors
                                                    and lamps, system semiconductors, electric motors, generators, transformers, modules, semi-finished goods etc.
                                                    </p>
                                                </div>
                                            </li>
                                        </ul>
                                        <h4 style="padding-bottom: 11px;margin-top: 33px;">
                                            2. Transaction effected on consignment and commission
                                        </h4>
                                        <ul class="pl30">
                                            <li>
                                                The term "transaction effected on consignment and commission" means a trade in which anyone who runs business of manufacture, construction work,
                                                processing, repair, sales, or services commissions the manufacture, construction work, processing, repair, services, or technology development (hereinafter referred to as "manufacture")
                                                of goods, parts, semi-finished goods, raw materials, etc.
                                                (hereinafter referred to as "goods, etc.") to any other small-medium enterprise and the commissioned small-medium enterprise manufactures the goods, etc. in a specialized manner
                                                <p class="font14 mt10 mb30 point9-text tip">
                                                    (Clause 4 Article 2 in Act On The Promotion Of Mutually Beneficial Cooperation Between Large Enterprises and Small and medium Enterprises)
                                                </p>
                                            </li>
                                            <li>
                                                A middle-standing enterprise prescribed by Presidential Decree, in a transaction relationship created on consignment and commission with a company belonging to an enterprise group
                                                subject to the limitations on mutual investment under Article 31 (1) of the Monopoly Regulation and Fair Trade Act, shall be construed as a commissioned enterprise under Articles 21 through 23,
                                                25 (1), and 27 (1) of the Act on the Promotion of Mutually Beneficial Cooperation between Large Enterprises and Small and Medium Enterprises.
                                                <p class="font14 mt10 point9-text tip">
                                                    (Article 13 in 「Special Act On The Promotion Of Growth And The Strengthning of Competitiveness Of Middle-Standing Enterprises」)
                                                </p>
                                            </li>
                                            <p class="font14 mt10 point9-text tip">
                                                “Middle-standing enterprises prescribed by Presidential Decree” means middle-standing enterprises, the average turnover or annual turnover of which
                                                (hereinafter referred to as “average sales, etc.”) is less than 300 billion won.<br>
                                                (Article 6 in 「Enforcement Decree Of The Special Act On The Promotion Of Growth And The Strengthning of Competitiveness Of Middle-Standing Enterprises」)
                                            </p>
                                        </ul>
                                        <ul class="ul-box">
                                            <li class="li-box">
                                                The following examples are included in the scope of "providers for doing business on production, construction, processing, repair, selling and service."
                                            </li>
                                        </ul>
                                        <div class="flex-item">
                                            <div class="">
                                                <table class="company-table font14 point4-text">
                                                    <tr class="fw500 font16 point7-text ">
                                                        <td class="t-head">Classification</td>
                                                        <td class="t-head tc">Scope</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Manufacturing
                                                        </td>
                                                        <td>
                                                            All manufacturing industries except processing
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Construction
                                                        </td>
                                                        <td>
                                                            General construction and specialized construction
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Processing
                                                        </td>
                                                        <td>
                                                            Lumber sawing, lumber processing, metal heat treatment, plating and other metal processing
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Repair
                                                        </td>
                                                        <td>
                                                            Computer and communication unit repair work, automobile and motorcycle repair work and consumer electronics repair work and etc.
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Distribution
                                                        </td>
                                                        <td>
                                                            Whole sales and retail sales
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Service
                                                        </td>
                                                        <td>
                                                            Electricity, gas, water supply, transportation and warehouse, accommodation and restaurant, information
                                                            and communication business, service related to real estate, science and technology service and education service
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <ul class="ul-box">
                                            <li class="li-box">
                                                "Doing as a business" means the continuous and repetitive conduct of economic activities, regardless of whether
                                            they are for profit or non-profit purposes. This involves engaging in economic actions in response to
                                            the supply of certain economic benefits and receiving corresponding economic benefits in return.
                                            </li>
                                        </ul>
                                        <ul style="padding-left: 43px">
                                            <li>
                                                For this matter, business registration, sales creation from such business
                                                and whether independent goods and services are supplies in business are comprehensively considered for decision.
                                            </li>
                                        </ul>
                                        <ul class="ul-box">
                                            <li class="li-box">
                                                "Commissioning enterprise" is an enterprise doing business for production, construction, processing, repair,
                                                sales and service by comissioning production of goods, parts, semi-products and raw material, construction, processing, repair,
                                                service or technology development to small and medium companies.
                                            </li>
                                        </ul>
                                        <ul style="padding-left: 43px">
                                            <li>
                                                Foreign Corporations are allowed, and bigger annual sales turnover than subcontracting company is not required.
                                            </li>
                                        </ul>
                                        <ul class="ul-box">
                                            <li class="li-box">
                                                "Commissioned enterprise" means specialized small and medium companies in production, construction, processing,
                                                repair, service and technology development by comissioning production of goods, parts, semi-products and raw material, construction,
                                                processing, repair, service or technology development from contracting company.
                                            </li>
                                        </ul>
                                        <ul style="padding-left: 43px">
                                            <li>
                                                The enterprises classified for group of enterprises restricted from mutual investment according to
                                                ｢Special Act on Expediting Growth and Strengthening on Competitiveness of Middle Standing Enterprises」),
                                                and middle standing enterprises related to contracting·sub-contracting trade less than average sales turnover or annual sales turnover in 300 billion Korean Won are included.
                                            </li>
                                        </ul>
                                        <ul class="ul-box" style="color: #505050;">
                                        ※ Commissioning enterprise may not describe the details on delivery price indexation on the agreement
                                            in case of the reasons defined in Clause 3 Article 21 of Act On The Promotion Of Mutually Beneficial Cooperation Between Large Enterprises and Small and medium Enterprises
                                        </ul>
                                        <li class="info-box mt10" style="display: block">
                                            Article 21 (Issuance of Written Agreements)<br>
                                            (3)In any of the following cases, a commissioning enterprise need not enter the matters prescribed in paragraph (1) 4 in the written agreement: Provided,
                                            That in cases falling under subparagraph 4, a commissioning enterprise and a commissioned enterprise shall clearly enter the purport and reasons therefor in the written agreement:<br>
                                            1. Where a commissioning enterprise is a small enterprise under Article 2 (2) of the Framework Act on Small and Medium Enterprises;<br>
                                            2. Where the duration of the transaction effected on consignment and commission is within a period prescribed by Presidential Decree within the scope of not exceeding 90 days;<br>
                                            3. Where the price of delivered goods does not exceed the amount prescribed by Presidential Decrees within the scope of 100 million won;<br>
                                            4. Where a commissioning enterprise and a commissioned enterprise agree not to link the price of delivered goods.
                                        </li>
                                    </div>
                                </div>
                                <div class="item-wrap mt20 mb10" onclick="detailOpen(this)" tabindex="1">
                                    <h3 class="text-mobile ar-title">3. Definition</h3>
                                    <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                                    <div class="detail-info">
                                        <h4 style="padding-bottom: 11px;margin-top: 33px;">
                                            1. Raw Material to be Indexed
                                        </h4>
                                        <ul class="pl30">
                                            <li class="li-pb15">
                                                The Major raw materials defined in Clause 13 Article 2 of Act On The Promotion Of Mutually Beneficial Cooperation Between
                                                Large Enterprises and Small and medium Enterprises (Raw material cost more than 10% of delivery price) are subject matter, etc.s to be indexed.
                                            </li>
                                            <li>
                                                However, even for raw materials that do not qualify as major raw materials, the parties involved may voluntarily apply the indexation system through mutual agreement.
                                            </li>
                                        </ul>
                                        <h4 style="padding-bottom: 11px;margin-top: 33px;">
                                            2. Basic Index for Raw Material Price
                                        </h4>
                                        <ul class="pl30">
                                            <li class="li-pb15">
                                                Basic indexes for measuring increased or decreased price of raw materials to be indexed, and those shall be defined by periodical public notice by the authoritative agencies.
                                            </li>
                                            <li class="li-minus" style=" padding-left: 10px;">
                                                However, in case of no indexes or improper use of the notified indexes (Big difference between noticed index and real trade price due to price negotiation power, etc.),
                                                the real trading price and the price decided by both parties on the corresponding raw material may be adapted.
                                            </li>
                                        </ul>
                                        <h4 style="padding-bottom: 11px;margin-top: 33px;">
                                            3. Base time and comparison time for calculating the rate of change in raw material prices
                                        </h4>
                                        <ul class="pl30">
                                            <li>
                                                The base time and comparison time are set to calculate the rate of change in raw material prices. Calculate the rate of change
                                                in raw material price based on how much the raw material price at comparison has fluctuated from the raw material price at base.
                                            </li>
                                        </ul>
                                        <h4 style="padding-bottom: 11px;margin-top: 33px;">
                                            4. Adjustment Conditions
                                        </h4>
                                        <ul class="pl30">
                                            <li>
                                                This refers to the ratio of changes in the price of major raw materials compared to the base time.
                                                If the rate of change in the price of major raw materials changes beyond the adjustment requirement, the delivery price must be adjusted.
                                            </li>
                                            <p class="info-box mt10">
                                                (Ex) At the changes over ±3%
                                            </p>
                                        </ul>
                                        <h4 style="padding-bottom: 11px;margin-top: 33px;">
                                            5. Adjustment Period
                                        </h4>
                                        <ul class="pl30">
                                            <li>
                                                It means the period of determining Y/N for delivery price indexation by checking whether adjustment condition is satisfied.
                                            </li>
                                            <p class="info-box mt10">(Ex) 1 month or quarterly <br>
                                                (Ex) Randomly or at the changes on raw material price
                                            </p>
                                        </ul>
                                        <h4 style="padding-bottom: 11px;margin-top: 33px;">
                                            6. Adjustment Date
                                        </h4>
                                        <ul class="pl30">
                                            <li>
                                                It means the date of deciding on delivery price adjustment according to adjustment period.
                                            </li>
                                            <p class="info-box mt10">
                                                (Ex) The 1st day of every month<br>
                                                (Ex) Ending date of every quarter
                                            </p>
                                        </ul>
                                        <h4 style="padding-bottom: 11px;margin-top: 33px;">
                                            7. Adjusted Price Reflection Date
                                        </h4>
                                        <ul class="pl30">
                                            <li class="li-pb15">
                                                It means basic date of applying adjusted delivery price.
                                            </li>
                                            <li class="li-minus" style=" padding-left: 10px;">
                                                contracting company shall pay for the delivered goods after the adjusted price reflection date based on adjusted price according to Clause 4 Article 6 of Standard Indexation Agreement.
                                            </li>
                                            <p class="info-box mt10">
                                                (Ex) The 1st day of every month or within 7 days from indexation date<br>
                                                (Ex) Ending date of every quarter
                                            </p>
                                        </ul>
                                        <h4 style="padding-bottom: 11px;margin-top: 33px;">
                                            8. Delivery Price Indexation Formula
                                        </h4>
                                        <ul class="pl30">
                                            <li>
                                                It means a formula to adjust the delivery price by reflecting the price change when the price of Major raw material satisfies the adjustment condition.
                                            </li>
                                            <p class="info-box mt10">
                                                (Ex) Changed price = Basic raw material price at comparison time  × Weight of raw material (2kg) + 5,000 Korean Won
                                            </p>
                                        </ul>
                                        <h4 style="padding-bottom: 11px;margin-top: 33px;">
                                            9. Reflection Rate
                                        </h4>
                                        <ul class="pl30">
                                            <li class="li-pb15">
                                                It means the raw material change rate to be reflected to the adjustment.
                                            </li>
                                            <li class="li-minus" style=" padding-left: 10px;">
                                                Reflecting 100% of the changed portion can meet the purport of introducing delivery price indexation system.
                                                However, considering the individual circumstances of enterprises, the reflection rate can be determined voluntarily through mutual agreement between the  commissioning and commissioned enterprise.
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

<script>
    function detailOpen(d) {
        if (!$(d).hasClass("open")) {
            $(d).find(".detail-info").slideDown();
            $(d).addClass("open");
        }
        else {
            $(d).find(".detail-info").slideUp();
            $(d).removeClass("open");
        }
    }
</script>

