<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="fx" prefix="fx" %>

<head>
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

</head>
<style>

    #main .pc {
    }

    #main .mobile {
        display: none
    }

    @media (max-width: 768px ) {
        #main .pc {
            display: none
        }
        #main .mobile {
            display: inline;
        }
        #main .main-slide-container {
            height: 600px;
            border-bottom-right-radius: 0;
        }
    }
    @media (max-width: 280px ) {
        #main .main-slide-container {
            height: 327px;
        }
    }
    @media (min-width: 281px) and (max-width: 360px ) {
        #main .main-slide-container {
            height: 420px;
        }
    }
    @media (min-width: 361px) and (max-width: 375px ) {
        #main .main-slide-container {
            height: 437px;
        }
    }
    @media (min-width: 376px) and (max-width: 390px ) {
        #main .main-slide-container {
            height: 455px;
        }
    }
    @media (min-width: 391px) and (max-width: 393px ) {
        #main .main-slide-container {
            height: 458px;
        }
    }
    @media (min-width: 394px) and (max-width: 412px ) {
        #main .main-slide-container {
            height: 481px;
        }
    }
    @media (min-width: 413px) and (max-width: 414px ) {
        #main .main-slide-container {
            height: 483px;
        }
    }
    @media (min-width: 415px) and (max-width: 445px ) {
        #main .main-slide-container {
            height: 519px;
        }
    }
    @media (min-width: 446px) and (max-width: 475px ) {
        #main .main-slide-container {
            height: 554px;
        }
    }
    @media (min-width: 476px) and (max-width: 505px ) {
        #main .main-slide-container {
            height: 589px;
        }
    }
