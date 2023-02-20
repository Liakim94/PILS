<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title>중소벤처기업부 | 실제 사례 보기</title>
</head>
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
                    납품대금 연동제 동참하기
                </li>
                <li>
                    실제 사례 보기
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">실제 사례 보기</h1>
            </div>
            <div id="about" class="content concept">
                <!-- 컨텐츠 start -->
                <section class="temp">
                    <div class="page">
                        <h1>납품대금 연동 특별약정서</h1>
                        <h3>
                            원재료의 가격 변동에 따른 납품대금 연동과 관련하여 위탁기업(원사업자를 포함한다. 이하 같다)과 수탁기업(수급사업자를 포함한다. 이하 같다)은 수탁·위탁거래약정에 부수하여 다음과 같이 납품대금 연동 특별약정을 체결한다.
                            <br>
                            <br>
                            ◇ 대상 수탁·위탁거래약정 : (명칭)
                            <span class="float-right">(체결 일자)</span>
                            <br>
                            <br>
                            <b>제1조(목적)</b> 이 특별약정은 상기 수탁·위탁거래약정과 관련하여, 원재료의 가격이 변동하는 경우, 그 변동분에 연동하여 납품대금(납품단가를 포함한다. 이하 같다)을 조정하는 것(이하 ‘납품대금 연동’이라 한다)에 필요한 제반 사항을 규정함을 목적으로 한다.
                            <br>
                            <br>
                            <b>제2조(정의)</b> ① 이 특별약정에서 사용하는 용어의 뜻은 다음과 같다.
                            <ol>
                                <li>
                                    ‘수탁·위탁거래’란 제조, 공사, 가공, 수리, 판매, 용역을 업(業)으로 하는 자가 물품, 부품, 반제품(半製品) 및 원료 등(이하 ‘물품등’이라 한다)의 제조, 공사, 가공, 수리, 용역 또는 기술개발(이하 ‘제조’라 한다)을 다른 중소기업에 위탁하고, 제조를 위탁받은 중소기업이 전문적으로 물품등을 제조하는 거래를 말한다.
                                </li>
                                <li>
                                    ‘연동 대상 원재료’란 납품대금 연동을 하기로 위탁기업과 수탁기업이 협의하여 정한 원재료를 말한다.
                                </li>
                                <li>
                                    ‘원재료 가격 기준지표’란 연동 대상 원재료 가격의 상승 또는 하락 정도를 측정하는 기준이 되는 지표를 말한다.
                                </li>
                                <li>
                                    ‘원재료 기준가격’은 원재료 가격 기준지표에 따른 특정 시점의 원재료의 단위당 가격을 말한다.
                                </li>
                                <li>
                                    ‘조정요건’이란 원재료 기준가격이 기준시점 대비 비교시점에 위탁기업과 수탁기업이 100분의 10 이내에서 협의하여 정한 비율 이상 변동할 경우 납품대금 연동을 시행하기로 한 요건을 말한다.
                                </li>
                                <li>
                                    ‘조정 주기’란 조정요건을 감안하여 납품대금 연동의 시행 여부를 판단하는 주기를 말하며, ‘조정일’이란 그 조정 주기에 따라 납품대금 연동의 시행 여부를 판단하는 날을 말한다.
                                </li>
                                <li>
                                    ‘조정대금 반영일‘이란 물품등에 대하여 조정된 납품대금을 적용하는 기준이 되는 날을 말한다.
                                </li>
                                <li>
                                    ‘납품대금 연동 산식’이란 납품대금 연동에 따라 조정될 납품대금을 산출하는 산식을 말한다.
                                </li>
                            </ol>
                            ② 이 특별약정에서 사용하는 용어의 뜻은 ｢대·중소기업 상생협력 촉진에 관한 법률｣(이하 ‘｢상생협력법｣’이라 한다)에 따른다.
                            <br>
                            <br>
                            <b>제3조(원재료 가격 기준지표)</b> 원재료 가격 기준지표는 약정의 당사자가 수탁·위탁거래의성격, 연동 대상 원재료의 특성 등을 고려하여 공신력 있는 기관이 주기적으로 고시하는 지표 또는 이에 준하는 지표로 정함을 원칙으로 한다.
                            다만, 이와 같은 지표를 사용하는 것이 적절하지 않은 경우에는 다음 각 호와 같이 정할 수 있다.
                            <ol>
                                <li>
                                    위탁기업이 원재료의 판매처와 직접 협상한 가격 또는 위탁기업이 수탁기업에 판매한 가격
                                </li>
                                <li>
                                    원재료의 판매처가 수탁기업에게 판매한 원재료의 단위 당 가격으로서 위탁기업이 확인할 수 있는 가격
                                </li>
                                <li>
                                    그 밖에 약정의 당사자 간 관련 자료를 바탕으로 협의하여 정한 가격
                                </li>
                            </ol>
                            <br>
                            <b>제4조(｢납품대금 연동표｣의 작성)</b> ① 위탁기업은 수탁기업과 성실하게 협의하여 【첨부1】 ｢납품대금 연동표｣(이하 ‘｢납품대금 연동표｣라 한다)의 각 기재사항을 적는다.
                            <br>
                            ② 이 특별약정의 당사자는 ｢납품대금 연동표｣의 각 기재사항과 관련하여 내용을 증명할 수 있는 서류를 제공할 것을 상대방에게 요청할 수 있으며, 이때 요청하는 자료는 ｢납품대금 연동표｣ 작성을 위해 필요한 최소한의 자료에 한한다.
                            <br>
                            ③ 제2항의 요청을 받은 상대방은 해당 서류를 성실하게 제공하여야 하며, 서류를 제공받은 당사자는 상대방의 경영정보 및 기술자료 보호 등을 위해 협조한다.
                            <br>
                            <br>
                            <b>제5조(납품대금 연동 절차)</b>
                            ① 위탁기업과 수탁기업은 ｢납품대금 연동표｣에 따라 조정일마다 원재료 기준가격의 기준시점 대비 비교시점의 변동률을 확인하고, 그 변동률이 조정요건을 충족하는 경우 납품대금 연동 산식에 따라 물품등의 납품대금의 금액을 산출한다.<br>
                            ② 위탁기업은 제1항에 따라 산출된 금액을 기준으로 물품등의 납품대금을 조정한다.<br>
                            ③ 위탁기업과 수탁기업은 제2항에 따라 물품등의 납품대금이 조정된 경우, 조정대금 반영일, 비교시점의 원재료 기준가격 및 조정된 납품단가를 【첨부2】 ｢납품단가 변동표｣(이하 ‘｢납품단가 변동표｣’라 한다)에 기재하고 서명(｢전자서명법｣ 제2조 제2호에 따른 전자서명을 포함한다) 또는 기명날인한다. <br>
                            ④ 제3항에도 불구하고, ｢납품단가 변동표｣의 기재 사항을 모두 포함하는 전자문서로 양 당사자가 내용을 확인할 수 있는 경우에는 당해 전자문서로 ｢납품단가 변동표｣를 갈음할 수 있다.<br>
                            ⑤ 위탁기업은 조정대금 반영일 이후에 납품되는 물품등에 대하여 제2항에 따라 조정된 금액을 기준으로 납품대금을 지급한다.<br>
                            ⑥ 조정대금 반영일 이전에 수탁·위탁거래약정의 이행이 완료되어야 하나 수탁기업에 책임있는 사유로 완료되지 않은 부분에 대해서는 그 조정대금 반영일의 납품대금 연동을 적용하지 아니한다.<br>
                            <br>
                            <b>제6조(효력)</b>
                            ① 이 특별약정은 수탁·위탁거래약정 기간 동안 유효하다.<br>
                            ② 납품대금 연동과 관련하여 이 특별약정에 저촉되는 다른 약정이 있는 경우 그 약정은 이 특별약정에 저촉되는 범위에서는 효력이 없다.<br>
                            ③ 이 특별약정은 ｢상생협력법｣ 제22조의2(공급원가 변동에 따른 납품대금 조정) 및 제25조(준수사항) 제1항제4호의 적용을 배제하는 것으로 해석되지 않는다.<br>
                            ④ ｢납품대금 연동표｣는 이 특별약정의 부속합의서로서 이 특별약정과 동일한 효력이 있다.<br>
                            <br>
                            <b>제7조(서류의 비치)</b>
                            위탁기업과 수탁기업은 이 특별약정서와 이에 부속되는 ｢납품대금 연동표｣ 및 ｢납품단가 변동표｣를 거래의 종료일부터 3년간 갖추어 두어야 한다.
                            <br>
                            <br>
                            이 특별약정의 체결사실 및 특별약정내용을 증명하기 위하여 이 특별약정서를 2부 작성하여 양 당사자가 각각 서명 또는 기명날인한 후 각자 1부씩 보관한다.                            <br>
                            <br>
                            <p class="witeDate">년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</p>
                            <div class="write-area">
                                <div class="item">
                                    <h3>
                                        <b>위탁기업</b><br>
                                        상호 또는 명칭 :<br>
                                        전화번호 :<br>
                                        주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 :<br>
                                        대표자 성명 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)<br>
                                        사업자(법인) 번호 :
                                    </h3>
                                </div>
                                <div class="item">
                                    <h3>
                                        <b>수탁기업</b><br>
                                        상호 또는 명칭 :<br>
                                        전화번호 :<br>
                                        주 소 :<br>
                                        대표자 성명 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)<br>
                                        사업자(법인)번호 :<br>
                                    </h3>
                                </div>
                            </div>
                        </h3>
                    </div>
                    <div class="tab-container">
                        <div class="tab-wrap">
                            <div class="tab active">작성 예시1</div>
                            <div class="tab">작성 예시2</div>
                            <div class="tab">작성 예시3</div>
                            <div class="tab">작성 예시4</div>
                            <div class="tab">작성 예시5</div>
                            <div class="tab">작성 예시6</div>
                            <div class="tab">작성 예시7</div>
                            <div class="tab">작성 예시8</div>
                            <div class="tab">작성 예시9</div>
                        </div>
                        <div class="tab-content-wrap">
                            <div class="tab-content">
                                <h1>작성예시 1</h1>
                                <div class="info-box">
                                    ① 고정식 프로펠러의 제조에 사용되는 구리의 가격 변동분을 LME 거래가를 기준 지표로 하여 납품대금에 연동하는 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>납품대금 연동 특별약정서</h2>
                                    <h3>◇ 위탁기업과 수탁기업은 수탁·위탁거래약정에 관한 납품대금 연동을 위해 다음과 같이 정한다.</h3>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 물품등의 명칭
                                            </td>
                                            <td>
                                                고정식 프로펠러
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 주요 원재료
                                            </td>
                                            <td>
                                                구리
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격 기준지표
                                            </td>
                                            <td>
                                                LME Cu 거래가
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 주요 원재료 기준가격의 변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 계약 체결 시점(발주서 발행 시점)<br>
                                                비교시점: 제작 시점(납품 3개월 전 한달 평균가)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td>
                                                계약시점 比 비교시점 구리가는 ±5%이상 변동시에만, 변동금액 전체 정산하는 조건
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                6. 조정주기
                                            </td>
                                            <td>
                                                발주서별 조정
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                7. 조정일
                                            </td>
                                            <td>
                                                발주서별 납품 2개월 전
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                8. 조정대금 반영시점
                                            </td>
                                            <td>
                                                발주서별 납품 2개월 전
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 납품대금 연동 산식
                                            </td>
                                            <td>
                                                최종 납품 대금 = <br>
                                                중량 X [계약단가*+(최종 구리 단가 – 계약 구리 단가)]<br>
                                                <br>
                                                (* 계약단가 = 구리단가 + 가공단가)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                10. 기타 사항
                                            </td>
                                            <td class="text-center">
                                                -
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="info-box">
                                    ※ 기재사항이 많아 해당 표에 모든 사항을 기재하기 어려운 경우에는 여러 품목에 공통적으로 적용되는 사항만 기재하고 나머지는 전자문서로 기재할 수 있음
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 2</h1>
                                <div class="info-box">
                                    ② 반제품(Assy)의 제조에 사용되는 레진류의 가격 변동분을 위탁기업이 원재료의 판매처와 직접 협상한 가격을 기준 지표로 하여 1개월마다 납품대금에
                                    연동하는 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>납품대금 연동 특별약정서</h2>
                                    <h3>◇ 위탁기업과 수탁기업은 수탁·위탁거래약정에 관한 납품대금 연동을 위해 다음과 같이 정한다.</h3>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 물품등의 명칭
                                            </td>
                                            <td>
                                                레진, 사출부품류 및 사출부품 등 포함 반제품(Assy)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 주요 원재료
                                            </td>
                                            <td>
                                                GPPS, ABS, SAN, PP, HIPS 등 Resin류
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격 기준지표
                                            </td>
                                            <td>
                                                위탁기업이 원재료의 판매처와 직접 협상한 가격
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 주요 원재료 기준가격의 변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 직전 대금 변경이 있었던 시점<br>
                                                비교시점: 조정일 현재
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td>
                                                원재료가 변동분 발생시
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                6. 조정주기
                                            </td>
                                            <td>
                                                1개월
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                7. 조정일
                                            </td>
                                            <td>
                                                위탁기업이 원재료의 판매처와 단가 조정한 날
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                8. 조정대금 반영시점
                                            </td>
                                            <td>
                                                단가변동 후 신규 발주분부터
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 납품대금 연동 산식
                                            </td>
                                            <td>
                                                조정될 납품단가(단위 : 1개)<br>
                                                = 직전 납품단가 + (Resin 변동가격 X 부품 중량 X 반영비율(100%))
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                10. 기타 사항
                                            </td>
                                            <td>
                                                납품단가는 1원 미만 절사(소숫점 첫째자리 절사)
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="info-box">
                                    ※ 기재사항이 많아 해당 표에 모든 사항을 기재하기 어려운 경우에는 여러 품목에 공통적으로 적용되는 사항만 기재하고 나머지는 전자문서로 기재할 수 있음
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 3</h1>
                                <div class="info-box">
                                    ③ 주철주물품의 제조에 사용되는 고철, 선철의 가격 변동분을 한국주물협동조합(중소기업협동조합), 스틸데일리(전문지)가 고시하는 가격을 기준 지표로 하여
                                    분기별로 납품대금에 연동하는 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>납품대금 연동 특별약정서</h2>
                                    <h3>◇ 위탁기업과 수탁기업은 수탁·위탁거래약정에 관한 납품대금 연동을 위해 다음과 같이 정한다.</h3>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 물품등의 명칭
                                            </td>
                                            <td>
                                                주철주물품
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 주요 원재료
                                            </td>
                                            <td>
                                                고철, 선철
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격 기준지표
                                            </td>
                                            <td>
                                                선철 : 한국주물협동조합<br>
                                                고철 : 스틸데일리
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 주요 원재료 기준가격의 변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 단가 변경이 발생한 직전분기 3개월 평균가<br>
                                                비교시점: 단가 조정일의 직전분기 3개월 평균가
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td>
                                                5% 이상 또는 –5% 이하
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                6. 조정주기
                                            </td>
                                            <td>
                                                분기별
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                7. 조정일
                                            </td>
                                            <td>
                                                1/1, 4/1, 7/1, 10/1
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                8. 조정대금 반영시점
                                            </td>
                                            <td>
                                                1/1, 4/1, 7/1, 10/1
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 납품대금 연동 산식
                                            </td>
                                            <td>
                                                변경가(원) = 현재가(원/EA) + 품목별 실투입중량(Kg) x △원/Kg
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                10. 기타 사항
                                            </td>
                                            <td>
                                                납품단가는 1원 미만 절사(소숫점 첫째자리 절사)
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="info-box">
                                    ※ 기재사항이 많아 해당 표에 모든 사항을 기재하기 어려운 경우에는 여러 품목에 공통적으로 적용되는 사항만 기재하고 나머지는 전자문서로 기재할 수 있음
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 4</h1>
                                <div class="info-box">
                                    ④ 세탁기 부품의 제조에 사용되는 레진의 가격 변동분을 위탁기업과 수탁기업 간 원재료 거래 계약서에 명시된 가격*을 기준 지표로 하여 분기별로
                                    납품대금에 연동하는 사례
                                    * 위탁기업이 수탁기업에게 원재료를 판매하는 유상사급 적용 중
                                </div>
                                <div class="table-wrap">
                                    <h2>납품대금 연동 특별약정서</h2>
                                    <h3>◇ 위탁기업과 수탁기업은 수탁·위탁거래약정에 관한 납품대금 연동을 위해 다음과 같이 정한다.</h3>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 물품등의 명칭
                                            </td>
                                            <td>
                                                세탁기 부품
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 주요 원재료
                                            </td>
                                            <td>
                                                레진
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격 기준지표
                                            </td>
                                            <td>
                                                위탁기업과 수탁기업 간 원재료 거래 약정서에 명시된 가격

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 주요 원재료 기준가격의 변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 위탁기업과 수탁기업이 직전 적용된 원재료 거래 계약을 체결한 시점<br>
                                                비교시점: 위탁기업과 수탁기업이 현재 적용 중인 원재료 거래 계약을 체결한 시점
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td>
                                                모든 경우
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                6. 조정주기
                                            </td>
                                            <td>
                                                위탁기업과 수탁기업이 원재료 거래계약을 체결할 때
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                7. 조정일
                                            </td>
                                            <td>
                                                위탁기업과 수탁기업이 원재료 거래계약을 체결할 때
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                8. 조정대금 반영시점
                                            </td>
                                            <td>
                                                조정일
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 납품대금 연동 산식
                                            </td>
                                            <td>
                                                조정될 납품 단가(단위 : 1개)<br>
                                                = 비교시점의 레진 기준가격 X 레진 중량(Kg) + 가공비
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                10. 기타 사항
                                            </td>
                                            <td>
                                                납품단가 소수점은 반올림
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="info-box">
                                    ※ 기재사항이 많아 해당 표에 모든 사항을 기재하기 어려운 경우에는 여러 품목에 공통적으로 적용되는 사항만 기재하고 나머지는 전자문서로 기재할 수 있음
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 5</h1>
                                <div class="info-box">
                                    ⑤ 호스류의 제조에 사용되는 고무의 가격 변동분을 특정 원재료 판매처가 공시하는 가격을 기준 지표로 하여 분기별로 납품대금에 연동하는 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>납품대금 연동 특별약정서</h2>
                                    <h3>◇ 위탁기업과 수탁기업은 수탁·위탁거래약정에 관한 납품대금 연동을 위해 다음과 같이 정한다.</h3>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 물품등의 명칭
                                            </td>
                                            <td>
                                                Hose류
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 주요 원재료
                                            </td>
                                            <td>
                                                고무소재 EPDM, CR, NBR, ACM, FKM
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격 기준지표
                                            </td>
                                            <td>
                                                ㅇㅇ공시가
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 주요 원재료 기준가격의 변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 단가 변경이 있었던 직전 분기의 원재료 3개월 평균가격<br>
                                                비교시점: 단가 조정일의 직전 분기의 원재료 3개월 평균가격
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td>
                                                5% 이상 또는 –5% 이하
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                6. 조정주기
                                            </td>
                                            <td>
                                                분기별(3개월 단위)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                7. 조정일
                                            </td>
                                            <td>
                                                매년 1월 내, 4월 내, 7월 내, 10월 내
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                8. 조정대금 반영시점
                                            </td>
                                            <td>
                                                계약 체결 후 해당 월
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 납품대금 연동 산식
                                            </td>
                                            <td>
                                                변경단가(원/EA)=현재단가(원/EA) + 품목별 소재중량(Kg) X △원/Kg*<br>
                                                ( * △원/Kg : 비교시점의 기준가- 기준시점의 기준가)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                10. 기타 사항
                                            </td>
                                            <td class="text-center">
                                                -
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="info-box">
                                    ※ 기재사항이 많아 해당 표에 모든 사항을 기재하기 어려운 경우에는 여러 품목에 공통적으로 적용되는 사항만 기재하고 나머지는 전자문서로 기재할 수 있음
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 6</h1>
                                <div class="info-box">
                                    ⑥ 동 케이블 제조에 사용되는 동의 가격 변동분을 한국전선공업협동조합에서 공시하는 가격을 기준 지표로 하여 매월 납품대금에 연동하는 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>납품대금 연동 특별약정서</h2>
                                    <h3>◇ 위탁기업과 수탁기업은 수탁·위탁거래약정에 관한 납품대금 연동을 위해 다음과 같이 정한다.</h3>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 물품등의 명칭
                                            </td>
                                            <td>
                                                동 케이블(CC-001)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 주요 원재료
                                            </td>
                                            <td>
                                                동
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격 기준지표
                                            </td>
                                            <td>
                                                한국전선공업협동조합 월별 LME 고시가(전기동고시가)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 주요 원재료 기준가격의 변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 조정일의 전전월 (평균)<br>
                                                비교시점: 조정일의 전월 (평균)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td>
                                                모든 경우
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                6. 조정주기
                                            </td>
                                            <td>
                                                1개월
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                7. 조정일
                                            </td>
                                            <td>
                                                매월 1일
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                8. 조정대금 반영시점
                                            </td>
                                            <td>
                                                매월 1일
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 납품대금 연동 산식
                                            </td>
                                            <td>
                                                조정될 납품단가(단위: 1개)<br>
                                                = 비교시점의 동 기준가격 × 동 중량(2kg) + 5,000원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                10. 기타 사항
                                            </td>
                                            <td>
                                                납품단가는 0.01원 미만 절사
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="info-box">
                                    ※ 기재사항이 많아 해당 표에 모든 사항을 기재하기 어려운 경우에는 여러 품목에 공통적으로 적용되는 사항만 기재하고 나머지는 전자문서로 기재할 수 있음
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 7</h1>
                                <div class="info-box">
                                    ⑦ 동 케이블 제조에 사용되는 동의 가격 변동분을 e-나라지표 주요 원자재가격 동향을 기준 지표로 하여 분기별 납품대금에 연동하는 사례<br>
                                    * 원재료 가격 변동분을 전부 반영하지 않고, 일부만 반영하는 등 반영비율 개념을 사용하는 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>납품대금 연동 특별약정서</h2>
                                    <h3>◇ 위탁기업과 수탁기업은 수탁·위탁거래약정에 관한 납품대금 연동을 위해 다음과 같이 정한다.</h3>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 물품등의 명칭
                                            </td>
                                            <td>
                                                동 케이블(CC-002)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 주요 원재료
                                            </td>
                                            <td>
                                                동
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격 기준지표
                                            </td>
                                            <td>
                                                e-나라지표 주요 원자재가격동향, PP가격
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 주요 원재료 기준가격의 변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 직전 대금 변경이 있었던 조정일(또는 약정 체결일)의 전 분기(평균)<br>
                                                비교시점: 조정일의 전 분기(평균)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td>
                                                3% 이상 또는 –3% 이하
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                6. 조정주기
                                            </td>
                                            <td>
                                                분기
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                7. 조정일
                                            </td>
                                            <td>
                                                매 분기 첫 달 1일
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                8. 조정대금 반영시점
                                            </td>
                                            <td>
                                                매 분기 첫 달 1일
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 납품대금 연동 산식
                                            </td>
                                            <td>
                                                조정될 납품단가(단위: 1개)<br>
                                                = 직전 납품단가 + [(비교시점 동 기준가격 – 기준시점 동 기준가격) × 반영비율(100%) × 동 중량(1ton)]
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                10. 기타 사항
                                            </td>
                                            <td>
                                                납품단가는 0.01원 미만 절사
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="info-box">
                                    ※ 기재사항이 많아 해당 표에 모든 사항을 기재하기 어려운 경우에는 여러 품목에 공통적으로 적용되는 사항만 기재하고 나머지는 전자문서로 기재할 수 있음
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 8</h1>
                                <div class="info-box">
                                    ⑧ Wire Rope 제조에 사용되는 경강선재의 가격 변동분을 위탁기업과 수탁기업 간 원재료 거래 계약서에 명시된 가격을 기준 지표로 하여 분기별
                                    납품대금에 연동하는 사례<br>
                                    * 위탁기업이 수탁기업에게 원재료를 직접 판매하는 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>납품대금 연동 특별약정서</h2>
                                    <h3>◇ 위탁기업과 수탁기업은 수탁·위탁거래약정에 관한 납품대금 연동을 위해 다음과 같이 정한다.</h3>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 물품등의 명칭
                                            </td>
                                            <td>
                                                Wire Rope(W-001)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 주요 원재료
                                            </td>
                                            <td>
                                                경강선재
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격 기준지표
                                            </td>
                                            <td>
                                                위탁기업과 수탁기업 간 원재료 거래 계약서에 명시된 가격
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 주요 원재료 기준가격의 변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 위탁기업과 수탁기업이 직전 적용된 원재료 거래 계약을 체결한 시점<br>
                                                비교시점: 위탁기업과 수탁기업이 현재 적용 중인 원재료 거래 계약을 체결한 시점
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td>
                                                모든 경우
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                6. 조정주기
                                            </td>
                                            <td>
                                                위탁기업과 수탁기업이 원재료 거래계약을 체결할 때
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                7. 조정일
                                            </td>
                                            <td>
                                                위탁기업과 수탁기업이 원재료 거래계약을 체결한 날
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                8. 조정대금 반영시점
                                            </td>
                                            <td>
                                                조정일
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 납품대금 연동 산식
                                            </td>
                                            <td>
                                                조정될 납품단가(단위 : 1개)<br>
                                                = 비교시점의 경강선재 기준가격 × 경강선재 중량(1ton) + 500,000원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                10. 기타 사항
                                            </td>
                                            <td>
                                                납품단가는 0.01원 미만 절사
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="info-box">
                                    ※ 기재사항이 많아 해당 표에 모든 사항을 기재하기 어려운 경우에는 여러 품목에 공통적으로 적용되는 사항만 기재하고 나머지는 전자문서로 기재할 수 있음
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 9</h1>
                                <div class="info-box">
                                    ⑨ 알루미늄 합금제조에 사용되는 알루미늄, 동의 가격 변동분을 조달청 최고가, 한국전선공업협동조합 고시가를 기준 지표로 하여 각각 1, 2개월 마다
                                    납품대금에 연동한 사례<br>
                                    * 주요 원재료가 두 개 이상인 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>납품대금 연동 특별약정서</h2>
                                    <h3>◇ 위탁기업과 수탁기업은 수탁·위탁거래약정에 관한 납품대금 연동을 위해 다음과 같이 정한다.</h3>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%" colspan="2">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 물품등의 명칭
                                            </td>
                                            <td colspan="2">
                                                알루미늄 합금(A-001)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 주요 원재료
                                            </td>
                                            <td>
                                                경강선재
                                            </td>
                                            <td>
                                                동
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격 기준지표
                                            </td>
                                            <td>
                                                조달청 원자재판매가격<br>
                                                알루미늄(서구산) 최고가
                                            </td>
                                            <td>
                                                한국전선공업협동조합 월별 LME 고시가(전기동고시가)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 주요 원재료 기준가격의 변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 직전 대금 변경이 있었던 조정일(또는 약정 체결일)의 전월 초일<br>
                                                비교시점: 조정일의 전월 초일
                                            </td>
                                            <td>
                                                기준시점: 직전 대금 변경이 있었던 조정일(또는 약정 체결일)의 전월(평균)<br>
                                                비교시점: 조정일의 전월(평균)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td colspan="2">
                                                모든 경우
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                6. 조정주기
                                            </td>
                                            <td>
                                                1개월
                                            </td>
                                            <td>
                                                2개월
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                7. 조정일
                                            </td>
                                            <td>
                                                매월 1일
                                            </td>
                                            <td>
                                                홀수달 1일
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                8. 조정대금 반영시점
                                            </td>
                                            <td>
                                                매월 1일
                                            </td>
                                            <td>
                                                홀수달 1일
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 납품대금 연동 산식
                                            </td>
                                            <td colspan="2">
                                                조정될 납품단가(단위: 1개)<br>
                                                = (비교시점의 알루미늄 기준가격 × 알루미늄 중량(1ton)) + (비교시점의 동 기준가격 × 동 중량(0.1ton)) +
                                                5,000,000원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                10. 기타 사항
                                            </td>
                                            <td colspan="2">
                                                납품단가는 0.01원 미만 절사
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="info-box">
                                    ※ 기재사항이 많아 해당 표에 모든 사항을 기재하기 어려운 경우에는 여러 품목에 공통적으로 적용되는 사항만 기재하고 나머지는 전자문서로 기재할 수 있음
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
    $(document).ready(function () {
        $(".tab").click(function () {
            var idx = $(this).index();
            $(".tab").removeClass("active");
            $(this).addClass("active");

            $(".tab-content").hide();
            $(".tab-content").eq(idx).fadeIn("500");
        });
    });

</script>