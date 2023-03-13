<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<head>
    <title>중소벤처기업부 | 동행기업 참여 추천</title>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>

</head>
<script>
    //radio 체크로 display 변경
    function div_show(s, ss) {

        if (s == "agree") {
            document.getElementById(ss).style.display = "";
        } else {
            document.getElementById(ss).style.display = "none";
        }
    }

    window.onload = function date() {
        var time = new Date();
        var Target = document.getElementById("date");
        var year = time.getFullYear();
        var month = time.getMonth() + 1;
        var date = time.getDate();
        var msg = year + '년 ' + month + '월 ' + date + '일';
        Target.innerText = msg;
    }

    function selectEmail(ele) {
        var $ele = $(ele);
        var $email = $('input[name=apply_email2]');

        // '1'인 경우 직접입력
        if ($ele.val() == "1") {
            $email.attr('readonly', false);
            $email.val('');
        } else {
            $email.attr('readonly', true);
            $email.val($ele.val());
        }
    }

    function selectEmail2(ele) {
        var $ele = $(ele);
        var $email2 = $('input[name=rcmd_email2]');

        // '1'인 경우 직접입력
        if ($ele.val() == "1") {
            $email2.attr('readonly', false);
            $email2.val('');
        } else {
            $email2.attr('readonly', true);
            $email2.val($ele.val());
        }
    }

    function printName() {
        const name = document.getElementById('apply_cmpNm').value;
        $('#result').attr('value', name);
    }

    $(function () {
        $('#apply').on('click', function () {
            var apply_bizno = $("#app_bizNo1").val() + $("#app_bizNo2").val() + $("#app_bizNo3").val();
            $('input[name=apply_bizno]').attr('value', apply_bizno);

            var rcmd_bizno = $("#rcmd_bizNo1").val() + $("#rcmd_bizNo2").val() + $("#rcmd_bizNo3").val();
            $('input[name=rcmd_bizno]').attr('value', rcmd_bizno);

            var apply_email = $("#apply_email1").val() + '@' + $("#apply_email2").val();
            $('input[name=apply_email]').attr('value', apply_email);

            var rcmd_email = $("#rcmd_email1").val() + '@' + $("#rcmd_email2").val();
            $('input[name=rcmd_email]').attr('value', rcmd_email);

            $("#frmRecom").submit();
        });
    });

    $(function () {
        $("#frmRecom").validate({
            ignore: "",
            rules: {
                apply: {required: true},
                status: {required: true},
                apply_cmpNm: {required: true},
                apply_bizno: {required: true, digits: true, minlength: 10},
                apply_ceo: {required: true},
                apply_telNo: {required: true},
                apply_email: {required: true},
                rcmd_cmpNm: {required: true},
                rcmd_bizno: {required: true, digits: true, minlength: 10},
                rcmd_telNo: {required: true},
                rcmd_email: {required: true},
                rcmd_detail: {required: true}
            },
            messages: {
                apply: {required: "동의 여부를 선택해주세요."},
                status: {required: "공개 여부를 선택해주세요."},
                apply_cmpNm: {required: "기업명을 입력하세요."},
                apply_bizno: {required: "사업자번호를 확인하세요.", digits: "숫자만 입력하세요", minlength: "사업자번호를 확인하세요."},
                apply_ceo: {required: "대표자명을 입력하세요."},
                apply_telNo: {required: "전화번호를 입력하세요."},
                apply_email: {required: "이메일을 입력하세요."},
                rcmd_cmpNm: {required: "기업명을 입력하세요."},
                rcmd_bizno: {required: "사업자번호를 확인하세요.", digits: "숫자만 입력하세요", minlength: "사업자번호를 확인하세요."},
                rcmd_telNo: {required: "전화번호를 입력하세요."},
                rcmd_email: {required: "이메일을 입력하세요."},
                rcmd_detail: {required: "추천사유를 입력하세요."}
            },
            errorPlacement : function(error, element) {
                if (element.is(":radio")) {
                    element.parent().after(error);
                } else {
                    element.after(error);
                }
            },
        });
    });


