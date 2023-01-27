<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.xicom.cmmn.web.EgovWebUtil" 									%>
<%@ page import="kr.co.xicom.cmmn.web.EgovProperties" 								%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>


<footer class="footer-container">
    <div class="footer-wrap">
        <div class="area">
            <img class="logo" src="${pageContext.request.contextPath}/images/common/footer-logo.png" alt="중소벤처기업부" />
            <div class="site-map">
                <a href="">개인정보처리방침</a>
                <a href="">이용약관</a>
            </div>
        </div>
        <div class="area">
            <p class="site-info">
                30121세종특별자치시 가름로 180, 세종파이낸스센터 3차 중소벤처기업부 4층 ~ 6층 / 대표전화 : 국번없이 1357<br>
                대·중소기업 농어업협력재단: 08379, 서울특별시 구로구 디지털로 32길 29, 키콕스벤처센터 4층<br>
                현재 388개 기업이 납품대금 연동제에 동참하고 있습니다.<br>
                위탁기업 47개사, 수탁기업 341개사<br>
                COPYRIGHT ⓒ 중소벤처기업부. ALL RIGHTS RESERVED.
            </p>
        </div>
    </div>
</footer>
