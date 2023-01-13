<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title>로그인</title>
</head>
<script>

    $(function () {
        $("#frmLogin").validate({
            ignore: "",
            rules: {
                memId: {required: true},
                memPwd: {required: true}
            },
            onkeyup: false,
            onclick: false,
            onfocusout: false,
            messages: {
                memId: {required: "아이디를 입력하세요."},
                memPwd: {required: "패스워드를 입력하세요"}
            },
            submitHandler: function (frm) {
                frm.submit();
            },
            showErrors: function (errorMap, errorList) {
                if (!$.isEmptyObject(errorList)) {
                    $.each(errorList, function () {
                        alert(this.message);
                        //$('#modalAlert').modal('show');
                        return false;
                    });
                    //this.defaultShowErrors();
                }
            }
        });

    });

</script>

<!-- container -->
<div id="content" class="bg-top">
    <div id="login">
        <div class="breadcromb mb40">
            <h4>
                <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                <a href="/">홈</a>
                <img class="right-icon" src="${pageContext.request.contextPath}/images/common/right-icon.png" alt="목차 아이콘"/>
                로그인
            </h4>
        </div>
        <p class="title mb40">로그인</p>
        <h3 class="fw400 mb40 point4-text tc">
            납품대금 연동제 홈페이지에 오신 것을 환영합니다.<br>
            로그인 후 서비스를 이용하실 수 있습니다.
        </h3>
        <form name="frmLogin" id="frmLogin" method="post" action="${pageContext.request.contextPath}/main/login.do">
            <div class="input-container">
                <div class="input-wrap">
                    <input type="text" name="id" id="id" class="mb20" placeholder="아이디를 입력하세요." required />
                    <input type="password" name="passwd" id="passwd" placeholder="비밀번호를 입력하세요." required />
                </div>
                <div class="submit-wrap" tabindex="0">
                    <img class="mb10" src="${pageContext.request.contextPath}/images/common/Login.png" alt="로그인">
                    <h4 class="text-white">로그인</h4>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- // container -->

