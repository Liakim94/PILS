<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<head>
    <title>중소벤처기업부 | 시범운영 분석 결과</title>
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
                    시범운영 분석 결과
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">시범운영 분석 결과</h1>
            </div>
            <div id="about" class="content">
                <!-- 컨텐츠 start -->
                <section>
                    <h2 class="title">납품대금 연동제 시범운영 개요</h2>
                    <h4 class="mb40">
                        중소벤처기업부는 납품대금 연동제의 효과적인 안착을 위해 위탁기업과 수탁기업이 납품대금 연동 약정을 자율적으로 체결하도록 하는 납품대금 연동제 시범운영을 실시하였습니다.
                        시범운영 중간 집계 결과, 위탁기업 44개사와 수탁기업 317개사가 총 669개의 원재료를 대상으로 334건의 납품대금 연동 약정을 체결하였습니다. (‘22.11.13. 기준)
                    </h4>
                </section>
                <section>
                    <h2 class="title">주요 원재료 종류</h2>
                    <h4 class="mb40">
                        주요 원재료는 수탁·위탁거래에서 물품등의 제조에 사용되는 원재료로서 납품대금 연동의 대상이 되는 원재료입니다.
                        <strong>주요 원재료</strong>는 철스크랩, 압연강재(후판, 박판, 봉강, 선재 등), 도금강재, 강관, 선철 등의 <strong>철강류가 49.9%</strong>로 가장 많았습니다.<br>
                        <br>
                        다음으로 동, 알루미늄, 아연, 납, 주석, 은, 니켈 등의 <strong>비철금속은 31.1%</strong>를 차지했습니다. 합성수지(PP, PA, ABS, GPPS 등), 합성고무(NBR, CR, EPDM, FKM 등), 에틸렌, 나프타 등의 <strong>석유화학 원재료가 10.9%</strong>로 뒤를 이었습니다.<br>
                        <br>
                        그 밖에도 <strong>목재, 농산물, 헬륨, 종이</strong> 등 <strong>다양한 원재료</strong>를 대상으로 약정이 체결됐습니다.
                    </h4>
                    <!--     주요 원재료의 종류    -->
                    <div class="materials-container">
                        <div class="item steel hover-info">
                            <div class="text-wrap">
                                <h3>철강</h3>
                                <h2>49.9%</h2>
                            </div>
                            <div class="info-box">
                                <h4>철강</h4>
                                <hr>
                                <h3>예시: ①철스크랩, ②압연강재(후판, 박판, 봉강, 선재 등), ③도금강재, ④강관, ⑤선철 등</h3>
                            </div>
                        </div>
                        <div class="item non-metal hover-info">
                            <div class="text-wrap">
                                <h3>비철금속</h3>
                                <h2>31.1%</h2>
                            </div>
                            <div class="info-box">
                                <h4>비철금속</h4>
                                <hr>
                                <h3>예시: ①동, ②알루미늄, ③아연, ④납, ⑤주석, ⑥은, ⑦니켈 등</h3>
                            </div>
                        </div>
                        <div class="item others">
                            <div class="item oil hover-info">
                                <div class="text-wrap">
                                    <h3>석유화학</h3>
                                    <h2>10.9%</h2>
                                </div>
                                <div class="info-box">
                                    <h4>석유화학</h4>
                                    <hr>
                                    <h3>예시: ①합성수지(PP, PA, ABS, GPPS 등), ②합성고무(NBR, CR, EPDM, FKM 등), ③에틸렌, ④나프타 등</h3>
                                </div>
                            </div>
                            <div class="item etc hover-info">
                                <div class="text-wrap">
                                    <h3>기타</h3>
                                    <h2>8.1%</h2>
                                </div>
                                <div class="info-box">
                                    <h4>기타</h4>
                                    <hr>
                                    <h3>예시: ①목재, ②농산물, ③헬륨, ④종이 등</h3>
                                </div>
                            </div>
                        </div>
                    </div>

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
                        원재료의 가격 변동 정도를 확인할 수 있는 <strong>원재료 가격 기준지표</strong>로는 <strong>원자재 거래소</strong>(런던금속거래소 등), <strong>중소기업협동조합</strong>(한국주물공업협동조합, 한국전선공업협동조합 등), <strong>전문가격조사기관</strong>(한국물가정보, 한국물가협회 등), <strong>전문지</strong>(철강금속신문, 스틸데일리 등) 등 <strong>공신력 있는 기관이 고시하는 지표</strong>를 활용하는 경우가 <strong>65.6%</strong>로 가장 많았습니다.<br>
                        <br>
                        <strong>특정 원재료 판매처의 공시 가격</strong>을 활용하는 사례도 <strong>14.6%</strong>를 차지했습니다.<br>
                    </h4>
                    <div id="barChart"  style="height:315px"></div>
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
                        조정요건이란 원재료 기준가격의 변동률을 근거로 정한 납품대금 연동의 요건입니다.
                        조정 요건이 0%로 설정된 경우, 원재료의 기준가격이 1원만 변경되어도납품대금을 조정하게 됩니다.
                        원재료 가격 변동률에 따른 <strong>조정 요건</strong>은 <strong>‘0%’</strong>가 <strong>48.6%</strong>로 나타났습니다.<br>
                        <br>
                        또한, 원재료 가격의 상승·하락 모두를 연동하도록 정한 사례는 <strong>99.7%</strong>로 나타났습니다.
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
                        <strong>납품대금을 조정하는 주기</strong>로는 <strong>‘분기 마다’가 39.6</strong>%로 가장 많았으며, <strong>‘1개월’도 29.7%</strong>에 이르렀습니다.<br>
                        <br>
                        조정주기를 1년으로 길게 잡은 경우도 있었으며, 수시로 조정주기를 정한 경우는 ① 원재료 가격 변동 시, ② 유상사급(위탁기업이 수탁기업에 원재료를 판매) 거래 시, ③ 납품 시 마다 조정 등이 있었습니다.                    </h4>
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
                    <br>
                    자료: 중소벤처기업부 ｢납품대금 연동제 시범운영｣, '22.11.13' 기준
                </section>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

