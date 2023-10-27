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
    <title>중소벤처기업부 | 담당자 신청</title>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>

</head>
<script>

    $(function () {
        $("select[name=selectEmail]").on("change", function(){
            var $email2 = $('input[name=email2]');
            if ($(this).val() == "1") {
                $email2.val('');
                $email2.prop("readonly",false);

            } else {
                $email2.val($(this).val());
                $email2.prop("readonly",true);
            }
        });

        $('#apply').on('click', function () {
            var bizNo = $("#bizNo1").val() + $("#bizNo2").val() + $("#bizNo3").val();
            $('input[name=bizNo]').attr('value', bizNo);

            var email =$("#email1").val() + $("#email2").val();
            $('input[name=email]').attr('value', email);
            $('#mbrApply').submit();
        });
    });

    $.validator.addMethod("regex", function(value, element,regexpr){
        return regexpr.test(value);
    });

    $(function () {

        $("#mbrApply").validate({
            ignore: "",
            rules: {
                cmpNm: {required: true},
                bizNo: {required: true, digits : true, minlength :10,
                    remote: {
                        type: "post"
                        , url: "${pageContext.request.contextPath}/join/checkBizno.do"
                        , data: {
                            username: function () {
                                return $("#bizNo").val();
                            }
                        }
                    }
                },
                id: {
                    required: true, remote: {
                        type: "post"
                        , url: "${pageContext.request.contextPath}/main/checkId.do"
                        , data: {
                            username: function () {
                                return $("#id").val();
                            }
                        }
                    }
                },
                passwd: {required: true, regex: /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{4,10}$/ },
                passwdChk: {required: true, equalTo: "#passwd"},
                email: {required: true},
                name: {required: true},
                mbphno: {required: true},
            },
            messages: {
                cmpNm: {required: "기업명을 입력하세요."},
                bizNo: {required: "사업자번호를 확인하세요.", remote: "이미 존재하는 사업자번호입니다.", digits : "숫자만 입력하세요", minlength: "사업자번호를 확인하세요."},
                id: {
                    required: "아이디를 입력하세요",
                    remote: "이미 존재하는 아이디입니다."
                },
                name: {required: "담당자 성명을 입력하세요."},
                mbphno: {required: "전화번호를 입력하세요."},
                passwd: {required: "비밀번호를 입력하세요.",
                    regex:"비밀번호는 4~10자의 영문소문자, 숫자, 특수문자를 조합하여 사용해야 합니다."},
                passwdChk: {required: "비밀번호를 재입력하세요.", equalTo: "비밀번호 불일치"},
                email: {required: "이메일을 입력하세요."}
            },
        });
    });

</script>
<style>
    label.error {
        display: block;
        color: red;
    }
    .line-wrap {
        display: flex;
        border-bottom: 1px solid #505050;
        width: 100%;
        min-width: 600px;
    }
    .line-wrap .label{
        background: rgba(145, 145, 145, 0.1);
        padding: 16px 8px;
        box-sizing: border-box;
        font-size: 16px;
        line-height: 24px;
        color: #191919;
        text-align: center;
        width: 150px;
        font-weight: 500;
    }
   .line-wrap .label .required {
       color: #E60024;
       margin-left: 2px;
   }
    .fx2{
        width: 50% !important;
        display: flex;
    }
    .line-wrap .input-wrap{
        width: calc(100% - 150px);
        padding:10px; !important;
        box-sizing: border-box;
        display: flex;
        align-items: center;
        margin: 0 !important;
    }
    .line-wrap .multi {
        width: 87px !important;
    }
    .line-wrap .non-flex{
        display: unset;
    }
    .line-wrap input{
        border: none;
        outline: none;
        font-size: 16px;
        padding: 18px 16px;
        box-sizing: border-box;
        width: 100%;
        color: #505050;
    }
    .line-wrap select{
        border: 1px solid #DDDDDD;
        border-radius: 5px;
        width: 200px;
        font-size: 16px;
        padding: 14px 16px;
        margin-top: 14px;
    }
