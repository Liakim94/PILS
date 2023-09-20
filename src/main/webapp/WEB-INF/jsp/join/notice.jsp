<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title>중소벤처기업부 | 납품대금 연동 관련 유의사항</title>
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
                    납품대금 연동제 도입하기
                </li>
                <li>
                    납품대금 연동 관련 유의사항
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">납품대금 연동 관련 유의사항</h1>
            </div>
            <div id="about" class="content concept">
                <!-- 컨텐츠 start -->
                <section class="temp">
                    <div class="tab-container">
                        <div class="tab-wrap">
                            <div class="tab active" style="width: 50%; font-size: 25px;">위탁기업 체크리스트</div>
                            <div class="tab" style="width: 50%; font-size: 25px;">수탁기업 체크리스트</div>
                        </div>
                        <div class="tab-content-wrap">
                            <div class="tab-content">
                                <h1>위탁기업 체크리스트</h1>
                                <div class="table-wrap">
                                    <table>
                                        <thead>
                                        <td width="10%">시기</td>
                                        <td width="30%">주요 체크리스트</td>
                                        <td width="60%">상세 내용</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title" rowspan="3" style="text-align: center;">
                                                계약 체결 전
                                            </td>
                                            <td>
                                                <strong>(성실 협의 의무)</strong><br>
                                                위탁기업은 연동계약 체결시 성실히 협의하여야 함
                                            </td>
                                            <td style="text-align: left;">
                                                - 주요 원재료에 해당하지 않더라도 위·수탁기업 합의에 따라 연동제 적용을 할 수 있음<br>
                                                -  ① 연동에 관한 협의를 하지 않은 경우, ② 회의 개최, 의견 교환 등 실질적인 협의를 진행하지 않은 경우, ③ 권한 있는 책임자가 협의에 참여하지 않은 경우 등은 성실한 협의 의무 위반이라고 볼 수 있음
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <strong>(계약서 기재사항)</strong><br>
                                                계약서에 납품대금 연동 관련 사항을 빠짐없이 기재할 것
                                            </td>
                                            <td style="text-align: left;">
                                                - ① 납품대금 연동의 대상 목적물 등의 명칭, ② 주요 원재료, ③ 조정요건, ④ 주요 원재료 가격의 기준 지표, ⑤ 납품대금 연동 산식,
                                                ⑥ 주요 원재료 가격의 변동률 산정을 위한 기준시점 및 비교시점, ⑦ 조정일, ⑧ 조정주기 및 ⑨조정 대금 반영일 등을 약정서에 기재하여 수탁기업에 발급해야 함(상생협력법 제21조, 같은 법 시행령 제14조)<br>
                                                - 표준 연동계약서에 첨부된 하도급대금등 연동표를 참고하여 작성
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <strong>(탈법행위의 금지)</strong><br>
                                                하도급대금 연동과 관련된 탈법행위 금지
                                            </td>
                                            <td style="text-align: left;">
                                                - 위탁기업은 납품대금 연동과 관련하여 수탁‧위탁거래에 관한 거래상 지위를 남용하거나 거짓 또는 그 밖의 부정한 방법을 사용해서는 안됨(상생협력법 제21조제4항)<br>
                                                (예) 쪼개기 계약, 미연동합의 강요·유도 등
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title" style="text-align: center;">
                                                계약 체결 후 조정시
                                            </td>
                                            <td>
                                                <strong>(위탁기업의 조정 의무)</strong><br>
                                                조정요건 충족 시 조정된 납품대금 지급
                                            </td>
                                            <td style="text-align: left;">
                                                - 위탁기업과 수탁기업은 연동계약서에 정한 조정일마다 변동률을 확인하고 조정요건을 충족하는 경우 하도급 대금 연동 산식에 따라 물품등의 납품대금을 산출<br>
                                                - 위탁기업은 산출된 금액을 기준으로 물품등의 납품 대금을 조정하여 조정대금 반영일에 조정된 납품대금을 적용<br>
                                                - 위탁기업은 조정대금 반영일 이후에 납품되는 물품등에 대하여 조정된 금액을 기준으로 납품대금을 지급<br>
                                                - 납품대금이 조정되는 경우 위·수탁기업은 납품대금 변동표에 해당 사항을 기재<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title" style="text-align: center;">
                                                조정 종료 후
                                            </td>
                                            <td>
                                                <strong>(연동 협의 서면 보존)</strong><br>
                                                가급적 연동계약 체결 시작부터 종료까지 과정을 상세히 기재하여 보존
                                            </td>
                                            <td style="text-align: left;">
                                                - 위탁기업과 수탁기업은 연동계약서와 이에 부속되는 납품대금 연동표·변동표를 3년 동안 보관해야함 (상생협력법 제39조)<br>
                                                - 성실히 협의에 응했는지 여부를 확인할 수 있는 회의록, 이메일, 공문 등도 같이 보존
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <strong>(연동지원본부 활용)</strong><br>
                                                - ‘납품대금 연동 확산 지원본부’를 통해 ① 원재료 가격 및 주요 물가지수 정보 제공, ② 납품대금 연동의 도입 및 조정 실적 확인, ③ 납품대금 연동 관련 교육 및 컨설팅 등 도움을 받을 수 있음
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-content">
                                <h1>수탁기업 체크리스트</h1>
                                <div class="table-wrap">
                                    <table>
                                        <thead>
                                        <td width="10%">시기</td>
                                        <td width="30%">주요 체크리스트</td>
                                        <td width="60%">상세 내용</td>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="title" rowspan="3" style="text-align: center;">
                                                계약 체결 전
                                            </td>
                                            <td>
                                                <strong>(협의 관련 근거 자료 보존)</strong><br>
                                                연동계약 체결시 성실한 협의가 이루어지지 않은 경우 근거자료 보존
                                            </td>
                                            <td style="text-align: left;">
                                                - 주요 원재료에 해당하지 않더라도 위·수탁기업 합의에 따라 연동제 적용을 할 수 있음<br>
                                                - 위탁기업은 납품대금 연동에 관한 사항 기재 시 수탁 기업의 이익에 반하는 불공정한 내용이 되지 않도록 수탁기업과 성실하게 협의하여야 함<br>
                                                - 성실한 협의가 이루어지지 않았다고 판단하는 경우 (① 연동에 관한 협의를 하지 않은 경우, ② 회의 개최, 의견 교환 등 실질적인 협의를 진행하지 않은 경우, ③ 권한 있는 책임자가 협의에 참여하지 않은 경우) 근거자료를 보존할 필요
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <strong>(계약서 기재사항)</strong><br>
                                                계약서에 납품대금 연동 관련 사항을 빠짐없이 기재할 것
                                            </td>
                                            <td style="text-align: left;">
                                                - ① 납품대금 연동의 대상 목적물 등의 명칭, ② 주요 원재료, ③ 조정요건, ④ 주요 원재료 가격의 기준 지표, ⑤ 납품대금 연동 산식,
                                                ⑥ 주요 원재료 가격의 변동률 산정을 위한 기준시점 및 비교시점, ⑦ 조정일, ⑧ 조정주기 및 ⑨조정 대금 반영일 등을 서면에 기재 하여 수탁기업에게 발급해야 함(상생협력법 제21조 같은 법 시행령 제14조)<br>
                                                - 표준 연동계약서에 첨부된 납품대금 연동표를 참고하여 작성
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <strong>(탈법행위의 금지)</strong><br>
                                                납품대금 연동과 관련된 탈법행위 금지
                                            </td>
                                            <td style="text-align: left;">
                                                - 위탁기업은 납품대금 연동과 관련하여 수탁‧위탁거래에 관한 거래상 지위를 남용하거나 거짓 또는 그 밖의 부정한 방법을 사용해서는 안됨(상생협력법 제21조제4항)<br>
                                                (예) 쪼개기 계약, 미연동합의 강요·유도 등<br>
                                                - 위탁기업의 탈법행위가 있는 경우 관련 증거를 수집· 보존할 필요
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title" style="text-align: center;">
                                                계약 체결 후 조정시
                                            </td>
                                            <td>
                                                <strong>(위탁기업의 조정 의무)</strong><br>
                                                조정요건 충족 시 조정된 납품대금 지급
                                            </td>
                                            <td style="text-align: left;">
                                                - 위탁기업과 수탁기업이 연동계약서에 정한 조정일마다 변동률을 확인하고 조정요건을 충족하는 경우 납품 대금 연동 산식에 따라 물품등의 납품대금을 산출<br>
                                                - 위탁기업은 산출된 금액을 기준으로 물품등의 납품대금을 조정하여 조정대금 반영일에 조정된 납품대금을 적용<br>
                                                - 위탁기업은 조정대금 반영일 이후에 납품되는 물품등에 대하여 조정된 금액을 기준으로 납품대금을 지급<br>
                                                - 납품대금이 조정되는 경우 위·수탁기업은 납품대금 변동표에 해당 사항을 기재<br>
                                                - 단, 수탁기업에 책임 있는 사유로 이행이 지연되어 조정대금 반영일 이후에 이행된 부분에 대해서는 납품대금 연동 절차를 적용하지 않음
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title" style="text-align: center;" rowspan="3">
                                                조정 종료 후
                                            </td>
                                            <td>
                                                <strong>(연동 협의 서면 보존)</strong><br>
                                                가급적 연동계약 체결 시작부터 종료까지 과정을 상세히 기재하여 보존
                                            </td>
                                            <td style="text-align: left;">
                                                - 위탁기업과 수탁기업은 연동계약서와 이에 부속되는 납품대금 연동표·변동표를 3년 동안 보관해야 함 (상생협력법 제39조)<br>
                                                - 성실히 협의에 응했는지 여부를 확인할 수 있는 회의록, 이메일, 공문 등도 같이 보존
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <strong>(수‧위탁분쟁조정협의회 조정 신청)</strong><br>
                                                납품대금 조정과 관련된 위탁기업의 위법행위가 있는 경우 수‧위탁분쟁조정협의회에 분쟁조정을 신청할 수 있음
                                            </td>
                                            <td style="text-align: left;">
                                                - 중소기업 수‧위탁거래 종합 포털을 통해 접수할 수 있습니다.<br>
                                                * 불공정거래신고센터 : 1357
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <strong>(중소벤처기업부 분쟁조정 요청)</strong><br>
                                                납품대금 조정과 관련된 위탁기업의 위법행위가 있는 경우 중소벤처기업부에 분쟁의 조정을 요청할 수 있음
                                            </td>
                                            <td style="text-align: left;">
                                                - 중소기업 수‧위탁거래 종합 포털 또는 중소벤처기업부 홈페이지를 통해 접수할 수 있습니다.<br>
                                                (민원‧신고 → 신고센터 → 불공정거래 신고)<br>
                                                * 불공정거래신고센터 : 1357 중소벤처기업부 상담전화 : 044-204-7918<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <strong>(연동지원본부 활용)</strong><br>
                                                - ‘납품대금 연동 확산 지원본부’를 통해 ① 원재료 가격 및 주요 물가지수 정보 제공, ② 납품대금 연동의 도입 및 조정 실적 확인, ③ 납품대금 연동 관련 교육 및 컨설팅 등 도움을 받을 수 있음
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
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