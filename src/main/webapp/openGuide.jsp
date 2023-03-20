<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 사이트 명 설정.
    // ex) String systemTitle = "중소기업 수출지원센터";
    String systemTitle = "중소벤처기업부 납품대금연동제 홈페이지";

    // 현재 운영중인 AS-IS 사이트 설정.
    // 10초 후 해당 사이트로 자동 이동한다.
    // ex) String targetUrl = "https://www.smes.go.kr/poll";
    String targetUrl = "https://www.smes.go.kr/pis";

    // TO-BE 메인 페이지 설정.
    // ex) String redirectUrl = request.getContextPath() + "/main/main.do";
    String redirectUrl = request.getContextPath() + "/";

    // 정식 오픈일에 맞춰 처리 하도록 함.
    // targetDt를 오늘 이전으로 설정하면 바로 /main/main.do로 이동하고
    // targetDt의 년도를 9999년으로 설정하면 현재 운영사이트로 카운트 다운 처리하고
    // targetDt가 오늘 이후이고 9999년 보다 작으면 오픈 준비중 화면을 출력한다.
    // ※ 오픈 일자가 정해지지 않았다면 년도를 9999년으로 설정하자!
    // ※ targetDt의 설정 일자는 web.xml에 정의한 OpenGuideFilter에 설정된 openDateTime 값과 동일하여야 한다.
    LocalDateTime targetDt  = LocalDateTime.parse("2023-03-20T14:00:00");
    LocalDateTime currentDt = LocalDateTime.now();
    if (currentDt.isAfter(targetDt)) {
        response.sendRedirect(redirectUrl);
    }
    else {
%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="robots" content="noindex">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <title><%= systemTitle %></title>
    <link rel="stylesheet" href="https://www.smes.go.kr/humanframe/theme/portal/assets/style/common.css?dummy=20201231100842706" type="text/css">
    <link rel="stylesheet" href="https://www.smes.go.kr/humanframe/theme/portal/assets/style/main.css?dummy=20201231100842706" type="text/css">
    <link rel="stylesheet" href="https://www.smes.go.kr/humanframe/theme/portal/assets/style/custom.css?dummy=20201231100842706" type="text/css">
    <link rel="stylesheet" href="https://www.smes.go.kr/resources/theme/portal/assets/style/common.css?dummy=20201231104622776" type="text/css">
    <link rel="stylesheet" href="https://www.smes.go.kr/resources/theme/portal/assets/style/main.css?dummy=20201231104622776" type="text/css">
    <link rel="stylesheet" href="https://www.smes.go.kr/resources/theme/portal/assets/style/custom.css?dummy=20201231104622776" type="text/css">
    <style>
        .smes_wrapper .v-box .logo-element .inner {
            /*border: 1px solid red;*/
            height: 95px;
            background: url(https://www.mss.go.kr/images/np/bg_logo.png) no-repeat center center;
        }
        .smes_wrapper .v-box .logo-element strong {
            color: red;
            font-weight: bold;
        }
        .logo-element {
            width: 100%!important;
        }
        .error-txt p {
            color : #e3ecf3;
        }
    </style>
</head>
<body<%-- onload="moveTimer()"--%>>
<div class="smes_wrapper" id="smes" style="">
    <div class="v-box">
        <div class="logo-element">
            <div class="inner"></div>
            <div class="error-txt">
                <%= systemTitle %> 시스템 <strong id="ok-target">오픈 준비중</strong>입니다.<br>
                <%--<% if (targetDt.getYear() < 9999) { %>
                <%= targetDt.getYear() %>년 <%= targetDt.getMonthValue() %>월 <%= targetDt.getDayOfMonth() %>일
                <%= targetDt.getHour() %>시에 새로운 모습으로 찾아 뵙겠습니다.<br>
                <% } else { %>
                <strong id="moveCount">10</strong>초 후 현재 운영중인 <a href="<%= targetUrl %>"><%= targetUrl %></a>로 이동합니다.<br>
                <% } %>
                <p><%= currentDt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))%></p>--%>
            </div>
        </div>
    </div>
</div>
<% if (targetDt.getYear() < 9999) { %>
<script>
    window.addEventListener("keydown", function (e) {
        if (e.which === 88 && e.shiftKey && e.ctrlKey) {
            <%-- web.xml에 정의한 cookieName과 동일한 값의 쿠키명을 입력! --%>
            document.cookie = "GUIDEOK=1";
            document.location = '<%= redirectUrl %>';
        }
    });
    var okTarget = document.getElementById("ok-target");
    okTarget.addEventListener("touchend", function(e) {

        document.cookie = "GUIDEOK=1";
        document.location = '<%= redirectUrl %>';
    });
</script>
<% } else { %>
<script>
    var cnt = 10;
    var titmer;
    function moveTimer() {
        timer = setTimeout("moveNow()", 10000);
    }
    function moveNow() {
        location.replace("<%= targetUrl %>");
    }
    function countdown() {
        if (cnt > 0) {
            document.getElementById("moveCount").innerHTML = cnt;
            setTimeout("countdown()", 1000);
            cnt--;
        }
    }
    window.addEventListener("keydown", function(e) {
        if (e.which === 88 && e.shiftKey && e.ctrlKey) {
            // if (timer) {
            //     clearTimeout(timer);
            // }
            <%-- web.xml에 정의한 cookieName과 동일한 값의 쿠키명을 입력! --%>
            document.cookie = "GUIDEOK=1";
            document.location = '<%= redirectUrl %>';
        }
    });
    var okTarget = document.getElementById("ok-target");
    okTarget.addEventListener("touchend", function(e) {

        document.cookie = "GUIDEOK=1";
        document.location = '<%= redirectUrl %>';
    });
    // countdown();
</script>
<% } %>
</body>
</html>
<%
    }
%>