</style>
<div id="content" class="pd-0">
    <div id="main">
        <section id="main-banner">
            <div class="pc">
                <div class="main-slide-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"
                             style="background: url(<c:url value='/images/main/main-banner.png'/>)">
                            <div class="text-wrap">
                                <h1 class="slide-text">
                                    <p>?????? <strong>392???</strong> ?????????</p>
                                    <p>???????????? ???????????? ???????????? ????????????.</p>
                                </h1>
                                <a href="<c:url value="/front/guide/company/list.do"/>" class="more-btn">???????????? ?????? ????????????<i
                                        class="fas fa-chevron-right"></i></a>
                            </div>
                        </div>
                        <div class="swiper-slide"
                             style="background: url(<c:url value='/images/main/banner-bg03.png'/>)">
                            <div class="text-wrap">
                                <h1 class="slide-text">
                                    <p>??????????????? 14??? ??????, </p>
                                    <p>???????????? ???????????? ???????????????.</p>
                                </h1>
                                <a href="<c:url value="/front/guide/concept.do"/>" class="more-btn">???????????? ????????? ?????? ????????????<i
                                        class="fas fa-chevron-right"></i></a>
                            </div>
                        </div>
                        <div class="swiper-slide"
                             style="background: url(<c:url value='/images/main/cardnews_banner.jpg'/>)"
                             OnClick="location.href ='<c:url value="/front/board/ready/list.do"/>'">
                        </div>
                        <div class="swiper-slide"
                             style="background: url(<c:url value='/images/main/event_banner.jpg'/>)"
                             OnClick="location.href ='<c:url value="/front/board/11/view.do?boardSeq=40"/>'"></div>
                        <div class="swiper-slide"
                             style="background: url(<c:url value='/images/main/recruit_banner.jpg'/>)"
                             OnClick="location.href ='<c:url value="/front/board/11/view.do?boardSeq=5"/>'"></div>
                    </div>
                </div>
            </div>
            <div class="mobile">
                <div class="main-slide-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"
                             style="background-image: url(<c:url value='/images/mobile/mobile_banner01.png'/>)">
                            <div class="text-wrap">
                                <h1 class="slide-text">
                                    <p>?????? <strong>392???</strong> ?????????</p>
                                    <p>???????????? ???????????? ???????????? ????????????.</p>
                                </h1>
                                <a href="<c:url value="/front/guide/company/list.do"/>" class="more-btn">???????????? ?????? ????????????<i
                                        class="fas fa-chevron-right"></i></a>
                            </div>
                        </div>
                        <div class="swiper-slide"
                             style="background-image: url(<c:url value='/images/mobile/mobile_banner02.png'/>)">
                            <div class="text-wrap">
                                <h1 class="slide-text">
                                    <p>??????????????? 14??? ??????, </p>
                                    <p>???????????? ???????????? ???????????????.</p>
                                </h1>
                                <a href="<c:url value="/front/guide/concept.do"/>" class="more-btn">???????????? ????????? ?????? ????????????<i
                                        class="fas fa-chevron-right"></i></a>
                            </div>
                        </div>
                        <div class="swiper-slide"
                             style="background-image: url(<c:url value='/images/mobile/banner03.jpg'/>)"
                             OnClick="location.href ='<c:url value="/front/board/ready/list.do"/>'">
                        </div>
                        <div class="swiper-slide"
                             style="background-image: url(<c:url value='/images/mobile/banner_04.jpg'/>)"
                             OnClick="location.href ='<c:url value="/front/board/11/view.do?boardSeq=40"/>'"></div>
                        <div class="swiper-slide"
                             style="background-image: url(<c:url value='/images/mobile/banner_05.jpg'/>)"
                             OnClick="location.href ='<c:url value="/front/board/11/view.do?boardSeq=5"/>'"></div>
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
                <h1 class="title">?????? ?????? <strong>???????????? ?????????</strong></h1>
                <div class="info-slide-navi">
                    <span class="info-prev"><i class="fas fa-chevron-left"></i></span>
                    <span class="info-next"><i class="fas fa-chevron-right"></i></span>
                </div>
                <div class="info-slide-wrap">
                    <div class="slide-item">
                        <h3>???????????? ????????? ?????? ??????</h3>
                        <img class="thumbnail" onclick="modalOpen('modal-box-1')"
                             src="<c:url value="/images/common/youtube-temp1.png"/>" alt="????????????????????? ?????????"/>
                    </div>
                    <div class="slide-item">
                        <h3>???????????? ????????? ????????????</h3>
                        <img class="thumbnail" onclick="modalOpen('modal-box-2')"
                             src="<c:url value="/images/common/youtube-temp2.png"/>" alt="????????????????????? ?????????"/>
                    </div>
                    <div class="slide-item">
                        <h3>???????????? ????????? ????????????</h3>
                        <img class="thumbnail" src="<c:url value="/images/card/001.jpg"/>"
                             onclick="openCardNews('modal-box-3')"/>
                    </div>
                    <div class="slide-item">
                        <h3>???????????? ????????? '????????????' ????????????</h3>
                        <img class="thumbnail" src="<c:url value="/images/card02/001.jpg"/>"
                             onclick="openCardNews('modal-box-4')"/>
                    </div>
                    <div class="slide-item">
                        <h3>???????????? ????????? ????????? ?????????</h3>
                        <img class="thumbnail" onclick="modalOpen('modal-box-5')"
                             src="<c:url value="/images/common/youtube_temp3.png"/>" alt="????????????????????? ?????????"/>
                    </div>
                    <div class="slide-item">
                        <h3>???????????? ????????? ?????????</h3>
                        <img class="thumbnail" onclick="modalOpen('modal-box-6')"
                             src="<c:url value="/images/common/youtube_temp4.png"/>" alt="????????????????????? ?????????"/>
                    </div>
                </div>
            </div>
        </section>
        <section class="gray-bg py-60">
            <h1 class="title"><strong>????????????</strong> ??????</h1>
            <h3 class="fw400">?????? ${cnt}??? ????????????, ${joinCmpCnt}??? ??????????????? ???????????? ???????????? ???????????? ????????????.</h3>
            <div class="company-list-container">
                <c:forEach var="company" items="${list}" varStatus="status">
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
<div class="modal-background" onclick="modalClose()"></div>
<div id="modal-box-1" class="main-modal-box">
    <div class="modal-close inline-focus" onclick="playerClose()">
        <span></span>
        <span></span>
    </div>
    <div class="contents-wrap">
        <h1 class="title">????????????????????? ?????? ?????????</h1>
        <div class="video-wrap" id="player1">
            <%--<iframe width="840" height="472" src="https://www.youtube.com/embed/srd5e4iU16k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>--%>
        </div>
    </div>
</div>
<div id="modal-box-2" class="main-modal-box">
    <div class="modal-close inline-focus" onclick="playerClose()">
        <span></span>
        <span></span>
    </div>
    <div class="contents-wrap">
        <h1 class="title">?????? ?????? ?????????, ???????????? ????????? ???????????? ?????? ??????</h1>
        <div class="video-wrap" id="player2">
            <%--<iframe width="840" height="472" src="https://www.youtube.com/embed/deoTuJCLNFY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>--%>
        </div>
    </div>
