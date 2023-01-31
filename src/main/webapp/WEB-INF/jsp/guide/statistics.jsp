<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<head>
    <title>중소벤처기업부 | 주요통계</title>
    <script src="${pageContext.request.contextPath }/js/chart/anychart-core.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/chart/anychart-treemap.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/chart/anychart-cartesian.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/chart/anychart-pie.min.js"></script>

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
                    주요 통계
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">주요 통계</h1>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <h4 class="mb40">위탁기업 44개사, 수탁기업 317개사가 <span class="text-red">334건의 연동약정 체결</span>로 납품대금 연동제가 사실상 가동 중인 것으로 확인</h4>
                <section>
                    <h2 class="title">주요 원재료 개수</h2>
                    <div class="flex-wrap">
                        <div class="flex-item">
                            <h4>
                                한 건의 약정서에 연동 대상이 되는 <strong>주요 원재료를 1개</strong>로 정한 경우는 <strong>181건(54.2%)</strong>이였으며, <strong>2개는 82건(24.6%), 3개 이상은 71건(21.3%)</strong>이였다.<br>
                                <br>
                                결과적으로 <strong>334건의 약정서</strong>에서 연동의 대상이 되는 원재료는 <strong>총 669개</strong>로 나타났다.
                            </h4>
                        </div>
                        <div class="flex-item">
                            <div id="table1" class="s-table-wrap ">
                                <table class="s-table">
                                    <tr>
                                        <td class="thead" colspan="4">주요 원재료의 개수 (단위: 건)</td>
                                    </tr>
                                    <tr>
                                        <td class="tbody">
                                            1개
                                        </td>
                                        <td class="tbody">
                                            2개
                                        </td>
                                        <td class="tbody">
                                            3개
                                        </td>
                                        <td class="tbody">
                                            합계
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="val">
                                            181 (54.2%)
                                        </td>
                                        <td class="val">
                                            82 (24.6%)
                                        </td>
                                        <td class="val">
                                            71 (21.3%)
                                        </td>
                                        <td class="val">
                                            334 (100%)
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <h2 class="title mt40">주요 원재료 종류</h2>
                    <h4 class="mb40">
                        연동의 대상이 되는 <strong>주요 원재료</strong>는 구체적으로 철스크랩, 압연강재(후판, 박판, 봉강, 선재 등), 도금강재, 강관, 선철 등의 <strong>철강류가 49.9%</strong>로 가장 많았다.<br>
                        <br>
                        다음으로 동, 알루미늄, 아연, 납, 주석, 은, 니켈 등의 <strong>비철금속은 31.1%</strong>를 차지했다. 합성수지(PP, PA, ABS, GPPS 등), 합성고무(NBR, CR, EPDM, FKM 등), 에틸렌, 나프타 등의 <strong>석유화학 원재료가 10.9%</strong>로 뒤를 이었다.<br>
                        <br>
                        그 밖에도 <strong>목재, 농산물, 헬륨, 종이</strong> 등 <strong>다양한 원재료</strong>를 대상으로 약정이 체결됐다.
                    </h4>
                    <div id="treemap" style="height:300px; width: 970px"></div>

                    <div class="s-table-wrap">
                        <table class="s-table" id="table2">
                            <tr>
                                <td class="thead" colspan="5">주요 원재료의 종류 (단위: 개)</td>
                            </tr>
                            <tr>
                                <td class="tbody">
                                    철강
                                </td>
                                <td class="tbody">
                                    비철금소
                                </td>
                                <td class="tbody">
                                    석유화학
                                </td>
                                <td class="tbody">
                                    기타
                                </td>
                                <td class="tbody">
                                    합계
                                </td>
                            </tr>
                            <tr>
                                <td class="val">
                                    334 (49.9%)
                                </td>
                                <td class="val">
                                    208 (31.1%)
                                </td>
                                <td class="val">
                                    73 (10.9%)
                                </td>
                                <td class="val">
                                    54 (8.1%)
                                </td>
                                <td class="val">
                                    669 (100%)
                                </td>
                            </tr>
                        </table>
                    </div>

                </section>
                <section>
                    <h2 class="title mt40">원재료 가격 기준지표</h2>
                    <h4 class="mb40">
                        원재료의 가격 변동 정도를 확인할 수 있는 <strong>원재료 가격 기준지표</strong>로 <strong>원자재 거래소</strong>(런던금속거래소 등), <strong>중소기업협동조합</strong>(한국주물공업협동조합, 한국전선공업협동조합 등), <strong>전문가격조사기관</strong>(한국물가정보, 한국물가협회 등), <strong>전문지</strong>(철강금속신문, 스틸데일리 등) 등 <strong>공신력 있는 기관이 고시하는 지표</strong>를 활용하는 경우가 <strong>65.6%</strong>로 가장 많았다.<br>
                        <br>
                        <strong>특정 원재료 판매처의 공시 가격</strong>을 활용하는 사례도 <strong>14.6%</strong>를 차지했다.<br>
                        연동제를 <strong>오랜 기간 운영해온 기업</strong> 중에는 여러 원재료 판매처 가격의 평균값을 지표로 활용하는 경우도 있었다.
                    </h4>
                    <div id="barChart"  style="height:250px"></div>
                    <div class="s-table-wrap">
                        <table class="s-table" id="table3">
                            <tr>
                                <td class="thead" colspan="5">원재료 가격의 기준지표 (단위: 개)</td>
                            </tr>
                            <tr>
                                <td class="tbody">
                                    공신력 있는 기관이
                                    고시하는 지표
                                </td>
                                <td class="tbody">
                                    특정 원재료
                                    판매처의 공시 가격
                                </td>
                                <td class="tbody">
                                    원재료 판매처가
                                    수탁기업에 판매한 가격
                                </td>
                                <td class="tbody">
                                    위탁기업이 수탁기업에
                                    판매한 가격(유상사급)
                                </td>
                                <td class="tbody">
                                    합계
                                </td>
                            </tr>
                            <tr>
                                <td class="val">
                                    439 (65.6%)
                                </td>
                                <td class="val">
                                    98 (14.6%)
                                </td>
                                <td class="val">
                                    95 (14.2%)
                                </td>
                                <td class="val">
                                    37 (5.5%)
                                </td>
                                <td class="val">
                                    669 (100%)
                                </td>
                            </tr>
                        </table>
                    </div>
                </section>
                <section>
                    <h2 class="title mt40">조정 요건</h2>
                    <h4 class="mb40">
                        원재료 가격 변동률에 따른 <strong>조정 요건</strong>은 <strong>‘0%’</strong>가 <strong>48.6%</strong>로 <strong>원재료 가격이 1원만 변경돼도 납품대금을 조정하는 사례가 절반</strong> 정도인 것으로 나타났으며, <strong>±3% 이하 조정 요건</strong>까지 포함하면 <strong>64.1%</strong>까지 늘어난다.<br>
                        <br>
                        <strong>±10%를 초과한 조정 요건</strong>을 설정한 사례는 <strong>0.4%</strong>에 불과했다.<br>
                        <br>
                        또한, 99.7%의 사례에서는 원재료 가격의 <strong>상승, 하락 모두를 연동</strong>되도록 정하고 있었다.
                    </h4>
                    <div id="pieChart"  style="height:400px"></div>
                    <div class="s-table-wrap">
                        <table class="s-table" id="table4">
                            <tr>
                                <td class="thead" colspan="7">
                                    조정 요건 (단위: 개)
                                </td>
                            </tr>
                            <tr>
                                <td class="tbody">
                                    0%
                                </td>
                                <td class="tbody">
                                    ±0% 초과 ±3% 이하
                                </td>
                                <td class="tbody">
                                    ±5%
                                </td>
                                <td class="tbody">
                                    ±10%
                                </td>
                                <td class="tbody">
                                    ±10% 초과
                                </td>
                                <td class="tbody">
                                    ±3%
                                </td>
                                <td class="tbody">
                                    합계
                                </td>
                            </tr>
                            <tr>
                                <td class="val">
                                    325<br>
                                    (48.6%)
                                </td>
                                <td class="val">
                                    104<br>
                                    (15.5%)
                                </td>
                                <td class="val">
                                    193<br>
                                    (28.8%)
                                </td>
                                <td class="val">
                                    42<br>
                                    (6.3%)
                                </td>
                                <td class="val">
                                    3<br>
                                    (0.4%)
                                </td>
                                <td class="val">
                                    2<br>
                                    (0.3%)
                                </td>
                                <td class="val">
                                    669<br>
                                    (100%)
                                </td>
                            </tr>
                        </table>
                    </div>
                </section>
                <section>
                    <h2 class="title mt40">조정 주기</h2>
                    <h4 class="mb40">
                        <strong>납품대금을 조정하는 주기</strong>로는 <strong>‘분기 마다’가 39.6</strong>%로 가장 많았으며, <strong>‘1개월’도 29.7%</strong>에 이르렀다.<br>
                        <br>
                        1년으로 길게 잡은 경우도 있었으며, 수시로 정한 경우는 원재료 가격 변동시, 유상사급(위탁기업이 수탁기업에 원재료를 판매) 거래시, 납품시 마다 조정하는 경우이다.
                    </h4>
                    <div id="bar_chart"  style="height:300px"></div>

                    <div class="s-table-wrap">
                        <table class="s-table" id="table5">
                            <tr>
                                <td class="thead" colspan="7">조정 주기 (단위: 개)</td>
                            </tr>
                            <tr>
                                <td class="tbody">
                                    수시
                                </td>
                                <td class="tbody">
                                    1개월
                                </td>
                                <td class="tbody">
                                    2개월
                                </td>
                                <td class="tbody">
                                    분기
                                </td>
                                <td class="tbody">
                                    반기
                                </td>
                                <td class="tbody">
                                    1년
                                </td>
                                <td class="tbody">
                                    합계
                                </td>
                            </tr>
                            <tr>
                                <td class="val">
                                    28 (4.2%)
                                </td>
                                <td class="val">
                                    28 (4.2%)
                                </td>
                                <td class="val">
                                    9 (1.3%)
                                </td>
                                <td class="val">
                                    265 (39.6%)
                                </td>
                                <td class="val">
                                    161 (24.1%)
                                </td>
                                <td class="val">
                                    7 (1.0%)
                                </td>
                                <td class="val">
                                    669 (100%)
                                </td>
                            </tr>
                        </table>
                    </div>
                    자료: 중소벤처기업부 ｢납품대금 연동제 시범운영｣, '22.11.4'
                </section>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

