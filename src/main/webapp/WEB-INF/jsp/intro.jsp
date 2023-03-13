<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <!--  <link rel="icon" href="/favicon.ico" />-->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>납품대금 연동제</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/reset.css"/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/common.css"/>" />
    <script type="text/javascript" src="<c:url value="/js/front/jquery-1.12.4.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/front/common.js"/>"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

</head>
<body>
<div id="intro">
    <div class="slide-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="intro-bg intro3"></div>
                <div class="text-wrap">
                    <p>
                        2023년 10월 4일</br>
                        중소기업의 14년 숙원</br>
                        <strong>납품대금 연동제</strong>가</br>
                        시작됩니다.
                    </p>
                </div>
                <a class="go-main" href="<c:url value="/main/index.do"/>">바로가기</a>
            </div>
            <div class="swiper-slide">
                <div class="intro-bg intro2"></div>
                <div class="text-wrap">
                    <p>
                        2023년 10월 4일</br>
                        <strong>중소기업의 14년 숙원</strong></br>
                        납품대금 연동제가</br>
                        시작됩니다.
                    </p>
                </div>
                <a class="go-main" href="<c:url value="/main/index.do"/>">바로가기</a>
            </div>
            <div class="swiper-slide">
                <div class="intro-bg intro1"></div>
                <div class="text-wrap">
                    <p>
                        2023년 10월 4일</br>
                        중소기업의 14년 숙원</br>
                        납품대금 연동제가</br>
                        시작됩니다.
                    </p>
                </div>
                <a class="go-main" href="<c:url value="/main/index.do"/>">바로가기</a>
            </div>
            <div class="swiper-slide">
                <div class="intro-bg intro4"></div>
                <div class="text-wrap">
                    <p>
                        2023년 10월 4일</br>
                        중소기업의 14년 숙원</br>
                        납품대금 연동제가</br>
                        <strong>시작됩니다.</strong>
                    </p>
                </div>
                <a class="go-main" href="<c:url value="/main/index.do"/>">바로가기</a>
            </div>
        </div>
    </div>

</div>

<script>
    $(function($) {

        var mainSlide = new Swiper(".slide-container", {
            slidesPerView: 1,
            effect: 'fade',
            loop: true,
            speed: 1000,
            autoplay: {
                delay: 5000,
                disableOnInteraction: false,
            },
            navigation: { // 네비게이션 설정
                nextEl: '.main-next', // 다음 버튼 클래스명
                prevEl: '.main-prev', // 이번 버튼 클래스명
            }
        });

    });
</script>
</body>
</html>

