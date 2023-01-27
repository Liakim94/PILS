<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <!--  <link rel="icon" href="/favicon.ico" />-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>납품대금연동제 홈페이지</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/reset.css"/>"/>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/common.css"/>"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="<c:url value="/js/front/jquery-1.12.4.min.js"/>"></script>
    <script src="<c:url value="/js/front/common.js"/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

</head>
<body>
    <div id="intro">
        <div class="slide-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="intro-bg intro1"></div>
                    <a class="go-main" href="<c:url value="/main/index.do"/>">바로가기</a>
                </div>
                <div class="swiper-slide">
                    <div class="intro-bg intro2"></div>
                    <a class="go-main" href="<c:url value="/main/index.do"/>">바로가기</a>
                </div>
                <div class="swiper-slide">
                    <div class="intro-bg intro3"></div>
                    <a class="go-main" href="<c:url value="/main/index.do"/>">바로가기</a>
                </div>
                <div class="swiper-slide">
                    <div class="intro-bg intro4"></div>
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
                    delay: 3000,
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