<script>
    anychart.onDocumentReady(function () {

        // create data
        var data = [
            {name:   "1.주요 원재료의 종류", children: [
                    {name: "철강",        value: 49.9, capital: "예시: ①철스크랩, ②압연강재(후판, 박판, 봉강, 선재 등), ③도금강재, ④강관, ⑤선철 등" },
                    {name: "비철금속",         value: 31.1, capital: "예시: ①동, ②알루미늄, ③아연, ④납, ⑤주석, ⑥은, ⑦니켈 등"    },
                    {name: "석유화학",        value: 10.9, capital: "예시: ①합성수지(PP, PA, ABS, GPPS 등), ②합성고무(NBR, CR, EPDM, FKM 등), ③에틸렌, ④나프타 등"   },
                    {name: "기타",         value: 8.1, capital: "예시: ①목재, ②농산물, ③헬륨, ④종이 등"   }
                ]}
        ];

        // create a chart and set the data
        var chart = anychart.treeMap(data, "as-tree");

        // enable HTML for labels
        chart.labels().useHtml(true);

        // configure labels
        chart.labels().format(
            "<span style='font-weight:bold'>{%name}</span><br>{%value}%"
        );

        // configure tooltips
        chart.tooltip().format(
            "{%capital}"
        );

        // set the container id
        chart.container("treemap");
        chart.draw();
    });
    anychart.onDocumentReady(function () {

        // create data
        var data = anychart.data.set([
            {name: "공신력 있는 기관이 고시하는 지표",        value: 439, capital: "예시: ①원재료 가격 기준지표로 원자재 거래소, ②중소기업협동조합, ③전문가격조사기관, ④전문지 등 공신력 있는 기관이 고시하는 지표" },
            {name: "특정 원재료 판매처의 공시 가격",         value: 98, capital: "예시: ①A사가 공시하는 자사 제품의 판매 가격, ②A사가 공시하는 자사 제품의 판매 가격과 B사가 공시하는 자사 제품의 판매 가격의 평균 등 "    },
            {name: "원재료 판매처가 수탁기업에 판매한 가격",        value: 95, capital: "예시: 수탁기업과 철강 원재료 판매기업 간 원재료 거래 계약서에 명시된 가격 등"   },
            {name: "위탁기업이 수탁기업에 판매한 가격(유상사급)",         value: 37, capital: "예시: 유상사급 등 "   }

        ]);

        // create a chart
        var chart = anychart.bar();

        // set data
        chart.data(data);

        // configure tooltips
        chart.tooltip().format("{%capital}");

        // set the container id
        chart.container("barChart");
        chart.draw();
    });
    anychart.onDocumentReady(function () {

        // create data
        var data = [
            {x: "0%", value: 325},
            {x: "±0% 초과 ±3% 이하", value: 104},
            {x: "±5%", value: 193},
            {x: "±10%", value: 42},
            {x: "±10% 초과", value: 3},
            {x: "±3%", value: 2}
        ];

        // create a chart and set the data
        var chart = anychart.pie(data);

        // set the container id
        chart.container("pieChart");
        chart.draw();
    });
    anychart.onDocumentReady(function () {

        // create a data set
        var data = anychart.data.set([
            ["수시", 28],
            ["1개월", 28],
            ["2개월", 9],
            ["분기", 265],
            ["반기", 161],
            ["1년", 7]
        ]);

        // map the data
        var seriesData_1 = data.mapAs({x: 0, value: 1});
        var seriesData_2 = data.mapAs({x: 0, value: 2});

        // create a chart
        var chart = anychart.column();

        // enable the value stacking mode
        chart.yScale().stackMode("value");

        // create area series, set the data
        var series1 = chart.column(seriesData_1);
        var series2 = chart.column(seriesData_2);

        // configure tooltips
        chart.tooltip().format("{%value}개");
        // set the container id
        chart.container("bar_chart");
        chart.draw();
    });
</script>
