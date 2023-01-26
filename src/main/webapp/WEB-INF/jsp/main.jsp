<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="fx" prefix="fx" %>

<head>
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>

<div id="content">
    <div id="main">
        <section id="mainVisual">
            <div class="main-visual-con">
                <div class="main-visual-item active-item">
                    <div class="main-txt-slider-wrap">
                        <div class="main-txt-slider">
                            <!-- Slide 1 -->
                            <div class="main-visual-txt-con">
                                <div class="main-visual-txt-inner">
                                    <h3 class="main-visual-txt1">
                                        <p>현재 <strong>388개</strong> 기업이</p>
                                        <p><strong>납품대금 연동제</strong>에 동참하고 있습니다.</p>
                                    </h3>
                                    <a href="" class="main-visual-more-btn " tabindex="-1"><span>참여자 현황 바로가기<i
                                            class="fas fa-chevron-right"></i></span></a>
                                </div>
                            </div>
                            <!-- Slide 2 -->
                            <div class="main-visual-txt-con">
                                <div class="main-visual-txt-inner">
                                    <h3 class="main-visual-txt1">
                                        <p>현재 <strong>388개</strong> 기업이</p>
                                        <p><strong>납품대금 연동제</strong>에 동참하고 있습니다.</p>
                                    </h3>
                                    <a href="" class="main-visual-more-btn " tabindex="-1"><span>참여자 현황 바로가기<i
                                            class="fas fa-chevron-right"></i></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main-navi">
                <div class="navi main-prev">
                    <i class="fas fa-chevron-left"></i>
                </div>
                <div class="navi main-next">
                    <i class="fas fa-chevron-right"></i>
                </div>
            </div>
        </section>
        <section>
            <div class="info-slide-container">
                <h1 class="title"><strong>소개</strong> 자료</h1>
                <div class="info-slide-navi">
                    <span class="info-prev"><i class="fas fa-chevron-left"></i></span>
                    <span class="info-next"><i class="fas fa-chevron-right"></i></span>
                </div>
                <div class="info-slide-wrap">
                    <div class="slide-item">
                        <h3>자료제목이 들어가는 영역</h3>
                        <img class="thumbnail" src="<c:url value="/images/common/video-temp.png"/>">
                    </div>
                    <div class="slide-item">
                        <h3>자료제목이 들어가는 영역</h3>
                        <img class="thumbnail" src="/images/common/video-temp.png">
                    </div>
                    <div class="slide-item">
                        <h3>자료제목이 들어가는 영역</h3>
                        <img class="thumbnail" src="/images/common/video-temp.png">
                    </div>
                    <div class="slide-item">
                        <h3>자료제목이 들어가는 영역</h3>
                        <img class="thumbnail" src="/images/common/video-temp.png">
                    </div>
                    <div class="slide-item">
                        <h3>자료제목이 들어가는 영역</h3>
                        <img class="thumbnail" src="/images/common/video-temp.png">
                    </div>
                </div>

            </div>

        </section>
        <section>
            <h1 class="title"><strong>참여기업</strong> 현황</h1>
            <h3 class="fw400">현재 납품대금연동제는 <span>43개 기업</span>이 참여하고 있습니다.</h3>
            <div class="company-list-container">
                <c:forEach var="list" items="${list }" varStatus="status">
                <div class="list-item">
                    <a href="<c:url value="/front/guide/cmpDetail.do?bizNo=${list.bizNo}"/>">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/hanssem-logo.png"/>">
                            </div>
                            <p class="company-name">${list.cmpNm}</p>
                        </div>
                    </a>
                </div>
                </c:forEach>

                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo2.png"/>">
                            </div>
                            <p class="company-name">(주)농업유통</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo3.png"/>">
                            </div>
                            <p class="company-name">(주)대한항공</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo4.png"/>">
                            </div>
                            <p class="company-name">(주)두산</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo5.png"/>">
                            </div>
                            <p class="company-name">(주)빙그레</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo6.png"/>">
                            </div>
                            <p class="company-name">(주)신세계디에프</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo7.png"/>">
                            </div>
                            <p class="company-name">(주)신세계인터내셔날</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo8.png"/>">
                            </div>
                            <p class="company-name">(주)씨제이이엔엠</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo9.png"/>">
                            </div>
                            <p class="company-name">(주)아모레퍼시픽</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo10.png"/>">
                            </div>
                            <p class="company-name">(주)엘엑스하우시스</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo11.png"/>">
                            </div>
                            <p class="company-name">(주)유라코퍼레이션</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo12.png"/>">
                            </div>
                            <p class="company-name">(주)이노션</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo13.png"/>">
                            </div>
                            <p class="company-name">(주)제일기획</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo14.png"/>">
                            </div>
                            <p class="company-name">(주)파리크라상</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo15.png"/>">
                            </div>
                            <p class="company-name">(주)포스코아이씨티</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo16.png"/>">
                            </div>
                            <p class="company-name">(주)풍산</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo17.png"/>">
                            </div>
                            <p class="company-name">(주)한양</p>
                        </div>
                    </a>
                </div>
                <div class="list-item">
                    <a href="">
                        <div class="list-wrapper">
                            <div class="img-wrap">
                                <img src="<c:url value="/images/main/logo18.png"/>"></div>
                            <p class="company-name">(주)환화</p>
                        </div>
                    </a>
                </div>
            </div>
        </section>
    </div>

</div>
<script>
    $(function ($) {

        /* *********************** 메인 비주얼 ************************ */
        $("#mainVisual").each(function () {
            $(this).find(".main-visual-item").addClass("active-item");
        });

        /* *********************** 메인 뉴스 및 공지 ************************ */

        $('.info-slide-wrap').slick({
            centerMode: true,
            slidesToShow: 3,
            speed: 800,
            autoplay: true,
            infinite: true,
            prevArrow: $('.info-prev'),
            nextArrow: $('.info-next'),
            variableWidth: true,
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '40px',
                        slidesToShow: 3
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '40px',
                        slidesToShow: 1
                    }
                }
            ]
        });

        $(".main-txt-slider").on('init', function (event, slick) {
            $(".main-visual-txt-con").eq(0).addClass("active-item");
        });

        $(".main-txt-slider").on('afterChange', function (event, slick, currentSlide) {
            $(".main-visual-txt-con").removeClass("active-item");
            $(this).find(".main-visual-txt-con").eq(currentSlide).addClass("active-item")
        });

        $(".main-txt-slider").slick({
            dots: false,
            infinite: true,
            slidesToShow: 1,
            slidesToScroll: 1,
            responsive: true,
            autoplay: true,
            speed: 800,
            autoplaySpeed: 3000,
            fade: true,
            prevArrow: $('.main-prev'),
            nextArrow: $('.main-next')
        });
    });
</script>