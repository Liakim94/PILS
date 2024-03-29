<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title>연동표 작성</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<script>
    function infoOpen(i) {
        if (!$(i).hasClass("open")) {
            $(i).addClass("open");
            $(i).parents(".line-wrap").find(".info-box").slideDown();
        } else {
            $(i).removeClass("open");
            $(i).parents(".line-wrap").find(".info-box").slideUp();
        }
    }

    function infoOpen2(i) {
        if (!$(i).hasClass("open")) {
            $(i).addClass("open");
            $(".info-full-box .info-box").slideDown();
        } else {
            $(i).removeClass("open");
            $(".info-full-box .info-box").slideUp();
        }
    }
</script>
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
                    연동표 작성하기
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">연동표 작성하기</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="agreement" class="content">
                <!-- 컨텐츠 start -->
                <form name="frmWrite" id="frmWrite" method="post"
                      action="${pageContext.request.contextPath}/join/agree.do">
                    <div class="write-container">
                        <div class="line-wrap">
                            <div class="label">
                                1. 목적물등의 명칭
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png" alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="name" name="name" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>1. 하도급대금등 연동 대상 목적물등의 명칭</h3>
                                        <p class="text">&#9634; 위탁기업이 수탁기업에 제조를 위탁한 물품등으로서,
                                            그 납품대금이 이 연동약정에 따라 납품대금 연동의 대상이 되는 것의 명칭을 기재 합니다.</p>
                                        <p class="text mt10">&#9675; "물품등"은 물품, 부품, 반제품(半製品) 및 원료 등을 말합니다.</p>
                                        <ul>- 예를 들어, 수탁기업이 위탁기업에 “코팅 용액”을 납품하는 경우
                                                납품대금 연동 대상이 되는 품목을 “코팅 용액”으로 기재합니다.
                                        </ul>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>1. 하도급대금등 연동 대상 목적물등의 명칭</td>
                                                    <td>코팅용액</td>
                                                </tr>
                                            </table>
                                        </div>
                                            <ul>
                                                <p class="text mt10">- 하나의 품목군에 여러 상세 사양이 존재하고, 동일한 연동 기준이 적용되는 경우에는 이를 모두 기재할 수 있습니다.</p>
                                            </ul>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>1. 하도급대금등 연동 대상 목적물등의 명칭</td>
                                                    <td>윤활유(LO-001), 윤활유(LO-002), 윤활유(LO-003), 윤활유(LO-004)</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                2. 주요 원재료
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png" alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="prmy_mat" name="prmy_mat" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>2. 하도급대금등 연동 대상 주요 원재료</h3>
                                        <p class="text">&#9634; &nbsp;납품대금 연동 대상 주요 원재료인 그 비용이 납품대금의 100분의 10 이상인 원재료를 기재합니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title">참고) 원재료의 범위</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:left">&#9634; 하도급대금의 공급원가는 재료비, 노무비, 경비 등으로 구성<br/>
                                                        &#9634; 원재료는 재료비에 해당하며, 노무비(인건비 등), 경비(운반비, 유류비 등)은 연동제의 적용 대상이 아님
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br/>
                                        <p class="text">&#9634; 원재료에는 수탁기업이 비용을 부담하지 않는 무상사급자재는 포함 되지 않으나, 비용을 부담하는 유상사급자재는 포함됩니다.</p>
                                        <ul> * (예): 유상사급자재비=1천원(하나의 원재료에 대한 비용이라고 가정), 유상사급자재비 공제전 하도급대금=1만원인 경우 유상사급자재비는 하도급대금의 10%이므로 그 비용이 하도급대금의 10% 이상인 원재료에 해당</ul>
                                        <p class="text mt10">&#9675; 다만, 주요 원재료에 해당하지 않는 원재료라 하더라도 당사자간 합의 하여 자율적으로 연동 대상 원재료로 정하여 연동제를 적용할 수 있습니다.</p>
                                        <ul>
                                            <p class="text"> - 예를 들어, 수탁기업이 위탁기업에 납품하는 코팅용액에 “니켈”의 비용이 납품대금의 10% 미만이더라도, 위·수탁기업간 합의에 따라 “니켈”을 연동 대상 원재료로 정할 수 있습니다.</p>
                                        </ul>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>2. 하도급대금등 연동 대상 주요 원재료</td>
                                                    <td>니켈</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <ul>
                                            <p class="text mt10"> - 대상 원재료가 두 개 이상인 경우 원재료별로 각각 납품대금 연동 표를 작성하는 것이 원칙이나, 동일한 목적물등에 사용되는 연동 대상 원재료로서 연동기준이 동일한 경우 하나의 연동표로 작성 할 수 있습니다.</p>
                                        </ul>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                3. 원재료 가격 기준지표
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png" alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="prmy_mat_std" name="prmy_mat_std" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>3. 원재료 가격 기준지표</h3>
                                        <p class="text">&#9634; &nbsp;납품대금 연동 관련 ‘대상 원재료 가격’의 상승 또는 하락 정도를 측정하기 위한 기준이 되는 지표를 기재합니다.</p>
                                        <p class="text">&#9675; 기준지표는 공신력 있는 기관이 주기적으로 고시하는 지표 또는 이에 준하는 지표로 정함을 원칙으로 합니다.</p>
                                        <p class="text">(예시) 런던금속거래소(LME, London Metal Exchange), 한국은행(www.bok.or.kr), e-나라 지표(www.index.go.kr),
                                            조달청(www.pps.go.kr), 산업통상자원부(www.motle.go.kr), 기획재정부장관에게 등록한 전문가격조사기관 등에서 고시하는 지표</p>
                                        <div class="table mb10">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>3. 원재료 가격 기준지표</td>
                                                    <td>LME Nickel Offical Price, Cash, Offer, USD/ton</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <ul> - 국제지표를 사용하는 경우 환율을 반영한 원 단위의 가격을 기준 가격으로 설정할 수 있습니다.</ul>
                                        <div class="table mb10">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>3. 원재료 가격 기준지표</td>
                                                    <td>LME Nickel Offical Price × A은행 기준 원달러 환율, 원/ton</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <ul>
                                            ※ 후술할 납품대금 연동 산식에서 환율을 반영할 수도 있음<br/>
                                            &nbsp; &nbsp;· 가격 기준지표에 환율을 반영할 경우 환율 변동을 연동요건 판단에 반영할 수 있음<br/>
                                            &nbsp; &nbsp;· 연동 산식에서 환율을 반영하는 경우에는 환율 변동은 연동요건 판단에 영향을 미치지 못함
                                        </ul>
                                        <p class="text mt10">&#9634; 다만, 공신력 있는 기관이 주기적으로 고시하는 지표를 사용하는 것이 적절하지 않거나 이에 해당하는 지표가 없는 경우에는 다음의 어느 하나로 정할 수 있습니다.</p>
                                        <ul>
                                            ① 원사업자가 원재료의 판매처와 직접 협상한 가격 또는 원사업자가 수급사업자에게 판매한 가격 <br/>
                                            &nbsp; &nbsp; - 이른바 원재료 ‘유상사급’ 계약을 하는 경우 아래와 같이 정할 수 있습니다.
                                        </ul>
                                        <div class="table mb10">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title"기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>3. 원재료 가격 기준지표</td>
                                                    <td>위탁기업과 수탁기업간 원재료 거래 계약서에 명시된 가격</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <ul>
                                            ② 원재료의 판매처가 해당 수탁기업에게 판매한 원재료의 단위 당 판매가격으로서 위탁기업이 확인할 수 있는 가격<br/>
                                            &nbsp; &nbsp;- 수탁기업의 물품등의 제조원가를 실제로 반영하여, 실제 원재료 구매 비용 등을 보전하려는 경우 이와 같이 연동방법을 정할 수 있습니다.<br/>
                                            &nbsp; &nbsp;- 수탁기업은 위탁기업이 원재료의 단위 당 판매가격을 확인할 수 있도록, 원가 내역을 제공하는 등 위탁기업에 협조하여야 합니다.<br/>
                                            &nbsp; &nbsp; * 이 경우 수탁기업은 원재료 비용 증빙 자료를 성실히 제출하고, 위탁기업은 제공 받은 자료를 연동 계약 목적 외로 사용하지 않는 등 제출한 자료 보호를 위해 적극 협조하여야 합니다.<br/>
                                            <p class="text mt10">③ 그 밖에 양 당사자 간 협의한 자료(약정서, 원가내역서, 견적서 등)를 바탕 으로 정한 가격</p>
                                            &nbsp; &nbsp;- 시장 가격을 기준으로 하는 경우, 국제지표를 변형하여 기준으로 하는 경우, 실제 원재료 구매 가격과 국제지표를 혼합하여 기준을 새로이 설정하는 경우 등 계약당사자가 자유롭게 협의하여 기준지표를 설정할 수 있습니다.
                                        </ul>
                                        <p class="text mt10">&#9675; 대상 원재료가 두 개 이상인 경우에는 다음과 같이 모두 기재합니다.</p>
                                        <div class="table mb10">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>2. 하도급대금등 연동 대상 주요 원재료</td>
                                                    <td>니켈</td>
                                                    <td>알루미늄</td>
                                                    <td>동</td>
                                                </tr>
                                                <tr>
                                                    <td>3. 원재료 가격 기준지표</td>
                                                    <td>LME Nickel Offical Price, Cash, Offer, USD/ton</td>
                                                    <td>LME Aluminium Offical Price, Cash, Offer, USD/ton</td>
                                                    <td>LME Copper Offical Price, Cash, Offer, USD/ton</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label-full" style="font-weight:500">
                                4. 원재료 가격의 변동률 산정을 위한 기준시점 및 비교시점
                                <img class="inline-focus info" onclick="infoOpen2(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png"
                                     alt="자세히 보기">
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="line-wrap">
                                <div class="label bg-none">
                                    기준시점
                                </div>
                                <div class="input-wrap br">
                                    <input type="text" id="std_point" name="std_point" required/>
                                </div>
                                <div class="label bg-none">
                                    비교시점
                                </div>
                                <div class="input-wrap">
                                    <input type="text" id="change_point" name="change_point" required/>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap info-full-box">
                            <div class="info-box">
                                <section>
                                    <h3>4. 원재료 가격의 변동률 산정을 위한 기준시점 및 비교시점</h3>
                                    <p class="text">&#9634; &nbsp;조정일에 원재료 기준가격*의 변동률을 산정하기 위한 ‘기준시점’과 ‘비교시점’을 기재합니다.</p>
                                    <ul>
                                        <p class="text">* 원재료 가격 기준지표에 따른 주요 원재료의 특정 시점의 단위당 가격</p>
                                    </ul>
                                    <p class="text">&#9675; 원재료의 기준가격의 변동률은 ‘기준시점’ 대비 ‘비교시점’의 원재료 기준가격 변동률을 말합니다.</p>
                                    <ul> - 예컨대, “동”의 기준시점의 원재료 기준가격이 10,000원/kg이고, 비교시점의 원재료 기준가격이 12,000원/kg이라면 원재료 기준가격의
                                        변동률은 <img class="math" src="<c:url value="/images/common/math.png"/>" alt="수식">* 100 =
                                        20%입니다.
                                    </ul>
                                    <p class="text">&#9675; ‘기준시점’은 대금 변경이 있었던 직전 조정일을 기준으로 정할 수 있으며, ‘비교시점’은 이번 조정일을 기준으로 정할 수 있습니다.</p>
                                    <ul>
                                        <p class="text">- 아래 예시와 같이 정한 경우, 이번 조정일이 ‘23년 5월 10일이면 비교 시점은 ’23년 4월이고,
                                            대금 변경이 있었던 직전 조정일이 ‘23년 2월 10일이면 기준시점은 ’23년 1월이 됩니다.</p>
                                    </ul>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="40%">구분</td>
                                                <td class="title" width="60%">기재사항</td>
                                            </tr>
                                            <tr>
                                                <td>4. 원재료 가격의 변동률 산정을 위한 기준시점 및 비교시점</td>
                                                <td>-기준시점: 대금 변경이 있었던 직전 조정일(대금 변경이 없었던 경우 약정 체결일)의 전월(평균)<br/>
                                                    -비교시점: 조정일의 전월(평균)
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text mt10">&#9675; 연동 대상 원재료가 두 개 이상이고, 기준시점과 비교시점을 다르게 정하는 경우 다음과 같이 모두 기재합니다.</p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="40%">구분</td>
                                                <td class="title" width="60%" colspan="3">기재사항</td>
                                            </tr>
                                            <tr>
                                                <td>2. 하도급대금등 연동 대상 주요 원재료</td>
                                                <td>니켈</td>
                                                <td>알루미늄</td>
                                                <td>동</td>
                                            </tr>
                                            <tr>
                                                <td>4. 원재료 가격의 변동률 산정을 위한 기준시점 및 비교시점</td>
                                                <td>- 기준시점: 대금 변경이 있었던 직전 조정일 (대금 변경이 없었던 경우 약정 체결일)의 전월(평균)<br/>
                                                    - 비교시점: 조정일의전월(평균)
                                                </td>
                                                <td colspan="2">- 기준시점: 대금 변경이 있었던 직전 조정일
                                                    (대금 변경이 없었던 경우 약정 체결일)의 전 분기(평균)<br/> - 비교시점: 조정일의 전 분기(평균)
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </section>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                5. 조정요건
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png"
                                     alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="rqrm_ust" name="rqrm_ust" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>5. 조정요건</h3>
                                        <p class="text">&#9634; 조정요건은 위탁기업과 수탁기업이 협의하여 100분의 10이내에서 정하여 기재합니다.</p>
                                        <p class="text">&#9675; 예를 들어 3% 이상 또는 –3% 이하로 정한 경우,
                                            연동 대상 원재료의 기준가격의 기준시점 대비 비교시점의 변동률이 조정요건에 해당하는 경우 납품대금을 조정하지만, 그렇지 않은 경우에는 납품대금을 조정 하지 않을 수 있습니다.
                                        </p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>5. 조정요건</td>
                                                    <td>3%이상 또는 –3%이하</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 변동률과 관계없이 매 조정일마다 하도급대금을 조정하도록 정할 수도 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>5. 조정요건</td>
                                                    <td>0% 또는 전부 연동</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 원사업자가 원재료를 직접 구매하여 수급사업자에 판매하는 경우 에는 아래와 같이 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>5. 조정요건</td>
                                                    <td>원재료 판매 가격 변동 시 전부 연동</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 연동 대상 원재료가 두 개 이상이고, 조정요건을 다르게 정하는 경우 다음과 같이 모두 기재합니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>2. 하도급대금등 연동 대상 주요 원재료</td>
                                                    <td>니켈</td>
                                                    <td>알루미늄</td>
                                                    <td>동</td>
                                                </tr>
                                                <tr>
                                                    <td>5. 조정요건</td>
                                                    <td>3%이상 또는 –3%이하</td>
                                                    <td>5% 이상 또는 –5%이하</td>
                                                    <td>전부 연동</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                6. 조정주기
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png"
                                     alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="rqrm_cycl" name="rqrm_cycl" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>6. 조정주기</h3>
                                        <p class="text">&#9634; 연동 대상 원재료 기준가격의 변동률이 조정요건을 충족하였는지 여부에 따라 납품대금 연동 시행 여부를 판단하는 조정주기를 기재 합니다.</p>
                                        <p class="text">&#9675; 조정주기는 일, 주, 월, 분기, 반기, 연 등으로 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>6. 조정주기</td>
                                                    <td>1개월</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 위탁기업이 원재료를 수탁기업에 판매하는 경우 아래와 같이 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>6. 조정 주기</td>
                                                    <td>원재료 거래 계약을 체결 시 마다</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 조정요건 충족 시마다 조정하도록 정할 수도 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>6. 조정 주기</td>
                                                    <td>수시 또는 조정요건 충족 시</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 연동 대상 원재료가 두 개 이상이고, 조정주기를 다르게 정하는 경우 다음과 같이 모두 기재합니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>2. 하도급대금등 연동 대상 주요 원재료</td>
                                                    <td>니켈</td>
                                                    <td>알루미늄</td>
                                                    <td>동</td>
                                                </tr>
                                                <tr>
                                                    <td>6. 조정 주기</td>
                                                    <td>1개월</td>
                                                    <td colspan="2">분기</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                7. 조정일
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png"
                                     alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="rqrm_date" name="rqrm_date" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>7. 조정일</h3>
                                        <p class="text">&#9634; 조정주기에 따라 납품대금 연동의 시행 여부를 판단하는 날을 기재 합니다.</p>
                                        <p class="text">&#9675; 조정주기가 1개월이라면 ‘매월 1일’, 조정주기가 분기라면 ‘매 분기 첫 달 10일’과 같이 정할 수 있습니다.
                                        </p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>7. 조정일</td>
                                                    <td>매월 1일</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 위탁기업이 원재료를 수탁기업에 판매하는 경우 아래와 같이 정할 수 있습니다. </p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>7. 조정일</td>
                                                    <td>원재료 거래 계약을 체결한 날</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 연동 대상 원재료가 두 개 이상이고, 조정일을 다르게 정하는 경우 다음과 같이 모두 기재합니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>2. 하도급대금등 연동 대상 주요 원재료</td>
                                                    <td>니켈</td>
                                                    <td>알루미늄</td>
                                                    <td>동</td>
                                                </tr>
                                                <tr>
                                                    <td>7. 조정일</td>
                                                    <td>매월 1일</td>
                                                    <td colspan="2">매 분기 초일</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                8. 조정대금 반영시점
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png"
                                     alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="reflect_point" name="reflect_point" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>8. 조정대금 반영시점</h3>
                                        <p class="text">&#9634; 물품등에 대하여 조정된 납품대금을 적용하는 기준이 되는 날을 기재 합니다.</p>
                                        <p class="text">&#9675; 표준 연동계약서 제6조 제4항에 따라 위탁기업은 조정대금 반영일 이후에 납품되는 물품등에 대하여 납품대금 연동에 따라 조정된 금액을 기준으로 납품대금을 지급하여야 합니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="50%">구분</td>
                                                    <td class="title" width="50%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>8. 조정대금 반영시점</td>
                                                    <td>매월 1일</td>
                                                </tr>
                                            </table>
                                            <table>
                                                <tr>
                                                    <td class="title" width="50%">구분</td>
                                                    <td class="title" width="50%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>8. 조정대금 반영시점</td>
                                                    <td>조정일로부터 7일 이내</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text">&#9675; 연동 대상 원재료가 두 개 이상이고, 조정대금 반영일을 다르게 정하는 경우 다음과 같이 모두 기재합니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>2. 하도급대금등 연동 대상 주요 원재료</td>
                                                    <td>니켈</td>
                                                    <td>알루미늄</td>
                                                    <td>동</td>
                                                </tr>
                                                <tr>
                                                    <td>8. 조정대금 반영일</td>
                                                    <td>매월 1일</td>
                                                    <td colspan="2">매 분기 초일</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                9. 하도급대금등 연동 산식
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png"
                                     alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="formula" name="formula" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>9. 납품대금 연동 산식</h3>
                                        <p class="text">&#9634; 납품대금 연동에 따라 조정될 납품대금을 산출하는 산식을 기재합니다.</p>
                                        <p class="text">&#9675; 원재료 기준가격과 원재료 중량을 고려하여 납품단가를 연동하는 경우, 다음과 같이 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 하도급대금등 연동 산식</td>
                                                    <td>
                                                        ᄋ 납품단가 = 비교시점의 동 기준가격 × 동 중량(2kg) + 5,000원
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 연동 대상 원재료가 여러 개인 경우, 다음과 같이 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 하도급대금등 연동 산식</td>
                                                    <td>
                                                        ᄋ 납품단가 = 비교시점의 동 기준가격 × 동 중량(2kg) + 비교시점의 철 기준가격 × 철 중량(2kg) + 10,000원
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 하나의 품목군에 속한 여러 상세 사양의 납품대금 연동에 관한 사항을 하나의 연동계약서에서 정한 경우 다음과 같이 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 하도급대금등 연동 산식</td>
                                                    <td>
                                                        ᄋ 납품단가 = 비교시점의 동 기준가격 × 동 중량 + 5,000원<br/>
                                                        ※ 동 중량은 원사업자 구매시스템에 제품 사양별로 기재한 중량에 따름
                                                    </td>
                                                </tr>
                                            </table>
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 하도급대금등 연동 산식</td>
                                                    <td>
                                                        ᄋ 납품단가 = 비교시점의 동 기준가격 × 동 중량 + 비교시점의 철 기준가격 × 철 중량 + 기타 항목<br/>
                                                        ※ 동 중량, 철 중량, 기타 항목은 원사업자 구매시스템에 제품 사양별로 기재한 중량에 따름
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                9.1. 반영비율
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png"
                                     alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="ratio" name="ratio" required/>
                                <div class="info-box">
                                    <section>
                                        <h3 style="margin-top: 20px;">9.1. 반영비율</h3>
                                        <p class="text">&#9634; 원재료 가격 변동분을 전부 반영하지 않고, 일부만 반영하는 경우 등 반영비율 개념을 사용하는 경우 다음과 같이 정할 수 있습니다</p>
                                        <ul>
                                            * 반영비율은 100%로 정하는 것이 납품대금 연동 도입 취지에 부합하지만, 위‧수탁기업이 개별적 사정을 고려하여 달리 정할 수 있습니다. 다만, 상생협력법 시행령 [별표3] 3.가.6)에 따른 벌점 경감산정 시에는 반영비율이 50%이상인 계약만 연동계약으로 인정됩니다.
                                        </ul>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 하도급대금등 연동 산식</td>
                                                    <td colspan="3">ᄋ 하도급단가 = 직전 하도급단가 + (비교시점 윤활기유 기준가격 – 기준시점 윤활기유 기준가격) × 윤활기유 중량 × 반영비율(100%)</td>
                                                </tr>
                                                <tr>
                                                    <td>9.1. 반영비율</td>
                                                    <td colspan="3">100%</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <ul>※ 위 산식은 다음과 같이 표기할 수도 있습니다.</ul>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 하도급대금등 연동 산식</td>
                                                    <td colspan="3">ᄋ 기준시점과 비교시점 간 윤활기유 원가 변동분의 100%를 하도급단가에 반영</td>
                                                </tr>
                                                <tr>
                                                    <td>9.1. 반영비율</td>
                                                    <td colspan="3">100%</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt20 mb20">&#9634; 원재료 중량 및 원가를 직접적으로 명시하기 곤란한 경우(경영정보 등 문제),
                                            원재료 기준가격 변동률의 일정 비율(납품단가에서 원재료 원가가 차지하는 비중 등 고려)을 납품단가에 반영하는 방식으로 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 하도급대금등 연동 산식</td>
                                                    <td colspan="3">ᄋ 하도급단가 = 직전에 적용된 하도급단가 × (1+윤활기유 기준가격의 변동률 × 반영 비율(50%))</td>
                                                </tr>
                                                <tr>
                                                    <td>9.1. 반영비율</td>
                                                    <td colspan="3">50%</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                10. 기타 사항
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png"
                                     alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="etc" name="etc" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>10. 기타 사항</h3>
                                        <p class="text">&#9634; 위 항목 외 납품대금 연동에 필요한 사항을 기재합니다. (납품단가의 절사 기준 등)</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>10. 기타 사항</td>
                                                    <td>ㅇ 납품단가 산출 시 0.01원 미만 절사</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="write-bottom">
                        <input type="submit" class="submit" value="등록"/>
                        <a href="${pageContext.request.contextPath}/join/agreeMain.do" class="back">취소</a>
                    </div>
                </form>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>
