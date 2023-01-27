<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <title></title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/temp.css"/>">
</head>
<script>
    // submit
    function fn_submit() {

        var frm = document.getElementById('frmWrite');

        if (frm.name.value == "") {
            alert("작성자를 입력하세요.");
            return false;
        }
        if (frm.id.value == "") {
            alert("공개여부를 선택하세요.");
            return false;
        }
        if (frm.passwd.value == "" && document.getElementById('ChkBox2').checked) {
            alert("비밀번호를 입력하세요.");
            return false;
        }
        if (frm.title.value == "") {
            alert("제목을 입력하세요.");
            return false;
        }

        $("#frmWrite").submit();
    }

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
    $.validator.addMethod("regex", function(value, element,regexpr){
        return regexpr.test(value);
    });

    $(function () {

        $("#frmWrite").validate({
            ignore: "",
            rules: {
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
                passwd: {required: true, regex: /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{4,10}$/ },
                passwdChk: {required: true, equalTo: "#passwd"},
            },
            messages: {
                id: {
                    required: "아이디를 입력하세요",
                    remote: "이미 존재하는 아이디입니다."
                },
                passwd: {required: "비밀번호를 입력하세요.",
                    regex:"비밀번호는 4~10자의 영문소문자, 숫자, 특수문자를 조합하여 사용해야 합니다."},
                passwdChk: {required: "비밀번호를 재입력하세요.", equalTo: "비밀번호 불일치"},
            }
        });
    });
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
                <div class="write-container">
                    <form name="frmWrite" id="frmWrite" method="post"
                          action="${pageContext.request.contextPath}/main/memAdd.do">
                        <div class="line-wrap">
                            <div class="label">
                                성명
                            </div>
                            <div class="input-wrap">
                                <input type="text" name="name" id="name" placeholder="성명을 입력해주세요." required/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    소속 부서
                                </div>
                                <div class="input-wrap">
                                    <input type="text" id="deptNm" name="deptNm" placeholder="소속부서를 입력해주세요." required/>
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    직위
                                </div>
                                <div class="input-wrap">
                                    <input type="text" id="position" name="position" placeholder="직위를 입력해주세요."
                                           required/>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                전화번호
                            </div>
                            <div class="input-wrap">
                                <input type="text" id="mbphno" name="mbphno" required/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                이메일
                            </div>
                            <div class="input-wrap ">
                                <input type="text" class="multi" name="email1" id="email1" required/>
                                <span>@</span>
                                <input type="text" style="width: 130px" name="email2" id="email2" required/>
                                <select id="email3" style="width: 130px"
                                        onclick="selectEmail(this)">
                                    <option value="1">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="gmail.com">gmail.com</option>
                                </select>
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
                    </form>
                </div>
                <div class="write-bottom">
                    <button type="submit" class="submit" style="width: 130px">등록</button>
                    <a href="${pageContext.request.contextPath}/main/management.do" class="go-lst">취소</a>
                </div>
            </div>
        </div>
    </div>
</div>
