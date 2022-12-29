<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.xicom.cmmn.web.EgovWebUtil" 									%>
<%@ page import="kr.co.xicom.cmmn.web.EgovProperties" 								%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>

<script>
    $(function() {
        $("#fSelect").on("change", function() {
            if($(this).val() != "none") {
                var ret = window.open($(this).val(),"");
                $("#fSelect").find("option:eq(0)").prop("selected", true);
            }
        });
    });
</script>

<footer>
	<div class="footer">
        <div class="rela">

            <div class="e-wrap">
                <img src="${pageContext.request.contextPath}/images/etc/etc-logo.png" alt="" />
            </div>
            <style>
                .bnb-list {
                    float: right
                }
            </style>
            <ul class="bnb-list">
               <li><a href="${pageContext.request.contextPath}/26">개인정보처리방침</a></li>
               <li><a href="${pageContext.request.contextPath}/25">이용약관</a></li>
               <li><a href="${pageContext.request.contextPath}/157">이메일 주소 무단수집거부</a></li>
            </ul>
            <address>
                <p class="addr">COBIZ 시스템 장애 문의 : (044) 300-0990, (044) 300-0991</span> | 메일문의 : smeshelp@tipa.or.kr</p>
                <p class="addr">
                대전광역시 유성구 가정북로 104(대전충남지방중소벤처기업청 3층) Tel. <span class="ft_bluetxt">042-331-0563,042-331-0564</span> Fax. <span class="ft_bluetxt">042-867-5508</span>
                </p>
                <p></p>
                <p class="copyright">(c)2018. M&A KVCA. All rights reserved.</p>
            </address>
        </div>
    </div>
</footer>
