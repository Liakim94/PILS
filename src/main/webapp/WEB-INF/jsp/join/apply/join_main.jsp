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
                    동행기업 알아보기
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 알아보기</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <div class="info-link">
<%--                    <div class="item">--%>
<%--                        <a href="${pageContext.request.contextPath}/join/joinApply.do">--%>
<%--                            <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" alt="약정서 체험하기">--%>
<%--                            <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>" alt="약정서 체험하기">--%>
<%--                            동행기업 신청</a>--%>
<%--                    </div>--%>
<%--                    <div class="item">--%>
<%--                        <a href="${pageContext.request.contextPath}/join//joinRecom.do">--%>
<%--                            <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" alt="약정서 체험하기">--%>
<%--                            <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>" alt="약정서 체험하기">--%>
<%--                            동행기업 참여 추천</a>--%>
<%--                    </div>--%>
                    <div class="item" style="width: 22%">
                        <a href="<c:url value="/front/board/11/view.do?boardSeq=5"/>">
                            <img class="hover" src="<c:url value="/images/common/document-icon.png"/>" alt="약정서 체험하기">
                            <img class="unhover" src="<c:url value="/images/common/document-icon2.png"/>" alt="약정서 체험하기">
                            동행기업 모집공고</a>
                    </div>
                    <div class="item" style="width: 22%">
                        <a href="">
                            <img class="hover" src="<c:url value="/images/common/download-icon2.png"/>" alt="약정서 다운로드">
                            <img class="unhover" src="<c:url value="/images/common/download-icon.png"/>" alt="약정서 다운로드">
                            필요서류 양식</a>
                    </div>
                </div>
                <h2 class="title">동행기업이란?</h2>
                <h4>
                    <ul class="disc">
                        <li class="mb20">
                            수탁·위탁기업 간의 상생협력을 위해 수탁·위탁거래(하도급거래 포함)에서 납품대금 연동 약정을 체결·운영하는 기업입니다.
                        </li>
                        <li class="">
                            동행기업은 중기부‧공정위에서 마련한 ‘납품대금 연동 특별약정서’ 또는 ‘하도급대금 연동계약서’를 활용*하여 납품대금 연동 약정을 자율적으로 체결하고 약정의 내용에 따라 납품대금을 조정하게 됩니다.
                            <p class="tip">
                                * 일부 변경하여 사용하는 것도 가능합니다.
                            </p>
                            <p class="tip">
                            ** 기존 계약에 특별약정으로서 추가로 체결하는 것도 가능합니다.
                            </p>
                        </li>
                    </ul>
                </h4>
                <h2 class="title mt40">동행기업 신청 및 선정</h2>
                <h4>
                    <ul class="disc">
                        <li class="mb20">
                            위탁기업이 납품대금 연동 약정을 체결할 수탁기업들과 협의하여 참여 신청서를 제출하면 심사를 거쳐 동행기업으로 선정될 수 있습니다.<br>
                            · 위탁기업: 제조, 공사, 가공, 수리, 판매, 용역을 업으로 하면서 물품 등의 제조, 공사, 가공, 수리, 용역 또는 기술개발을 다른 중소기업에게 위탁하는 기업<br>
                            · 수탁기업: 위탁기업으로부터 물품 등의 제조, 공사, 가공, 수리, 용역 또는 기술개발을 위탁받아 전문적으로 이를 수행하는 기업
                            <p class="tip">
                                ※ 참여기업 선정 결과 통보 : 신청일로부터 1개월 이내 개별 통보
                            </p>
                        </li>
                        <li class="mb20">
                            참여를 희망하는 위탁기업은 모집공고문을 확인한 후 홈페이지 또는 이메일을 통해 필요 서류를 제출하시기 바랍니다.<br>
                            · 홈페이지 신청: 상단의 ‘동행기업 신청’ 버튼 클릭<br>
                            · 이메일 신청: med@win-win.or.kr로 송부
                        </li>
                        <li class="">
                            필요 서류<br>
                            1. 납품대금 연동제 동행기업 참여 신청서<br>
                            2. 납품대금 연동제 운영 계획서<br>
                            3. 개인·기업정보 활용 동의서<br>
                            4. 사업자등록증
                        </li>
                    </ul>
                </h4>
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
                        <img src="<c:url value="/images/common/company-process4.png"/>" alt="연동 특별약정서 제출"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/common/company-process8.png"/>" alt="연동실적 제출 및 확인"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/common/company-process7.png"/>" alt="우수기업 선정 및 인센티브 부여"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/common/company-process6.png"/>" alt="우수기업 선정 및 인센티브 부여"/>
                    </div>
                    <div class="prwrap">
                        <img src="<c:url value="/images/common/company-process5.png"/>" alt="우수기업 선정 및 인센티브 부여"/>
                    </div>
                </div>
                <div class="accordion-container">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>자세히 보기</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h3 class="mb20">연동 약정 및 실적 확인 세부절차</h3>
                            <p class="tip">* (협력재단 역할) 위탁기업-수탁기업 간 계약기간 중 원재료 가격 변동에 따라 납품대금을 연동하여 조정한 실적을 확인</p>
                            <div class="peristalsis-process">
                                <div class="item">
                                    ① 연동 특별약정서 제출
                                </div>
                                <div class="item">
                                    ② 참여확인서 발급
                                </div>
                                <div class="item">
                                    ③ 인센티브 부여
                                </div>
                                <div class="item">
                                    ④ 조정실적 제출
                                </div>
                            </div>
                            <h4 class="mb20">
                                ① <strong>(연동 특별약정서 제출)</strong> 위탁기업-수탁기업 간 체결한 계약서의 특별약정에 해당하는 부분 제출
                                <p class="tip">* 영업비밀에 해당할 수 있는 내용은 제외, 위탁기업-수탁기업 담당자 정보 포함</p>
                            </h4>
                            <h4 class="mb20">
                                ② <strong>(참여확인서 발급)</strong> 위탁기업이 연동 특별약정서를 제출한 뒤 확인서 발급을 요청하면 ‘납품대금 연동제 동행기업 참여 확인서’ 발급
                            </h4>
                            <h4 class="mb20">
                                ③ <strong>(인센티브 부여)</strong>참여기업은 ‘동행기업 참여시 제공 인센티브’를 부여받고자 하는 해당기관에 ‘납품대금 연동제 동행기업 참여 확인서’를 제출
                            </h4>
                            <h4 class="">
                                ④ <strong>(조정실적 제출)</strong> 위탁기업이 납품대금 연동 약정에 따라 납품대금을 조정하여 지급한 내역서를 제출
                            </h4>
                            <hr>
                            <h3 class="mb20"> 우수기업 선정 세부절차</h3>
                            <h4>
                                ◦ 동행기업은 ‘23년도 납품대금 연동제 추진실적을 ‘23.10.2일부터 ’23.10.31일까지 제출<br>
                                ◦ 다만, ‘23.8.1일 이후 동행기업으로 선정된 기업의 연동실적은  ‘24년 10월 말까지 제출하여 ‘24년도 우수기업 선정에 반영
                                <br>
                                ◦ ’23년 실적을 제출한 기업에 한해 평가를 통해 우수기업으로 선정·포상(12월 예정)<br>
                                <p class="tip">※ 관계부처 협의를 통해 우수기업 인센티브 확정 예정(~’23년 중)</p>
                            </h4>
                        </div>
                    </div>
                </div>
                <h2 class="title mt40" style="margin-bottom:20px">동행기업 참여 시 제공 인센티브(’23년)</h2>
                <h4>
                    <ul class="disc">
                        <p class="tip">
                            ※ ‘동행기업 참여확인서’ 등을 제출한 기업에 한하여 제공
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
                                <p class="pl10"> * 연동계약 체결비율, 대금 인상실적 등 하도급법상 기준에 따라 인센티브 제공</p>
                                ③ (중소기업) 하도급거래 모범업체 선정 시 가점 부여<br>
                                ④ (공통) 공정거래 업무 유공 포상 추천
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
                                <p class="pl10">  * (금리감면) 대기업 최대 0.3%p, 중견‧중소기업 최대 0.7%p</p>
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="accordion-container mt40">
                    <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                        <h3>추가 인센티브</h3>
                        <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="상세보기">
                        <div class="detail-info">
                            <h4 class="">
                                ◦ 동행기업 중 우수기업을 선정하여 추가 인센티브를 지원할 계획
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