</script>
<style type="text/css">
    input.error, textarea.error {
        border: 1px dashed red;
    }

    label.error {
        display: block;
        color: red;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_join"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    동행기업
                </li>
                <li>
                    동행기업 참여 추천
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 참여 추천</h1>
                <div class="side-wrap">
                </div>
            </div>
            <form:form name="frmRecom" id="frmRecom" action="recom.do" method="post">
            <div id="about" class="content concept">
                <!-- 컨텐츠 start -->
                <section class="temp">
                    <div class="page">
                        <h1>기업정보 수집·이용 동의</h1>
                        <h3>
                            ※ 기업정보 수집·이용 동의서는 신청된 납품대금 연동제 관련 업무에 활용되며, 기타 다른 목적으로 사용되지 않음을 명시합니다.
                            <br>
                            <br>
                            <ol>
                                <li> 기업정보 수집 목적 : 납품대금 연동제 동행기업 추천 자료 확보 등
                                </li>
                                <li>
                                    기업정보 수집 항목 : 신청기업의 기본정보(기업명, 사업자등록번호, 연락처 등)
                                </li>
                                <li>
                                    개인정보 활용 기관 : 중소벤처기업부, 공정거래위원회, 대·중소기업·농어업협력재단, 납품대금 연동 확산 지원본부(추후지정)
                                </li>
                                <li>
                                    동의서 효력기간 : 본 동의서 제출 시점부터 3년까지 보유·이용
                                </li>
                            </ol>
                            <br>
                            <h3 style="text-align: center"> 납품대금 연동제 동행기업 추천을 위해 상단의 자료를 해당 기관에 제공하는 것을 동의합니다.</h3>
                            <br>
                            <div style="text-align:right">
                                <span>동의함</span><input type="radio" name="apply" value="agree"
                                                       onclick="div_show(this.value,'divshow');"/>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                <span>동의하지 않음</span><input type="radio" name="apply" value="disagree"
                                                           onclick="div_show(this.value,'divshow');"/>
                            </div>
                        </h3>
                    </div>

                    <div class="content" id="divshow" style="display:none;">
                        <div id="company-write" class="content">
                            <h2 class="title mt40">납품대금 연동제 동행기업 참여 추천서</h2>
                            <div class="box-container">
                                수탁기업이 위탁기업의 납품대금 연동제 ‘동행기업’ 참여를 추천하는 양식입니다. 중소벤처기업부와 대·중소기업·농어업협력재단이 추천해주신 위탁기업에 신청기업과
                                연동 약정을 체결하고 동행기업에 참여하도록 독려할 예정입니다.
                                <br>
                                ‘공개 여부’에 ‘비공개’로 선택하면 위탁기업 측에는 신청기업명이 밝혀지지 않으며 위탁기업이 자율적으로 선택한 수탁기업과 동행기업에 참여하도록 안내됩니다.
                                <br>
                                많은 관심과 추천 부탁드립니다.<br>
                                <h3 style="text-align: center">
                                    <strong>[공개 여부]<span style="color: #E60024;">*</span>&nbsp;&nbsp;
                                        <span>공개</span><input type="radio" name="status" value="Y"/>
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <span>비공개</span><input type="radio" name="status" value="N"/>
                                    </strong>
                                </h3>
                            </div>
                            <div class="write-container">
                                <div class="line-wrap">
                                    <div class="label-full">
                                        추천 신청 기업 정보(수탁기업)
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="fx2">
                                        <div class="label">
                                            기업명<span class="required">*</span>
                                        </div>
                                        <div class="input-wrap non-flex">
                                            <input type="text" id="apply_cmpNm" name="apply_cmpNm" onkeyup='printName()'
                                                   required/>
                                        </div>
                                    </div>
                                    <div class="fx2">
                                        <div class="label">
                                            사업자 번호
                                        </div>
                                        <div class="input-wrap non-flex">
                                            <td>
                                                <input class="multi" type="text" id="app_bizNo1" name="app_bizNo1"
                                                       maxlength="3"/>
                                                <span>-</span>
                                                <input class="multi" type="text" id="app_bizNo2" name="app_bizNo2"
                                                       maxlength="2"/>
                                                <span>-</span>
                                                <input class="multi" type="text" id="app_bizNo3" name="app_bizNo3"
                                                       maxlength="5"/>
                                                <input type="hidden" id="apply_bizno" name=apply_bizno value="">

                                        </div>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">
                                        이메일<span class="required">*</span>
                                    </div>
                                    <div class="input-wrap ">
                                        <input type="text" class="multi" name="apply_email1" id="apply_email1"/>
                                        <span>@</span>
                                        <input type="text" style="width: 130px" name="apply_email2" id="apply_email2"/>
                                        <select id="apply_email3" style="width: 130px"
                                                onclick="selectEmail(this)">
                                            <option value="1">직접입력</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="daum.net">daum.net</option>
                                            <option value="gmail.com">gmail.com</option>
                                        </select>
                                        <input type="hidden" value="" id="apply_email" name="apply_email">
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">
                                        전화번호<span class="required">*</span>
                                    </div>
                                    <div class="input-wrap non-flex">
                                        <input type="text" id="apply_telNo" name="apply_telNo" required/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label-full">
                                        추천 기업 정보(위탁기업)
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="fx2">
                                        <div class="label">
                                            기업명<span class="required">*</span>
                                        </div>
                                        <div class="input-wrap non-flex">
                                            <input type="text" id="rcmd_cmpNm" name="rcmd_cmpNm" required/>
                                        </div>
                                    </div>
                                    <div class="fx2">
                                        <div class="label">
                                            사업자 번호
                                        </div>
                                        <div class="input-wrap non-flex">
                                            <td>
                                                <input class="multi" type="text" id="rcmd_bizNo1" name="rcmd_bizNo1"
                                                       maxlength="3"/>
                                                <span>-</span>
                                                <input class="multi" type="text" id="rcmd_bizNo2" name="rcmd_bizNo2"
                                                       maxlength="2"/>
                                                <span>-</span>
                                                <input class="multi" type="text" id="rcmd_bizNo3" name="rcmd_bizNo3"
                                                       maxlength="5"/>
                                                <input type="hidden" id="rcmd_bizno" name=rcmd_bizno value="">

                                        </div>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">
                                        이메일<span class="required">*</span>
                                    </div>
                                    <div class="input-wrap ">
                                        <input type="text" class="multi" name="rcmd_email1" id="rcmd_email1"/>
                                        <span>@</span>
                                        <input type="text" style="width: 130px" name="rcmd_email2" id="rcmd_email2"/>
                                        <select id="rcmd_email3" style="width: 130px"
                                                onclick="selectEmail2(this)">
                                            <option value="1">직접입력</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="daum.net">daum.net</option>
                                            <option value="gmail.com">gmail.com</option>
                                        </select>
                                        <input type="hidden" value="" id="rcmd_email" name="rcmd_email">

                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">
                                        전화번호<span class="required">*</span>
                                    </div>
                                    <div class="input-wrap non-flex">
                                        <input type="text" id="rcmd_telNo" name="rcmd_telNo" required/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">
                                        추천사유
                                    </div>
                                    <div class="input-wrap non-flex">
                                        <input type="text" id="rcmd_detail" name="rcmd_detail" required/>
                                    </div>
                                </div>
                            </div>
                            <br>
<%--                            <h4 style="text-align: center">위와 같이 위탁기업의 납품대금 연동제 동행기업 참여를 추천합니다.</h4><br>--%>
<%--                            <p style="text-align: right">--%>
<%--                            <h4 id="date" style="text-align: right"></h4>--%>
<%--                            <div class="write-area" style="text-align: right">--%>
<%--                                <h4>--%>
<%--                                    기업명 : <input id="result" type="text" value="" readonly><br>--%>
<%--                                    대표자명 : <input type="text" name="apply_ceo"><br>--%>
<%--                                </h4><br>--%>
<%--                                <h2 style="text-align: center"> 대·중소기업·농어업협력재단 사무총장 귀하</h2>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                    </form:form>
                    <div class="write-bottom">
                        <button id="apply" class="submit">추천하기</button>
                        <a href="${pageContext.request.contextPath}/join/joinMain.do" class="back">취소</a>
                    </div>
            </div>
        </div>
    </div>
</div>