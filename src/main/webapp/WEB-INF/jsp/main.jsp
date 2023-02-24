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

<div id="content" class="pd-0" >
    <div id="main">
        <section id="main-banner">
            <div class="main-slide-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" style="background: url(<c:url value='/images/main/main-banner.png'/>)">
                        <div class="text-wrap">
                            <h1 class="slide-text">
                                <p>현재 <strong>392개</strong> 기업이</p>
                                <p>납품대금 연동제에 동참하고 있습니다.</p>
                            </h1>
                            <a href="<c:url value="/front/guide/company/list.do"/>" class="more-btn">참여기업 현황 바로가기<i class="fas fa-chevron-right"></i></a>
                        </div>
                    </div>
                    <div class="swiper-slide" style="background: url(<c:url value='/images/main/banner-bg03.png'/>)">
                        <div class="text-wrap">
                            <h1 class="slide-text">
                                <p>중소기업의 14년 숙원, </p>
                                <p>납품대금 연동제가 시작됩니다.</p>
                            </h1>
                            <a href="<c:url value="/front/guide/concept.do"/>" class="more-btn">납품대금 연동제 소개 바로가기<i class="fas fa-chevron-right"></i></a>
                        </div>
                    </div>
                    <div class="swiper-slide" style="background: url(<c:url value='/images/main/cardnews_banner.jpg'/>)"
                         OnClick="location.href ='<c:url value="/front/board/ready/list.do"/>'">
                    </div>
                    <div class="swiper-slide" style="background: url(<c:url value='/images/main/event_banner.jpg'/>)"
                         OnClick="location.href ='<c:url value="/front/board/11/view.do?boardSeq=40"/>'"></div>
                <div class="swiper-slide" style="background: url(<c:url value='/images/main/recruit_banner.jpg'/>)"
                     OnClick="location.href ='<c:url value="/front/board/11/view.do?boardSeq=5"/>'"></div>
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
                <h1 class="title">쉽게 보는 <strong>납품대금 연동제</strong> </h1>
                <div class="info-slide-navi">
                    <span class="info-prev"><i class="fas fa-chevron-left"></i></span>
                    <span class="info-next"><i class="fas fa-chevron-right"></i></span>
                </div>
                <div class="info-slide-wrap">
                    <div class="slide-item">
                        <h3>납품대금 연동제 설명 영상</h3>
                        <img class="thumbnail" onclick="modalOpen('modal-box-1')" src="<c:url value="/images/common/youtube-temp1.png"/>" alt="납품대금연동제 설명회"/>
                    </div>
                    <div class="slide-item">
                        <h3>납품대금 연동제 추진경과</h3>
                        <img class="thumbnail" onclick="modalOpen('modal-box-2')" src="<c:url value="/images/common/youtube-temp2.png"/>" alt="납품대금연동제 설명회"/>
                    </div>
                    <div class="slide-item">
                        <h3>납품대금 연동제 알아보기</h3>
                        <img class="thumbnail" src="<c:url value="/images/card/001.jpg"/>"  onclick="openCardNews('modal-box-3')"/>
                    </div>
                    <div class="slide-item">
                        <h3>납품대금 연동제 '동행기업' 모집공고</h3>
                         <img class="thumbnail" src="<c:url value="/images/card02/001.jpg"/>"  onclick="openCardNews('modal-box-4')"/>
                    </div>
                    <div class="slide-item">
                        <h3>납품대금 연동제 로드쇼 개막식</h3>
                        <img class="thumbnail" onclick="modalOpen('modal-box-5')" src="<c:url value="/images/common/youtube_temp3.png"/>" alt="납품대금연동제 설명회"/>
                    </div>
                    <div class="slide-item">
                        <h3>품대금 연동제 로드쇼 개막식 Q&A</h3>
                        <img class="thumbnail" onclick="modalOpen('modal-box-6')" src="<c:url value="/images/common/youtube_temp4.png"/>" alt="납품대금연동제 설명회"/>
                    </div>
                </div>
            </div>
        </section>
        <section class="gray-bg py-60">
            <h1 class="title"><strong>참여기업</strong> 현황</h1>
            <h3 class="fw400">현재 ${cnt}개 위탁기업,  ${joinCmpCnt}개 수탁기업이 납품대금 연동제에 동참하고 있습니다.</h3>
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
        <h1 class="title">납품대금연동제 시책 설명회</h1>
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
        <h1 class="title">가슴 벅찬 첫걸음, 납품대금 연동제 시범운영 본격 개시</h1>
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
        <h1 class="title">납품대금연동제 알아보기</h1>
        <!--   카드뉴시 일시     -->
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
        <h1 class="title">납품대금연동제 알아보기</h1>
        <!--   카드뉴시 일시     -->
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
        <h1 class="title">납품대금 연동제 로드쇼 개막식 풀버전</h1>
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
        <h1 class="title">납품대금 연동제 로드쇼 개막식 Q&A</h1>
        <div class="video-wrap" id="player4">
        </div>
    </div>
</div>
<script src="https://www.youtube.com/iframe_api"></script>
<script>
    <%-- WildRain 추가 2023-02-03 : Youtube 동영상 중지 처리 추가 --%>
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
            videoId: 'YG80p4iRcZo'
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

    function modalOpen(current){
        $(".main-modal-box").css("display","none");
        $(".main-modal-box").css({
            "top": (($(window).height()-$(".main-modal-box").outerHeight())/2+$(window).scrollTop())+"px",
            "left": (($(window).width()-$(".main-modal-box").outerWidth())/2+$(window).scrollLeft())+"px"
        });
        $(".modal-background").css("display","block");
        //$(".main-modal-box").css("display","block");
        $('#' + current).css('display', 'block');

    }
    function modalClose(){
        $(".modal-background").css("display","none");
        $(".main-modal-box").css("display","none");
    }

    <%-- WildRain 수정 20023-02-03 : 카드 뉴스 닫은 후 재 오픈시 작동 안되는 문제 해결을 위하여... --%>
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
            navigation : { // 네비게이션 설정
                nextEl : '.modal-next', // 다음 버튼 클래스명
                prevEl : '.modal-prev', // 이번 버튼 클래스명
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
                navigation : { // 네비게이션 설정
                    nextEl : '.modal-next', // 다음 버튼 클래스명
                    prevEl : '.modal-prev', // 이번 버튼 클래스명
                },
            });
        modalOpen(current);
    }
    $(function($){

        var mainSlide = new Swiper(".main-slide-container", {
            slidesPerView: 1,
            effect : 'fade',
            loop: true,
            speed: 1000,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            navigation : { // 네비게이션 설정
                nextEl : '.main-next', // 다음 버튼 클래스명
                prevEl : '.main-prev', // 이번 버튼 클래스명
            },
        });




        $('.info-slide-wrap').slick({
            centerMode: true,
            slidesToShow: 3,
            speed:800,
            autoplay: true,
            infinite:true,
            prevArrow: $('.info-prev'),
            nextArrow: $('.info-next'),
            variableWidth:true,
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