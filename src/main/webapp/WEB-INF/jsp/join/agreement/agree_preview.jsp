<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
    <title>중소벤처기업부 | 연동표 미리보기</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/print.css"/>" />
<%--    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/reset.css"/>" />--%>
<%--    <script type="text/javascript" src="<c:url value="/js/front/jquery-1.12.4.min.js"/>"/>--%>
<%--    <script type="text/javascript" src="<c:url value="/js/front/common.js"/>"/>--%>
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
            </h3>
        </div>
        <div class="page">
            <h3>
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
            </h3>
        </div>
        <div class="page">
            <h3>
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
                <p class="witeDate">년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</p>
            </h3>
            <div class="write-area">
                <div class="item">
                    <h3>
                        <b>원사업자등</b><br>
                        상호 또는 명칭 :<br>
                        전화번호 :<br>
                        주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 :<br>
                        대표자 성명 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(인)<br>
                        사업자(법인) 번호 :
                    </h3>
                </div>
                <div class="item">
                    <h3>
                        <b>수급사업자등</b><br>
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
                표준 연동계약서 (별첨)
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
                    <td class="tit">9.1. 반영비율</td>
                    <td>
                        ${rs.ratio}
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
                * 납품단가가 아닌 납품대금을 기준으로 조정한 경우에는 조정된 납품대금을 기재
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