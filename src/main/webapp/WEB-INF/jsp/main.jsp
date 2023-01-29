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

<div id="content">
    <div id="main">
        <section id="main-banner">
            <div class="main-slide-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" style="background: url(<c:url value='/images/main/main-banner.png'/>)">
                        <div class="text-wrap">
                            <h1 class="slide-text">
                                <p>현재 <strong>338개</strong> 기업이</p>
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
                        <div class="video-wrap">
                            <iframe  onclick="modalOpen()" width="560" height="315" src="https://www.youtube.com/embed/srd5e4iU16k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="slide-item">
                        <div class="video-wrap">
                            <iframe onclick="modalOpen()" width="560" height="315" src="https://www.youtube.com/embed/deoTuJCLNFY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="slide-item">
                        <h3>자료제목이 들어가는 영역</h3>
                        <img class="thumbnail" src="<c:url value="/images/common/video-temp.png"/>"  onclick="modalOpen()">
                    </div>
                    <div class="slide-item">
                        <h3>자료제목이 들어가는 영역</h3>
                        <img class="thumbnail" src="<c:url value="/images/common/video-temp.png"/>"  onclick="modalOpen()">
                    </div>

                </div>
            </div>
        </section>
        <section>
            <h1 class="title"><strong>참여기업</strong> 현황</h1>
            <h3 class="fw400">현재 납품대금연동제는 <span>43개 기업</span>이 참여하고 있습니다.</h3>
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
<div class="modal-background"></div>
<div class="main-modal-box">
    <div class="modal-close inline-focus" onclick="modalClose()">
        <span></span>
        <span></span>
    </div>
    <div class="contents-wrap">
        <!--   CardNews Slide     -->
        <h1 class="title">제목이 들어갈 자리입니다.</h1>
        <span class="modal-prev"><i class="fas fa-chevron-left"></i></span>
        <span class="modal-next"><i class="fas fa-chevron-right"></i></span>
        <div class="modal-slide-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="img/intro/intro-banner1.png">
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function modalOpen(){
        $(".main-modal-box").css({
            "top": (($(window).height()-$(".main-modal-box").outerHeight())/2+$(window).scrollTop())+"px",
            "left": (($(window).width()-$(".main-modal-box").outerWidth())/2+$(window).scrollLeft())+"px"
        });
        $(".modal-background").css("display","block");
        $(".main-modal-box").css("display","block");
    }
    function modalClose(){
        $(".modal-background").css("display","none");
        $(".main-modal-box").css("display","none");
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
            }
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