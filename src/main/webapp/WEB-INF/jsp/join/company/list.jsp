<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>

<head>
    <title>중소벤처기업부 | 동행기업</title>
    <script src="${pageContext.request.contextPath }/js/chart/anychart-core.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/chart/anychart-map.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/chart/anychart-cartesian.min.js"></script>
    <script src="https://cdn.anychart.com/geodata/2.2.0/countries/south_korea/south_korea.js"></script>

</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_join"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="/">홈</a></li>
                <li>
                    동행기업
                </li>
                <li>
                    동행기업 현황(위탁기업)
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 현황(위탁기업)</h1>
            </div>
            <div id="main">
                <!-- 컨텐츠 start -->
                <div class="statistics-wrap">
                    <div class="item" onclick="modalOpen(1)">
                        <img class="unhover" src="<c:url value="/images/company/statistics1-1.png"/>" alt="업종별 통계" />
                        <img class="hover" src="<c:url value="/images/company/statistics1-2.png"/>" alt="업종별 통계" />
                        업종별 통계
                    </div>
                    <div class="item" onclick="modalOpen(2)">
                        <img class="unhover" src="<c:url value="/images/company/statistics2-1.png"/>" alt="지역별 통계" />
                        <img class="hover" src="<c:url value="/images/company/statistics2-2.png"/>" alt="지역별 통계" />
                        지역별 통계
                    </div>
                    <div class="item" onclick="modalOpen(3)">
                        <img class="unhover" src="<c:url value="/images/company/statistics3-1.png"/>" alt="기업 규모별 통계" />
                        <img class="hover" src="<c:url value="/images/company/statistics3-2.png"/>" alt="기업 규모별 통계" />
                        기업 규모별 통계
                    </div>
                </div>
                <!-- Popup -->
                <div class="modal-background" onclick="modalClose()"></div>
                <div class="detail-modal-box">
                    <div class="modal-close inline-focus" onclick="modalClose()">
                        <span></span>
                        <span></span>
                    </div>
                    <!--  업종별 통계  -->
                    <form action="<c:url value="/front/guide/company/list.do"/>" id="comSearch" method="get">
                    <div id="contents1" class="contents-wrap">
                        <h2 class="title">업종별 통계</h2>
                        <div class="industry-container">
                            <div class="item machine hover-info" onclick="comSearch('machinery')">
                                <div class="text-wrap">
                                    <h3>기계·자동차·조선</h3>
                                    <h2>14개사</h2>
                                </div>
                                <div class="info-box">
                                    <h4>기계·자동차·조선</h4>
                                    <hr>
                                    <h3>14개사</h3>
                                </div>
                            </div>
                            <div class="item electronics hover-info"  onclick="comSearch('elect')">
                                <div class="text-wrap">
                                    <h3>전기·전자</h3>
                                    <h2>10개사</h2>
                                </div>
                                <div class="info-box">
                                    <h4>전기·전자</h4>
                                    <hr>
                                    <h3>10개사</h3>
                                </div>
                            </div>
                            <div class="item chemistry hover-info" onclick="comSearch('chemical')">
                                <div class="text-wrap">
                                    <h3>화학·금속·비금속</h3>
                                    <h2>9개사</h2>
                                </div>
                                <div class="info-box">
                                    <h4>화학·금속·비금속</h4>
                                    <hr>
                                    <h3>9개사</h3>
                                </div>
                            </div>
                            <div class="item others">
                                <div class="item food hover-info" onclick="comSearch('food')">
                                    <div class="text-wrap">
                                        <h3>식품</h3>
                                        <h2>5개사</h2>
                                    </div>
                                    <div class="info-box">
                                        <h4>식품</h4>
                                        <hr>
                                        <h3>5개사</h3>
                                    </div>
                                </div>
                                <div class="item communication hover-info" onclick="comSearch('tel')">
                                    <div class="text-wrap">
                                        <h3>통신</h3>
                                        <h2>4개사</h2>
                                    </div>
                                    <div class="info-box">
                                        <h4>통신</h4>
                                        <hr>
                                        <h3>4개사</h3>
                                    </div>
                                </div>
                                <div class="item building hover-info" onclick="comSearch('con')">
                                    <div class="text-wrap">
                                        <h3>건설</h3>
                                        <h2>3개사</h2>
                                    </div>
                                    <div class="info-box">
                                        <h4>건설</h4>
                                        <hr>
                                        <h3>3개사</h3>
                                    </div>
                                </div>
                                <div class="item service hover-info" onclick="comSearch('service')">
                                    <div class="text-wrap">
                                        <h3>서비스</h3>
                                        <h2>2개사</h2>
                                    </div>
                                    <div class="info-box">
                                        <h4>서비스</h4>
                                        <hr>
                                        <h3>2개사</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                    <!--  지역별 통계  -->
                    <div id="contents2" class="contents-wrap">
                        <h2 class="title">지역별 통계</h2>
                        <div id="map" style="height: 350px"></div>
                    </div>
                    <!--  기업 규모별 통계  -->
                    <div id="contents3" class="contents-wrap">
                        <h2 class="title">기업 규모별 통계</h2>
                        <div id="bar_chart" style="height: 350px"></div>

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
    $(document).ready(function(){
        $(".hover-info").hover(function (){
                var divX = $(this).offset().left;
                var divY = $(this).offset().top;
                $(this).find('.info-box').fadeIn("500");
                $(document).mousemove(function(e) {
                    mouseX = e.pageX;
                    mouseY = e.pageY;
                    $(this).find('.info-box').css("left", mouseX - divX + 10).css("top", mouseY-divY + 15);
                    console.log("divX = " + divX);
                    console.log("mouseX = " + mouseX);
                });


            },
            function (){
                $(this).find('.info-box').hide();
            });
    });

    function modalOpen(set){
        $(".contents-wrap").hide();
        $("#contents"+set).show();

        $(".detail-modal-box").css({
            "top": (($(window).height()-$(".detail-modal-box").outerHeight())/2+$(window).scrollTop())+"px",
            "left": (($(window).width()-$(".detail-modal-box").outerWidth())/2+$(window).scrollLeft())+"px"
        });
        $(".modal-background").css("display","block");
        $(".detail-modal-box").css("display","block");
    }
    function modalClose(){
        $(".modal-background").css("display","none");
        $(".detail-modal-box").css("display","none");
    }

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
            ["중소기업",7]
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

    function comSearch(code){
        var form = document.getElementById('comSearch');
        var input = document.createElement('input');
        input.setAttribute('type','hidden');
        input.setAttribute('value',code);
        input.setAttribute('name','bizcd');

        form.appendChild(input);
        form.submit();
    }
</script>
