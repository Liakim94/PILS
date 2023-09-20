<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title>중소벤처기업부 | 연동표 작성 예시 보기</title>
</head>
<style>
    .temp .item-wrap {
        width: 100%;
        border: 1px solid #DDDDDD;
        border-radius: 10px;
        padding: 20px;
        box-sizing: border-box;
        cursor: pointer;
        margin-bottom: 20px;
    }
    .temp .item-wrap img {
        float: right;
        position: relative;
        bottom: 5px;
        transform: rotate(180deg);
    }
    .temp .item-wrap:focus{
        border: 1px solid #E60024;
    }
    .temp .item-wrap h3{
        display: inline-block;
    }
    .temp .item-wrap h3 ul{
        padding-left: 20px;
        font-weight: 400;
        text-align: left;
        line-height: 30px;
        letter-spacing: 1px;
        word-break: normal !important;
        font-size: 16px;
    }
    .temp .item-wrap img{
        float: right;
        position: relative;
        bottom: 5px;
        transform: rotate(180deg);
    }
    .temp .open img{
        transform: rotate(0deg);

    }
    .temp .item-wrap .detail-info{
        margin-top: 41px;
        position: relative;
        display: none;
    }
    .temp .item-wrap .detail-info:after{
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
    .temp .item-wrap h3 .table table{
        border: 1px solid #FFC7C7;
        margin-top: 10px;
    }
    .temp .item-wrap h3 .table table tr{
        border-bottom: 1px solid #D2D2D2;
    }
    .temp .item-wrap h3 .table table td{
        padding: 10px;
        min-height: unset;
        height: auto;
        border-bottom: none;
        font-size: 16px;
        line-height: 26px;
    }
    .temp .item-wrap h3 .table table .title{
        background: #FFEFEF;
        border-right: 1px solid #FFC7C7;
    }
</style>
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
                    연동표 작성 예시 보기
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">연동표 작성 예시 보기</h1>
            </div>
            <div id="about" class="content concept">
                <!-- 컨텐츠 start -->
                <section class="temp">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>표준 연동계약서</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="page">
                            <h1>표준 연동계약서</h1>
                                <h3>
                                ｢하도급거래 공정화에 관한 법률｣ 또는 ｢대·중소기업 상생협력 촉진에 관한 법률｣에 따른 하도급대금 또는 납품대금(이하 “하도급대금등”이라 한다) 연동과 관련하여
                                원사업자 또는 위탁기업(이하 “원사업자등”이라 한다)과 수급사업자 또는 수탁기업(이하 “수급사업자등”이라 한다)은
                                아래 하도급계약 또는 수탁·위탁거래약정(이하 “하도급계약등”이라 한다)에 부수하여 다음과 같이 연동계약을 체결한다.
                                <br>
                                <br>
                                ◇ 하도급계약등 명칭 :<br>
                                ◇ 하도급계약등의 체결 일자 :<br>
                                <br>
                                <br>
                                <b>제1조(목적)</b>
                                이 계약은 위의 하도급계약등과 관련된 하도급대금등 연동에 관하여 필요한 제반 사항을 규정함을 목적으로 한다.
                                <br>
                                <br>
                                <b>제2조(정의)</b> ① 이 계약에서 사용하는 용어의 뜻은 다음과 같다.
                                <ul>
                                    1. “원재료”란 하도급거래에서 목적물등의 제조, 수리, 시공 또는 용역수행에 사용되는 원재료 또는 수탁‧위탁거래에서 물품등의 제조,
                                    공사, 가공, 수리, 용역 또는 기술개발에 사용되는 원재료로서 천연재료, 화합물, 가공물, 중간재 등을 포함하되 이에 한정하지 아니한다.<br>
                                    2. “주요 원재료”란 그 비용이 하도급대금등의 100분의 10 이상인 원재료를 말한다.<br>
                                    3. “원재료 가격의 기준지표”란 주요 원재료 가격의 상승 또는 하락 정도를 측정하는 기준이 되는 지표를 말한다.<br>
                                    4. “조정요건”이란 주요 원재료의 가격이 기준시점 대비 비교시점에 변동한 비율로서 주요 원재료의 가격이 그 변동비율 이상 변동한 경우 하도급대금등을 조정하기로 한 기준이 되는 것을 말한다.<br>
                                    5. “조정 주기”란 조정요건 충족 여부를 따져 하도급대금등 연동 여부를 판단하는 주기를 말한다.<br>
                                    6. “조정일”이란 조정 주기에 따라 하도급대금등의 조정 여부를 판단하는 날을 말한다.<br>
                                    7. “조정대금 반영일”이란 목적물등 또는 물품등(이하 “목적물등”이라 한다)에 대하여 조정된 하도급대금등을 적용하는 기준이 되는 날을 말한다.<br>
                                    8. “하도급대금등 연동 산식”이란 주요 원재료의 가격이 조정요건을 충족하는 경우 주요 원재료 가격 변동을 반영하여 하도급대금등을 조정하기 위한 산식을 말한다.<br>
                                    9. “반영 비율”이란 주요 원재료 가격 변동분이 하도급대금등의 조정에 반영되는 비율을 말한다.<br>
                                </ul>
                                <ul>② 제1항에서 정한 용어 외의 용어의 뜻은 ｢하도급거래 공정화에 관한 법률｣ 또는 ｢대‧중소기업 상생협력 촉진에 관한 법률｣에 따른다.</ul>
                                <br>
                                <b>제3조(하도급대금등 연동 대상 주요 원재료)</b>
                                이 계약에 따라 하도급대금등 연동 대상 주요 원재료는 제2조제1항제2호에 따른 주요 원재료(이하 “연동 대상 주요 원재료”라 한다)로 한다.<br>
                                <br>
                                <b>제4조(하도급대금등 연동 대상 주요 원재료 가격의 기준지표)</b>
                                연동 대상 주요 원재료 가격의 기준지표는 공신력 있는 기관이 주기적으로 고시하는 지표 또는 이에 준하는 지표로 한다. 다만, 이와 같은 지표를 사용하는 것이 적절하지 않거나 이에 해당하는 지표가 없는 경우에는 다음 각 호의 어느 하나에 따라 정할 수 있다.
                                <ul>
                                    1. 원재료의 판매자가 수급사업자등에게 판매한 연동 대상 주요 원재료의 가격으로서 원사업자등이 확인할 수 있는 가격<br>
                                    2. 원사업자등이 연동 대상 주요 원재료의 판매자와 직접 협상한 가격 또는 원사업자등이 수급사업자등에 판매한 가격<br>
                                    3. 그 밖에 관련 자료를 바탕으로 원사업자등과 수급사업자등이 합의하여 정한 가격<br>
                                </ul>
                                <br>
                                <b>제5조(｢하도급대금등 연동표｣의 작성)</b>
                                ① 원사업자등은 수급사업자등과 합의하여 【첨부 1】 ｢하도급대금등 연동표｣(이하 “｢하도급대금등 연동표｣”라 한다)의 각 기재사항을 적는다.<br>
                                ② 원사업자등 또는 수급사업자등은 ｢하도급대금등 연동표｣의 각 기재사항과 관련하여 내용을 증빙할 수 있는 자료를 제공할 것을 상대방에게 요청할 수 있으며, 이때 요청하는 자료는 ｢하도급대금등 연동표｣ 작성을 위해 필요한 최소한의 자료에 한한다.<br>
                                ③ 제2항의 요청을 받은 상대방은 해당 자료를 성실하게 제공하여야 하며, 자료를 제공받은 당사자는 해당 자료를 이 계약의 목적 외로 사용하지 아니한다.<br>
                                <br>
                                <b>제6조(하도급대금등 연동 절차)</b>
                                ① 원사업자등과 수급사업자등은 ｢하도급대금등 연동표｣에 따라 조정일마다 연동 대상 주요 원재료 가격의 기준시점 대비 비교시점의 변동률을 확인하고, 그 변동률이 조정요건을 충족하는 경우 하도급대금등 연동 산식에 따라 조정될 하도급대금등을 산출한다.<br>
                                ② 원사업자등은 제1항에 따라 산출된 금액을 기준으로 하도급대금등을 조정한다.<br>
                                ③ 원사업자등과 수급사업자등은 제2항에 따라 하도급대금등이 조정된 경우, 조정대금 반영일, 비교시점의 연동 대상 주요 원재료 기준가격 및 조정된 하도급대금등을 【첨부 2】 ｢하도급대금등 변동표｣
                                (이하 “｢하도급대금등 변동표｣”라 한다)에 기재하고 서명(｢전자서명법｣ 제2조 제2호에 따른 전자서명을 포함한다) 또는 기명날인한다.<br>
                                ④ 원사업자등은 조정대금 반영일 이후에 납품되는 목적물등에 대하여 제2항에 따라 조정된 금액을 기준으로 하도급대금등을 지급한다.<br>
                                ⑤ 제1항부터 제4항까지는 수급사업자등의 책임 있는 사유로 이행이 지연되어 조정대금 반영일 이후에 이행된 부분에 대해서는 적용하지 아니한다.<br>
                                <br>
                                <b>제7조(해석 등)</b>
                                ① 이 계약은  ｢하도급거래 공정화에 관한 법률｣ 제16조(설계변경 등에 따른 하도급대금의 조정), 제16조의2(공급원가 등의 변동에 따른 하도급대금의 조정),
                                ｢대‧중소기업 상생협력 촉진에 관한 법률｣ 제22조의2(공급원가 변동에 따른 납품대금의 조정), 제25조(준수사항)제1항제4호의 적용을 배제하는 것으로 해석되지 않는다.<br>
                                ② ｢하도급대금등 연동표｣는 이 계약의 부속합의서로서 이 계약과 동일한 효력이 있다.<br>
                                ③ 주요 원재료에 해당하지 않은 원재료 중 당사자가 합의하여 하도급대금등 연동제를 적용하기로 한 원재료에 대해 제4조부터 제6조까지, 제7조 제1항 및 제2항을 준용한다.<br>
                                <br>
                                <b>제8조(금지행위)</b>
                                원사업자등은 하도급대금등 연동과 관련하여 하도급거래에 관한 거래상 지위 또는 수탁·위탁거래에 관한 거래상 지위를 남용하거나 거짓 또는 그 밖의 부정한 방법을 사용하지 아니한다.<br>
                                <br>
                                이 계약의 체결사실 및 계약내용을 증명하기 위하여 이 계약서를 2부 작성하여 양 당사자가 각각 서명 또는 기명날인한 후 각자 1부씩 보관한다. <br>
                                <br>
                                <p class="witeDate">2023년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15일</p>
                                <div class="write-area">
                                    <div class="item">
                                        <h3>
                                            <b>원사업자등</b><br>
                                            상호 또는 명칭 : ㅇㅇㅇ물산(주)<br>
                                            전화번호 :  02-1234-0000<br>
                                            주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 : 서울시 000 000로 00<br>
                                            대표자 성명 :&nbsp;&nbsp;&nbsp; 0 0 0&nbsp;&nbsp;(인)<br>
                                            사업자(법인) 번호 : 000-00-00000
                                        </h3>
                                    </div>
                                    <div class="item">
                                        <h3>
                                            <b>수급사업자등</b><br>
                                            상호 또는 명칭 : ㅇㅇ산업(주)<br>
                                            전화번호 : 031-4321-0000<br>
                                            주 소 : 경기도 00시 000로 00<br>
                                            대표자 성명 :&nbsp;&nbsp;&nbsp; 0 0 0&nbsp;&nbsp;(인)<br>
                                            사업자(법인)번호 : 000-00-00000<br>
                                        </h3>
                                    </div>
                                </div>
                            </h3>
                            </div>
                        </div>
                    </div>
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>표준 미연동계약서</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                        <div class="detail-info">
                            <div class="page">
                                <h1>표준 미연동계약서</h1>
                                <h3>
                                    ｢하도급거래 공정화에 관한 법률｣ 또는 ｢대·중소기업 상생협력 촉진에 관한 법률｣에 따른 하도급대금 또는 납품대금(이하 “하도급대금등”이라 한다)
                                    연동과 관련하여 원사업자 또는 위탁기업(이하 “원사업자등”이라 한다)과 수급사업자 또는 수탁기업(이하 “수급사업자등”이라 한다)은
                                    아래 하도급계약 또는 수탁·위탁거래약정(이하 “하도급계약등”이라 한다)에 부수하여 다음과 같이 미연동계약을 체결한다.
                                    <br>
                                    <br>
                                    ◇ 하도급계약등 명칭 :<br>
                                    ◇ 하도급계약등의 체결 일자 :<br>
                                    ◇ 미연동 대상 목적물등 또는 물품등의 명칭 :<br>
                                    ◇ 미연동 대상 주요 원재료 명칭 :<br>
                                    ◇ 협의 개요 :<br>
                                    &nbsp;(협의한 일시/방법)<br>
                                    &nbsp;(원사업자등 측 협의책임자 성명/직위)<br>
                                    &nbsp;(수급사업자등 측 협의책임자 성명/직위)<br>
                                    <br>
                                    <b>제1조(하도급대금등 미연동 합의)</b>
                                    원사업자등과 수급사업자등은 위 하도급계약등의 주요 원재료에 대해 아래의 사유로 하도급대금등 연동을 하지 아니하기로 합의(이하 “미연동 합의”라 한다)한다.<br>                                    <br>
                                    <div class="table">
                                        <table>
                                            <tr>
                                                <td class="title" colspan="2">미연동 사유</td>
                                            </tr>
                                            <tr>
                                                <td>원사업자등</td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>수급사업자등</td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br>
                                    <b>제2조(해석)</b> 이 계약은 ｢하도급거래 공정화에 관한 법률｣ 제16조(설계변경 등에 따른 하도급대금의 조정), 제16조의2(공급원가 등의 변동에 따른 하도급대금의 조정), ｢대‧중소기업 상생협력 촉진에 관한 법률｣
                                    제22조의2(공급원가 변동에 따른 납품대금의 조정), 제25조(준수사항)제1항제4호의 적용을 배제하는 것으로 해석되지 않는다.
                                    <br>
                                    <b>제3조(금지행위)</b>
                                    ① 원사업자등은 미연동 합의와 관련하여 하도급거래에 관한 거래상 지위 또는 수탁‧위탁거래에 관한 거래상 지위를 남용하거나 거짓 또는 그 밖의 부정한 방법을 사용하지 아니한다.<br>
                                    ② 원사업자등이 제1항을 위반한 경우 수급사업자등은 주요 원재료에 대해 하도급대금등 연동계약의 체결을 요구할 수 있으며, 원사업자등은 이에 응하여 연동 관련 의무를 준수해야 한다.<br>
                                    <br>
                                    이 계약의 체결사실 및 계약내용을 증명하기 위하여 이 계약서를 2부 작성하여 양 당사자가 각각 서명 또는 기명날인한 후 각자 1부씩 보관한다.<br>
                                    <br>
                                    <p class="witeDate">2023년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;15일</p>
                                    <div class="write-area">
                                        <div class="item">
                                            <h3>
                                                <b>원사업자등</b><br>
                                                상호 또는 명칭 : ㅇㅇㅇ물산(주)<br>
                                                전화번호 :  02-1234-0000<br>
                                                주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 : 서울시 000 000로 00<br>
                                                대표자 성명 :&nbsp;&nbsp;&nbsp; 0 0 0&nbsp;&nbsp;(인)<br>
                                                사업자(법인) 번호 : 000-00-00000
                                            </h3>
                                        </div>
                                        <div class="item">
                                            <h3>
                                                <b>수급사업자등</b><br>
                                                상호 또는 명칭 : ㅇㅇ산업(주)<br>
                                                전화번호 : 031-4321-0000<br>
                                                주 소 : 경기도 00시 000로 00<br>
                                                대표자 성명 :&nbsp;&nbsp;&nbsp; 0 0 0&nbsp;&nbsp;(인)<br>
                                                사업자(법인)번호 : 000-00-00000<br>
                                            </h3>
                                        </div>
                                    </div>
                                </h3>
                            </div>
                        </div>
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
                                    ◇ 조정요건을 ‘모든 경우’로 설정하여 원재료 가격이 1원이라도 변동 시 조정하는 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>하도급대금등 연동표</h2>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 하도급대금등 연동 대상 목적물등의 명칭
                                            </td>
                                            <td>
                                                동 케이블(CC-001)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 하도급대금등 연동 대상 주요 원재료
                                            </td>
                                            <td>
                                                동
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격의 기준 지표
                                            </td>
                                            <td>
                                                한국전선공업협동조합 월별 LME 고시가(전기동고시가)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 원재료 가격의
                                                변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 조정일의 전전월 (평균) <br>
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
                                                9. 하도급대금등 연동 산식
                                            </td>
                                            <td>
                                                조정될 하도급단가(단위: 1개)<br>
                                                = 비교시점의 동 기준가격 × 동 중량(2kg) + 5,000원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9.1. 반영비율
                                            </td>
                                            <td>
                                                100%
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
                                <div class="info-box-box">
                                    ※ 상황 <br>
                                   1) ‘23년 1월 1일 계약 체결 후 2월 1일(조정일)이 도래:<br>
                                    &nbsp;(가정) 동 기준가격이 ’22년 12월(기준시점) 10,000천원/ton에서 ‘23년 1월(비교시점) 12,000천원/ton으로 상승(변동률 20%로, 연동요건 충족)<br>
                                    <br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가: 12,000천원/ton × 2kg(=0.002ton) + 5,000원 = 24,000 + 5,000원 = 29,000원<br>
                                    <br>
                                    2) 3월 1일(조정일)이 도래:<br>
                                    &nbsp; (가정) 동 기준가격이 ’23년 1월(기준시점) 12,000천원/ton에서 ‘23년 2월(비교시점) 13,000천원/ton으로 상승(변동률 8.3%로, 연동요건 충족)<br>
                                    <br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가: 13,000천원/ton × 2kg(=0.002ton) + 5,000원 = 26,000 + 5,000원 = 31,000원<br>
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 2</h1>
                                <div class="info-box">
                                    ◇ 원재료의 기준가격 변동률이 조정요건을 충족하는 경우에만 조정<br>
                                    ◇ 가격 기준지표를 외화 기준으로 정하였으나, 수급사업자가 원재료 구매 시 환율의 영향을 받는 경우 산식에 환율을 포함할 수 있음
                                </div>
                                <div class="table-wrap">
                                    <h2>하도급대금등 연동표</h2>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 하도급대금등 연동 대상 목적물등의 명칭
                                            </td>
                                            <td>
                                                코팅용액(AA-001)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 하도급대금등 연동 대상 주요 원재료
                                            </td>
                                            <td>
                                                니켈
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격의 기준 지표
                                            </td>
                                            <td>
                                                LME Nickel Offical Price, Cash, Offer, USD/ton
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 원재료 가격의
                                                변동률 산정을 위한 기준시점 및 비교시점
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
                                            <td>
                                                3% 이상 또는 -3% 이하
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
                                                9. 하도급대금등 연동 산식
                                            </td>
                                            <td>
                                                납품단가 = 니켈 공급원가 + 9,000원<br>
                                                ※ 니켈 공급원가 = 비교시점의 니켈 기준가격 × 니켈 중량 × 환율 ※ 니켈 중량 = 1kg<br>
                                                ※ 환율 기준 = oo은행 연동일 고시 환율<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9.1. 반영비율
                                            </td>
                                            <td>
                                                100%
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
                                <div class="info-box-box">
                                    ※ 상황 <br>
                                    1) ‘23년 1월 1일 계약 체결 후 2월 1일(조정일)이 도래:<br>
                                    &nbsp;(가정) 니켈 기준가격은 ’22년 12월(기준시점) 2만USD/ton에서 ‘23년 1월(비교시점) 2.1만 USD/ton으로 상승<br>
                                    &nbsp;&nbsp;&nbsp;→ 기준가격 변동률은 5%이므로 조정요건(3% 이상) 충족<br>
                                    ○ 니켈 공급원가 = 기준가격(2.1만USD/ton) × 중량(1kg=0.001ton) × 환율(1,000원/달러) = 21,000원<br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가 : 니켈 공급원가(21,000원) + 9,000원 = 30,000원<br>
                                    <br>
                                    2) 3월 1일(조정일) 시행 시에는 연동요건 미충족, 4월 1일(조정일)이 도래:<br>
                                    &nbsp; (가정) 니켈 기준가격은 ’23년 1월(기준시점) 2.1만USD/ton에서 3월(비교시점) 2.31만 USD/ton으로 상승, 환율도 10% 상승<br>
                                    &nbsp; &nbsp; &nbsp; → 기준가격 변동률은 10%이므로 조정요건(3% 이상) 충족<br>
                                    ○ 니켈 공급원가 = 기준가격(2.31만USD/ton) × 중량(1kg=0.001ton) × 환율(1,100원/달러) = 25,410원<br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가: 니켈 공급원가(25,410원) + 9,000원 = 34,410원<br>
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 3</h1>
                                <div class="info-box">
                                    ◇ 원재료의 기준가격 변동률이 조정요건을 충족하는 경우에만 조정<br>
                                    ◇ 원재료 가격 변동분을 전부 반영하지 않고, 일부만 반영하는 경우 등 반영비율 개념을
                                    사용하는 경우
                                </div>
                                <div class="table-wrap">
                                    <h2>하도급대금등 연동표</h2>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 하도급대금등 연동 대상 목적물등의 명칭
                                            </td>
                                            <td>
                                                동 케이블(CC-002)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 하도급대금등 연동 대상 주요 원재료
                                            </td>
                                            <td>
                                                동
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격의 기준 지표
                                            </td>
                                            <td>
                                                e-나라지표 주요 원자재가격동향, PP가격
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 원재료 가격의
                                                변동률 산정을 위한 기준시점 및 비교시점
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
                                                + 3% 이상 또는 –3% 이하 변동 시
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
                                                9. 하도급대금등 연동 산식
                                            </td>
                                            <td>
                                                조정될 납품단가(단위: 1개)<br>
                                                = 직전 납품단가 + [(비교시점 동 기준가격 – 기준시점 동 기준가격)
                                                × 반영비율(100%) × 동 중량(1ton)]<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9.1. 반영비율
                                            </td>
                                            <td>
                                                100%
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
                                <div class="info-box-box">
                                    ※ 시뮬레이션<br>
                                    ○ ‘23년 1월 1일 계약 체결 후 2분기 첫 달 1일인 4월 1일(조정일)이 도래:<br>
                                    &nbsp;&nbsp;&nbsp;(가정) 특별약정 체결 시 납품단가 : 20,000천원<br>
                                    &nbsp;&nbsp;&nbsp;동 기준가격은 ’22년 4분기(기준시점) 10,000천원/ton에서 ‘23년 1분기(비교시점) 11,000천원 /ton으로 상승(변동률 10%로, 조정요건 충족)<br>
                                    <br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가: 직전 납품단가 + (비교시점 동 기준가격 – 기준시점 동 기준가격) × 반영비율(100%) × 동 중량(1ton) = 20,000천원 + [(11,000천원/ton – 10,000천원/ton) × 100% × 1ton] = 21,000천원<br>
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 4</h1>
                                <div class="info-box">
                                    ◇ 원사업자가 수급사업자에게 원재료를 직접 판매하는 경우로 원재료 가격 기준지표를 ‘원사업자와 수급사업자 간 원재료 거래 계약서에 명시된 가격’으로 설정한 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>하도급대금등 연동표</h2>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 하도급대금등 연동 대상 목적물등의 명칭
                                            </td>
                                            <td>
                                                Wire Rope(W-001)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 하도급대금등 연동 대상 주요 원재료
                                            </td>
                                            <td>
                                                경강선재
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격의 기준 지표
                                            </td>
                                            <td>
                                                원사업자와 수급사업자가 간 원재료 거래 계약서에 명시된 가격
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 원재료 가격의
                                                변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 원사업자와 수급사업자가 직전 적용된 원재료 거래 계약을 체결한 시점<br>
                                                비교시점: 원사업자와 수급사업자가 현재 적용 중인 원재료 거래 계약을 체결한 시점
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
                                                원사업자와 수급사업자가 원재료 거래계약을 체결할 때
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                7. 조정일
                                            </td>
                                            <td>
                                                원사업자와 수급사업자가 원재료 거래계약을 체결할 때
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
                                                9. 하도급대금등 연동 산식
                                            </td>
                                            <td>
                                                조정될 납품단가(단위: 1개)<br>
                                                = 비교시점의 경강선재 기준가격 × 경강선재 중량(1ton) +
                                                500,000원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9.1. 반영비율
                                            </td>
                                            <td>
                                                100%
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
                                    ※ 수급사업자가 납품하는 물품(Wire Rope)에 다양한 사양이 존재하고 사양별로 원재료 중량 및 물품 가공비가 달라 위 표에 모든 사항을 기재하기 어려운 경우, 원재료 중량 및 가공비 등은 별도 서류(전자문서 포함)에 기재하여 첨부할 수 있습니다.
                                </div>
                                <div class="info-box-box">
                                    ※ 시뮬레이션<br>
                                    ○ ‘23년 1월 1일 하도급계약 체결 후 2월 1일 원재료 거래계약 체결, 6월 1일 새로운 원재료 거래계약을 체결:<br>
                                    &nbsp;&nbsp;&nbsp;(가정) 경강선재 기준가격은 2월 1일(기준시점) 500천원/ton에서 6월 1일(비교시점) 550천원 /ton으로 상승<br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가: 550천원/ton × 1ton + 500천원 = 1,050천원<br>
                                    <br>
                                    ○ 9월 1일 새로운 원재료 거래계약을 체결<br>
                                    &nbsp;&nbsp;&nbsp;(가정) 경강선재 기준가격은 6월 1월(기준시점) 550천원/ton에서 9월 1일(비교시점) 600천원 /ton으로 상승<br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가: 600천원/ton × 1ton + 500천원 = 1,100천원<br>
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 5</h1>
                                <div class="info-box">
                                    ◇ 납품대금연동대상원재료가두개이상인경우에는원재료별로각각작성하는 것이 원칙이나, 동일한 목적물등에 사용되는 연동 대상 원재료로서 3.~10.까지 중 공통되는 사항이 있는 경우 하나의 연동표로 작성 가능                                </div>
                                <div class="table-wrap">
                                    <h2>하도급대금등 연동표</h2>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%" colspan="2">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 하도급대금등 연동 대상 목적물등의 명칭
                                            </td>
                                            <td colspan="2">
                                                알루미늄 합금(A-001)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 하도급대금등 연동 대상 주요 원재료
                                            </td>
                                            <td>
                                                알루미늄
                                            </td>
                                            <td>
                                                동
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격의 기준 지표
                                            </td>
                                            <td>
                                                조달청 원자재판매가격 알루미늄(서구산) 최고가
                                            </td>
                                            <td>한국전선공업협동조합 월별 LME 고시가(전기동고시가)</td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 원재료 가격의
                                                변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 직전 대금 변경이 있었던 조정일(또는 약정 체결일)의 전월 초일<br>
                                                비교시점: 조정일의 전월 초일
                                            </td>
                                            <td>
                                                기준시점: 직전 대금 변경이 있었던 조정일(또는 약정 체결일)의 전월 (평균)<br>
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
                                            <td> 2개월</td>
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
                                                9. 하도급대금등 연동 산식
                                            </td>
                                            <td colspan="2">
                                                조정될 납품단가(단위: 1개) <br>
                                                = (비교시점의 알루미늄 기준가격 × 알루미늄 중량(1ton)) +
                                                (비교시점의 동 기준가격 × 동 중량(0.1ton)) + 5,000,000원
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9.1. 반영비율
                                            </td>
                                            <td colspan="2">
                                                100%
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
                                <div class="info-box-box">
                                    ※ 시뮬레이션<br>
                                    ○ ‘23년 1월 1일 계약 체결 후 2월 1일(알루미늄 조정일)이 도래:<br>
                                    &nbsp;&nbsp;&nbsp;(가정) 알루미늄 기준가격이 ’22년 12월 1일(기준시점) 3,000천원/ton에서 ‘23년 1월 1일(비교시점) 3,300천원/ton으로 상승,
                                    동 기준가격은 약정 체결일의 전월인 ’22년 12월(기준시점)의 10,000천원/ton<br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가: 3,300천원/ton × 1ton + 10,000천원/ton × 0.1ton + 5,000천원 = 9,300천원<br>
                                    <br>
                                    ○ 3월 1일(알루미늄, 동 조정일)이 도래:<br>
                                    &nbsp;&nbsp;&nbsp;(가정) 알루미늄 기준가격이 ’23년 1월 1일(기준시점) 3,300천원/ton에서 ‘23년 2월 1일(비교시점) 3,000천원/ton으로 하락<br>
                                    &nbsp;&nbsp;&nbsp;‣ 동 기준가격은 ’22년 12월(기준시점) 10,000천원/ton에서 ‘23년 2월(비교시점) 12,000천원 /ton으로 상승<br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가: 3,000천원/ton × 1ton + 12,000천원/ton × 0.1ton + 5,000천원 = 9,200천원<br>
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 6</h1>
                                <div class="info-box">
                                    ◇ 한 건의 하도급거래에서 수시로 여러 건의 발주를 하는 경우로 ‘발주 시’를 조정주기로 설정한 사례                                </div>
                                <div class="table-wrap">
                                    <h2>하도급대금등 연동표</h2>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 하도급대금등 연동 대상 목적물등의 명칭
                                            </td>
                                            <td>
                                                고정식 프로펠러
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 하도급대금등 연동 대상 주요 원재료
                                            </td>
                                            <td>
                                                구리
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격의 기준 지표
                                            </td>
                                            <td>
                                                LME Cu Offical Price, Cash, Offer, USD/ton
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 원재료 가격의
                                                변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 발주서 발행일<br>
                                                비교시점: 발주서별 납품일 3개월 전 (월 평균)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td>
                                                ± 5% 이상 변동 시
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                6. 조정주기
                                            </td>
                                            <td>
                                                발주 시
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                7. 조정일
                                            </td>
                                            <td>
                                                발주서별 납품일 2개월 전
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                8. 조정대금 반영시점
                                            </td>
                                            <td>
                                                발주서별 납품일 2개월 전
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 하도급대금등 연동 산식
                                            </td>
                                            <td>
                                                최종 하도급대금 =<br>
                                                구리 중량 x (최종 구리 단가 + 가공단가)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9.1. 반영비율
                                            </td>
                                            <td>
                                                100%
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                10. 기타 사항
                                            </td>
                                            <td>
                                                납품단가는 1원 미만 절사(소숫점 첫째자리 절사)<br>
                                                구리 중량 및 가공단가는 첨부 서류에 기재된 바에 따름
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="info-box-box">
                                    ※ 시뮬레이션<br>
                                    ○ ‘23년 1월 1일 특별약정 체결 후 2월 1일에 발주서를 발행하고 8월 1일에 납품을 받기로함<br>
                                    &nbsp;&nbsp;&nbsp;(가정) 특별약정 체결 시 납품단가 : 10,000천원/ton<br>
                                    &nbsp;&nbsp;&nbsp;구리 기준가격은 ’23년 2월 1일(기준시점) 10,000천원/ton에서 ‘23년 5월 1일(비교시점) 10,500천원/ton으로 상승(변동률 5%로, 조정요건 충족)<br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가: 1ton × (10,500천원/ton + 500천원/ton(가공단가)) = 11,000천원<br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정일과 대금반영시점 : ‘23년 6월 1일<br>
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 7</h1>
                                <div class="info-box">
                                    ◇ 공신력 있는 기관에서 가격을 발표하지 않거나, 기준지표가 다양한 경우 등 기준지표 설정이 어려운 경우로 수급사업자 실제 구매한 가격으로 기준지표를 설정한 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>하도급대금등 연동표</h2>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 하도급대금등 연동 대상 목적물등의 명칭
                                            </td>
                                            <td>
                                                프레스 부품 반제품(Assy)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 하도급대금등 연동 대상 주요 원재료
                                            </td>
                                            <td>
                                                압연강재(판재류)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격의 기준 지표
                                            </td>
                                            <td>
                                                원재료 판매처로부터 구입한 실제 구매 영수증
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 원재료 가격의
                                                변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 직전 조정일(또는 약정 체결일)의 전월<br>
                                                비교시점: 이번 조정일의 전월
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td>
                                                기준가격 대비 ±5% 이상 변동 시
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
                                                원재료 가격 변동 후 신규 발주분부터
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 하도급대금등 연동 산식
                                            </td>
                                            <td>
                                                조정될 납품단가(단위 : 1개)<br>
                                                = 직전 납품단가 + (압연강재 변동가격 x 중량 x 반영비율(100%))
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9.1. 반영비율
                                            </td>
                                            <td>
                                                100%
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
                                <div class="info-box-box">
                                    ※ 시뮬레이션<br>
                                    ○ ‘23년 1월 1일 특별약정 체결 후 2월 1일에 수급사업자가 판매처에서 원재료 구매하고 해당 영수증을 원사업자에게 제출(조정일 도래)<br>
                                    &nbsp;&nbsp;&nbsp;(가정) 특별약정 체결 시 압연강재 납품단가 : 10,000천원/ton<br>
                                    &nbsp;&nbsp;&nbsp;압연강재 기준가격은 ’22년 12월 1일(기준시점) 10,000천원/ton에서 ‘23년 1월 1일(비교시점) 10,500천원/ton으로 상승(변동률 5%로, 조정요건 충족)<br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가: 10,000천원/ton+ (500천원 x 1ton x 100%) = 10,500천원/ton<br>
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 8</h1>
                                <div class="info-box">
                                    ◇ 원재료를 취급하는 판매처가 소수이고 기준지표 설정이 어려운 경우로 해당 판매처 에서 고시하는 가격을 기준지표로 설정한 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>하도급대금등 연동표</h2>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 하도급대금등 연동 대상 목적물등의 명칭
                                            </td>
                                            <td>
                                                Hose류
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 하도급대금등 연동 대상 주요 원재료
                                            </td>
                                            <td>
                                                합성고무(NBR, EPDM, CR)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격의 기준 지표
                                            </td>
                                            <td>
                                                해외 판매처(A사) 고시가
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 원재료 가격의
                                                변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 직전 대금 변경이 있었던 조정일(또는 약정 체결일) 의 전 분기 평균가<br>
                                                비교시점: 직전 3개월 평균가
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td>
                                                평균 5% 이상 변동
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
                                                분기 시작일
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                8. 조정대금 반영시점
                                            </td>
                                            <td>
                                                분기 시작일
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 하도급대금등 연동 산식
                                            </td>
                                            <td>
                                                조정될 납품단가(단위 : 1개)<br>
                                                = 제품중량 x 원자재가 변동금액
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9.1. 반영비율
                                            </td>
                                            <td>
                                                100%
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
                                <div class="info-box-box">
                                    ※ 시뮬레이션<br>
                                    ○ ‘23년 1월 1일 계약 체결 후 2분기 첫 달 1일인 4월 1일(조정일)이 도래:<br>
                                    &nbsp;&nbsp;&nbsp;(가정) 특별약정 체결 시 납품단가 : 10,000천원<br>
                                    &nbsp;&nbsp;&nbsp;합성고무 기준가격은 ’22년 4분기 평균가(기준시점) 10,000천원/ton에서 ‘23년 1분기(비교시 점) 10,500천원/ton으로 상승(변동률 5%로, 조정요건 충족)<br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가: 1ton x 10,500천원/ton = 10,500천원<br>
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>작성예시 9</h1>
                                <div class="info-box">
                                    ◇ 원사업자가 원재료 판매처와 직접 가격 협상을 하고, 수급사업자가 그 가격으로 원재료를 구매하는 경우로 조정요건은 ‘원재료 가격 변동 시’, 조정주기는 원사업자가 ‘원재료의 판매처와 가격을 조정한 날’로 정한 사례
                                </div>
                                <div class="table-wrap">
                                    <h2>하도급대금등 연동표</h2>
                                    <table>
                                        <thead>
                                        <td width="30%">구분</td>
                                        <td width="70%">기재사항</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title">
                                                1. 하도급대금등 연동 대상 목적물등의 명칭
                                            </td>
                                            <td>
                                                냉장고 외형 반제품(Assy-0001)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                2. 하도급대금등 연동 대상 주요 원재료
                                            </td>
                                            <td>
                                                GPPS(폴리스티렌)<br>
                                                * 강도가 높고 성형 가공성이 우수하여 가전제품, 구조부품, 일상
                                                잡화에 사용되는 범용 수지(플라스틱)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                3. 원재료 가격의 기준 지표
                                            </td>
                                            <td>
                                                원사업자가 원재료의 판매처와 직접 협상한 가격
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                4. 원재료 가격의
                                                변동률 산정을 위한 기준시점 및 비교시점
                                            </td>
                                            <td>
                                                기준시점: 직전 대금 변경일(대금 변경 없었던 경우 약정 체결 일)<br>
                                                비교시점: 조정일
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                5. 조정요건
                                            </td>
                                            <td>
                                                원재료 가격 변동 시
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                6. 조정주기
                                            </td>
                                            <td>
                                                원사업자가 원재료의 판매처와 원재료 가격을 조정할 때
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                7. 조정일
                                            </td>
                                            <td>
                                                원사업자가 원재료의 판매처와 원재료 가격을 조정할 때
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                8. 조정대금 반영시점
                                            </td>
                                            <td>
                                                원재료 가격 변동 후 신규 발주분부터
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9. 하도급대금등 연동 산식
                                            </td>
                                            <td>
                                                조정될 납품단가(단위 : 1개)<br>
                                                = 직전 납품단가 + (GPPS 변동가격 x GPPS 중량 x 반영비율(100%))
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                9.1. 반영비율
                                            </td>
                                            <td>
                                                100%
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                10. 기타 사항
                                            </td>
                                            <td>
                                                납품단가는 1원 미만 절사(소숫점 첫째자리 절사)<br>
                                                원재료 가격은 변동 즉시 원사업자가 수급사업자에 통지함<br>
                                                사양별 최초 납품단가 및 GPPS 중량은 첨부서류에 기재된 바에 따름<br>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="info-box-box">
                                    ※ 시뮬레이션<br>
                                    ○ ‘23년 1월 1일 특별약정 체결 후 3월 1일에 GPPS 가격이 변동되어 원사업자와 판매처 사이에 가격을 조정<br>
                                    &nbsp;&nbsp;&nbsp;(가정) 특별약정 체결 시 GPPS 납품단가 : 10,000천원/kg<br>
                                    &nbsp;&nbsp;&nbsp;GPPS 기준가격은 ’23년 1월 1일(기준시점) 10,000천원/kg에서 ‘23년 3월 1일(비교시점) 10,500천원/ton으로 상승(변동률 5%로, 조정요건 충족)<br>
                                    &nbsp; <img class="next" src="/pils/images/common/next.png" style="width: 20px;">
                                    &nbsp; 조정될 납품단가: 10,000천원/kg + (500천원 x 1kg x 100%) = 10,500천원/kg<br>
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