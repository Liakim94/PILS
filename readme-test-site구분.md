운영 사이트와 테스트 사이트 구분 처리
=====================================

> * 현재 운영 사이트는 https://www.smes.go.kr/cobiz 로 배포되며 개발/테스트용 사이트는 https://www.smes.go.kr/cobiz-dev 로 배포되고 있음.
> * 개발 사이트(https://www.smes.go.kr/cobiz-dev) 에 의도치 않은 사용자의 접근을 방지하고, 검색 엔진 등의 크롤링에 대한 대비가 필요 함.

### 1. 개발 사이트(https://www.smes.go.kr/cobiz-dev) 접근 방지

* /index.jsp 파일에 아래와 같이 context-path를 이용하여 개발 사이트 접근 방지

```jsp
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
    String contextPath = request.getContextPath();
    // 일반 사용자의 개발 또는 테스트서버 접근을 차단하기 위한 처리
    if (contextPath.endsWith("-dev") || contextPath.endsWith("-test")) {
        response.sendRedirect(contextPath + "/guide.do");
    }
    else {
        response.sendRedirect(contextPath + "/index.do");
    }
%>
```

* guide.do 페이지 출력
```jsp
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>사회적책임경영 테스트 사이트</title>
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
            background: url(https://www.smes.go.kr/humanframe/theme/portal/assets/image/etc/logo_smes.png) no-repeat center center;
        }
        .smes_wrapper .v-box .logo-element strong {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="smes_wrapper" id="smes" style="">
    <div class="v-box">
        <div class="logo-element">
            <div class="inner"></div>
            <div class="error-txt">
                이곳은 사회적책임경영시스템 <strong>테스트 사이트</strong>입니다.<br>
                사회적책임경영시스템에 방문하시려면
                <a href="https://www.smes.go.kr/cobiz">https://www.smes.go.kr/cobiz</a>로 이동하세요.
            </div>
        </div>
    </div>
</div>
</body>
</html>
```

### 2. 개발 사이트(https://www.smes.go.kr/cobiz-dev) 구분을 위한 표시 추가

* 사이트의 헤더 출력부분에 아래와 같은 코딩을 출력하여 매 페이지마다 현재 사이트가 개발 사이트임을 출력
* /WEB-INF/jsp/user/common/header_top.jsp 일부 발췌
```jsp
<% if (request.getContextPath().endsWith("-dev") || request.getContextPath().endsWith("-test")) { %>
    <ul class="h-left">
        <li><strong style="color:red;line-height: 35px;">이곳은 테스트용 사이트입니다!</strong> </li>
    </ul>
<% } %>
```

### 3. 검색 엔진 색인 생성 방지

* 개발 사이트의 검색엔진 색인을 방지하기 위하여 페이지 <head>에 아래와 같이 meta 테그 추가
* /WEB-INF/jsp/user/common/header_inc.jsp 일부 발췌

```jsp
<% if (request.getContextPath().endsWith("-dev") || request.getContextPath().endsWith("-test")) { %>
    <meta name="robots" content="noindex">
<% } %>
```