</div>
<div id="modal-box-3" class="main-modal-box">
    <div class="modal-close inline-focus" onclick="modalClose()">
        <span></span>
        <span></span>
    </div>
    <div class="contents-wrap">
        <!--   CardNews Slide     -->
        <h1 class="title">????????????????????? ????????????</h1>
        <!--   ???????????? ??????     -->
        <div class="card-news">
            <span class="modal-prev"><i class="fas fa-chevron-left"></i></span>
            <span class="modal-next"><i class="fas fa-chevron-right"></i></span>
            <div class="modal-slide-container" id="modal-slide-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card/001.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card/002.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card/003.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card/004.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card/005.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card/006.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card/007.jpg"/>"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="modal-box-4" class="main-modal-box">
    <div class="modal-close inline-focus" onclick="modalClose()">
        <span></span>
        <span></span>
    </div>
    <div class="contents-wrap">
        <!--   CardNews Slide     -->
        <h1 class="title">????????????????????? ????????????</h1>
        <!--   ???????????? ??????     -->
        <div class="card-news">
            <span class="modal-prev"><i class="fas fa-chevron-left"></i></span>
            <span class="modal-next"><i class="fas fa-chevron-right"></i></span>
            <div class="modal-slide-container2" id="modal-slide-container2">
                <div class="swiper-wrapper" style="width: 100%">
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card02/001.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card02/002.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card02/003.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card02/004.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card02/005.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card02/006.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card02/007.jpg"/>"/>
                    </div>
                    <div class="swiper-slide">
                        <img src="<c:url value="/images/card02/008.jpg"/>"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="modal-box-5" class="main-modal-box">
    <div class="modal-close inline-focus" onclick="playerClose()">
        <span></span>
        <span></span>
    </div>
    <div class="contents-wrap">
        <h1 class="title">???????????? ????????? ????????? ????????? ?????????</h1>
        <div class="video-wrap" id="player3">
        </div>
    </div>
</div>
<div id="modal-box-6" class="main-modal-box">
    <div class="modal-close inline-focus" onclick="playerClose()">
        <span></span>
        <span></span>
    </div>
    <div class="contents-wrap">
        <h1 class="title">???????????? ????????? ?????????</h1>
        <div class="video-wrap" id="player4">
        </div>
    </div>
</div>
<script src="https://www.youtube.com/iframe_api"></script>
<script>
    <%-- WildRain ?????? 2023-02-03 : Youtube ????????? ?????? ?????? ?????? --%>
    var player1;
    var player2;
    var player3;
    var player4;

    function onYouTubeIframeAPIReady() {
        player1 = new YT.Player('player1', {
            width: '840',
            height: '472',
            videoId: 'srd5e4iU16k'
        });
        player2 = new YT.Player('player2', {
            width: '840',
            height: '472',
            videoId: 'deoTuJCLNFY'
        });
        player3 = new YT.Player('player3', {
            width: '840',
            height: '472',
            videoId: '6N9ko0YKfzU'
        });
        player4 = new YT.Player('player4', {
            width: '840',
            height: '472',
            videoId: 'KsP_fLcYVKA'
        });
    }

    function playerClose() {
        if (player1) {
            player1.pauseVideo();
        }
        if (player2) {
            player2.pauseVideo();
        }
        if (player3) {
            player3.pauseVideo();
        }
        if (player4) {
            player4.pauseVideo();
        }
        modalClose();
    }

    function modalOpen(current) {
        $(".main-modal-box").css("display", "none");
        $(".main-modal-box").css({
            "top": (($(window).height() - $(".main-modal-box").outerHeight()) / 2 + $(window).scrollTop()) + "px",
            "left": (($(window).width() - $(".main-modal-box").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
        });
        $(".modal-background").css("display", "block");
        //$(".main-modal-box").css("display","block");
        $('#' + current).css('display', 'block');

    }

    function modalClose() {
        $(".modal-background").css("display", "none");
        $(".main-modal-box").css("display", "none");
    }

    <%-- WildRain ?????? 20023-02-03 : ?????? ?????? ?????? ??? ??? ????????? ?????? ????????? ?????? ????????? ?????????... --%>
    let modalSlide1;
    let modalSlide2;

    function openCardNews(current) {
        if (modalSlide1) {
            modalSlide1.destroy(true, true);
        }
        modalSlide1 = new Swiper(".modal-slide-container", {
            slidesPerView: 1,
            loop: true,
            speed: 1000,
            observer: true,
            observeParents: true,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            navigation: { // ??????????????? ??????
                nextEl: '.modal-next', // ?????? ?????? ????????????
                prevEl: '.modal-prev', // ?????? ?????? ????????????
            },
        }),
            modalSlide2 = new Swiper(".modal-slide-container2", {
                slidesPerView: 1,
                loop: true,
                speed: 1000,
                observer: true,
                observeParents: true,
                autoplay: {
                    delay: 3000,
                    disableOnInteraction: false,
                },
                navigation: { // ??????????????? ??????
                    nextEl: '.modal-next', // ?????? ?????? ????????????
                    prevEl: '.modal-prev', // ?????? ?????? ????????????
                },
            });
        modalOpen(current);
    }

    $(function ($) {

        var mainSlide = new Swiper(".main-slide-container", {
            slidesPerView: 1,
            effect: 'fade',
            loop: true,
            speed: 1000,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            navigation: { // ??????????????? ??????
                nextEl: '.main-next', // ?????? ?????? ????????????
                prevEl: '.main-prev', // ?????? ?????? ????????????
            },
        });


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
    });
</script>