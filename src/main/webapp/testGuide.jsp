<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<h1>test guide</h1>
<%--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String systemTitle = "협업정보시스템";
    String targetUrl = "https://www.smes.go.kr/cobiz";
    String redirectUrl = request.getContextPath() + "/index.do";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="robots" content="noindex">
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
            background: url(https://www.smes.go.kr/humanframe/theme/portal/assets/image/etc/logo_smes.png) no-repeat center center;
        }
        .smes_wrapper .v-box .logo-element strong {
            color: red;
            font-weight: bold;
        }
        .logo-element {
            width: 1000px !important;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mousetrap/1.6.5/mousetrap.js"></script>
    <script>
        Mousetrap.bind('ctrl+shift+x', function (e) {
            document.cookie = "TESTGUIDEOK=1";
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
                이곳은 <%= systemTitle%> <strong>테스트 사이트</strong>입니다.<br>
                <%= systemTitle %>에 방문하시려면
                <a href="<%= targetUrl %>"><%= targetUrl %></a>로 이동하세요.
            </div>
        </div>
    </div>
</div>
</body>
</html>
--%>