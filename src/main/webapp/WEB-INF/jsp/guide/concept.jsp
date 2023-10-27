<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<head>
    <title>중소벤처기업부 | 개념</title>
</head>
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
                    개념
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">개념</h1>
            </div>
            <div id="about" class="content concept">
                <section class="font16 point4-text">
                    <h2 class="title">납품대금 연동제란?</h2>
                    <div class="box-container">
                        <p class="mb20 m-text">
                            <b class="text-red">납품대금 연동제</b>란 수탁기업이 위탁기업에 납품하는 물품등의 주요 원재료*
                            가격이 일정 수준** 이상 변동하는 경우 그 변동분에 연동하여 납품대금을 조정하는 내용이 포함된 서면 약정을 체결하는 제도입니다.
                        </p>
                        <p class="font14 point9-text tip">
                            * 물품등의 제조를 위해 필요한 재료로서 원료와 재료를 포괄하고, 천연재료, 화합물, 가공물, 중간재 등을 포함하되 이에 한정하지 않음<br>
                            ** 위탁기업과 수탁기업이 100분의 10 이내의 범위에서 협의하여 정함
                        <p class="mt20 mb20 m-text">계약체결 당시 예견할 수 없는 원재료 가격 변동에 대해 납품대금을 조정함으로써 공급망 안정화에 기여할 수 있습니다.</p>
                        </p>
                        <div class="peristalsis-process" style="gap:3%;max-width: 850px;margin-bottom: 20px;">
                            <div style="width: 25%;margin-top: 20px">
                                <table class="company-table font14 point4-text">
                                    <tr class="fw500 font16 point7-text ">
                                        <td class="t-head">계약서 작성</td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2">
                                            가격 기준지표, 조정요건 등 기재
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div>
                                <img src="<c:url value='/images/common/next2.png'/>" style="width:23px;margin: 66px 0;">
                            </div>
                            <div style="width: 82%;">
                                <table class="company-table font14 point4-text" style="table-layout: auto">
                                    <tr class="fw500 font16 point7-text ">
                                        <td class="t-head" colspan="7">납품대금 지급</td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2">
                                            가격 기준지표 변동 확인
                                            (조정요건 충족 여부 확인)
                                        </td>
                                        <td style="text-align: center; width:30px">
                                           :
                                        </td>
                                        <td>
                                            [조정요건 충족]
                                        </td>
                                        <td style="width:30px">
                                            <img src="<c:url value='/images/common/next2.png'/>" style="width:23px;">
                                        </td>
                                        <td>
                                            연동 산식 적용
                                        </td>
                                        <td style="width:30px">
                                            <img src="<c:url value='/images/common/next2.png'/>" style="width:23px;">
                                        </td>
                                        <td>
                                            조정된
                                            납품대금 지급
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:30px">
                                            :
                                        </td>
                                        <td>
                                            [조정요건 미충족]
                                        </td>
                                        <td colspan="3" style="width:30px">
                                            <img src="<c:url value='/images/common/next2.png'/>" style="width:23px;">
                                        </td>
                                        <td>
                                            당초 납품대금 지급
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="accordion-container">
                            <div class="item-wrap" onclick="detailOpen(this)" tabindex="1" >
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
                            <div class="item-wrap" onclick="detailOpen(this)" tabindex="1">
                                <h3 class="ar-title">2. 위탁기업이란?</h3>
                                <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                                <div class="detail-info">
                                    <ul class="point4-text">
                                        <li>
                                            위탁기업이란 제조, 공사, 가공, 수리, 판매, 용역을 업(業)으로 하는 기업으로서 물품등의 제조를 다른 수탁기업에 위탁하는 기업을
                                            말합니다.
                                            <p class="font14 mt10 mb30 point9-text tip">
                                                ※ 관련법령: ｢대·중소기업 상생협력 촉진에 관한 법률｣ 제2조 제5호
                                            </p>
                                        </li>
                                        <li class="mb40">
                                            “업(業)으로 한다는 것”의 의미는 영리 또는 비영리 여부를 불문하고 경제 행위를 계속하여 반복적으로 행하는 것을 의미하며 이는 어떤
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
                                                <img class="company1" src="<c:url value="/images/common/company1.png"/>" alt="위탁기업" />
                                                <div class="tc">
                                                    <p class="fw700 font16 point7-text company-box-text1">위탁기업</p>
                                                    <p class="font12 company-box-text1 point9-text">(대∙중견기업, 중소기업, 공기업 등)</p>
                                                </div>
                                            </div>
                                            <div class="ml35 mr35 tc point4-text font14">
                                                <p>
                                                    물품, 부품, 반제품 및<br />
                                                    원료 등의 제조, 공사, 가공, 수리, 용역<br />
                                                    또는 기술개발을 위탁
                                                </p>
                                                <p class="mt25">
                                                    중소기업이 전문적으로<br />
                                                    물품 등을 제조, 납품하는 행위
                                                </p>
                                            </div>
                                            <div>
                                                <img class="company2" src="<c:url value="/images/common/company2.png"/>" alt="수탁기업" />
                                                <div class="tc">
                                                    <p class="fw700 font16 point7-text company-box-text2">수탁기업</p>
                                                    <p class="font12 company-box-text2 point9-text">(중소기업)</p>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 모바일용 -->
                                        <div class="company-box company-box-modile mt40">
                                            <img class="company1" src="<c:url value="/images/common/company1-m.png"/>" alt="위탁기업" />
                                            <div class="tc">
                                                <p class="fw700 font16 point7-text">위탁기업</p>
                                                <p class="font12">(대∙중견기업, 중소기업, 공기업 등)</p>
                                            </div>
                                            <img class="arrow mt20" src="<c:url value="/images/common/arrow.png"/>" alt="화살표" />
                                            <br />
                                            <div class="company-text tc mt20 mb20">
                                                <span class="tc mr25">
                                                    물품, 부품, 반제품 및<br />
                                                    원료 등의 제조, 공사,<br /> 가공, 수리, 용역
                                                    또는<br /> 기술개발을 위탁
                                                </span>
                                                <span class="tc">
                                                    중소기업이<br /> 전문적으로
                                                    물품 등을<br /> 제조, 납품하는 행위
                                                </span>
                                            </div>
                                            <br />
                                            <img class="arrow mb20" src="<c:url value="/images/common/arrow.png"/>" alt="화살표" />
                                            <div class="mt20">
                                                <img class="company2" src="<c:url value="/images/common/company2-m.png"/>" alt="수탁기업" />
                                                <div class="tc">
                                                    <p class="fw700 font16 point7-text">수탁기업</p>
                                                    <p class="font12">(중소기업)</p>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="mt20 point8-text tc font14 fw500">
                                            ‘업으로 하는 자'의 판단 기준: 사업자등록 여부, 해당 업에 대한 매출발생 여부, 사업상 독립적으로 재화 또는<br
                                                class="br-modile" />
                                            용역을 공급하고 있는지 등을 종합적으로 고려하여 판단
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="item-wrap mb10" onclick="detailOpen(this)" tabindex="1">
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
                                            「독점규제 및 공정거래에 관한 법률」제31조제1항에 따른 상호출자제한기업집단에 속하는 기업과 수탁·위탁거래 관계에 있는 대통령령으로
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
                            <div class="item-wrap mb10" onclick="detailOpen(this)" tabindex="1">
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
                                    </ul>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-container">
                        <p class="mt60 m-text">약정서에 적어야 할 납품대금 연동에 관한 사항은 “약정서 작성하기” 페이지에서 확인할 수 있습니다.</p>
                        <p class="mt30 m-text">
                            다만, 물품등의 제조에 사용되는 <b class="text-red">주요 원재료</b>가 없거나, <b class="text-red">｢상생협력법｣에서 정하는 예외 사유</b>에 해당하는 경우에는 납품대금 연동에 관한
                            사항을 약정서에 적지 않을 수 있습니다.
                        <p class="font14 mt10 mb30 point9-text tip">
                            ※ 관련법령: 개정 ｢대·중소기업 상생협력 촉진에 관한 법률｣ [2023.1.3. 일부개정] 제2조 제13호
                        </p>
                        </p>
                        <div class="accordion-container">
                            <div class="item-wrap mt20" onclick="detailOpen(this)" tabindex="1">
                                <h3 class="ar-title">1. 주요 원재료란?</h3>
                                <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                                <div class="detail-info">
                                    <ul>
                                        <li>
                                            수탁·위탁거래에서 물품등의 제조에 사용되는 원재료로서 그 비용이 납품대금의 10% 이상인 원재료를 말합니다.
                                            <p class="font14 mt10 mb30 point9-text">
                                                ※ 관련법령: 개정 ｢대·중소기업 상생협력 촉진에 관한 법률｣ [2023.1.3. 일부개정] 제2조 제12호
                                            </p>
                                        </li>
                                        <li>
                                            원재료는 원료와 재료를 포괄하는 개념으로, 천연재료, 화합물, 가공물, 중간재 등을 포함하되 이에 한정하지 않습니다. 원재료의 예시는
                                            다음과 같습니다.
                                            <div>
                                                <p class="mt20">
                                                    ① 천연재료 또는 화합물
                                                </p>
                                                <p class="info-box mt10">
                                                    천연재료 : 금, 철, 구리, 알루미늄, 고무, 연, 아연, 주석, 니켈, 석탄, 원유, 원목 등<br />
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
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="item-wrap mt20 mb10" onclick="detailOpen(this)" tabindex="1">
                                <h3 class="text-mobile ar-title">2. ｢상생협력법｣에서 정하는 예외 사유란?</h3>
                                <img class="icon" src="<c:url value="/images/common/arrow-top.png"/>" alt="법률 상세보기">
                                <div class="detail-info">
                                    <ul class="list-none">
                                        <li>
                                            개정 상생협력법[2023.1.3. 일부개정] 에서는 납품대금 연동제를 적용하지 않을 수 있는 다음 네 가지의 예외 사유를 정하고
                                            있습니다.
                                            <p class="font14 mt10 mb30 point9-text tip">
                                                ※관련법령: 개정 ｢대·중소기업 상생협력 촉진에 관한 법률｣ [2023.1.3. 일부개정] 제2조 제3항
                                            </p>
                                        </li>
                                        <ul>
                                            <li class="mt20 mb30">
                                                ① 위탁기업이 「중소기업기본법」제2조제2항에 따른 소기업에 해당하는 경우
                                            </li>
                                            <li class="mt20">
                                                ② 수탁·위탁거래의기간이 90일 이내의 범위에서 대통령령으로 정하는 기간 이내인 경우
                                                <p class="font14 mt10 mb30 point9-text tip">
                                                    * 대통령령으로 정하는 기간은 ｢상생협력법 시행령｣ 개정(‘23.10월)을 통해 정해질 예정입니다
                                                </p>
                                            </li>
                                            <li class="mt20">
                                                ③ 납품대금이 1억원 이하의 범위에서 대통령령으로 정하는 금액 이하인 경우
                                                <p class="font14 mt10 mb30 point9-text tip">
                                                    * 대통령령으로 정하는 금액은 ｢상생협력법 시행령｣ 개정(‘23.10월)을 통해 정해질 예정입니다.
                                                </p>
                                            </li>
                                            <li class="mt20">
                                                ④ 위탁기업과 수탁기업이 납품대금 연동을 하지 아니하기로 합의한 경우
                                                <p class="font14 mt10 point9-text tip">
                                                    * 이 경우 위탁기업과 수탁기업은 납품대금 연동을 하지 아니하기로 합의한 취지와 사유를 약정서에 분명하게 적어야 합니다.
                                                </p>
                                            </li>
                                        </ul>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h2 class="title title-amend mt40"><strong>참고</strong> 2023년 상생협력법 개정에 따라 달라지게 되는 사항은?</h2>
                    <div class="text-box">
                        <h3 class="text-red mb2">첫째. 모든 수위탁거래에 연동 약정서 발급 의무 부과</h3>
                        <h4>
                            위탁기업이 수탁기업에 물품등의 제조·공사·가공·수리·용역을 위탁할 때 주요 원재료, 조정요건 등 납품대금 연동에 관한 사항을 약정서에 기재하고 수탁기업에
                            발급해야
                            합니다.
                        </h4>
                        <br />
                        <h4>
                            또한, 위탁기업에는 납품대금 연동에 관한 사항을 적기 위해 수탁기업과 성실히 협의할 의무가 부과됩니다.
                        </h4>
                        <br />
                        <h4>다만, △소액 계약, △단기 계약, △위탁기업이 소기업인 경우, △위탁기업과 수탁기업이 연동하지 않기로 합의한 경우*에는 위탁기업이 납품대금 연동에 관한
                            사항을
                            약정서에 적지 아니할 수 있습니다.<br />
                            * 위탁기업과 수탁기업이 연동하지 않기로 합의한 경우에는 그 취지와 사유를 약정서에 명시적으로 기재해야 합니다.
                        </h4>
                        <br>
                        <br>
                        <h3 class="text-red mb2">둘째. 위탁기업의 탈법행위 금지</h3>
                        <h4>
                            위탁기업이 <strong>거래상 지위를 남용하</strong>거나 <strong>거짓 또는 그 밖의 부정한 방법</strong>으로 <strong>납품대금
                            연동에 관한 의무를 피하려는 행위가 금지</strong>되며, <strong>이를 위반한 위탁기업에는 5천만원이하의
                            과태료가 부과되며, 개선요구, 시정권고 또는 시정명령이 내려질 수 있습니다.</strong>
                        </h4>
                        <br>
                        <br>
                        <h3 class="text-red mb2">셋째. 위탁의 임의 취소·변경행위 금지</h3>
                        <h4>
                            <strong>위탁기업이 연동에 관한 사항을 이행하지 않기 위해</strong> 수탁기업의 책임질 사유 없이 <strong>위탁을 임의로 취소·변경하는 행위가
                            금지</strong>되며, <strong>이를 위반한 위탁기업에는 개선요구,
                            시정권고 또는 시정명령이 내려질 수 있습니다.</strong>
                        </h4>
                        <br>
                        <br>
                        <h3 class="text-red mb2">넷째, 연동제 확산 지원의 근거 마련</h3>
                        <h4>
                            중소벤처기업부장관은 납품대금 연동의 확산을 위해 <strong>납품대금 연동 우수기업을 선정하고 포상</strong>할 수 있으며, 원재료 가격정보 지원,
                            교육·컨설팅 등을 수행하는 <strong>연동지원본부를
                            지정</strong>할 수 있게 되었습니다.
                        </h4>
                        <br>
                        <br>
                        <h3 class="text-red mb2">다섯째. 중소벤처기업부의 분쟁조정</h3>
                        <h4>
                            중소벤처기업부장관의 <strong>분쟁조정 대상에 납품대금 연동에 관한 사항이 명시</strong>되었으며, 중소벤처기업부의 각 지방청에 분쟁조정 등의
                            <strong>권한을 위임할 근거</strong>도 마련되었습니다.<br />
                            ⇒ 중소벤처기업부장관은 시정의 필요성이 인정될 경우 시정권고 또는 시정명령을 할 수 있으며, 시정명령에 따르지 않아 공표하였음에도 불구하고 공표 후 1개월이
                            지날 때까지 시정명령을 이행하지 아니한 자는 1년 이하의 징역 또는 5천만원 이하의 벌금에 처해질 수 있습니다.
                        </h4>
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
        }
        else {
            $(d).find(".detail-info").slideUp();
            $(d).removeClass("open");
        }
    }
</script>

