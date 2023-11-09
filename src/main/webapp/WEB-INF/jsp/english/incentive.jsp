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
                    Incentive offered to partner company
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">Incentive offered to partner company</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <h2 class="title">Incentive offered to partner company(2023)</h2>
                <h4>
                    <ul class="disc">
                        <p class="tip">
                            ※ Incentives are provided only to commissioning enterprise that have submitted the 'certificate of partner company involvement,'
                            and the incentive for exemption from the 2024  transaction effected on consignment and commission/ subcontract transaction survey is provided only
                            to commissioning enterprise that fall within the scope of eligible companies.
                        </p>
                    </ul>
                </h4>
                <div class="accordion-container mt40">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>Ministry of SMEs and Startups  </h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h4>
                                ◦ (Common) Beneficial assessment for the government awards (Merit of win-win growth)<br>
                                ◦ (Common) Additional point at the involvement into smart factory subsidizing project (5 points)<br>
                                ◦ (Common) Reduction on penalty point at the evaluation on obliged accusation request (Maximum –0.15 point)<br>
                                ◦ (Large company) Add 'introduction' and 'operation achievement' of delivery price indexation system at the point of win-win growth of large company assessment index,
                                    'delivery price adjustment' (Maximum 3 points (Some part of business category 4 points))<br>
                                ◦ (Large‧Middle standing company) Additional point at the selection by the companies hosting win-win advancing projects of large·small&medium companies (1 point))<br>
                                ◦ (Small & medium company) Expand the maximum loan limit of political fund for small and medium companies (Remained amount) 10 billion Korean Won (←6 billion Korean Won)<br>
                                ◦ (Small & medium company) Preferential guarantee for technology warrant fund to small and medium companies of exporting (Reduction of warrant fee by 0.4%p, warrant ratio 95%)<br>
                                ◦ (Small & medium company) Additional point to small and medium companies involved into export consortium (2 points)<br>
                                ◦ (Small & medium company) Additional point to foreign certification project (5 points)<br>
                                ◦ (Small & medium company) Additional point to export voucher project (1 point)<br>
                                ◦ (Small & medium company) Additional point to assessment of recommendation for military service designed firm<br>
                                ◦ (Common) Exemption on transaction effected on consignment and commission investigation on 2024 (Once on 2024 limitedly)<br>
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="accordion-container mt40">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>Fair Trade Commission</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h4 class="">
                                ① (Common) Reflection of indexation achievement to the performance assessment criteria in fair trade agreement (5 points)<br>
                                ② (Common) Approve the reason of reducing penalty point for subcontract act* (Maximum 3.5 points)<br>
                                <p class="pl10 tip">  * Offering incentive according to criteria on Fair Transactions In Subcontracting Act like indexation agreement entrance rate and price increase records </p>
                                ③ (Small & medium company) Additional point at the selection of demonstrative companies in subcontract transaction
                                <br>
                                ④ (Common) Recommendation to awarding the prize for merit in fair trade works
                                <br>
                                ⑤ (Common) Exemption on contracting and subcontracting investigation on 2024 (Once on 2024 in temporary)
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="accordion-container mt40">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>Financial Services Commission</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h4 class="">
                                ◦ (Common) Supply operation fund by interest reducing loan to the contracting company which performs indexation system (1 trillion Korean Won, Korea Development Bank)
                                <p class="pl10 tip">  * (Interest rate reduction) Large company maximum 0.3%p, middle standing company and SMEs maximum 0.7%p</p>
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="accordion-container mt40">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>Incentive for exempting investigation on  transaction effected on consignment and commission/  subcontract transaction on 2024</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h4 class="">
                                ◦ (For) Commissioning enterprise or Prime contractors who meet the following conditions based on the number of participating commissioned
                                enterprise(subcontractor) as of October 31, 2023, and the indexation agreement concluded as of January 31, 2024
                                <p style="text-align: center;font-size: 20px;margin-top:20px;"><strong>&lt;Companies for granting incentive&gt;</strong></p>
                                <div class="table">
                                    <table>
                                        <tr>
                                            <td class="t">Classification</td>
                                            <td class="t">Companies affiliated to large company group*/<br>
                                                Public agencies in state owned status</td>
                                            <td class="t">Middle standing company/<br>
                                                other public agencies**</td>
                                            <td class="t">Small & middle and company/<br> Local public agencies***</td>
                                            <td class="t">Remarks</td>
                                        </tr>
                                        <tr>
                                            <td>Count of involving subcontracting company</td>
                                            <td> Over 100 companies</td>
                                            <td>Over 40 companies</td>
                                            <td>Over 20 companies</td>
                                            <td>October 31, 2023 status quo</td>
                                        </tr>
                                        <tr>
                                            <td>Count of company entered into indexation agreement </td>
                                            <td>Over 50 companies</td>
                                            <td>Over 20 companies</td>
                                            <td>Over 10 companies</td>
                                            <td>January 31, 2024 status quo</td>
                                    </table>
                                </div>
                                <p class="pl10 tip">  * The group of companies limited for mutual investment and companies obliged for public  notice designated by Fair Trade Commission <br>
                                    ** Semi-government agency and other public organizations /***Local corporation, local industrial complex and local invested organizations</p>
                                <br>
                                ◦ (Benefit) ‘Exemption on contracting and subcontracting investigation on 2024 (Once on 2024 in temporary)<br>
                                ◦ (Organization for exemption) The companies which are excluded in exemption on incentive granting by Ministry of SMEs and Startups, Fair Trade Commission are excluded in investigation by competent ministry.<br>
                                <p class="pl10 tip">* Only the investigation on contracting and subcontracting trade is exempted for the cases related to subcontract act,
                                                    and only the investigation on subcontract trade for the cases related to Act On The Promotion Of Mutually Beneficial Cooperation.
                                </p>
                                <p class="pl10">- (Ministry of SMEs and Startups) Punished companies like improvement requested at investigation on 2023, non-reporting companies
                                    to unfair trade center on 2024 and dispute arbitration (Including advanced dispute arbitration) on 2024  <br>
                                - (Fair Trade Commission) Punished companies* due to the investigation on 2023 or companies under processing on cases or dispute arbitration </p>
                                <p class="pl10 tip">* Terms for assessment: May 1, 2023 - April 31, 2024. (For 1 year), ** May 1, 2024 status quo</p>
                                ◦ (Other) 'Entering into an indexation agreement' means that the subcontracting company includes matters related to delivery price indexation under Paragraph 4 Clause 1 Article 21 of the Act On The Promotion Of Mutually Beneficial Cooperation
                                Between Large Enterprises and Small and medium Enterprises or Paragraph 3 Clause 2 Article 3 of the Fair Transactions In Subcontracting Act in the agreement document, which is then issued by the subcontracting company to the contracting company.
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="accordion-container mt40">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>Others</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h4 class="">
                                ◦ Planned for additional incentive by selecting superb companies out of partner companies.
                            </h4>
                        </div>
                    </div>
                </div>
                <!-- 컨텐츠 end -->
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