<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<head>
    <title>중소벤처기업부 | 도입 준비하기</title>
</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu2"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    납품대금 연동제 도입하기
                </li>
                <li>
                    도입 준비하기
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">도입 준비하기</h1>
            </div>
            <div id="ready" class="content">
                <section class="font16 point4-text">
                    <div class="pc-process-wrap">
                        <img class="process" src="<c:url value="/images/common/ready_process1.png"/>">
                        <img class="next" src="<c:url value="/images/common/next.png"/>">
                        <img class="process" src="<c:url value="/images/common/ready_process2.png"/>">
                        <img class="next" src="<c:url value="/images/common/next.png"/>">
                        <img class="process" src="<c:url value="/images/common/ready_process3.png"/>">
                    </div>
                    <div class="mobile-process-wrap mobile">
                        <div class="img-wrap">
                            <img class="process" src="<c:url value="/images/common/ready_process1.png"/>">
                        </div>
                        <br>
                        <div class="img-wrap">
                            <img class="process" src="<c:url value="/images/common/ready_process2.png"/>">
                        </div>
                        <div class="img-wrap">
                            <img class="process" src="<c:url value="/images/common/ready_process3.png"/>">
                        </div>
                    </div>
                </section>
                <div id="about" class="content">
                    <section class="font16 point4-text">
                        <h2 class="title">① 적용 대상 거래 알아보기</h2>
                        <div class="box-container">
                            <li class="mb20 m-text">
                                <b class="text-red">납품대금 연동제</b>란 <b class="text-red">위탁기업</b>이 <b
                                    class="text-red">수탁기업</b>에 물품, 부품, 반제품 및 원료 등(이하 “물품등”이라 한다)의 제조, 공사, 가공,
                                수리, 용역 또는 기술개발(이하 “제조”라 한다“)을 <b class="text-red">위탁</b>할 때 납품대금 연동에 관한 사항을
                                적은 약정서를 그 수탁기업에 발급하도록 하는 제도입니다.
                            </li>
                            <p class="font14 mb40 point9-text tip">
                                ※ 관련법령: 개정 ｢대·중소기업 상생협력 촉진에 관한 법률｣ [2023.1.3. 일부개정] 제21조 제1항 및 제1항 제4호
                            </p>
                            <div class="accordion-container">
                                <div class="item-wrap" onclick="detailOpen(this)" tabindex="1"
                                     style="padding: 10px 20px !important">
                                    <h3 class="ar-title">1. 납품대금 연동이란?</h3>
                                    <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                                    <div class="detail-info">
                                        <ul>
                                            <li>
                                                “납품대금 연동”이란 주요 원재료의 가격이 일정 기준(위탁기업과 수탁기업이 10% 이내의 범위에서 협의하여 정한 비율)
                                                이상 변동하는 경우 그 변동분에 연동하여 납품대금을 조정하는 것을 말합니다.
                                                <p class="font14 mt10 mb30 point9-text tip">
                                                    ※ 관련법령: 개정 ｢대·중소기업 상생협력 촉진에 관한 법률｣ [2023.1.3. 일부개정] 제2조 제13호
                                                </p>
                                            </li>
                                            <li>
                                                “주요원재료”란 수탁·위탁거래에서 물품등의 제조에 사용되는 원재료로서 그 비용이 납품대금의 10% 이상인 원재료를 말합니다.
                                                <p class="font14 mt10 point9-text tip">
                                                    ※ 관련법령: 개정 ｢대·중소기업 상생협력 촉진에 관한 법률｣ [2023.1.3.
                                                    일부개정] 제2조 제13호
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="item-wrap" onclick="detailOpen(this)" tabindex="1"
                                     style="padding: 10px 20px !important">
                                    <h3 class="ar-title">2. 위탁기업이란?</h3>
                                    <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                                    <div class="detail-info">
                                        <ul class="point4-text">
                                            <li>
                                                위탁기업이란 제조, 공사, 가공, 수리, 판매, 용역을 업(業)으로 하는 기업으로서 물품등의 제조를 다른 수탁기업에 위탁하는
                                                기업을
                                                말합니다.
                                                <p class="font14 mt10 mb30 point9-text tip">
                                                    ※ 관련법령: ｢대·중소기업 상생협력 촉진에 관한 법률｣ 제2조 제5호
                                                </p>
                                            </li>
                                            <li class="mb40">
                                                “업(業)으로 한다는 것”의 의미는 영리 또는 비영리 여부를 불문하고 경제 행위를 계속하여 반복적으로 행하는 것을 의미하며 이는
                                                어떤
                                                경제적
                                                이익의 공급에 대하여 그것에 대응하는 경제적 이익의 반대급부를 받는 행위를
                                                말합니다. “업(業)으로 한다는 것”의 범위는 아래 예시를 포함합니다.
                                            </li>
                                        </ul>
                                        <div class="flex-item">
                                            <div class="">
                                                <table class="company-table font14 point4-text">
                                                    <tr class="fw500 font16 point7-text ">
                                                        <td class="t-head">구분</td>
                                                        <td class="t-head tc">범위</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            제조업
                                                        </td>
                                                        <td>
                                                            제조업 중 가공업을 제외한 모든 산업
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            공사업
                                                        </td>
                                                        <td>
                                                            종합건설업 및 전문직별 공사업
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            가공업
                                                        </td>
                                                        <td>
                                                            제재 및 목재 가공업, 금속 열처리, 도금 및 기타 금속 가공업 등
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            수리업
                                                        </td>
                                                        <td>
                                                            컴퓨터 및 통신장비 수리업, 자동차 및 모터사이클 수리업, 가전제품 수리업 등
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            판매업
                                                        </td>
                                                        <td>
                                                            도매업 및 소매업
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            용역업
                                                        </td>
                                                        <td>
                                                            전기, 가스, 수도, 운수 및 창고업, 숙박 및 음식점업, 정보통신업, 부동산관련 서비스업, 과학 및 기술
                                                            서비스업, 교육 서비스업
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <!-- pc용 -->
                                            <div class="company-box company-box-pc mt40">
                                                <div>
                                                    <img class="company1"
                                                         src="<c:url value="/images/common/company1.png"/>" alt="위탁기업"/>
                                                    <div class="tc">
                                                        <p class="fw700 font16 point7-text company-box-text1">위탁기업</p>
                                                        <p class="font12 company-box-text1 point9-text">(대∙중견기업, 중소기업,
                                                            공기업 등)</p>
                                                    </div>
                                                </div>
                                                <div class="ml35 mr35 tc point4-text font14">
                                                    <p>
                                                        물품, 부품, 반제품 및<br/>
                                                        원료 등의 제조, 공사, 가공, 수리, 용역<br/>
                                                        또는 기술개발을 위탁
                                                    </p>
                                                    <p class="mt25">
                                                        중소기업이 전문적으로<br/>
                                                        물품 등을 제조, 납품하는 행위
                                                    </p>
                                                </div>
                                                <div>
                                                    <img class="company2"
                                                         src="<c:url value="/images/common/company2.png"/>" alt="수탁기업"/>
                                                    <div class="tc">
                                                        <p class="fw700 font16 point7-text company-box-text2">수탁기업</p>
                                                        <p class="font12 company-box-text2 point9-text">(중소기업)</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 모바일용 -->
                                            <div class="company-box company-box-modile mt40">
                                                <img class="company1"
                                                     src="<c:url value="/images/common/company1-m.png"/>" alt="위탁기업"/>
                                                <div class="tc">
                                                    <p class="fw700 font16 point7-text">위탁기업</p>
                                                    <p class="font12">(대∙중견기업, 중소기업, 공기업 등)</p>
                                                </div>
                                                <img class="arrow mt20" src="<c:url value="/images/common/arrow.png"/>"
                                                     alt="화살표"/>
                                                <br/>
                                                <div class="company-text tc mt20 mb20">
                                                <span class="tc mr25">
                                                    물품, 부품, 반제품 및<br/>
                                                    원료 등의 제조, 공사,<br/> 가공, 수리, 용역
                                                    또는<br/> 기술개발을 위탁
                                                </span>
                                                    <span class="tc">
                                                    중소기업이<br/> 전문적으로
                                                    물품 등을<br/> 제조, 납품하는 행위
                                                </span>
                                                </div>
                                                <br/>
                                                <img class="arrow mb20" src="<c:url value="/images/common/arrow.png"/>"
                                                     alt="화살표"/>
                                                <div class="mt20">
                                                    <img class="company2"
                                                         src="<c:url value="/images/common/company2-m.png"/>"
                                                         alt="수탁기업"/>
                                                    <div class="tc">
                                                        <p class="fw700 font16 point7-text">수탁기업</p>
                                                        <p class="font12">(중소기업)</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <p class="mt20 point8-text tc font14 fw500">
                                                ‘업으로 하는 자'의 판단 기준: 사업자등록 여부, 해당 업에 대한 매출발생 여부, 사업상 독립적으로 재화 또는<br
                                                    class="br-modile"/>
                                                용역을 공급하고 있는지 등을 종합적으로 고려하여 판단
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="item-wrap mb10" onclick="detailOpen(this)" tabindex="1"
                                     style="padding: 10px 20px !important">
                                    <h3 class="ar-title">3. 수탁기업이란?</h3>
                                    <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                                    <div class="detail-info">
                                        <ul>
                                            <li>
                                                수탁기업이란 위탁기업으로부터 물품등의 제조를 위탁받아 전문적으로 물품등의 제조를 하는 중소기업을 말합니다.
                                                <p class="font14 mt10 mb30 point9-text tip">
                                                    ※ 관련법령: ｢대·중소기업 상생협력 촉진에 관한 법률｣ 제2조 제6호
                                                </p>
                                            </li>
                                            <li>
                                                「독점규제 및 공정거래에 관한 법률」제31조제1항에 따른 상호출자제한기업집단에 속하는 기업과 수탁·위탁거래 관계에 있는
                                                대통령령으로
                                                정하는
                                                중견기업*은 ‘상생협력법’ 제21조부터 제23조까지, 제25조제1항 및 제27조제1항에 따른 수탁기업으로 봅니다.
                                                <p class="font14 mt10 mb30 point9-text tip">
                                                    ※ 관련법령: 「중견기업 성장촉진 및 경쟁력 강화에 관한 특별법」 제13조
                                                </p>

                                                * “대통령령으로 정하는 중견기업”이란 평균매출액 또는 연간매출액이 3천억원 미만인 중견기업을
                                                말합니다.
                                                <p class="font14 mt10 point9-text tip">
                                                    ※ 관련법령: 「중견기업 성장촉진 및 경쟁력 강화에 관한 특별법 시행령」 제6조)
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="item-wrap mb10" onclick="detailOpen(this)" tabindex="1"
                                     style="padding: 10px 20px !important">
                                    <h3 class="ar-title">4. 물품등의 제조를 위탁한다는 것의 의미는?</h3>
                                    <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                                    <div class="detail-info ">
                                        <ul>
                                            <li class="mb40">
                                                물품등의 제조를 다른 중소기업에게 위탁한다고 함은 물품등의 규격, 성능 등 상세 사양을 정하여 제조를 위탁하는 것으로, 직접적인
                                                계약행위가 없다 하더라도 위탁의 내용을 실질적으로 지배 혹은 관리하여 위탁거래관계가 있을 경우 위탁으로 봅니다.
                                                <strong>다만, 단순 구매 및 판매위탁은 위탁에서 제외합니다.</strong>
                                            </li>
                                            <li class="info-box mt10" style="display: block">
                                                <p><strong>(1) 제조, 공사, 가공, 수리, 용역 또는 기술개발의 의미</strong></p><br>

                                                ① "제조"란 원재료에 물리적, 화학적 작용을 가하여 투입된 원재료를 성질이 다른 새로운 제품으로 전환시키는 것을
                                                말합니다.<br>

                                                ② "공사"란 토목공사, 건축공사, 산업설비공사, 조경공사, 환경시설공사, 전기공사, 정보통신공사, 소방시설공사, 문화재수리공사,
                                                그 밖에 명칭에 관계없이 시설물을 설치ㆍ유지ㆍ보수하는 공사(시설물을 설치하기 위한 부지조성공사를 포함) 및 기계설비나 그 밖의
                                                구조물의 설치 및 해체하는 공사 등을 말합니다.<br>

                                                ③ "가공"이란 재료를 쓰거나 또는 물건에 변경을 가하여 새로운 물건을 만드는 것을 말합니다.<br>

                                                ④ "수리"란 컴퓨터 및 주변장치, 통신장비, 가전제품, 가정용품, 가구 및 가정용 비품, 의류 및 의류 액세서리, 경기용품,
                                                악기 및 취미용품, 기타 개인용품을 전문적으로 유지ㆍ보수하는 것을 말합니다.<br>

                                                ⑤ "용역"이란 재화 외에 재산 가치가 있는 모든 역무(役務)와 그 밖의 행위를 말합니다.<br>

                                                ⑥ "기술개발"이란 용역 중 기술자료의 산출과 관련된 개발행위를 말합니다.<br><br>

                                                <p><strong> (2) 물품등의 제조 위탁에 해당하는 것의 예시</strong></p><br>
                                                ① 유통업체가 자사상표를 부착한 상품의 제조를 다른 중소기업에 위탁하는 경우(PB상품의 제조위탁)<br>

                                                ② 의류업체가 자사상표를 부착한 의류의 제조를 다른 중소기업에 위탁하는 경우<br>

                                                ③ 자동차 정비사업자가 고객의 차량을 수리 후 고객과 약정한 보험사로부터 직접 수리비를 지급받는 경우, 보험사가 차량 수리의
                                                범위를 정하거나 이에 영향을 주는 등 사실상 정비사업자에게 수리를 위탁하였다고 볼 수 있는 경우<br>

                                                ④ 제조업자가 사무실에서 사용할 냉방장비를 중소기업으로부터 구매하면서 이에 따른 설치도 같이 위탁하는 경우<br>

                                                ⑤ 제조업자가 소프트웨어 개발 위탁을 위해 중소기업을 우선협상대상자로 선정하여 교섭단계에서 계약이 확실하게 체결되리라는 정당한
                                                기대 내지 신뢰를 부여하고, 정식 계약 체결 전에 상당한 금액이 투입되는 기초작업의 이행을 요구하여 중소기업이 이행에 착수하였을
                                                경우<br>

                                                ⑥ 레저사업자가 부동산 임대업자로부터 부동산을 임차하면서, 해당 부동산을 골프장 등 특수목적으로 개발 및 조성하여 줄 것을
                                                위탁하는 경우<br>

                                                ⑦ 대형마트가 삼겹살을 판매하기 위해 중소기업에게 고기를 특정 부위별로 절단, 분할 혹은 포장해줄 것을 위탁하는 경우<br>

                                                ⑧ 외식업자가 음식광고, 소비자와의 계약 체결 알선, 음식배송 등을 위탁하는 경우<br><br>

                                                <p><strong>(3) 물품등의 제조 위탁에 해당하지 않는 것의 예시</strong></p><br>

                                                ① 건설회사가 중소기업에게 인력의 파견을 요청하여 직접 급여를 지급하고 건설회사의 지휘ㆍ명령 하에 파견인력을 근로하도록 하는 경우<br>

                                                ② 식품회사가 대리점 계약을 통해 상품의 재판매 또는 위탁판매를 하는 경우<br>
                                            </li>
                                            <br>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <li class="m-text mt40">
                                위탁기업은 법 시행일(2023년 10월 4일) 이후 최초로 물품등의 제조 위탁에 관한 약정을 체결·갱신하는 경우부터 납품대금 연동에 관한 사항을 적은 약정서를
                                수탁기업에 발급하여야 합니다.
                                <p class="font14 mt10 mb30 point9-text tip">
                                    ※ 다만, ①위탁기업이 중기업인 경우, ｢상생협력법 시행령｣에서 정하는 ②소액거래 또는 ③단기거래인 경우, ④위탁기업과 수탁기업이 연동제 적용을 하지
                                    않기로 합의한 경우에는 발급하지 않을 수 있습니다.
                                </p>
                            </li>
                            <li class="m-text mt40">
                                <strong>위탁기업과 수탁기업은 법 시행일(2023년 10월 4일) 이전에 납품대금 연동제가 적용되는 거래가 무엇인지를 파악하고, 해당 거래에 대하여는 납품대금 연동
                                    약정을 체결할 준비를 해야 합니다.</strong>
                            </li>
                        </div>
                        <h2 class="title mt40"> ② 주요 원재료 알아보기</h2>
                        <div class="box-container">
                            <li class="mb20 m-text">
                                납품대금 연동은 주요 원재료의 가격이 일정 기준 이상 변동하는 경우 그 변동분에 연동하여 납품대금을 조정하는 것을 말합니다.
                            </li>
                            <li class="mb20 m-text">
                                주요 원재료란 물품등의 제조에 사용되는 원재료로서 그 비용이 납품대금의 10% 이상인 원재료를 말합니다.
                            </li>
                            <li class="mb20 m-text">
                                물품등의 제조에 사용되는 주요 원재료가 없는 경우에는 납품대금 연동제를 적용하지 않을 수 있습니다.
                            </li>
                            <li class="mb20 m-text">
                                원재료는 원재료와 재료를 포괄하는 개념으로, 천연재료, 화합물, 가공물, 중간재 등을 포함하되 이에 한정하지는 않습니다.
                            </li>
                            <div class="accordion-container">
                                <div class="item-wrap mt20" onclick="detailOpen(this)" tabindex="1">
                                    <h3 class="ar-title">주요 원재료의 예시는?</h3>
                                    <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                                    <div class="detail-info">
                                        <div>
                                            <p class="mt20">
                                                ① 천연재료 또는 화합물
                                            </p>
                                            <p class="info-box mt10">
                                                천연재료 : 금, 철, 구리, 알루미늄, 고무, 연, 아연, 주석, 니켈, 석탄, 원유, 원목 등<br/>
                                                화합물 : 폴리에틸렌, 폴리프로필렌, 폴리염화비닐(PVC) 등
                                            </p>
                                            <p class="mt30">
                                                ② 천연재료 또는 화합물을 산업용으로 가공한 물건
                                            </p>
                                            <p class="info-box mt10">
                                                금속강, 금속판, 골재, 목재, 시멘트, 레미콘, 콘크리트, 선철, 아스팔트, 화학섬유, 합성수지 등
                                            </p>
                                            <p class="mt30">
                                                ③ 수탁기업이 위탁받은 제조를 수행하는 과정에서 사용하기 위하여 구매하는 중간재
                                            </p>
                                            <p class="info-box mt10">
                                                자동차 부품, 전기전자부품, 기계부품, 석유화학제품, 철강재, 나사, 강철, 고무 타이어, 전기 센서 및 램프,
                                                시스템반도체, 전동기, 발전기, 변압기, 모듈, 반제품 등
                                            </p>
                                            <p class="mt30">④ 그 밖에 수탁기업이 위탁받은 물품 등의 제조를 위해 필요한 것으로서 양 당사자가 협의하여 정하는
                                                원재료</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h2 class="title mt40"> ③ 원재료 가격 기준지표 알아보기</h2>
                        <div class="box-container">
                            <li class="mb20 m-text">
                                납품대금 연동제를 적용할 거래와 주요 원재료를 파악하였다면, 각 원재료의 가격 기준지표를 설정해야 합니다.
                            </li>
                            <li class="mb20 m-text">
                                원재료 가격 기준지표란 주요 원재료 가격의 상승 또는 하락의 정도를 측정하기 위한 기준이 되는 지표를 말합니다.
                            </li>
                            <li class="mb20 m-text">
                                기준지표는 위탁기업이 수탁기업에 물품등의 제조를 위탁할 때양 당사자가 협의하여 정합니다.
                            </li>
                            <li class="mb20 m-text">
                                기준지표는 공신력 있는 기관이 주기적으로 고시하는 지표 또는 이에 준하는 지표로 정함을 원칙으로 합니다.
                                <p class="font14 mt10 mb30 point9-text tip">
                                    (예시) 런던금속거래소(LME, London Metal Exchange), 한국은행(<a href="http://www.bok.or.kr">www.bok.or.kr</a>),
                                    e-나라지표(<a href="http://www.index.go.kr">www.index.go.kr)</a>, 조달청(<a href="http://www.pps.go.kr">www.pps.go.kr</a>), 산업통상자원부(<a href="http://www.motie.go.kr/">www.motle.go.kr</a>), 기획재정부장관에게 등록한
                                    전문가격조사기관 등에서 고시하는 지표
                                </p>
                            </li>
                            <li class="mb20 m-text">
                                다만, 이와 같은 지표를 사용하는 것이 적절하지 않은 경우에는다음과 같이 정할 수 있습니다.<br><br>
                                <p style="padding-left: 30px;font-size: 17px;">
                                    1. 위탁기업이 원재료의 판매처와 직접 협상한 가격<br>
                                    2. 위탁기업이 수탁기업에 판매한 가격<br>
                                    3. 원재료의 판매처가 수탁기업에게 판매한 가격으로서 위탁기업이 확인할 수 있는 가격<br>
                                    4. 그 밖에 약정서의 양 당사자 간 협의한 자료(약정서, 원가내역서, 견적서 등)를 바탕으로 협의하여 정한 가격<br>
                                </p>
                            </li>
                            <li class="mb20 m-text">
                                <strong>위탁기업과 수탁기업은 원활한 납품대금 연동제의 도입을 위해 법 시행일(2023년 10월 4일) 이전에 주요 원재료에 대한 기준지표로 무엇을
                                    설정할지를 미리 협의하여 정해야 합니다.</strong>
                            </li>
                        </div>
                    </section>
                </div>
                </section>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

<script>
    function detailOpen(d) {
        if (!$(d).hasClass("open")) {
            $(d).find(".detail-info").slideDown();
            $(d).addClass("open");
        } else {
            $(d).find(".detail-info").slideUp();
            $(d).removeClass("open");
        }
    }
</script>