</style>
<div id="content" class="bg-top">
    <div id="login" style="max-width: 960px;">
        <div class="breadcromb mb40">
            <h4>
                <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                <a href="${pageContext.request.contextPath}">홈</a>
                <img class="right-icon" src="${pageContext.request.contextPath}/images/common/right-icon.png" alt="목차 아이콘"/>
                담당자 신청
            </h4>
        </div>
        <p class="title mb40"> 담당자 신청</p>

        <form:form modelAttribute="mbrApply" action="mbrApply.do">
            <div id="company-write" style="border-top: 2px solid #505050;border-bottom: 2px solid #505050;">
                <div class="line-wrap">
                    <div class="fx2">
                        <div class="label">
                            소속 기업명<span class="required">*</span>
                        </div>
                        <div class="input-wrap non-flex">
                            <input type="text" id="cmpNm" name="cmpNm" placeholder="기업명을 입력해주세요." required/>
                        </div>
                    </div>
                    <div class="fx2">
                        <div class="label">
                            사업자 번호<span class="required">*</span>
                        </div>
                        <div class="input-wrap non-flex">
                            <td>
                                <input class="multi" type="text" id="bizNo1" name="bizNo1" maxlength="3"/>
                                <span>-</span>
                                <input class="multi" type="text" id="bizNo2" name="bizNo2" maxlength="2"/>
                                <span>-</span>
                                <input class="multi" type="text" id="bizNo3" name="bizNo3" maxlength="5"/>
                                <input type="hidden" id="bizNo" name=bizNo value="" >

                        </div>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">
                        성명<span class="required">*</span>
                    </div>
                    <div class="input-wrap  non-flex">
                        <input type="text" name="name" id="name" placeholder="성명을 입력해주세요." required/>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="fx2">
                        <div class="label">
                            소속 부서
                        </div>
                        <div class="input-wrap non-flex">
                            <input type="text" id="deptNm" name="deptNm" placeholder="소속부서를 입력해주세요." />
                        </div>
                    </div>
                    <div class="fx2">
                        <div class="label">
                            직위
                        </div>
                        <div class="input-wrap non-flex">
                            <input type="text" id="position" name="position" placeholder="직위를 입력해주세요."/>
                        </div>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">
                        전화번호<span class="required">*</span>
                    </div>
                    <div class="input-wrap  non-flex">
                        <input type="text" id="mbphno" name="mbphno"/>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">
                        이메일(회사계정)<span class="required">*</span>
                    </div>
                    <div class="input-wrap non-flex">
                        <input type="text" class="multi" name="email1" id="email1"/>
                        <span>@</span>
                        <input type="text" style="width: 130px" name="email2" id="email2"/>
                        <select id="selectEmail" name="selectEmail" style="width: 130px" >
                            <option value="1">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="gmail.com">gmail.com</option>
                        </select>
                        <input type="hidden" value="" id="email" name="email">

                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">
                        사무실 전화
                    </div>
                    <div class="input-wrap non-flex">
                        <input type="text" id="memTelNo" name="memTelNo"/>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label">팩스</div>
                    <div class="input-wrap non-flex">
                        <input type="text" id="memFaxNo" name="memFaxNo"/>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="label label-long">
                        사용자 ID<span class="required">*</span>
                    </div>
                    <div class="input-wrap  non-flex long-input">
                        <input type="text" name="id" id="id" placeholder="ID를 입력해주세요." required/>
                    </div>
                </div>
                <div class="line-wrap">
                    <div class="fx2">
                        <div class="label label-long">
                            비밀번호<span class="required">*</span>
                        </div>
                        <div class="input-wrap  non-flex long-input">
                            <input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요." required>
                            <h5 class="sub">※ 비밀번호는 4~10자의 영문소문자, 숫자, 특수문자를 조합하여 사용해야 합니다.</h5>
                        </div>
                    </div>
                    <div class="fx2">
                        <div class="label label-long">
                            비밀번호 재입력<span class="required">*</span>
                        </div>
                        <div class="input-wrap  non-flex long-input">
                            <input type="password" id="passwdChk" name="passwdChk" placeholder="비밀번호를 재입력해주세요."
                                   required/>
                        </div>
                    </div>
                </div>
            </div>
            </form:form>
            <div class="write-bottom">
                <button id="apply" class="submit" style="width:130px">등록</button>
                <a href="${pageContext.request.contextPath}/main/index.do" class="back">취소</a>
            </div>
        </div>
    </div>
</div>
</div>