<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<div id="content">
    <div id="board">
        <page:applyDecorator name="guide_menu"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    납품대금 연동제란?
                </li>
                <li>
                    관련 법령
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">관련 법령</h1>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <section>
                    <h2 class="title">「대·중소기업 상생협력 촉진에 관한 법률」</h2>
                    <div class="accordion-container">
                        <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                            <h3>제2조(정의)</h3>
                            <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                            <div class="detail-info">
                                <h4>
                                    제2조(정의) 이 법에서 사용하는 용어의 뜻은 다음과 같다.<br>
                                    <br>
                                    1. “중소기업”이란 「중소기업기본법」 제2조에 따른 중소기업을 말한다.<br>
                                    <br>
                                    2. “대기업”이란 중소기업이 아닌 기업을 말한다.<br>
                                    <br>
                                    3. “상생협력”이란 대기업과 중소기업 간, 중소기업 상호간 또는 위탁기업과 수탁기업(受託企業) 간에 기술, 인력, 자금, 구매, 판로 등의 부문에서 서로 이익을 증진하기 위하여 하는 공동의 활동을 말한다.<br>
                                    <br>
                                    4. “수탁ㆍ위탁거래”란 제조, 공사, 가공, 수리, 판매, 용역을 업(業)으로 하는 자가 물품, 부품, 반제품(半製品) 및 원료 등(이하 “물품등”이라 한다)의 제조, 공사, 가공, 수리, 용역 또는 기술개발(이하 “제조”라 한다)을 다른 중소기업에 위탁하고, 제조를 위탁받은 중소기업이 전문적으로 물품등을 제조하는 거래를 말한다.<br>
                                    <br>
                                    5. “위탁기업”이란 제4호에 따른 위탁을 하는 자를 말한다.<br>
                                    <br>
                                    6. “수탁기업”이란 제4호에 따른 위탁을 받은 자를 말한다.<br>
                                    <br>
                                    7. “중소기업자단체”란 「중소기업협동조합법」 제3조에 따른 중소기업협동조합과 중소벤처기업부령으로 정하는 중소기업 관련 단체를 말한다.<br>
                                    <br>
                                    8. “어음대체결제”란 위탁기업이 물품등의 납품대금을 「조세특례제한법」 제7조의2제3항제5호부터 제7호까지의 규정에 따른 기업구매전용카드, 외상매출채권 담보대출, 구매 론 제도, 그 밖에 어음을 대체하여 사용되는 결제수단으로서 대통령령으로 정하는 수단으로 지급하는 것을 말한다.<br>
                                    <br>
                                    8의2. “상생결제”란 위탁기업 또는 수탁기업이 다음 각 목의 요건을 모두 충족하는 외상매출채권으로 납품대금을 지급하는 것을 말한다.<br>
                                    가. 수탁기업이 위탁기업으로부터 납품대금으로 받은 외상매출채권을 담보로 다른 수탁기업에게 새로운 외상매출채권을 발행하여 납품대금을 지급할 수 있을 것<br>
                                    나. 여러 단계의 하위 수탁기업들이 위탁기업이 발행한 외상매출채권과 동일한 금리조건의 외상매출채권으로 납품대금을 지급할 수 있을 것<br>
                                    다. 금융기관이 수탁기업에 대하여 상환청구권을 행사할 수 없는 것으로 약정될 것<br>
                                    라. 외상매출채권은 그 만기일이 도래하는 때에 대통령령으로 정하는 바에 따라 별도로 지정된 전용예치계좌에서 현금으로 인출되어 상환될 것<br>
                                    <br>
                                    8의3. “중앙관서 및 지방자치단체의 상생결제”란 「국가재정법」 제6조에 따른 중앙관서 및 「지방자치법」 제2조에 따른 지방자치단체가 공공부문과 중소기업 간 협력을 촉진하기 위하여 상생결제 방식으로 제22조제6항에 따라 납품대금을 지급하는 것을 말한다.<br>
                                    <br>
                                    9. “기술자료”란 물품등의 제조 방법, 생산 방법, 그 밖에 영업활동에 유용하고 독립된 경제적 가치가 있는 것으로서 대통령령으로 정하는 자료를 말한다.<br>
                                    <br>
                                    10. “동반성장지수”란 대ㆍ중소기업 간 동반성장을 촉진하기 위하여 동반성장의 수준을 평가하여 계량화한 지표를 말한다.<br>
                                    <br>
                                    11. “중소기업 적합업종ㆍ품목”(이하 “적합업종”이라 한다)이란 중소기업의 경영안정을 위하여 대ㆍ중소기업 간의 합리적 역할분담을 통하여 중소기업의 형태로 사업을 영위하는 것이 적합한 업종ㆍ품목을 말한다.<br>
                                    <br>
                                    12. “주요 원재료”란 수탁·위탁거래에서 물품등의 제조에 사용되는 원재료로서 그 비용이 납품대금의 100분의 10 이상인 원재료를 말한다.<br>
                                    <br>
                                    13. “납품대금 연동”이란 주요 원재료의 가격이 위탁기업과 수탁기업이 100분의 10 이내의 범위에서 협의하여 정한 비율 이상 변동하는 경우 그 변동분에 연동하여 납품대금을 조정하는 것을 말한다.
                                </h4>
                            </div>
                        </div>
                        <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                            <h3>제21조(약정서의 발급)</h3>
                            <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                            <div class="detail-info">
                                <h4>
                                    ① 위탁기업이 수탁기업에 물품등의 제조를 위탁할 때에는 지체 없이 다음 각 호의 사항을 적은 약정서를 그 수탁기업에 발급하여야 한다.<br>
                                    <br>
                                    1. 위탁의 내용<br>
                                    2. 납품대금(지급 방법 및 지급기일을 포함한다)<br>
                                    3. 납품한 물품등의 검사 방법<br>
                                    4. 납품대금 연동의 대상인 물품등의 명칭, 주요 원재료, 조정요건, 기준 지표 및 산식 등 납품대금 연동에 관한 사항으로서 대통령령으로 정하는 사항<br>
                                    5. 그 밖에 약정서에 적어야 할 사항으로서 대통령령으로 정하는 사항<br>
                                    <br>
                                    ② 위탁기업은 약정서에 제1항제4호의 사항을 적기 위하여 수탁기업과 성실히 협의하여야 한다.<br>
                                    <br>
                                    ③ 위탁기업은 다음 각 호의 어느 하나에 해당하는 경우 제1항제4호에 따른 사항을 약정서에 적지 아니할 수 있다. 다만, 제4호의 경우에는 위탁기업과 수탁기업이 그 취지와 사유를 약정서에 분명하게 적어야 한다.<br>
                                    <br>
                                    1. 위탁기업이 「중소기업기본법」 제2조제2항에 따른 소기업에 해당하는 경우<br>
                                    2. 수탁·위탁거래의 기간이 90일 이내의 범위에서 대통령령으로 정하는 기간 이내인 경우<br>
                                    3. 납품대금이 1억원 이하의 범위에서 대통령령으로 정하는 금액 이하인 경우<br>
                                    4. 위탁기업과 수탁기업이 납품대금 연동을 하지 아니하기로 합의한 경우<br>
                                    <br>
                                    ④ 위탁기업은 납품대금 연동과 관련하여 수탁·위탁거래에 관한 거래상 지위를 남용하거나 거짓 또는 그 밖의 부정한 방법으로 이 조의 적용을 피하려는 행위를 하여서는 아니 된다.<br>
                                    <br>
                                    ⑤ 중소벤처기업부장관은 위탁기업과 수탁기업의 상생협력 및 수탁·위탁거래의 공정화를 위하여 제1항제4호 및 제3항 각 호 외의 부분 단서에 관한 표준약정서를 제정 또는 개정하고, 그 사용을 권장하여야 한다.<br>
                                    <br>
                                    ⑥ 위탁기업은 수탁기업으로부터 물품등을 받으면 물품등의 검사 여부에 관계없이 즉시 물품 수령증을 발급하여야 한다.
                                </h4>
                            </div>
                        </div>
                        <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                            <h3>제22조의3(납품대금 연동 우수기업 선정 지원)</h3>
                            <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                            <div class="detail-info">
                                <h4>
                                    ① 중소벤처기업부장관은 납품대금 연동의 확산을 위하여 납품대금 연동 우수기업 및 납품대금 연동 확산에 기여한 자(이하 “납품대금 연동 우수기업등”이라 한다)를 선정하고 포상하는 등 지원시책을 수립하여 추진할 수 있다.<br>
                                    <br>
                                    ② 납품대금 연동 우수기업등의 선정 방법, 절차 및 지원시책 등에 관하여 필요한 사항은 중소벤처기업부령으로 정한다.
                                </h4>
                            </div>
                        </div>
                        <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                            <h3>제22조의4(납품대금 연동 확산 지원본부의 지정 등)</h3>
                            <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                            <div class="detail-info">
                                <h4>
                                    ① 중소벤처기업부장관은 납품대금 연동의 확산을 지원하기 위하여 중소기업지원 관련 기관이나 단체를 납품대금 연동 확산 지원본부(이하 “연동지원본부”라 한다)로 지정할 수 있다.<br>
                                    <br>
                                    ② 연동지원본부는 다음 각 호의 사업을 한다.<br>
                                    <br>
                                    1. 원재료 가격 및 주요 물가지수 정보 제공<br>
                                    2. 납품대금 연동의 도입 및 조정 실적 확인<br>
                                    3. 납품대금 연동 관련 교육 및 컨설팅<br>
                                    4. 그 밖에 납품대금 연동의 확산을 위하여 필요한 사항으로서 중소벤처기업부령으로 정하는 사항<br>
                                    <br>
                                    ③ 중소벤처기업부장관은 연동지원본부가 제2항 각 호의 사업을 추진하는 데 필요한 지원을 할 수 있다.<br>
                                    <br>
                                    ④ 중소벤처기업부장관은 연동지원본부가 다음 각 호의 어느 하나에 해당하면 지정을 취소하거나 6개월 이내의 기간을 정하여 그 업무의 전부 또는 일부의 정지를 명할 수 있다. 다만, 제1호에 해당하는 경우에는 그 지정을 취소하여야 한다.<br>
                                    <br>
                                    1. 거짓이나 그 밖의 부정한 방법으로 지정을 받은 경우<br>
                                    2. 제5항에 따른 지정 기준을 충족하지 못하는 경우<br>
                                    3. 정당한 사유 없이 제2항 각 호의 사업을 1개월 이상 수행하지 아니한 경우<br>
                                    <br>
                                    ⑤ 연동지원본부의 지정 및 지정 취소의 기준과 절차 등에 관한 세부사항은 대통령령으로 정한다.
                                </h4>
                            </div>
                        </div>
                        <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                            <h3>제25조(준수사항)</h3>
                            <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                            <div class="detail-info">
                                <h4>
                                    ① 위탁기업은 수탁기업에 물품등의 제조를 위탁할 때 다음 각 호의 행위를 하여서는 아니 된다.<br>
                                    <br>
                                    1. 수탁기업이 책임질 사유가 없는데도 물품등의 수령을 거부하거나 납품대금을 깎는 행위<br>
                                    <br>
                                    1의2. 물품등의 제조를 위탁한 후 제21조제1항제4호의 사항을 이행하지 아니하기 위하여 수탁기업이 책임질 사유가 없음에도 불구하고 물품등의 제조 위탁을 임의로 취소하거나 변경하는 행위<br>
                                    <br>
                                    2. 납품대금을 지급기일까지 지급하지 아니하는 행위<br>
                                    <br>
                                    3. 수탁기업이 납품하는 물품등과 같은 종류이거나 유사한 물품등에 대하여 통상적으로 지급되는 대가보다 현저히 낮은 가격으로 납품대금을 정하는 행위<br>
                                    <br>
                                    4. 물품등의 제조를 위탁한 후 경제상황 변동 등의 이유로 발주자로부터 추가금액을 받은 위탁기업이 같은 이유로 수탁기업에 추가비용이 드는데도 받은 추가금액의 내용과 비율에 따라 납품대금을 증액하여 지급하지 아니하는 행위<br>
                                    <br>
                                    5. 품질의 유지 또는 개선을 위하여 필요한 경우나 그 밖에 정당한 사유가 있는 경우를 제외하고 위탁기업이 지정하는 물품등을 강제로 구매하게 하는 행위<br>
                                    <br>
                                    6. 납품대금을 지급할 때 그 납품대금의 지급기일까지 금융기관으로부터 할인을 받기 어려운 어음을 지급하는 행위<br>
                                    <br>
                                    7. 물품등에 흠이 없는데도 정당한 사유 없이 발주물량을 통상적으로 발주하는 수량보다 현저히 감소시키거나 발주를 중단하는 행위<br>
                                    <br>
                                    8. 납품대금을 지급하는 대신 위탁기업이 제조하는 제품을 받을 것을 요구하는 행위<br>
                                    <br>
                                    9. 위탁기업이 수출용으로 수탁기업에 발주한 물품등에 대하여 정당한 사유 없이 내국신용장 개설을 기피하는 행위<br>
                                    <br>
                                    10. 물품등의 제조를 의뢰한 후 그 제조된 물품등에 대한 발주를 정당한 사유 없이 기피하는 행위<br>
                                    <br>
                                    11. 수탁기업이 납품한 물품에 대한 검사를 할 때 객관적 타당성이 결여된 검사기준을 정하는 행위<br>
                                    <br>
                                    12. 정당한 사유 없이 기술자료 제공을 요구하는 행위<br>
                                    <br>
                                    13. 기술자료의 임치를 요구한 수탁기업에 불이익을 주는 행위<br>
                                    <br>
                                    13의2. 정당한 사유 없이 원가자료 등 중소벤처기업부령으로 정하는 경영상의 정보를 요구하는 행위<br>
                                    <br>
                                    14. 수탁기업이 다음 각 목의 어느 하나에 해당하는 행위를 한 것을 이유로 수탁ㆍ위탁거래의 물량을 줄이거나 수탁ㆍ위탁거래의 정지 또는 그 밖의 불이익을 주는 행위<br>
                                    <br>
                                    가. 위탁기업이 다음의 어느 하나에 해당하는 행위를 한 사실을 관계 기관에 고지한 행위<br>
                                    1) 제1호, 제1호의2, 제2호부터 제13호까지에 해당하는 행위<br>
                                    2) 제2항을 위반하는 행위<br>
                                    나. 제22조의2제1항 또는 제2항의 위탁기업에 대한 납품대금의 조정신청 또는 같은 조 제8항의 중소벤처기업부장관에 대한 분쟁 조정신청<br>
                                    <br>
                                    ② 위탁기업은 취득한 수탁기업의 기술자료(비밀로 관리되는 기술자료로 한정한다)에 관하여 부당하게 다음 각 호의 어느 하나에 해당하는 유용행위를 하여서는 아니 된다.<br>
                                    1. 자기 또는 제3자를 위하여 사용하는 행위<br>
                                    <br>
                                    2. 제3자에게 제공하는 행위<br>
                                    <br>
                                    ③ 위탁기업이 제1항제1호의 행위를 통하여 감액한 납품대금을 물품등의 수령일부터 60일이 지난 후 지급하는 경우에는 그 초과기간에 대하여 연 100분의 40 이내의 범위에서 대통령령으로 정하는 이율에 따른 이자를 지급하여야 한다. < 신설 2020. 10. 20. ><br>
                                    <br>
                                    ④ 수탁기업은 위탁기업으로부터 물품등의 제조를 위탁받았을 때에는 다음 각 호의 행위를 하여서는 아니 된다.<br>
                                    1. 위탁기업으로부터 위탁받은 물품등의 품질ㆍ성능 또는 납품기일에 관한 약정을 위반하는 행위<br>
                                    <br>
                                    2. 물품등의 가격을 부당하게 인상하여 줄 것을 요구하는 행위<br>
                                    <br>
                                    3. 그 밖에 수탁ㆍ위탁거래의 질서를 문란하게 하는 행위
                                </h4>
                            </div>
                        </div>
                        <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                            <h3>제27조(수탁위탁기업 간 불공정거래행위 개선)</h3>
                            <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                            <div class="detail-info">
                                <h4>
                                    ① 중소벤처기업부장관은 대기업과 중소기업 간의 수탁ㆍ위탁거래 과정에서 위탁기업이 제21조, 제21조의2제1항, 제22조, 제22조의2, 제23조, 제25조제1항부터 제3항까지의 규정을 이행하고 있는지를 대통령령으로 정하는 바에 따라 주기적으로 조사하여 개선이 필요한 사항에 대하여는 해당 기업에 개선을 요구할 수 있다.<br>
                                    <br>
                                    ② 중소벤처기업부장관은 제1항에 따른 위탁기업이 제21조, 제22조, 제22조의2, 제23조 또는 제25조제1항부터 제3항까지의 규정을 위반한 경우 납품대금의 지급, 법 위반행위의 중지, 향후 재발 방지, 그 밖에 시정에 필요한 조치를 명할 수 있다. 다만, 그 위반사실이 「하도급거래 공정화에 관한 법률」 제3조, 제4조부터 제12조까지, 제12조의2, 제12조의3, 제13조, 제13조의2, 제15조, 제16조, 제16조의2 및 제17조부터 제20조까지의 규정 또는 「독점규제 및 공정거래에 관한 법률」 제23조제1항에 따른 금지행위에 해당하는 경우는 그러하지 아니하다.<br>
                                    <br>
                                    ③ 중소벤처기업부장관은 제1항에 따른 개선요구 또는 제2항에 따른 명령을 받은 위탁기업이 개선요구 또는 명령에 따르지 아니할 때에는 그 명칭 및 요지를 공표하여야 한다.<br>
                                    <br>
                                    ④ 중소벤처기업부장관은 필요하다고 인정하면 대통령령으로 정하는 규모 이상의 중소기업이 다른 중소기업에 제조를 위탁한 경우에도 제1항부터 제3항까지의 규정을 준용한다.<br>
                                    <br>
                                    ⑤ 중소벤처기업부장관은 제1항과 제4항에 따른 조사 결과 현금결제 및 상생결제 확대 등 결제조건이 양호하고 공정한 수탁ㆍ위탁거래 관계를 확립하기 위하여 노력한 것으로 평가된 기업에 대하여는 포상이나 그 밖에 필요한 지원을 할 수 있다. < 개정 2017. 7. 26., 2018. 3. 20., 2020. 10. 20. ><br>
                                    <br>
                                    ⑥ 정부는 중소기업에 대한 대기업의 납품대금 결제조건을 개선하고 현금성 결제(현금결제 및 상생결제를 포함한다)를 확대하기 위하여 세제지원 등 필요한 지원을 할 수 있다. < 개정 2018. 3. 20., 2020. 10. 20. ><br>
                                    <br>
                                    ⑦ 중소벤처기업부장관은 제21조, 제21조의2제1항, 제22조, 제22조의2, 제23조 또는 제25조제1항부터 제3항까지의 규정을 위반한 위탁기업에 대하여 중소벤처기업부령으로 정하는 바에 따라 그 위반 및 피해의 정도에 따라 벌점을 부과할 수 있으며, 그 벌점이 중소벤처기업부령으로 정하는 기준을 초과하는 경우에는 「국가를 당사자로 하는 계약에 관한 법률」 제27조, 「지방자치단체를 당사자로 하는 계약에 관한 법률」 제31조 또는 「공공기관의 운영에 관한 법률」 제39조에 따른 입찰참가자격의 제한을 해당 중앙관서의 장, 지방자치단체의 장 또는 공공기관의 장에게 요청할 수 있다.
                                </h4>
                            </div>
                        </div>
                        <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                            <h3>제28조(분쟁의 조정)</h3>
                            <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                            <div class="detail-info">
                                <h4>
                                    ① 다음 각 호의 사항에 관하여 위탁기업과 수탁기업 또는 중소기업협동조합 간에 분쟁이 생겼을 때에는 위탁기업·수탁기업 또는 중소기업협동조합은 대통령령으로 정하는 바에 따라 중소벤처기업부장관에게 분쟁 조정을 요청할 수 있다.<br>
                                    <br>
                                    1. 제21조에 따른 약정서, 납품대금 연동 및 물품 수령증에 관한 사항<br>
                                    <br>
                                    2. 제22조에 따른 납품대금의 지급 등에 관한 사항<br>
                                    <br>
                                    2의2. 제22조의2에 따른 납품대금의 조정에 관한 사항<br>
                                    <br>
                                    3. 제23조에 따른 물품등의 검사에 관한 사항<br>
                                    <br>
                                    4. 제24조의2에 따른 기술자료의 임치에 관한 사항<br>
                                    <br>
                                    5. 제25조에 따른 준수사항의 이행 여부에 관한 사항<br>
                                    <br>
                                    ② 제1항에 따른 분쟁당사자인 수탁기업은 중소기업자단체에 분쟁조정과 관련된 권한을 위임할 수 있다.<br>
                                    <br>
                                    ③ 중소벤처기업부장관은 제1항에 따른 조정을 요청받으면 지체 없이 그 내용을 검토하여 제1항 각 호의 사항에 관하여 시정을 할 필요가 있다고 인정될 때에는 해당 위탁기업ㆍ수탁기업 또는 중소기업협동조합에 그 시정을 권고하거나 시정명령을 할 수 있다.<br>
                                    <br>
                                    ④ 중소벤처기업부장관은 제3항에 따른 시정명령을 받은 위탁기업ㆍ수탁기업 또는 중소기업협동조합이 명령에 따르지 아니할 때에는 그 명칭 및 요지를 공표하여야 한다. 다만, 위탁기업의 행위가 제26조에 해당하는 경우에는 공정거래위원회에 필요한 조치를 하여 줄 것을 요구하여야 한다.<br>
                                    <br>
                                    ⑤ 제3항에 따른 검토 및 시정권고나 시정명령에 필요한 사항은 대통령령으로 정한다.
                                </h4>
                            </div>
                        </div>
                        <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                            <h3>제43조(과태료)</h3>
                            <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                            <div class="detail-info">
                                <h4>
                                    ① 제34조제3항에 따른 명령을 이행하지 아니한 자에게는 1억원 이하의 과태료를 부과한다.<br>
                                    <br>
                                    ② 다음 각 호의 어느 하나에 해당하는 자에게는 5천만원 이하의 과태료를 부과한다.<br>
                                    1. 제40조에 따른 자료를 제출하지 아니하거나 거짓 자료를 제출한 자 또는 조사를 거부ㆍ방해 또는 기피한 자<br>
                                    2. 제21조제4항을 위반한 자<br>
                                    <br>
                                    ③ 다음 각 호의 어느 하나에 해당하는 자에게는 1천만원 이하의 과태료를 부과한다.<br>
                                    1. 제21조제1항에 따른 약정서를 발급하지 아니한 자<br>
                                    <br>
                                    2. 제21조의2제1항에 따른 비밀유지계약을 체결하지 아니한 자<br>
                                    <br>
                                    ④ 다음 각 호의 어느 하나에 해당하는 자에게는 500만원 이하의 과태료를 부과한다.<br>
                                    <br>
                                    1. 제20조의2제5항에 따른 회의록을 작성ㆍ비치하지 아니한 자<br>
                                    <br>
                                    2. 제28조의2에 따른 교육명령 등의 조치를 이행하지 아니한 자<br>
                                    <br>
                                    3. 제39조제1항에 따른 서류를 갖추어 두지 아니하거나 그 서류에 거짓 사항을 적은 자<br>
                                    <br>
                                    ⑤제1항부터 제4항까지에 따른 과태료는 대통령령으로 정하는 바에 따라 중소벤처기업부장관이 부과ㆍ징수한다.
                                </h4>
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
