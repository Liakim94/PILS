<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>

<head>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>
</head>
<script>

    $.validator.addMethod("regex", function (value, element, regexpr) {
        return regexpr.test(value);
    });
    $(function () {
        $("#frmChange").validate({
            ignore: "",
            rules: {
                pw1: {required: true, regex: /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{4,10}$/},
                passwd: {required: true, equalTo: "#pw1"},
            },
            onkeyup: false,
            onclick: false,
            onfocusout: false,
            messages: {
                pw1: {
                    required: "비밀번호를 입력하세요.",
                    regex: "비밀번호는 4~10자의 영문소문자, 숫자, 특수문자를 조합하여 사용해야 합니다."
                },
                passwd: {required: "비밀번호를 재입력하세요.", equalTo: "비밀번호 불일치"}
            },
            showErrors: function (errorMap, errorList) {
                if (!$.isEmptyObject(errorList)) {
                    $.each(errorList, function () {
                        alert(this.message);
                        return false;
                    });
                }
            }
        });
    });
</script>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_myPage"/>
        <form:form name="frmChange" id="frmChange" method="POST" action="changePw.do">

        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>마이페이지</li>
                <li>담당자 정보 수정</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">비밀번호 변경</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="company-write" class="content">
                <div class="write-container">
                    <div class="line-wrap">
                        <input type="hidden" id=id name="id" value="${sessionId}">
                        <div class="fx2">
                            <div class="label">비밀번호</div>
                            <div class="input-wrap">
                                <input type="text" class="uni_input_text wdh100" name="pw1" id="pw1"/>
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label label-long">비밀번호 재입력</div>
                            <div class="input-wrap long-input">
                                <input type="text" class="uni_input_text wdh100" id="passwd" name="passwd"/>
                            </div>
                        </div>
                    </div>
                    </form:form>
                </div>
                <div class="write-bottom">
                    <button type="submit" class="submit">저장</button>
                    <a href="${pageContext.request.contextPath}/main/management.do" class="back">취소</a>
                </div>
            </div>
        </div>
    </div>
</div>

