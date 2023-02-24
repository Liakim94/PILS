<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
<title>중소벤처기업부 | 제도 설명</title>
</head>
<body>

<div id="content">
    <div id="board">
        <page:applyDecorator name="menu2"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="/">홈</a></li>
                <li>
                    동행기업
                </li>
                <li>
                    제도 설명
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">제도 설명</h1>
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
                    <h2 class="title">① 납품대금 연동 약정 체결</h2>
                    <h4>
                      <ul class="disc">
                          <li class="mb20">
                              위탁기업과 수탁기업은 수탁·위탁거래 계약을 체결할 때 연동 조건을 상호 협의하여 납품대금 연동 약정을 체결합니다.
                          </li>
                          <li class="mb20">
                              어떤 원재료를 대상으로 할지, 원재료의 가격 기준지표는 무엇으로 할지, 조정요건, 조정주기, 연동 산식은 어떻게 할지 등을 정하여 약정서에 기재합니다.
                          </li>
                          <li class="mb20">
                              납품대금 연동 약정서는 양 당사자가 각각 서명 또는 기명날인 후 각자 1부씩 보관합니다.
                          </li>
                          <li class="mb20">
                              수탁·위탁거래 기본계약서(또는 수탁·위탁거래 개별계약서)에 납품대금 연동에 관한 내용을 포함하여 작성하는 것도 가능하며, 별도의 특별약정서에 작성하는 것도 가능합니다.
                          </li>
                          <li class="mb20">
                              이 때, 중소벤처기업부에서 배포하는 표준약정서(약정서 작성 링크)의 사용이 권장됩니다.
                          </li>
                      </ul>
                    </h4>
                    <h2 class="title mt40">② 조정요건 충족 여부 확인</h2>
                    <h4>
                        <ul class="disc">
                            <li class="">
                                위탁기업과 수탁기업은 납품대금 연동 약정에서 정한 조정일마다 원재료 가격 기준지표의 변동률을 확인하고, 해당 변동률이 조정요건을 충족하였는지를 확인합니다.
                                <p class="tip mt3">* (예시) 조정요건이 ’5% 이상 또는 –5% 이하‘로 설정된 경우, 가격 기준지표가 10% 상승하였으면 조정요건을 충족하나, 3% 상승하였으면 미충족</p>
                            </li>
                        </ul>
                    </h4>
                    <h2 class="title mt40">③ 납품대금 조정</h2>
                    <h4>
                        <ul class="disc">
                            <li class="mb20">
                                조정요건이 충족된 경우, 위탁기업과 수탁기업은 약정서에 기재된 연동 산식에 따라 납품대금을 조정합니다.
                                <p class="tip mt3">* (예시) 연동 산식이 ’직전 납품단가 × (1 + 동 가격 기준지표 변동률)‘로 설정되었고, 직전 납품단가가 10,000원인데, 동 가격 기준지표가 10% 상승하였으면 11,000원(=10,000 × (1 + 0.1))으로 조정</p>
                            </li>
                            <li class="">
                                납품대금이 조정된 경우 「납품단가 변동표」에 조정대급 반영시점, 조정된 원재료의 기준가격 및 조정된 납품단가를 기재하는 것이 권장됩니다.
                                <p class="tip mt3">※ 「납품단가 변동표」의 기재 사항을 모두 포함하는 전자문서로 양 당사자가 내용을 확인할 수 있는 경우에는 해당 전자문서로 「납품단가 변동표」를 갈음할 수 있습니다.</p>
                            </li>
                        </ul>
                    </h4>
                    <h2 class="title mt40">④ 조정된 납품대금의 지급</h2>
                    <h4>
                        <ul class="disc">
                            <li class="mb20">
                                위탁기업은 약정서에 기재된 조정대금 반영시점 이후에 납품되는 물품등에 대하여 조정된 금액을 기준으로 납품대금을 지급합니다.
                            </li>
                            <li class="">
                                조정대금 반영시점 이전에 수탁·위탁거래약정의 이행이 완료되어야 하나 수탁기업에 책임있는 사유로 완료되지 않은 부분에 대해서는 그 조정대금 반영시점의 납품대금 연동을 적용하지 아니합니다.
                            </li>
                        </ul>
                    </h4>
                </section>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>
