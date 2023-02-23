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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>

</head>
<script>

    //주소찾기
    function execPostCode() {
        daum.postcode.load(function () {
            new daum.Postcode({
                oncomplete: function (data) {
                    var addr = '';

                    if (data.userSelectedType === 'R') {
                        addr = data.roadAddress;
                    } else {
                        addr = data.jibunAddress;
                    }
                    document.getElementById("address").value = '(' + data.zonecode + ') ' + addr;
                    document.getElementById("address_dtl").focus();
                }
            }).open();
        });
    }

    function selectEmail(ele) {
        var $ele = $(ele);
        var $email2 = $('input[name=email2]');

        // '1'인 경우 직접입력
        if ($ele.val() == "1") {
            $email2.attr('readonly', false);
            $email2.val('');
        } else {
            $email2.attr('readonly', true);
            $email2.val($ele.val());
        }
    }
    //
    // $.validator.addMethod("regex", function(value, element,regexpr){
    //     return regexpr.test(value);
    // });
    //
    // $(function () {
    //
    //     $("#frmApply").validate({
    //         ignore: "",
    //         rules: {
    //             cmpNm: {required: true},
    //             ceo: {required: true},
    //             fdate: {required: true},
    //             address: {required: true},
    //             telNo: {required: true},
    //             faxNo: {required: true},
    //             bizType: {required: true},
    //             capital: {required: true, digits : true},
    //             product: {required: true},
    //             mainProduct: {required: true},
    //             joinCmp: {required: true, digits : true},
    //             material: {required: true}
    //         },
    //         messages: {
    //             cmpNm: {required: "기업명을 입력하세요."},
    //             bizNo: {required: "사업자번호를 확인하세요.", remote: "이미 존재하는 사업자번호입니다.",  digits : "숫자만 입력하세요", minlength: "사업자번호를 확인하세요."},
    //             ceo: {required: "대표자명을 입력하세요."},
    //             fdate: {required: "설립일자를 입력하세요."},
    //             address: {required: "본사 주소를 입력하세요."},
    //             telNo: {required: "기업 전화번호를 입력하세요."},
    //             faxNo: {required: "기업 팩스를 입력하세요."},
    //             bizType: {required: "업종을 입력하세요."},
    //             capital: {required: "자본금을 입력하세요.",  digits : "숫자만 입력하세요"},
    //             product: {required: "주요 제품을 입력하세요."},
    //             mainProduct: {required: "주요 적용 제품을 입력하세요."},
    //             joinCmp: {required: "참여기업 수를 입력하세요.",  digits : "숫자만 입력하세요"},
    //             material: {required: "주요원재료를 입력하세요."},
    //             id: {
    //                 required: "아이디를 입력하세요",
    //                 remote: "이미 존재하는 아이디입니다."
    //             },
    //             name: {required: "담당자 성명을 입력하세요."},
    //             mbphno: {required: "담당자 전화번호를 입력하세요."},
    //             conQ: {required: "컨설팅시 주요 질의사항를 입력하세요."}
    //         },
    //     });
    // });
    //radio 체크로 display 변경
    function div_show(s,ss){

        if(s == "named"){
            document.getElementById(ss).style.display = "";
        }else{
            document.getElementById(ss).style.display = "none";

        }

    }

