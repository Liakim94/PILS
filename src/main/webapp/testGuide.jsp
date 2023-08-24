<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 사이트명 설정.
    // ex) String systemTitle = "중소기업 수위탁거래 종합포털";
    String systemTitle = "중소벤처기업부 남품대금연동제 홈페이지";

    // 운영 사이트 설정.
    // ex) String targetUrl = "https://www.smes.go.kr/poll";
    String targetUrl = "https://www.smes.go.kr/pis";

    // 테스트 사이트 메인 페이지 설정.
    // ex) String redirectUrl = request.getContextPath() + "/main/main.do";
    String redirectUrl = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="robots" content="noindex">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <title><%= systemTitle %> 테스트 사이트</title>
    <link rel="stylesheet" href="https://www.smes.go.kr/humanframe/theme/portal/assets/style/common.css?dummy=20201231100842706" type="text/css">
    <link rel="stylesheet" href="https://www.smes.go.kr/humanframe/theme/portal/assets/style/main.css?dummy=20201231100842706" type="text/css">
    <link rel="stylesheet" href="https://www.smes.go.kr/humanframe/theme/portal/assets/style/custom.css?dummy=20201231100842706" type="text/css">
    <link rel="stylesheet" href="https://www.smes.go.kr/resources/theme/portal/assets/style/common.css?dummy=20201231104622776" type="text/css">
    <link rel="stylesheet" href="https://www.smes.go.kr/resources/theme/portal/assets/style/main.css?dummy=20201231104622776" type="text/css">
    <link rel="stylesheet" href="https://www.smes.go.kr/resources/theme/portal/assets/style/custom.css?dummy=20201231104622776" type="text/css">
    <style>
        .smes_wrapper .v-box .logo-element .inner {
            height: 95px;
            background: url(https://www.mss.go.kr/images/np/bg_logo.png) no-repeat center center;
        }
        .smes_wrapper .v-box .logo-element strong {
            color: red;
            font-weight: bold;
        }
        .logo-element {
            width: 100% !important;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mousetrap/1.6.5/mousetrap.js"></script>
    <script>
        Mousetrap.bind('ctrl+shift+x', function (e) {
            <%-- web.xml에 정의한 cookieName과 동일한 값의 쿠키명을 입력! --%>
            document.cookie = "GUIDEOK=1";
            document.location = '<%= redirectUrl %>';
        });
    </script>
</head>
<body>
<div class="smes_wrapper" id="smes" style="">
    <div class="v-box">
        <div class="logo-element">
            <div class="inner"></div>
            <div class="error-txt">
                이곳은 <%= systemTitle%> <strong id="ok-target">테스트 사이트</strong>입니다.<br>
                <%= systemTitle %>에 방문하시려면
                <a href="<%= targetUrl %>"><%= targetUrl %></a>로 이동하세요.
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("ok-target").addEventListener("touchend", function(e) {
        document.cookie = "GUIDEOK=1";
        document.location = '<%= redirectUrl %>';
    });
    document.getElementById("ok-target").addEventListener("click", function(e) {
        if (e.shiftKey) {
            document.cookie = "GUIDEOK=1";
            document.location = '<%= redirectUrl %>';
        }
    });
</script>
</body>
</html>
