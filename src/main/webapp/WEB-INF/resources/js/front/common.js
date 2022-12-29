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
    $('.lnb:not(.progress) ul li a').on('click',function(){        
        if($(this).parent().find('ul').length > 0){
            if($(this).parent().hasClass('_selected')){
                $(this).parent().removeClass('_selected');
            } else{
                $(this).parent().addClass('_selected').siblings('li').removeClass('_selected');            
            }
            return false;
        } else {
            return true;
        }        
    })

    //탭 메뉴 동작
    if( $(".tab_wrap").length ){
        $("button.tab_btn").on("click",function(){
            if( !$(this).parent().hasClass("__selected") ){
                $(".tab_list > li").removeClass("__selected");
                $(this).parent().addClass("__selected");
            }
        });
        $("a.tab_btn").on("click",function(e){
            if( $(this).parent().hasClass("__selected") ){
                e.preventDefault();
                $(this).siblings(".tab_cont").focus();
            }
        });
    }

    //라디오 탭 메뉴 동작
    if( $(".radio_tabs").length ){
        $("input[type=radio]").on("change",function(){
           
            if($(this).parent().index() === 0) {
               $(".inputText1").text('사전조정신청서')
            } else {
                $(".inputText1").text('조정신청서')
            }
        }); 
    }
    
    // 설문-답변기준안내 토글
    $(".tip_answer").on("click",function(){
        $(this).next().toggle()
        $(this).toggleClass('opened') 

        if($(this).hasClass('opened')){
            $(this).text( $(this).text().replace('열기', '닫기'))
        } else {
            $(this).text( $(this).text().replace('닫기', '열기'))
        }
        
        if($(this).hasClass('type2')){ 
            if($(this).hasClass('opened')){
                $(this).text( $(this).text().replace('보기', '닫기'))
            } else {
                $(this).text( $(this).text().replace('닫기', '보기'))
            }
        }

    });

    // 성과관리 진행 표시 사이드바
    $('.progress ul li a').on('click', function(){        
        if($(this).parent().find('ul').length > 0){
            if($(this).parent().hasClass('on')){
                $(this).parent().removeClass('on');
            } else{
                $(this).parent().addClass('on');      
            }
            return false;
        } else {
            return true;
        }        
    })
    
    // qna
    if( $(".qna_items").length ){
        $(".qna_btn").on("click",function(){
            var q_top = $(this).parents(".qna_items").parent();
            var q_targ = $(this).parent().siblings("dd");
            if( !q_top.hasClass("__selected") ){
                $(".qna_items > dd").stop().slideUp();
                $(".board_thumb.qna > li").removeClass("__selected");
                q_top.addClass("__selected");
                q_targ.stop().slideDown();
            }
            else {
                q_top.removeClass("__selected");
                q_targ.stop().slideUp();
            }
        });
    }

    // file
    if( $(".file_wrap").length ){
        $('input[type=file].file_inp').on('change',function(){
            var curfile = $(this)[0];
            if( curfile.files.length == 0 ){
                $(this).siblings(".file_info").removeClass("__selfile");
                $(this).siblings(".file_info").children("i").text("선택된 파일이 없음");
                $('.prev_area').empty();
            }
            else {
                $(this).siblings(".file_info").addClass("__selfile");
                var fname = "(" + filesize(curfile.files[0].size) + ") " + curfile.files[0].name;
                $(this).siblings(".file_info").children("i").text(fname);

                if( $(this).hasClass("for_imgfile") ){
                    if(curfile.files && curfile.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $('.prev_area').html("<img src="+ e.target.result +" alt='"+"선택 이미지 미리보기'"+">");
                        }
                        reader.readAsDataURL(curfile.files[0]);
                    }
                }
            }
        });

        $(".file_del").on('click',function(){
            var delfile = $(this).parent().siblings(".file_inp");
            delfile.replaceWith(delfile.val('').clone(true));
            $(this).parent(".file_info").removeClass("__selfile");
            $(this).siblings("i").text("선택된 파일이 없음");
            $('.prev_area').empty();
        });
    }

    // prize select
    if( $(".hof_year_select").length ){
        $('.hof_year_select').on('change',function(){
            var cur_selected = $('.hof_year_select > option:selected').index();
            var target_li = $('.selected_cont > ul > li');
            var target_cont = $('.selected_cont > ul > li').eq(cur_selected);
            if( !target_cont.hasClass("__selected") ){
                target_li.removeClass("__selected");
                target_cont.addClass("__selected");
            }
        });
    }

    // calendar
    if( $(".view_calendar").length ){
        $(".view_calendar").on('click',function(){
            var unview_tg = $(this).parent().parent();
            unview_tg.removeClass("__curview");
            unview_tg.siblings("div").addClass("__curview");
            if( unview_tg.hasClass("calendar_list_view") ){
                $("#cal_tbl .view_calendar").focus();
            }
            else {
                $("#cal_lst .view_calendar").focus();
            }
        });
    }

    // csr 통합정보사전
    if( $(".int_dictionary").length ){
        $(".int_toggle_btn").on('click',function(){
            var tar_prt = $(this).parents(".int_dictionary");
            if( !tar_prt.hasClass("__showdetail") ){
                tar_prt.addClass("__showdetail");
                $(this).attr("title","상세검색 닫기");
            }
            else {
                tar_prt.removeClass("__showdetail");
                $(this).attr("title","상세검색 열기");
            }
        });
        $(".close_toggle").on('click',function(){
            var tar_prtc = $(this).parents(".int_dictionary");
            tar_prtc.removeClass("__showdetail");
            $(".int_toggle_btn").attr("title","상세검색 열기");
        });
    }

    // form datepicker
    $(".datepicker").datepicker({
        dateFormat: "yy-mm-dd"
    });
    $(".date-picker").datepicker({
    	dateFormat: "yy-mm-dd"
    });

    // 중소벤쳐24 메뉴펼침
    $(".ven_allmenu").on('click',function(){
        if( !$(this).parent().hasClass("__showmenu") ){
            $(this).parent().addClass("__showmenu");
            $("body").css("position","relative");
            $("body").prepend("<div class='menu_dim'></div>");
            set_dim();
        }
        else { 
            $(".menu_dim").remove();
            $("body").removeAttr("style");
            $(this).parent().removeClass("__showmenu");
        }
    });

    // 레이어팝업
    if( !$(".new_winpop").length ) {
        $(".l_pop_open_btn").on('click',function(){
            // if( $(this).hasClass("") ){

            // }
            // else {
                if( !$(".layer_pop_wrap").hasClass("__show") ){
                    $("body").prepend("<div class='layer_dim'></div>").addClass("__onlayer");
                    new_dim();
                    $(".layer_pop_wrap").addClass("__show");

                }
            // }

        });

        $(".l_pop_close_btn").on('click',function(){
            $(".layer_dim").remove();
            $("body").removeClass("__onlayer");
            $(".layer_pop_wrap").removeClass("__show");
        });
    }
    
    // 공통 헤더 검색
    if( $(".search-menu").length ){
        $(".search-menu").on('click',function(){
            if( !$(".__showsearch").length ){
                $("body").addClass("__showsearch");
                $(".search_area > input").focus();
            }
            else {
                $("body").removeClass("__showsearch");
            }
        });
    }

    // 공통 헤더 사이트 메뉴
    $(".sitemenu_btn").on('click',function(){
        if( !$(body).hasClass("__mobmenu") ){
            $("body").addClass("__mobmenu");
            $(".sitemenu_close_btn").focus();
        }
        else {
            $("body").removeClass("__mobmenu");
        }
    });

    $(".site_menu button").on('click',function(e){
        if( $(this).siblings("ul").length ){
            e.preventDefault();
            if( $(this).hasClass("menu_depth1") )
                $(this).parent().siblings().removeClass("_selected");

            if( !$(this).parent().hasClass("_selected") )
                $(this).parent().addClass("_selected");
            else {
                $(this).parent().removeClass("_selected");
            }
        }
    });

    $(".sitemenu_close_btn").on('click',function(e){
        $("body").removeClass("__mobmenu");
        $(".sitemenu_btn").focus();
    });

    // 수위탁메인
    if( $(".main_wrap_tra").length ){
        $(".mini_tab_select").on('click',function(){
            if( !$(this).parent().hasClass("__selected") ){
                $(".board_miniview > li").removeClass("__selected");
                $(this).parent().addClass("__selected");
            }
        });
    }
    

});


function new_dim (){
    $(".layer_dim").on('click',function(){
        $(".layer_dim").remove();
        $("body").removeClass("__onlayer");
        $(".layer_pop_wrap").removeClass("__show");
    });
}

function set_dim (){
    $(".menu_dim").on('click',function(){
        $(".gnb-box").removeClass("__showmenu");
        $(".menu_dim").remove();
    });
}

function filesize(num) {
  if(num < 1024) {
    return num + 'bytes';
  } else if(num >= 1024 && num < 1048576) {
    return (num/1024).toFixed(1) + 'KB';
  } else if(num >= 1048576) {
    return (num/1048576).toFixed(1) + 'MB';
  }
}

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
