<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<head>
</head>
<style>
    .article-header .fw700{
        font-size: 44px;
    }
    @media (max-width: 1078px) {
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
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    What is the delivery price indexation system?
                </li>
                <li>
                    Notes regarding the price indexation system
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">Notes regarding the price indexation system</h1>
            </div>
            <div id="about" class="content">
                <h2 class="title">Prohibition on Illegal Action related to delivery price indexation</h2>
                <h4>
                    <ul class="disc">
                        <li class="mb20">
                            Commissioning enterprise shall not abuse its position, fake or use other illegal means related to delivery price indexation.
                        </li>
                        <li class="mb10">
                            If the Commissioning enterprise an illegal act, such as forcing Commissioned enterprise to non-indexation,
                            Commissioning enterprise may receive a fine of 30 million won (1st), 40 million won (2nd), 50 million won (3rd),
                            or penalty points*(Point 5.1) depending on the number of violations.
                        </li>
                        <p class="font14 point9-text tip">
                            * Limited in public bidding application for exceeding 5 points in cumulative for 3 years.
                        </p>
                    </ul>
                </h4>
                <h2 class="title mt40">Other Illegal Action</h2>
                <h4>
                    <ul class="disc">
                        <li class="mb20">
                            In cases where a transaction falls under the scope of delivery price indexation, and despite not qualifying for any exceptions,
                            an indexation agreement is not entered into, a fine of 10 million KRW, corrective actions, and a penalty ranging from 1.5 to 2.0 points based on the type of corrective actions may be imposed
                        </li>
                        <li class="mb20">
                            Penalty points of 1.5 to 2.0 may be imposed depending on the type of corrective action and corrective action if the Commissioning
                            enterprise violates the obligation of sincere consultation with Commissioned enterprise or fails to fulfill the indexation agreement,
                            or if the purpose and reason of the agreement are not stated in the agreement after agreeing not to index the delivery price.
                        </li>
                    </ul>
                </h4>
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

