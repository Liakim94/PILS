<!--  Common  -->
$( document ).ready(function() {
    $(".wrapper").hover(function () {
            $(this).find(".submenu").show();
        },
        function () {
            $(this).find(".submenu").hide();
        }
    );

    var scrollBottom = $(document).height() - $(window).height() - $(window).scrollTop();
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#backToTop').fadeIn(500);
        } else {
            $('#backToTop').fadeOut('slow');
        }
        var scrT = $(window).scrollTop();
        console.log(scrT); //스크롤 값 확인용
        if(scrT == $(document).height() - $(window).height() - 30){
            $('#backToTop').fadeOut('slow');
        } else {
            $('#backToTop').fadeIn(500);
        }
    });
    $('#backToTop').click(function (e) {
        e.preventDefault();
        $('html, body').animate({scrollTop: 0}, 200);
    });

    $(".gnb-wrap .menu").focus(function (){
        $(this).siblings(".submenu").show();
    })
    $(".gnb-wrap .menu").blur(function (){
        $(this).siblings(".submenu").hide();
    })
});
$(function() {

});

function mobileMenuOpen(m){
    if(!$(m).hasClass("active")){
        $(".mobile-gnb-container").show();
        $(m).addClass("active");
        $(".mobile-gnb-wrap").animate({
            right: '0px'
        }, 'slow');
    }
    else{
        $(m).removeClass("active");
        $(".mobile-gnb-wrap").animate({
            right: '-300px'
        }, 'slow');
    }
}
function menuToggleMobile(m){
    var toggle = $(m).siblings(".toggle");
    if(toggle.hasClass("active")){
        toggle.removeClass("active");
        $(m).siblings(".submenu").slideUp("500");
    }
    else{
        toggle.addClass("active");
        $(m).siblings(".submenu").slideDown("500");

    }
}



