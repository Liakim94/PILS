<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title>약정서 작성</title>
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
                    납품대금연동제 동참하기
                </li>
                <li>
                    약정서 작성
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">약정서 작성</h1>
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
                                1. 물품등의 명칭
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png" alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="name" name="name" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>1. 물품등의 명칭</h3>
                                        <p class="text">&#9634; 위탁기업이 수탁기업에 제조, 공사, 가공, 수리, 판매, 용역 또는 기술개발(이하 “제조”라 한다)을
                                            위탁한 물품등으로서, 그 납품대금이 이 특별약정에 따라 납품대금 연동의 대상이 되는 것의 명칭을 기재합니다.</p>
                                        <ul>
                                            <li>"물품등"은 물품, 부품, 반제품(半製品) 및 원료 등을 말합니다.</li>
                                            <li>예를 들어, 수탁기업이 위탁기업에 “코팅 용액”을 납품하는 경우 납품 대금 연동 대상이 되는 품목을 “코팅 용액”으로 기재합니다.
                                                품목 번호가 있는 경우, 품목 번호도 기재합니다.
                                            </li>
                                            <li>하나의 품목군에 여러 상세 사양이 존재하고, 동일한 연동 기준이 적용되는 경우에는 이를 모두 기재할 수 있습니다.</li>
                                        </ul>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>1. 물품 등의 명칭</td>
                                                    <td>코팅용액(CC-001)</td>
                                                </tr>
                                            </table>
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>1. 물품 등의 명칭</td>
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
                                        <h3>2. 주요 원재료</h3>
                                        <p class="text">&#9634; 수탁기업이 물품 등의 제조에 사용할 원재료 중 해당 가격 변동 시, 납품대금 연동을 하기로 양
                                            당사자가 협의하여 정한 원재료를 기재합니다.</p>
                                        <p class="text">&#9675; 주요 원재료는 아래 사항을 고려하여 정할 수 있습니다.</p>
                                        <ul>
                                            <li>물품등의 제조에 사용되는 원재료 중 그 비용이 납품대금에서 10% 이상을 차지하는 원재료</li>
                                            <li>계속적 거래 관계 또는 장기간의 거래에서 원재료의 가격 변동을 주기적으로 반영할 필요가 있는 원재료</li>
                                            <li>국내외 가격지표가 명확하거나 위탁기업이 직접 원재료 구매가격을 협상하거나 구매하여 기준가격 설정이 용이한 원재료</li>
                                            <li>주 투입 원재료가 단수이거나 여러 원재료가 동시에 투입되는 경우라도 투입 원재료의 특정 및 원재료별 투입비율 등에 대한 확인이 가능한 원재료
                                            </li>
                                        </ul>
                                        <p class="text mt10">&#9675; 예를 들어, 수탁기업이 위탁기업에 납품하는 코팅용액에 “니켈”이 주된 원재료로 사용되는
                                            경우, 수탁·위탁기업 간 협의를 통해 “니켈”을 주요 원재료로 정할 수 있습니다.</p>
                                        <p class="example">(예시) 코팅용액에 사용되는 “니켈”, 동 케이블에 사용되는 “동”, 건설자재로 사용되는 “시멘트”</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>2. 주요 원재료</td>
                                                    <td>니켈</td>
                                                </tr>
                                            </table>
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title" colspan="3">기재사항</td>

                                                </tr>
                                                <tr>
                                                    <td>2. 주요 원재료</td>
                                                    <td>니켈</td>
                                                    <td>동</td>
                                                    <td>시멘트</td>
                                                </tr>
                                            </table>
                                        </div>
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
                                        <p class="text">&#9634; 납품대금 연동 관련 ‘주요 원재료 가격’의 상승 또는 하락 정도를 측정하기 위한 기준이 되는 지표를
                                            기재합니다.</p>
                                        <p class="text">&#9675; 기준지표는 공신력 있는 기관이 주기적으로 고시하는 지표 또는 이에 준하는 지표로 정함을 원칙으로
                                            합니다.</p>
                                        <p class="example">(예시) 런던금속거래소(LME, London Metal Exchange),
                                            한국은행(www.bok.or.kr), e-나라지표(www.index.go.kr), 조달청(www.pps.go.kr),
                                            산업통상자원부(www.motle.go.kr), 기획재정부장관에게 등록한 전문가격조사기관 등에서 고시하는 지표</p>
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
                                        <p class="text">&#9675; 다만, 이와 같은 지표를 사용하는 것이 적절하지 않은 경우에는 다음과 같이 정할 수 있습니다.</p>
                                        <ul>
                                            <li>위탁기업이 원재료의 판매처와 직접 협상한 가격 또는 위탁기업이 수탁기업에게 판매한 가격</li>
                                        </ul>
                                        <div class="table mb10">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>3. 원재료 가격 기준지표</td>
                                                    <td>위탁기업과 수탁기업 간 원재료 거래 계약서에 명시된 가격</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <ul>
                                            <li>원재료의 판매처가 수탁기업에게 판매한 원재료의 단위 당 가격으로서 위탁기업이 확인할 수 있는 가격</li>
                                            <li>그 밖에 약정서의 양 당사자 간 협의한 자료(약정서, 원가내역서, 견적서 등)를 바탕으로 협의하여 정한 가격</li>
                                        </ul>
                                        <p class="text mt10">&#9675; 주요 원재료가 두 개 이상인 경우 다음과 같이 모두 기재합니다.</p>
                                        <div class="table mb10">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>2. 주요 원재료</td>
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
                            <div class="label-full">
                                4. 원재료 기준 가격의 변동률 산정을 위한 기준시점 및 비교시점
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
                                    <h3>. 원재료 기준 가격의 변동률 산정을 위한 기준시점 및 비교시점</h3>
                                    <p class="text">&#9634; 조정일에 원재료 기준가격*의 변동률을 산정하기 위한 ‘기준시점’과 ‘비교시점’을 기재합니다.</p>
                                    <p class="text">* 원재료 가격 기준지표에 따른 주요 원재료의 특정 시점의 단위당 가격</p>
                                    <p class="text">&#9675; 원재료의 기준가격의 변동률은 ‘기준시점’ 대비 ‘비교시점’의 기준가격 증감률을 말합니다. 예컨대,
                                        기준시점의 기준가격이 10,000원/kg이고, 비교시점의 기준가격이 12,000원/kg이라면 기준가격의 변동률은 * 100 =
                                        20%입니다.</p>
                                    <p class="text">&#9675;‘기준시점’은 대금 변경이 있었던 직전 조정일을 기준으로 정할 수 있으며, ‘비교시점’은 이번 조정일을
                                        기준으로 정할 수 있습니다.</p>
                                    <p class="text">아래 예시와 같이 정한 경우, 이번 조정일이 ‘22년 5월 10일이면 비교시점은 ’22년 4월이고, 대금 변경이
                                        있었던 직전 조정일이 ‘22년 2월 10일이면 기준시점은 ’22년 1월이 됩니다.</p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="40%">구분</td>
                                                <td class="title" width="60%">기재사항</td>
                                            </tr>
                                            <tr>
                                                <td>4. 원재료 기준가격 변동률 산정을 위한 기준시점 및 비교시점</td>
                                                <td>기준시점: 대금 변경이 있었던 직전 조정일(대금 변경이 없었던 경우 약정 체결일)의 전월(평균)
                                                    비교시점: 조정일의 전월(평균)
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <p class="text">&#9675;주요 원재료가 두 개 이상이고, 기준시점과 비교시점을 다르게 정하는 경우 다음과 같이 모두
                                        기재합니다.</p>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" width="40%">구분</td>
                                                <td class="title" width="60%" colspan="3">기재사항</td>
                                            </tr>
                                            <tr>
                                                <td>2. 주요 원재료</td>
                                                <td>니켈</td>
                                                <td>알루미늄</td>
                                                <td>동</td>
                                            </tr>
                                            <tr>
                                                <td>4. 원재료 기준가격 변동률 산정을 위한 기준시점 및 비교시점</td>
                                                <td>기준시점: 대금 변경이 있었던 직전 조정일(대금 변경이 없었던 경우 약정 체결일)의 전월(평균)
                                                    비교시점: 조정일의 전월(평균)
                                                </td>
                                                <td colspan="2">기준시점: 대금 변경이 있었던 직전 조정일(대금 변경이 없었던 경우 약정 체결일)의 전
                                                    분기(평균)
                                                    비교시점: 조정일의 전 분기(평균)
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </section>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                5. 조정 요건
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png"
                                     alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="rqrm_ust" name="rqrm_ust" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>5. 조정 요건</h3>
                                        <p class="text">&#9634; □ 주요 원재료의 기준가격의 기준시점 대비 비교시점의 변동률(위탁기업과 수탁기업이 협의하여 정한 비율(0~±10%)이상 변동하는 경우)을 근거로 정한 납품대금 연동을 시행하는 요건을 기재합니다</p>
                                        <p class="text">&#9675; 예를 들어 3% 이상 또는 –3% 이하로 정한 경우, 주요 원재료의 기준가격의 기준시점 대비
                                            비교시점의 변동률이 조정 요건에 해당하는 경우 납품대금을 조정하지만, 그렇지 않은 경우에는 납품대금을 조정하지 않을 수
                                            있습니다.</p>
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
                                        <p class="text mt10">&#9675; 변동률과 관계없이 매 조정일마다 납품대금을 조정하도록 정할 수도 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>5. 조정요건</td>
                                                    <td>모든 경우</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 주요 원재료가 두 개 이상이고, 조정요건을 다르게 정하는 경우 다음과 같이 모두
                                            기재합니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>2. 주요 원재료</td>
                                                    <td>니켈</td>
                                                    <td>알루미늄</td>
                                                    <td>동</td>
                                                </tr>
                                                <tr>
                                                    <td>5. 조정요건</td>
                                                    <td>3%이상 또는 –3%이하</td>
                                                    <td>5% 이상 또는 –5%이하</td>
                                                    <td>모든 경우</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                6. 조정 주기
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png"
                                     alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="rqrm_cycl" name="rqrm_cycl" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>6. 조정 주기</h3>
                                        <p class="text">&#9634; 주요 원재료 기준가격의 변동률이 조정요건을 충족하였는지 여부에 따라 납품대금 연동 시행 여부를
                                            판단하는 조정주기를 기재합니다.</p>
                                        <p class="text">&#9675; 조정주기는 일, 주, 월, 분기, 반기, 연 등으로 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>6. 조정 주기</td>
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
                                                    <td>위탁기업과 수탁기업이 원재료 거래 계약을 체결할 때</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 주요 원재료가 두 개 이상이고, 조정주기를 다르게 정하는 경우 다음과 같이 모두
                                            기재합니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title">구분</td>
                                                    <td class="title" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>2. 주요 원재료</td>
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
                                        <p class="text">&#9634; 조정 주기에 따라 납품대금 연동의 시행 여부를 판단하는 날을 기재합니다.</p>
                                        <p class="text">&#9675; 조정 주기가 1개월이라면 ‘매월 1일’, 조정주기가 분기라면 ‘매 분기 첫 달 10일’과 같이
                                            정할 수 있습니다.</p>
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
                                                    <td>위탁기업과 수탁기업이 원재료 거래 계약을 체결한 날</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 주요 원재료가 두 개 이상이고, 조정일을 다르게 정하는 경우 다음과 같이 모두
                                            기재합니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>2. 주요 원재료</td>
                                                    <td>니켈</td>
                                                    <td>알루미늄</td>
                                                    <td>동</td>
                                                </tr>
                                                <tr>
                                                    <td>6. 조정 주기</td>
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
                                        <p class="text">&#9634; 물품등에 대하여 조정된 납품대금을 적용하는 기준이 되는 날을 기재합니다.</p>
                                        <p class="text">&#9675; 특별약정서 제4조 제5항에 따라 위탁기업은 조정대금 반영시점 이후에 납품되는 물품등에 대하여
                                            납품대금
                                            연동에 따라 조정된 금액을 기준으로 납품대금을 지급하여야 합니다.</p>
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
                                                    <td>조정일로부터 7일 후</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text">&#9675; 주요 원재료가 두 개 이상이고, 조정대금 반영시점을 다르게 정하는 경우 다음과 같이 모두
                                            기재합니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%" colspan="3">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>2. 주요 원재료</td>
                                                    <td>니켈</td>
                                                    <td>알루미늄</td>
                                                    <td>동</td>
                                                </tr>
                                                <tr>
                                                    <td>6. 조정 주기</td>
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
                                9. 납품대금 연동 산식
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png"
                                     alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="formula" name="formula" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>9. 납품대금 연동 산식</h3>
                                        <p class="text">&#9634; 납품대금 연동에 따라 조정될 납품대금을 산출하는 산식을 기재합니다. 다양한 기재 방법이
                                            있으며, 아래 예시를
                                            참고하여 작성할 수 있습니다.</p>
                                        <p class="text">&#9675; 원재료 기준가격과 원재료 중량을 고려하여 납품단가를 연동하는 경우, 다음과 같이 정할 수
                                            있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 납품대금 연동 산식</td>
                                                    <td>
                                                        ㅇ 조정될 납품단가(단위: 1개)<br>
                                                        = 비교시점의 동 기준가격 × 동 중량(2kg) + 5,000원
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 주요 원재료가 여러 개인 경우, 다음과 같이 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 납품대금 연동 산식</td>
                                                    <td>
                                                        ㅇ 조정될 납품단가(단위: 1개) <br>
                                                        = 비교시점의 동 기준가격 × 동 중량(2kg) + 비교시점의 철 기준가격 × 철 중량(2kg) +
                                                        10,000원
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 하나의 품목군에 속한 여러 상세 사양의 납품대금 연동에 관한 사항을 하나의
                                            특별약정서에서 정한 경우
                                            다음과 같이 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 납품대금 연동 산식</td>
                                                    <td>
                                                        ㅇ 조정될 납품단가(단위: 1개)<br>
                                                        = 비교시점의 동 기준가격 × 동 중량 + 5,000원<br>
                                                        ※ 동 중량은 위탁기업 구매시스템에 제품 사양별로 기재한 중량에 따름
                                                    </td>
                                                </tr>
                                            </table>
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 납품대금 연동 산식</td>
                                                    <td>
                                                        ㅇ 조정될 납품단가(단위: 1개)<br>
                                                        = 비교시점의 동 기준가격 × 동 중량 + 비교시점의 철 기준가격 × 철 중량 + 기타 항목<br>
                                                        ※ 동 중량, 철 중량, 기타 항목은 위탁기업 구매시스템에 제품 사양별로 기재한 중량에 따름
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 원재료 가격 변동분을 전부 반영하지 않고, 일부만 반영하는 경우 등 반영비율 개념을
                                            사용하는 경우
                                            다음과 같이 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 납품대금 연동 산식</td>
                                                    <td>
                                                        ㅇ 조정될 납품단가(단위: 1개)<br>
                                                        = 직전 납품단가 + (비교시점 동 기준가격 – 기준시점 동 기준가격) × 반영 비율(100%) × 동
                                                        중량(10kg)
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt20 mb20">※ 원재료 가격 변동분을 전부 반영하지 않고, 일부만 반영하는 경우 등 반영비율 개념을
                                            사용하는 경우
                                            다음과 같이 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 납품대금 연동 산식</td>
                                                    <td>
                                                        ㅇ 기준시점과 비교시점 간 동 기준가격 변동분의 100%를 납품단가에 반영<br>
                                                        ※ 동 중량: 10kg
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <p class="text mt10">&#9675; 원재료 중량 및 원가를 직접적으로 명시하기 곤란한 경우(경영정보 등 문제), 원재료
                                            기준가격
                                            변동률의 일정 비율(납품단가에서 원재료 원가가 차지하는 비중 등 고려)을 납품단가에 반영하는 방식으로 정할 수 있습니다.</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>9. 납품대금 연동 산식</td>
                                                    <td>
                                                        ㅇ 조정될 납품단가(단위: 1개)<br>
                                                        = 직전에 적용된 납품단가 × (1+윤활기유 기준가격의 변동률 × 단가 변동 비율(50%))
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
                                10. 기타사항
                                <img class="inline-focus info" onclick="infoOpen(this);" tabindex="0"
                                     src="${pageContext.request.contextPath}/images/common/info-icon.png"
                                     alt="자세히 보기">
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="etc" name="etc" required/>
                                <div class="info-box">
                                    <section>
                                        <h3>11. 기타 사항</h3>
                                        <p class="text">&#9634; 위 항목 외 납품대금 연동에 필요한 사항을 기재합니다. (납품단가의 절사 기준 등)</p>
                                        <div class="table">
                                            <table>
                                                <tr>
                                                    <td class="title" width="35%">구분</td>
                                                    <td class="title" width="65%">기재사항</td>
                                                </tr>
                                                <tr>
                                                    <td>11. 기타 사항</td>
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
                        <a href="${pageContext.request.contextPath}/join/agree.do">취소</a>
                    </div>
                </form>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>