</script>
<style type="text/css">
    input.error, textarea.error{
        border:1px dashed red;
    }
    label.error{
        display:block;
        color:red;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu2"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    납품대금 연동제 동참하기
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
            <div id="company-write" class="content">
                <form:form modelAttribute="" action="joinRecom.do">
                    <div  style="text-align: center; font-size: 20px">
                    <span class="fw700">익명 신청</span><input type="radio" name="apply" value="anonymous" onclick="div_show(this.value,'divshow');" />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <span class="fw700">기명 신청</span><input type="radio" name="apply" value="named" onclick="div_show(this.value,'divshow');"/>
                    </div>
                    <div class="content" id="divshow" style="display:none;">
                        <br>
                <h2 class="title">신청 기업 정보(수탁기업)</h2>
                <div class="write-container">
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                기업명<span class="required">*</span>
                            </div>
                            <div class="input-wrap non-flex">
                                <input type="text" id="cmpNm" name="cmpNm" placeholder="기업명을 입력해주세요." required/>
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                대표자명<span class="required">*</span>
                            </div>
                            <div class="input-wrap non-flex">
                                <input type="text" id="ceo" name="ceo" laceholder="대표자명을 입력해주세요." required/>
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">
                            본사 주소<span class="required">*</span>
                        </div>
                        <div class="input-wrap non-flex address-input-wrap">
                            <input type="text" name="address" id="address" onclick="execPostCode()"
                                   readonly/>
                            <button type="button" class="btn" onclick="execPostCode()">주소찾기</button>
                            <input type="text" name="address_dtl" id="address_dtl" placeholder="상세주소"/>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                업종<span class="required">*</span>
                            </div>
                            <div class="input-wrap non-flex">
                                <input type="text" id="bizType" name="bizType" required/>
                                </td>
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                               대표 전화번호<span class="required">*</span>
                            </div>
                            <div class="input-wrap non-flex">
                                <input type="text" id="telNo" name="telNo" required/>
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label-full">
                            담당자 연락처
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">
                                이메일<span class="required">*</span>
                            </div>
                            <div class="input-wrap non-flex">
                                <input type="text" id="bizType" name="bizType" required/>
                                </td>
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">
                               사무실 전화<span class="required">*</span>
                            </div>
                            <div class="input-wrap non-flex">
                                <input type="text" id="telNo" name="telNo" required/>
                            </div>
                        </div>
                    </div>
            </div>
                    </div>
            <h2 class="title mt40">추천 기업 정보(위탁기업)</h2>
            <div class="write-container">
                <div class="line-wrap">
                    <div class="fx2">
                        <div class="label">
                            기업명
                        </div>
                        <div class="input-wrap">
                            <input type="text" id="deptNm" name="deptNm" placeholder="소속부서를 입력해주세요." />
                        </div>
                    </div>
                    <div class="fx2">
                        <div class="label">
                            대표자명
                        </div>
                        <div class="input-wrap">
                            <input type="text" id="position" name="position" placeholder="직위를 입력해주세요."/>
                        </div>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">
                        본사 주소<span class="required">*</span>
                    </div>
                    <div class="input-wrap non-flex address-input-wrap">
                        <input type="text" name="address" id="address" onclick="execPostCode()"
                               readonly/>
                        <button type="button" class="btn" onclick="execPostCode()">주소찾기</button>
                        <input type="text" name="address_dtl" id="address_dtl" placeholder="상세주소"/>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="fx2">
                        <div class="label">
                            업종<span class="required">*</span>
                        </div>
                        <div class="input-wrap non-flex">
                            <input type="text" id="bizType" name="bizType" required/>
                            </td>
                        </div>
                    </div>
                    <div class="fx2">
                        <div class="label">
                            대표 전화번호<span class="required">*</span>
                        </div>
                        <div class="input-wrap non-flex">
                            <input type="text" id="telNo" name="telNo" required/>
                        </div>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label-full">
                        담당자 연락처
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="fx2">
                        <div class="label">
                            이메일<span class="required">*</span>
                        </div>
                        <div class="input-wrap non-flex">
                            <input type="text" id="bizType" name="bizType" required/>
                            </td>
                        </div>
                    </div>
                    <div class="fx2">
                        <div class="label">
                            사무실 전화<span class="required">*</span>
                        </div>
                        <div class="input-wrap non-flex">
                            <input type="text" id="telNo" name="telNo" required/>
                        </div>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">
                       추천사유
                    </div>
                    <div class="input-wrap non-flex">
                        <input type="text" id="telNo" name="telNo" required/>
                    </div>
                </div>
            </div>
            </form:form>
            <div class="write-bottom">
                <button id="apply" class="submit" style="width:130px">추천하기</button>
                <a href="${pageContext.request.contextPath}/join/joinMain.do" class="back">취소</a>
            </div>
        </div>
    </div>
</div>
</div>