<script>
    <!--  주요 원재료의 종류 차트  -->
    $(document).ready(function(){
        $(".hover-info").hover(function (){
                var divX = $(this).offset().left;
                var divY = $(this).offset().top;
                $(this).find('.info-box').fadeIn("500");
                $(document).mousemove(function(e) {
                    mouseX = e.pageX;
                    mouseY = e.pageY;
                    $(this).find('.info-box').css("left", mouseX - divX - 150).css("top", mouseY-divY + 15);
                    console.log("divX = " + divX);
                    console.log("mouseX = " + mouseX);
                });


            },
            function (){
                $(this).find('.info-box').hide();
            });
    });

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

    anychart.onDocumentReady(function () {

        // create a data set
        var data = anychart.data.set([
            {x: "공신력 있는 기관이 고시하는 지표",        value: 439, capital: "예시: ①원재료 가격 기준지표로 원자재 거래소, ②중소기업협동조합, ③전문가격조사기관, ④전문지 등 공신력 있는 기관이 고시하는 지표" },
            {x: "특정 원재료 판매처의 공시 가격",         value: 98, capital: "예시: ①A사가 공시하는 자사 제품의 판매 가격, ②A사가 공시하는 자사 제품의 판매 가격과 B사가 공시하는 자사 제품의 판매 가격의 평균 등 "    },
            {x: "원재료 판매처가 수탁기업에 판매한 가격",        value: 95, capital: "예시: 수탁기업과 철강 원재료 판매기업 간 원재료 거래 계약서에 명시된 가격 등"   },
            {x: "위탁기업이 수탁기업에 판매한 가격(유상사급)",         value: 37, capital: "예시: 유상사급 등 "   }

        ]);

        // create a chart
        var chart = anychart.bar();

        // create a bar series and set the data
        var series = chart.bar(data);

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
