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
    <title>중소벤처기업부 | 제도 설명</title>
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
        <page:applyDecorator name="menu_join"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
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
                <div class="info-link">
                    <div class="item" style="width: 22%">
                        <a href="<c:url value="/front/board/11/view.do?boardSeq=79"/>">
                            <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" alt="약정서 체험하기">
                            <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>" alt="약정서 체험하기">
                            동행기업 모집공고</a>
                    </div>
                </div>
                <h2 class="title">동행기업이란?</h2>
                <div class="box-container">
                    <ul class="disc">
                        <li class="mb20"  style="font-size: 18px; line-height: 28px;">
                            수탁·위탁기업 간의 상생협력을 위해 수탁·위탁거래(하도급거래 포함)에서 납품대금 연동 약정을 체결·운영하는 기업입니다.
                        </li>
                        <li class=""  style="font-size: 18px; line-height: 28px;">
                            동행기업은 중기부‧공정위에서 마련한 “표준 연동계약서”를 활용*하여 수탁·위탁거래에서 납품대금 연동 약정을 자율적으로 체결**하고 연동약정서의 내용에 따라 납품대금을 조정하게 됩니다.
                            <p class="tip">
                                * 일부 변경하여 사용하는 것도 가능합니다.
                            </p>
                            <p class="tip">
                            ** 기존 계약에 특별약정으로서 추가로 체결하는 것도 가능합니다.
                            </p>
                        </li>
                    </ul>
                </div>
                <h2 class="title mt40">동행기업 운영 절차는?</h2>
                <div class="company-process">
                    <div class="prwrap">
                        <img src="<c:url value="/images/common/company-process1.png"/>" alt="참여 신청·접수"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/common/company-process2.png"/>" alt="참여기업 선정" />
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/common/company-process3.png"/>" alt="연동 약정 체결"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/common/company-process4.png"/>" alt="표준 연동계약서 제출"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/common/company-process8.png"/>" alt="우수기업 선정,포상"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/common/company-process7.png"/>" alt="조정 실적 제출"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/common/company-process6.png"/>" alt="참여확인서 제출 및 인센티브 부여"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/common/company-process5.png"/>" alt="참여확인서 발급"/>
                    </div>
                </div>
                <div class="accordion-container">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>자세히 보기</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h3 class="mb20">연동체결 및 조정실적 제출 세부 운영절차</h3>
                            <%--                            <div class="peristalsis-process">--%>
                            <%--                                <div class="item">--%>
                            <%--                                    ① 연동 특별약정서 제출--%>
                            <%--                                </div>--%>
                            <%--                                <div class="item">--%>
                            <%--                                    ② 참여확인서 발급--%>
                            <%--                                </div>--%>
                            <%--                                <div class="item">--%>
                            <%--                                    ③ 인센티브 부여--%>
                            <%--                                </div>--%>
                            <%--                                <div class="item">--%>
                            <%--                                    ④ 조정실적 제출--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                            <h4 class="mb20">
                                ① <strong>(표준 연동계약서 제출)</strong> 위탁기업-수탁기업 간 체결한 계약서의 연동약정에해당하는 부분 제출
                                <p class="pl10 tip">* 영업비밀에 해당할 수 있는 내용은 제외, 위탁기업-수탁기업 담당자 정보 포함</p>
                            </h4>
                            <h4 class="mb20">
                                ② <strong>(참여확인서 발급)</strong> 위탁기업이 표준 연동계약서를 제출한 뒤 확인서 발급을 요청하면 ‘납품대금 연동제 동행기업 참여 확인서’ 발급
                            </h4>
                            <h4 class="mb20">
                                ③ <strong>(인센티브 부여)</strong>참여기업은 ‘동행기업 참여시 제공 인센티브’를 부여받고자 하는 해당기관에 ‘납품대금 연동제 동행기업 참여 확인서’를 제출
                            </h4>
                            <h4 class="">
                                ④ <strong>(조정실적 제출)</strong> 위탁기업이 납품대금 연동 약정에 따라 납품대금을 조정하여 지급한 내역서를 제출
                            </h4>
                        </div>
                    </div>
                </div>
                <h2 class="title mt40" style="margin-bottom:20px">동행기업 참여 시 제공 인센티브(’23년)</h2>
                <h4>
                    <ul class="disc">
                        <p class="tip">
                            ※ ‘동행기업 참여확인서’ 등을 제출한 위탁기업에 한하여 제공하며, ‘24년 수탁‧위탁거래/ 하도급거래 실태조사 면제 인센티브는 부여 대상 기업 범위에 해당하는 위탁기업만 제공
                        </p>
                    </ul>
                </h4>
                <div class="accordion-container mt40">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>중소벤처기업부 제공 인센티브</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h4>
                                ◦ (공통) 정부포상(동반성장유공) 우대평가<br>
                                ◦ (공통) 스마트공장 지원사업 참여시 가점 부여(5점)<br>
                                ◦ (공통) 의무고발요청 여부 심의 시 법 위반점수 감경(최대 –0.15점)<br>
                                ◦ (대기업) 동반성장 대기업 실적평가지표인 ‘납품단가 조정’ 항목에 납품대금 연동제 ‘도입’ 및 ‘운영 실적’ 추가(최대 3점(일부업종 4점))<br>
                                ◦ (대‧중견기업) 대·중소기업 동반진출사업 주관기업 선정 시 가점 부여(1점)<br>
                                ◦ (중소기업) 중소기업 정책자금 최대 대출한도(잔액) 100억원(←60억원)까지 확대<br>
                                ◦ (중소기업) 수출중소기업에 대한 기술보증기금 보증우대(보증료 0.4%p 감면, 보증비율 95%)<br>
                                ◦ (중소기업) 수출컨소시엄 참여 중소기업에 대한 가점 부여(2점)<br>
                                ◦ (중소기업) 해외규격인증지원사업 가점 부여(5점)<br>
                                ◦ (중소기업) 수출바우처사업 가점 부여(1점)<br>
                                ◦ (중소기업) 병역지정업체 추천 평가 가점 부여<br>
                                ◦ (공통) ‘24년 수탁·위탁거래 실태조사 면제(’24년 1회, 한시적)<br>
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="accordion-container mt40">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>공정거래위원회 제공 인센티브</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h3 class="mb20">
                                ※ <strong>연동계약 체결비율, 대금 인상실적 등 별도</strong> 기준에 따라 인센티브 제공
                            </h3>
                            <h4 class="">
                                ① (공통) 공정거래협약 이행평가 기준에 연동 실적 반영(5점)<br>
                                ② (공통) 하도급법 벌점 경감 사유로 인정*(최대 3.5점)<br>
                                <p class="pl10 tip"> * 연동계약 체결비율, 대금 인상실적 등 하도급법상 기준에 따라 인센티브 제공</p>
                                ③ (중소기업) 하도급거래 모범업체 선정 시 가점 부여<br>
                                ④ (공통) 공정거래 업무 유공 포상 추천<br>
                                ④ (공통) ‘24년 하도급거래 실태조사 면제(’24년 1회, 한시적)
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="accordion-container mt40">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>금융위원회 제공 인센티브</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h4 class="">
                                ◦ (공통) 연동제 실시 위탁기업에 금리감면 대출로 운전자금 공급(1조원, 산은)
                                <p class="pl10 tip">  * (금리감면) 대기업 최대 0.3%p, 중견‧중소기업 최대 0.7%p</p>
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="accordion-container mt40">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>24년 수탁‧위탁거래/하도급거래 실태조사 면제 인센티브</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h4 class="">
                                ◦ (대상) ‘23.10.31일 기준 참여 수탁기업수 및 ‘24. 1.31일 기준 체결한 연동 약정체결이 아래 조건을 만족한 위탁기업 또는 원사업자
                                <p style="text-align: center;font-size: 20px;margin-top:20px;"><strong>&lt;인센티브 부여 대상기업 범위&gt;</strong></p>
                                <div class="table">
                                    <table>
                                        <tr>
                                            <td class="t">구분</td>
                                            <td class="t">대기업집단* 소속회사<br>/공기업형 공공기관</td>
                                            <td class="t">중견기업<br>/그밖의 공공기관**</td>
                                            <td class="t">중소기업/지방공공기관***</td>
                                            <td class="t">비고</td>
                                        </tr>
                                        <tr>
                                            <td>참여 수탁기업수</td>
                                            <td>100개사 이상</td>
                                            <td>40개사 이상</td>
                                            <td>20개사 이상</td>
                                            <td>‘23.10.31일기준</td>
                                        </tr>
                                        <tr>
                                            <td>연동계약 체결 기업수</td>
                                            <td>50개사 이상</td>
                                            <td>20개사 이상</td>
                                            <td>10개사이상</td>
                                            <td>‘24.1.31일기준</td>
                                        </tr>
                                    </table>
                                </div>
                                <p class="pl10 tip">  * 공정위에서 지정한 상호출자제한기업집단 및 공시대상기업집단<br>
                                    ** 준정부기관, 기타공공기관 / *** 지방공사, 지방공단, 지방출자출연기관</p>
                                <br>
                                ◦ (우대혜택) ‘24년 수·위탁거래/하도급거래 실태조사 면제(`24년 1회, 한시적)<br>
                                ◦ (제외대상) 중기부, 공정위가 인센티브 부여 제외대상으로 지정한 기업은 소관부처의 실태조사 면제 대상에서 제외<br>
                                <p class="pl10 tip">* 면제대상 제외사유가 하도급법 관련인 경우는 수위탁거래 실태조사만 면제가능, 상생협력법 관련인 경우는 하도급거래 실태조사만 면제가능</p>
                                <p class="pl10">- (중기부) ‘23년 실태조사 개선요구 등 처분받은 기업, ’24년 불공정거래 신고센터 피신고기업, ‘24년 분쟁조정(사전분쟁조정 포함) 피신청기업<br>
                                - (공정위) ‘23년 실태조사 등의 결과로 처분받은 기업*, 사건이나 분쟁 조정 절차가 진행 중**인 기업</p>
                                <p class="pl10 tip">* 고려기간: ‘23. 5. 1. ∼`24. 4.30. (1년간), ** `24. 5. 1. 기준</p>
                                ◦ (기타) ‘연동계약 체결’은 상생협력법 제21조제1항제4호 또는 하도급법 제3조제2항제3호에 따른 납품대금 연동에 관한 사항을 약정서에 기재하여 위탁기업이 수탁기업에 발급하는 것을 의미함.
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="accordion-container mt40">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>우수기업 선정</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h4 class="">
                                ◦ 동행기업 중 우수기업을 선정하여 추가 인센티브를 지원할 계획 <br>
                                ※ 우수기업 선정 기준<br>
                                <p class="pl10">- ‘23.10.31일 기준 동행기업으로 참여한 위탁기업 중 참여 수탁기업수, 연동계약 체결 기업 수 등을 평가하여, 실적이 우수한 기업을 선정하여 포상(’23. 12월 예정)</p>
                                ※ 기타사항<br>
                                <p class="pl10">- 기존 시범운영(중기부 공고 제2022-482호) 및 상시모집(제2022-526호)과 자율운영(공정위 공고 제2022-147호) 참여기업의 경우 동행기업 참여의사 확인 후 ‘동행기업’에 참여한 것으로 인정</p>
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