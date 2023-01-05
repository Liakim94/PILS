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
                <img src="${pageContext.request.contextPath}/images/main/mainLogo1.png" alt="" />
            </div>
            <style>
                .bnb-list {
                    float: right
                }
            </style>

            <address>
                <p class="addr">
                    30121세종특별자치시 가름로 180, 세종파이낸스센터 3차 중소벤처기업부 4층 ~ 6층 Tel. <span class="ft_bluetxt">042-331-0563,042-331-0564</span> 대표전화 : <span class="ft_bluetxt"> 국번없이 1357</span>
                </p>
                <p></p>
                <p class="copyright">COPYRIGHT ⓒ 중소벤처기업부. ALL RIGHTS RESERVED.</p>
            </address>
        </div>
    </div>
</footer>
