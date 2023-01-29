<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>

<head>
    <title>참여 기업 현황</title>
    <script src="${pageContext.request.contextPath }/js/chart/anychart-core.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/chart/anychart-map.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/chart/anychart-treemap.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/chart/anychart-cartesian.min.js"></script>
    <script src="https://cdn.anychart.com/geodata/2.2.0/countries/south_korea/south_korea.js"></script>

</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="guide_menu"/>
        <div class="article">
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="/">홈</a></li>
                <li>
                    납품대금 연동제란?
                </li>
                <li>
                    참여 기업 현황
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700" style="margin-bottom:20px">참여 기업 현황</h1>
            </div>
            <div id="main">
                <!-- 컨텐츠 start -->
                <div class="tab">
                    <ul class="tabnav">
                        <li><a href="#tab01">1. 업종</a></li>
                        <li><a href="#tab02">2. 지역</a></li>
                        <li><a href="#tab03">3. 기업 규모</a></li>
                    </ul>
                    <div class="tabcontent">
                        <div id="tab01" style="height:100%;" ><div id="chart" style="height:100%;"></div></div>
                        <div id="tab02" style="height:100%;"><div id="map" style="height:100%;"></div></div>
                        <div id="tab03" style="height:100%;"><div id="bar_chart" style="height:100%;"></div></div>
                    </div>
                </div>
                <section>
                    <div class="company-list-container">
                        <c:forEach var="company" items="${list }" varStatus="status">
                            <div class="list-item">
                                <a href="<c:url value="/front/guide/company/details.do?bizNo=${company.bizNo}"/>">
                                    <div class="list-wrapper">
                                        <div class="img-wrap">
                                            <img src="<c:url value="${FileUploadController.makeDownloadLink(company.logoImgPath)}"/>"
                                                 alt="<c:out value="${company.cmpNm}"/>"
                                                 onerror="this.src='<c:url value="/images/no-image.jpg"/>'"/>
                                        </div>
                                        <p class="company-name">${company.cmpNm}</p>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        $('.tabcontent > div').hide();
        $('.tabnav a').click(function () {
            $('.tabcontent > div').hide().filter(this.hash).fadeIn();
            $('.tabnav a').removeClass('active');
            $(this).addClass('active');
            return false;
        }).filter(':eq(0)').click();
    });
    anychart.onDocumentReady(function () {

        // create the data
        var dataSet = [
            {name: "업종", children: [
                            {name: "기계·자동차·조선", value: 14},
                            {name: "전기·전자", value: 10},
                            {name: "화학·금속·비금속", value: 9},
                            {name: "통신", value: 4},
                            {name: "건설", value: 3},
                            {name: "식품", value: 5},
                            {name: "서비스", value: 2}
                    ]}

        ];

        // create the treemap chart and set the data
        var chart = anychart.treeMap(dataSet, "as-tree");


        // set a custom color scale
        var customColorScale = anychart.scales.linearColor();
        customColorScale.colors(['#f78437', '#ffcc00']);
        chart.colorScale(customColorScale);
        chart.colorRange().length('100%');

        // format the labels
        chart.labels().useHtml(true);
        chart.labels().format(
            "<span style='font-size: 10px; color: #070707'>{%name}</span><br>{%value}개사"
        );
        // set the container id for the chart
        chart.container("chart");
        chart.draw();

    });
    anychart.onDocumentReady(function() {
        // create map
        var map = anychart.map();

        // create data set
        var dataSet = anychart.data.set(
            [{"id":"KR.4194","value":47},
                {"id":"KR.GB","value":2},//충북
                {"id":"KR.IN","value":2},  //인천
                {"id":"KR.KW","value":1},  //강원도
                {"id":"KR.SO","value":20}, //서울
                {"id":"KR.KG","value":10}, //경기
                {"id":"KR.CB","value":1}, //전남
                {"id":"KR.KJ","value":1}, //광주
                {"id":"KR.GN","value":1}, //충남
                {"id":"KR.TJ","value":0},
                {"id":"KR.TG","value":0},
                {"id":"KR.KN","value":3},  //경남
                {"id":"KR.2685","value":0},
                {"id":"KR.PU","value":1}, //부산
                {"id":"KR.UL","value":2},  //울산
                {"id":"KR.2688","value":2},  //경북
                {"id":"KR.CJ","value":1},  //제주
                {"id":"KR.SJ","value":0}]
        );

        // create choropleth series
        series = map.choropleth(dataSet);

        // set geoIdField to 'id', this field contains in geo data meta properties
        series.geoIdField('id');
        series.labels(false);
        // set map color settings
        series.colorScale(anychart.scales.linearColor('#deebf7', '#3182bd'));
        series.hovered().fill('#addd8e');

        // set geo data, you can find this map in our geo maps collection
        // https://cdn.anychart.com/#maps-collection
        map.geoData(anychart.maps['south_korea']);

        //set map container id (div)
        map.container('map');
        map.draw();
    });
    anychart.onDocumentReady(function () {

        // create a data set
        var data = anychart.data.set([
            ["대기업", 31],
            ["중견기업", 9],
            ["중기업",5],
            ["소기업",2]
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

        // configure labels on the y-axis
        chart.yAxis().labels().format("{%value}");

        // set the container id
        chart.container("bar_chart");
        chart.draw();
    });
</script>
<style>
    html,body {width:100%;  }
    body,div,ul,li{margin:0; padding:0;}
    ul,li {list-style:none;}

    /*tab css*/
    .tab{margin:0 auto;  width:600px; height:290px;padding: 15px; }
    .tabnav{font-size:0; width:600px;}
    .tabnav li{display: inline-block;  height:30px; text-align:center; border-right:1px solid #ddd;  border:1px solid #ddd;}
    .tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
    .tabnav li a.active:before{background:#7ea21e;}
    .tabnav li a.active{border-bottom:1px solid #fff;}
    .tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 20px; line-height:32px; text-decoration:none; font-size:14px;}
    .tabnav li a:hover,
    .tabnav li a.active{background:#fff; color:#7ea21e; }
    .tabcontent{height:297px; border:1px solid #ddd; }
</style>