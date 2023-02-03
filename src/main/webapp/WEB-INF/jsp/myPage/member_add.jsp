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
    <title></title>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/temp.css"/>">
</head>
<script>

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
    function emailChk(frm) {
        var email1 = $("#email1").val();
        var email2 = $("#email2").val();
        var result = email1+email2;
        $("#email").val(result);
        return frm.submit;
    }
    $.validator.addMethod("regex", function (value, element, regexpr) {
        return regexpr.test(value);
    });

    $(function () {
        $("#frmWrite").validate({
            ignore: "",
            rules: {
                name: {required: true},
                mbphno: {required: true, digits : true},
                email: {required: true},
                id: {
                    required: true, remote: {
                        type: "post"
                        , url: "${pageContext.request.contextPath}/join/checkId.do"
                        , data: {
                            username: function () {
                                return $("#id").val();
                            }
                        }
                    }
                },
                passwd: {required: true, regex: /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{4,10}$/},
                passwdChk: {required: true, equalTo: "#passwd"},
            },
            messages: {
                name: {
                    required: "이름을 입력하세요"},
                mbphno: {required: "전화번호를 입력하세요.",  digits : "숫자만 입력하세요"},
                email: {required: "이메일을 입력하세요."},
                id: {
                    required: "아이디를 입력하세요",
                    remote: "이미 존재하는 아이디입니다."
                },
                passwd: {
                    required: "비밀번호를 입력하세요.",
                    regex: "비밀번호는 4~10자의 영문소문자, 숫자, 특수문자를 조합하여 사용해야 합니다."
                },
                passwdChk: {required: "비밀번호를 재입력하세요.", equalTo: "비밀번호 불일치"},
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
        <page:applyDecorator name="menu_myPage"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>마이페이지</li>
                <li>담당자 추가</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">담당자 추가</h1>
                <div class="side-wrap">
                </div>
            </div>

            <div id="company-write" class="content">
                <form:form name="frmWrite" id="frmWrite" method="post" action="memAdd.do">

                    <div class="write-container">
                        <div class="line-wrap">
                            <div class="label">
                                성명<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="name" id="name" placeholder="성명을 입력해주세요."/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    소속 부서
                                </div>
                                <div class="input-wrap">
                                    <input type="text" id="deptNm" name="deptNm" placeholder="소속부서를 입력해주세요." />
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    직위
                                </div>
                                <div class="input-wrap">
                                    <input type="text" id="position" name="position" placeholder="직위를 입력해주세요."
                                           />
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                전화번호<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="mbphno" name="mbphno" />
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                이메일<span class="required">*</span>
                            </div>
                            <div class="input-wrap ">
                                <input type="text" class="multi" name="email1" id="email1" />
                                <span>@</span>
                                <input type="text" style="width: 130px" name="email2" id="email2" />
                                <select id="email3" style="width: 130px"
                                        onclick="selectEmail(this)">
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
                            <div class="input-wrap">
                                <input type="text" id="memTelNo" name="memTelNo"/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">팩스</div>
                            <div class="input-wrap">
                                <input type="text" id="memFaxNo" name="memFaxNo"/>
                            </div>
                        </div>
                        <h2 class="title mt40">회원가입 정보</h2>
                        <div class="write-container">
                            <div class="line-wrap">
                                <div class="label label-long">
                                    사용자 ID<span class="required">*</span>
                                </div>
                                <div class="input-wrap long-input">
                                    <input type="text" name="id" id="id" placeholder="ID를 입력해주세요." required/>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="fx2">
                                    <div class="label label-long">
                                        비밀번호<span class="required">*</span>
                                    </div>
                                    <div class="input-wrap long-input">
                                        <input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요."
                                               required>
                                        <h5 class="sub">※ 비밀번호는 4~10자의 영문소문자, 숫자, 특수문자를 조합하여 사용해야 합니다.</h5>
                                    </div>
                                </div>
                                <div class="fx2">
                                    <div class="label label-long">
                                        비밀번호 재입력<span class="required">*</span>
                                    </div>
                                    <div class="input-wrap long-input">
                                        <input type="password" id="passwdChk" name="passwdChk"
                                               placeholder="비밀번호를 재입력해주세요."
                                               required/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="write-bottom">
                        <button onclick="emailChk(this.form)"  class="submit" style="width: 130px">등록</button>
                        <a href="${pageContext.request.contextPath}/main/management.do" class="go-lst">취소</a>
                    </div>
                </form:form>

            </div>
        </div>
    </div>
</div>
