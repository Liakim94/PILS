$(document).ready(function(){
	//숫자만 입력 input태그의 num_only 클래스
	$(document).on('keypress', 'input.num_only', function(e){
        if(e.which && (e.which < 48 || e.which > 57) ){ e.preventDefault(); }
    });

	//숫자만 입력 input태그의 num_only 클래스
    $(document).on('keyup', 'input.num_only', function(e){
        if( $(this).val() != null && $(this).val() != '' ) {
            var tmps = $(this).val().replace(/[^0-9]/g, '');
            $(this).val(tmps);
        }
    });
    $('.lnb').parent().parent().addClass('lnb-line');
    $('.header-site-wrap').addClass('h-'+$('.site_list ul li').length);
    //left 메뉴의 아코디언 적용.
    /*
    $("body").on("click", ".lnb a.arr", function(){
        var ck = $(this).attr("class");
        $('.lnb > ul > li,.lnb > ul > li > a').removeClass('on')
        if(ck == 'arr on'){
            $(this).removeClass('on');
            $(this).parent().removeClass('on');
        }else{
            $(this).addClass('on');
            $(this).parent().addClass('on');
        }
    });
    */

   acocordian()
});

$(function(){
    common.headerEvt();
    common.etcEvt();

});

var TOUCH = "ontouchstart" in window;
var tevent = '';
if (TOUCH){
    tevent = "touchstart";
}else{
    tevent = "click";
}


common = {
    calendar:function(){
        $(".datepicker").datepicker({
            dateFormat: "yy-mm-dd"
        });
    },
    headerEvt:function(){
        $("body").on("mouseenter",".header .gnb>li>a",function(){
            $(".header").addClass("active");
        });
        $("body").on("mouseleave",".header",function(){
            $(".header, body").removeClass("active");
            $(".total-menu").removeClass("on");
        });

        $("body").on("click",".gnb-close",function(){
            $(".total-menu").removeClass("on");
            $(".header, body").removeClass("active");
        });
        $("body").on("click",".total-menu",function(){
            var ck = $(this).hasClass("on");
            if(ck){
                $(this).removeClass("on");
                $(".header, body").removeClass("active");
            }else{
                $(this).addClass("on");
                $(".header, body").addClass("active");
            }
        });

        $("body").on("click",".sClose",function(){
            $(".tOpen").removeClass("on");
            $(".totalMenu").hide();
            $("body").removeClass("menu-active");
        });
        $("body").on("click",".menu-toggle",function(){
            var ck = $(this).hasClass("on");
            if(ck){
                $(this).removeClass("on");
                $(this).next("ul").show();
            }else{
                $(this).addClass("on");
                $(this).next("ul").hide();
            }
        });
    },
    etcEvt:function(){
        $("body").on("click",".slide-stop",function(e){
            $(".lastest-slide-func a").removeClass("on");
            $(this).addClass("on");
            $('.latst-slide').slick('slickPause');
        });
        $("body").on("click",".slide-play",function(e){
            $(".lastest-slide-func a").removeClass("on");
            $(this).addClass("on");
            $('.latst-slide').slick('slickPlay');
        });
        $(".latst-slide").slick({
            accessibility : true,
            autoplay: true,
            vertical: true,
            autoplaySpeed: 3000,
            pauseOnHover : false,
            slidesToShow: 1
        });
        $("body").on("click", ".chk-all input", function(){
            var ck = $(this).prop("checked");
            if(ck){
                $(".chk-wrap input.agree").prop("checked", true);
            }else{
                $(".chk-wrap input").prop("checked", false);
            }
        });
        $("body").on("click", ".tbl-chk-wrap input", function(){
            var ck = $(this).prop("checked");
            if(ck){
                $(".checkbox").prop("checked", true);
            }else{
                $(".checkbox").prop("checked", false);
            }
        });
        // $("body").on("click", ".header-site", function(){
        //     $(".header-site-wrap").show();
        //     $(".normal-wrap").addClass("deemed");
        // });
        // $("body").on("click", ".site-close", function(){
        //     $(".header-site-wrap").hide();
        //     $(".normal-wrap").removeClass("deemed");
        // });
        $("body").on("click",".private-list > li > a",function(){
            var yy = $(this).attr("href").substring(1);
            $('.content.private').hide();
            $('#p-'+yy).show();
            $(window).scrollTop(0);
            return false;
        })
        
        $("body").on("click",".site-cont .popup-tab > ul > li > a",function(){
            var cp = $(this).attr("class");
            $(".site-cont .popup-tab > ul > li").removeClass();
            $(this).parent().addClass("on");
            if (cp == "c"){
                $(".site_list.c").show();
                $(".site_list.p").hide();
            } else {
                $(".site_list.c").hide();
                $(".site_list.p").show();
            }
            return false;
        })
        
        $(window).scroll(function(){
            //$(".header-site-wrap").hide();
        });


    },
    popOpen:function(o){
        $(o).addClass("on");
    },
    popClose:function(o){
        $(o).removeClass("on");
    }
    
}

/* 비밀번호 암호화 */
function gfn_rsaEnc(value, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
    var rsa = new RSAKey();
    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);
    var encValue = rsa.encrypt(value);
    return encValue;
}

/* 파라미터 값 가져오기 */
function gfn_getParam(sname) {
    var params = location.search.substr(location.search.indexOf("?") + 1);
    var sval = "";
    params = params.split("&");
    for (var i = 0; i < params.length; i++) {
        temp = params[i].split("=");
        if ([temp[0]] == sname) { sval = temp[1]; }
    }
    return sval;
}

/* faq */
function acocordian(){
    var _$accordianArea = $( '.accordian-list');
    var _$accordianList = _$accordianArea.children('.acco-group');
    var _$accordianListBtn = _$accordianList.find('.acco-head a, .acco-head button');

    // accordian 초기값에 따라 내용 열기, 내용 닫기 세팅을 합니다.
    _$accordianList.each(function(_i, _accordian){
        if($(_accordian).hasClass('active')){
            $(_accordian).find('.btn > span').text("내용닫기");
        }else{
            $(_accordian).find('.btn > span').text("내용열기");
        }
    });

    // accordian 하나 열리면 하나 닫힘
    _$accordianListBtn.on( 'click', function () {

    if ( $( this ).closest( '.acco-group' ).hasClass( 'active' )) {
        $( this ).closest( '.acco-group' ).removeClass( 'active' );
        $( this ).closest( '.acco-head' ).find('.btn span').text("내용열기");
    } else {
        _$accordianList.removeClass('active');
        $( this ).closest( '.acco-group' ).addClass( 'active' );
        $( this ).closest( '.acco-head' ).find('.btn span').text("내용닫기");
    }
    return false;
    });
}
