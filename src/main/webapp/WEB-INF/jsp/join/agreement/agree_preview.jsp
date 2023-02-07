<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
    <title>중소벤처기업부 | 약정서 미리보기</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/print.css"/>" />

</head>

<div class="print-container">
    <div class="btn-fixed">
        <span class="print-btn" onclick="printDiv('printArea')">
            프린트 하기
            <img class="unhover" src="<c:url value="/images/common/Print2.png"/>">
            <img class="hover" src="<c:url value="/images/common/Print.png"/>">
        </span>
    </div>
    <div id="printArea">
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
                <b>제1조(목적)</b> 이 특별약정은 상기 수탁·위탁거래약정과 관련하여, 주요 원재료의 가격이 상승 또는 하락하여 변동하는 경우, 그 변동분에 연동한 납품대금(납품단가를 포함한다. 이하 같다)의 조정(이하 ‘납품대금 연동’이라 한다)에 필요한 제반 사항을 규정함을 목적으로 한다.
                <br>
                <br>
                <b>제2조(정의)</b> ① 이 특별약정에서 사용하는 용어의 뜻은 다음과 같다.
                <ol>
                    <li>
                        ‘수탁·위탁거래’란 제조, 공사, 가공, 수리, 판매, 용역을 업(業)으로 하는 자가 물품, 부품, 반제품(半製品) 및 원료 등(이하 ‘물품등’이라 한다)의 제조, 공사, 가공, 수리, 용역 또는 기술개발(이하 ‘제조’라 한다)을 다른 중소기업에 위탁하고, 제조를 위탁받은 중소기업이 전문적으로 물품등을 제조하는 거래를 말한다.
                    </li>
                    <li>
                        ‘주요 원재료’란 수탁기업이 물품등의 제조에 사용할 원재료(천연재료, 화합물, 가공물, 중간재 등을 포함하되 이에 한정하지 아니한다)로서 해당 가격 변동 시, 납품대금 연동을 하기로 위탁기업과 수탁기업이 협의하여 정한 원재료를 말한다.
                    </li>
                    <li>
                        ‘원재료 가격 기준지표’란 주요 원재료 가격의 상승 또는 하락 정도를 측정하는 기준이 되는 지표를 말한다.
                    </li>
                    <li>
                        ‘원재료 기준가격’은 원재료 가격 기준지표에 따른 특정 시점의 주요 원재료의 단위당 가격을 말한다.
                    </li>
                    <li>
                        ‘조정요건’이란 원재료 기준가격의 기준시점 대비 비교시점의 변동률을 근거로 정한 납품대금 연동을 시행하는 요건을 말한다.
                    </li>
                    <li>
                        ‘조정 주기’란 조정요건을 감안하여 납품대금 연동의 시행 여부를 판단하는 주기를 말하며, ‘조정일’이란 그 조정 주기에 따라 납품대금 연동의 시행 여부를 판단하는 날을 말한다.
                    </li>
                </ol>
            </h3>
        </div>
        <div class="page">
            <h3>
                <ol start="7">
                    <li>
                        ‘조정대금 반영시점‘이란 물품등에 대하여 조정된 납품대금을 적용하는 기준이 되는 날을 말한다.
                    </li>
                    <li>
                        ‘납품대금 연동 산식’이란 납품대금 연동에 따라 조정될 납품대금을 산출하는 산식을 말한다.
                    </li>
                </ol>
                ② 이 특별약정에서 사용하는 용어의 뜻은 ｢대·중소기업 상생협력 촉진에 관한 법률｣(이하 ‘｢상생협력법｣’이라 한다)에 따른다.
                <br>
                <br>
                <b>제3조(원재료 가격 기준지표)</b> ① 원재료 가격 기준지표는 약정의 당사자가 수탁·위탁거래의 성격, 주요 원재료의 특성 등을 고려하여 공신력 있는 기관이 주기적으로 고시하는 지표 또는 이에 준하는 지표로 정함을 원칙으로 한다. 다만, 이와 같은 지표를 사용하는 것이 적절하지 않은 경우에는 다음 각 호와 같이 정할 수 있다.
                <ol>
                    <li>
                        위탁기업이 원재료의 판매처와 직접 협상한 가격 또는 위탁기업이 수탁기업에 판매한 가격
                    </li>
                    <li>
                        원재료의 판매처가 수탁기업에게 판매한 원재료의 단위 당 가격으로서 위탁기업이 확인할 수 있는 가격
                    </li>
                    <li>
                        그 밖에 약정의 당사자 간 합의한 자료를 바탕으로 협의하여 정한 가격
                    </li>
                </ol>
                ② 이 특별약정의 당사자는 원재료 가격 기준지표 등을 정함에 있어 관련 내용을 증명할 수 있는 서류를 제공할 것을 상대방에게 요청할 수 있으며, 해당 서류를 제공받은 당사자는 상대방의 경영정보 및 기술자료 보호 등을 위해 협조한다.
                <br>
                <br>
                <b>제4조(납품대금 연동)</b> ① 위탁기업과 수탁기업은 【첨부1】 ｢납품대금 연동 특별약정서 (별첨)｣(이하 ‘｢별첨｣’이라 한다)에 따라 조정일마다 주요 원재료 기준가격의 기준시점 대비 비교시점의 변동률을 확인하고, 그 변동률이 조정요건을 충족하는 경우 납품대금 연동 산식에 따라 물품등의 납품대금의 금액을 산출한다.<br>
                ② 위탁기업은 제1항에 따라 산출된 금액을 기준으로 물품등의 납품대금을 조정한다.<br>
                ③ 위탁기업과 수탁기업은 제2항에 따라 물품등의 납품대금이 조정된 경우, 조정대금 반영시점, 조정된 원재료 기준가격 및 조정된 납품단가를 【첨부2】 ｢납품단가 변동표｣(이하 ‘｢납품단가 변동표｣’라 한다)에 기재하고 서명(｢전자서명법｣ 제2조 제2호에 따른 전자서명을 포함한다) 또는 기명날인한다.<br>
                ④ 제3항에도 불구하고, ｢납품단가 변동표｣의 기재 사항을 모두 포함하는 전자문서로 양 당사자가 내용을 확인할 수 있는 경우에는 당해 전자문서로 ｢납품단가 변동표｣를 갈음할 수 있다.<br>
                ⑤ 위탁기업은 조정대금 반영시점 이후에 납품되는 물품등에 대하여 제2항에 따라  조정된 금액을 기준으로 납품대금을 지급한다.
            </h3>
        </div>
        <div class="page">
            <h3>
                ⑥ 조정대금 반영시점 이전에 수탁·위탁거래약정의 이행이 완료되어야 하나 수탁기업에 책임있는 사유로 완료되지 않은 부분에 대해서는 그 조정대금 반영시점의 납품대금 연동을 적용하지 아니한다.
                <br>
                <br>
                <b>제5조(효력)</b> ① 이 특별약정은 수탁·위탁거래약정 기간 동안 유효하다.<br>
                ② 납품대금 연동과 관련하여 이 특별약정에 저촉되는 다른 약정이 있는 경우 그 약정은 이 특별약정에 저촉되는 범위에서는 효력이 없다.<br>
                ③ 이 특별약정은 ｢상생협력법｣ 제22조의2(공급원가 변동에 따른 납품대금 조정)의 적용을 배제하는 것으로 해석되지 않는다.<br>
                ④ ｢별첨｣은 이 계약의 부속합의서로서 이 특별약정과 동일한 효력이 있다.
                <br>
                <br>
                <b>제6조(서류의 비치)</b> 위탁기업과 수탁기업은 이 특별약정서와 이에 부속되는 ｢별첨｣ 및 ｢납품단가 변동표｣를 거래의 종료일부터 3년간 갖추어 두어야 한다.
                <br>
                <br>
                이 특별약정의 체결사실 및 특별약정내용을 증명하기 위하여 이 특별약정서를 2부 작성하여 양 당사자가 각각 서명 또는 기명날인한 후 각자 1부씩 보관한다.
                <br>
                <br>
                <p class="witeDate">년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</p>
            </h3>
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
                        주    소 :<br>
                        대표자 성명 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)<br>
                        사업자(법인)번호 :<br>
                    </h3>
                </div>
            </div>
        </div>
        <div class="page">
            <h3 class="text-left">
                【첨부 1】
                <br>
                <br>
            </h3>
            <h1>
                납품대금 연동 특별약정서 (별첨)
            </h1>
            <h3>
                ◇ 위탁기업과 수탁기업은 수탁·위탁거래약정에 관한 납품대금 연동을 위해 다음과 같이 정한다.
            </h3>
            <table>
                <thead>
                <tr>
                    <th width="30%">구분</th>
                    <th width="70%">기재사항</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="tit">1. 물품등의 명칭</td>
                    <td>${rs.name}</td>
                </tr>
                <tr>
                    <td class="tit">2. 주요 원재료</td>
                    <td>${rs.prmy_mat}</td>
                </tr>
                <tr>
                    <td class="tit">3. 원재료 가격 기준지표</td>
                    <td> ${rs.prmy_mat_std}</td>
                </tr>
                <tr>
                    <td class="tit">4. 원재료 기준가격의 변동률 산정을 위한 기준시점 및 비교시점</td>
                    <td>
                        <h3>
                            기준시점: ${rs.std_point}<br>
                            비교시점: ${rs.change_point}
                        </h3>
                    </td>
                </tr>
                <tr>
                    <td class="tit">5. 조정요건</td>
                    <td>${rs.rqrm_ust}</td>
                </tr>
                <tr>
                    <td class="tit">6. 조정주기</td>
                    <td>${rs.rqrm_cycl}</td>
                </tr>
                <tr>
                    <td class="tit">7. 조정일</td>
                    <td>${rs.rqrm_date}</td>
                </tr>
                <tr>
                    <td class="tit">8. 조정대금 반영시점</td>
                    <td> ${rs.reflect_point}</td>
                </tr>
                <tr>
                    <td class="tit">9. 납품대금 연동 산식</td>
                    <td>
                        ${rs.formula}
                    </td>
                </tr>
                <tr>
                    <td class="tit">10. 기타 사항</td>
                    <td>${rs.etc}</td>
                </tr>
                </tbody>
            </table>
            <h3>
                <br>
                ◇ 기재사항이 많아 해당 표에 모든 사항을 기재하기 어려운 경우에는 여러 품목에 공통적으로 적용되는 사항만 기재하고 나머지는 전자문서로 기재할 수 있음
            </h3>
        </div>
        <div class="page">
            <h3 class="text-left">
                【첨부 2】
                <br>
                <br>
            </h3>
            <h1>
                납품단가 변동표
            </h1>
            <h3>
                ◇ 특별약정 체결 시 납품단가* :<br>
                ◇ 특별약정 체결 시 주요 원재료의 기준가격 :
            </h3>
            <table>
                <thead>
                <tr>
                    <th width="14%">조정대금 반영시점</th>
                    <th width="14%">조정된 주요 원재료의 기준가격</th>
                    <th width="13%">조정된 납품단가*</th>
                    <th width="11%">위탁기업 확인</th>
                    <th width="11%">수탁기업 확인</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2">서명·기명날인</td>
                    <td class="td2">서명·기명날인</td>
                </tr>
                <tr>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2">서명·기명날인</td>
                    <td class="td2">서명·기명날인</td>
                </tr>
                <tr>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2">서명·기명날인</td>
                    <td class="td2">서명·기명날인</td>
                </tr>
                <tr>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2">서명·기명날인</td>
                    <td class="td2">서명·기명날인</td>
                </tr>
                <tr>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2">서명·기명날인</td>
                    <td class="td2">서명·기명날인</td>
                </tr>
                <tr>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2">서명·기명날인</td>
                    <td class="td2">서명·기명날인</td>
                </tr>
                <tr>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2">서명·기명날인</td>
                    <td class="td2">서명·기명날인</td>
                </tr>
                <tr>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2">서명·기명날인</td>
                    <td class="td2">서명·기명날인</td>
                </tr>
                <tr>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2">서명·기명날인</td>
                    <td class="td2">서명·기명날인</td>
                </tr>
                <tr>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2"></td>
                    <td class="td2">서명·기명날인</td>
                    <td class="td2">서명·기명날인</td>
                </tr>
                </tbody>
            </table>
            <h3>
                <br>
                * 납품단가가 아닌 납품대금을 기준으로 조정한 경우에는 조정된 납품대금을 기재
                <br>
                <br>
                ◇ 구매·계약시스템 등 상기 내용을 모두 포함하는 전자문서로 양 당사자가 내용을 확인할 수 있는 경우에는 당해 전자문서로 납품대금 변동표를 갈음할 수 있음
            </h3>
        </div>
    </div>
</div>
    <script>
        var printDiv;
        var initBody;
        function printDiv (divId) {
            printDiv = document.all[divId];

            window.onbeforeprint = beforePrint;
            window.onafterprint = afterPrint;

            window.print();
        }
        function beforePrint(){
            initBody = document.body.innerHTML;
            document.body.innerHTML = printDiv.innerHTML;
        }

        function afterPrint(){
            document.body.innerHTML = initBody;
        }


    </script>