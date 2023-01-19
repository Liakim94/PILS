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
<title>참여기업 현황</title>
<script>
</script>

</head>

       <!-- main-wrap -->
<%--        <div class="main-wrap">--%>
<%--            <!-- link_box -->--%>
<%--            <div class="link_box">--%>
<%--                <div class="bg-gray visual-section">--%>
<%--                    <div class="container" style="width:50%">--%>
<%--                    </div>--%>

<%--                <div class="tab-content">--%>
<%--                    <div role="tabpanel" class="tab-pane active" id="corporation">--%>

<%--          <!-- // logo list -->--%>
<%--                <div class="list-company">--%>

<%--                    <div class="col-lg-9" >--%>
<%--                        <img src="${pageContext.request.contextPath}/images/main/main.png" class="company-logo" >--%>
<%--                    </div>--%>

<%--                    <div class="row">--%>
<%--                        <div class="col-md-12">--%>

<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <a h--%>
<%--                                        <img src="${pageContext.request.contextPath}/images/main/partner/ci01.png" class="company-logo" alt="(주) 한샘">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주) 한샘</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                        <img src="${pageContext.request.contextPath}/images/main/partner/ci02.png" class="company-logo" alt="(주)농협유통">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)농협유통</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                        <img src="${pageContext.request.contextPath}/images/main/partner/ci03.png" class="company-logo" alt="(주)대한항공">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)대한항공</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci04.png" class="company-logo" alt="(주)두산">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)두산</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci05.png" class="company-logo" alt="(주)신세계디에프">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)신세계디에프</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci06.png" class="company-logo" alt="(주)한화">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)한화</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci07.png" class="company-logo" alt="(주)농심">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)농심</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci08.png" class="company-logo" alt="(주)LG화학">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>㈜LG화학</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci09.png" class="company-logo" alt="(주)KCC">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>㈜KCC</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci01.png" class="company-logo" alt="(주) 한샘">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주) 한샘</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci02.png" class="company-logo" alt="(주)농협유통">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)농협유통</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci03.png" class="company-logo" alt="(주)대한항공">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)대한항공</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci04.png" class="company-logo" alt="(주)두산">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)두산</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci05.png" class="company-logo" alt="(주)신세계디에프">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)신세계디에프</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci06.png" class="company-logo" alt="(주)한화">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)한화</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci04.png" class="company-logo" alt="(주)두산">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)두산</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci05.png" class="company-logo" alt="(주)신세계디에프">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)신세계디에프</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="ico-list">--%>
<%--                                <div class="container-logo">--%>
<%--                                    <img src="${pageContext.request.contextPath}/images/main/partner/ci06.png" class="company-logo" alt="(주)한화">--%>
<%--                                </div>--%>
<%--                                <div class="corp-name">--%>
<%--                                    <span>(주)한화</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                    </div>--%>


<%--                 </div>--%>
<%--            <!-- // link_box -->--%>


<%--                </div>--%>
<%--        </div>--%>
<%--        <!-- // main-wrap -->--%>
<%--        </div>--%>