<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="kr.co.xicom.cmmn.web.EgovWebUtil" 									%>
<%@ page import="kr.co.xicom.cmmn.web.EgovProperties" 								%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"				prefix="fmt" 		%>
<%@ taglib uri="fx"                                             prefix="fx"         %>

<script src="${pageContext.request.contextPath}/x2/plugins/jQueryUI/jquery-ui.js"></script>
<head>
<title></title>
<script>

//쿠키불러오기
function getCookie( cookieName ){
    var search = cookieName + "=";
    var cookie = document.cookie;

    // 현재 쿠키가 존재할 경우6
    if (cookie.length > 0) {
        // 해당 쿠키명이 존재하는지 검색한 후 존재하면 위치를 리턴.
        startIndex = cookie.indexOf(cookieName);

        // 만약 존재한다면
        if (startIndex != -1) {
            // 값을 얻어내기 위해 시작 인덱스 조절
            startIndex += cookieName.length;

            // 값을 얻어내기 위해 종료 인덱스 추출
            endIndex = cookie.indexOf(";", startIndex);

            // 만약 종료 인덱스를 못찾게 되면 쿠키 전체길이로 설정
            if (endIndex == -1)
                endIndex = cookie.length;

            // 쿠키값을 추출하여 리턴
            return unescape(cookie.substring(startIndex + 1, endIndex));
        } else {
            // 쿠키 내에 해당 쿠키가 존재하지 않을 경우
            return false;
        }
    } else {
        // 쿠키 자체가 없을 경우
        return false;
    }
}


</script>

<%--<style>--%>

<%--    .list-company .ico-list {--%>
<%--        border-radius:12px;--%>
<%--        border-color:#4876ee;--%>
<%--    }--%>

<%--    .list-company .ico-list:hover {--%>
<%--        box-shadow: 5px 5px 0 0 rgba(72, 118, 238, 0.1);--%>
<%--        border-color:#4876ee;--%>
<%--    }--%>
<%--    .list-company .ico-list:hover .corp-name {--%>
<%--        color:#4876ee;--%>
<%--    }--%>

<%--</style>--%>
</head>

       <!-- main-wrap -->
        <div class="main-wrap">
            <!-- link_box -->
            <div class="link_box">
                <div class="bg-gray visual-section">
                    <div class="container" style="width:50%">
                        <div class="col-lg-9" >
                            <img src="${pageContext.request.contextPath}/images/main/main.png" class="company-logo" >
                        </div>
                    </div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="corporation">

          <!-- // logo list -->
                <div class="list-company">
                    <div class="row">
                        <div class="col-md-12">

                            <div class="ico-list">
                                <div class="container-logo">
                                        <img src="${pageContext.request.contextPath}/images/main/partner/ci01.png" class="company-logo" alt="(주) 한샘">
                                </div>
                                <div class="corp-name">
                                    <span>(주) 한샘</span>
                                </div>
                            </div>

                            <div class="ico-list">
                                <div class="container-logo">
                                        <img src="${pageContext.request.contextPath}/images/main/partner/ci02.png" class="company-logo" alt="(주)농협유통">
                                </div>
                                <div class="corp-name">
                                    <span>(주)농협유통</span>
                                </div>
                            </div>

                            <div class="ico-list">
                                <div class="container-logo">
                                        <img src="${pageContext.request.contextPath}/images/main/partner/ci03.png" class="company-logo" alt="(주)대한항공">
                                </div>
                                <div class="corp-name">
                                    <span>(주)대한항공</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci04.png" class="company-logo" alt="(주)두산">
                                </div>
                                <div class="corp-name">
                                    <span>(주)두산</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci05.png" class="company-logo" alt="(주)신세계디에프">
                                </div>
                                <div class="corp-name">
                                    <span>(주)신세계디에프</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci06.png" class="company-logo" alt="(주)한화">
                                </div>
                                <div class="corp-name">
                                    <span>(주)한화</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci07.png" class="company-logo" alt="(주)농심">
                                </div>
                                <div class="corp-name">
                                    <span>(주)농심</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci08.png" class="company-logo" alt="(주)LG화학">
                                </div>
                                <div class="corp-name">
                                    <span>㈜LG화학</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci09.png" class="company-logo" alt="(주)KCC">
                                </div>
                                <div class="corp-name">
                                    <span>㈜KCC</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci01.png" class="company-logo" alt="(주) 한샘">
                                </div>
                                <div class="corp-name">
                                    <span>(주) 한샘</span>
                                </div>
                            </div>

                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci02.png" class="company-logo" alt="(주)농협유통">
                                </div>
                                <div class="corp-name">
                                    <span>(주)농협유통</span>
                                </div>
                            </div>

                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci03.png" class="company-logo" alt="(주)대한항공">
                                </div>
                                <div class="corp-name">
                                    <span>(주)대한항공</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci04.png" class="company-logo" alt="(주)두산">
                                </div>
                                <div class="corp-name">
                                    <span>(주)두산</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci05.png" class="company-logo" alt="(주)신세계디에프">
                                </div>
                                <div class="corp-name">
                                    <span>(주)신세계디에프</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci06.png" class="company-logo" alt="(주)한화">
                                </div>
                                <div class="corp-name">
                                    <span>(주)한화</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci04.png" class="company-logo" alt="(주)두산">
                                </div>
                                <div class="corp-name">
                                    <span>(주)두산</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci05.png" class="company-logo" alt="(주)신세계디에프">
                                </div>
                                <div class="corp-name">
                                    <span>(주)신세계디에프</span>
                                </div>
                            </div>
                            <div class="ico-list">
                                <div class="container-logo">
                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci06.png" class="company-logo" alt="(주)한화">
                                </div>
                                <div class="corp-name">
                                    <span>(주)한화</span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                    </div>


                 </div>
            <!-- // link_box -->


                </div>
        </div>
        <!-- // main-wrap -->
        </div>