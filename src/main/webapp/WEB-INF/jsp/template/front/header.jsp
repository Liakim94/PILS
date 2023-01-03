<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="java.util.*, java.text.*" %>
<%@ page import="kr.co.xicom.cmmn.web.EgovWebUtil" 									%>
<%@ page import="kr.co.xicom.cmmn.web.EgovProperties" 								%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"				prefix="fmt" 		%>

<%
String uploadPath = "";
uploadPath = EgovWebUtil.nvl(EgovProperties.getProperty("UploadPath").toString().trim()).equals("")?"upload":EgovProperties.getProperty("UploadPath").toString();
%>

<head>
<script>
function getCookie(name){
	var cookieName = name + "=";
	var i = 0;
	while(i <= document.cookie.length){
		var c = (i + cookieName.length);
		if(document.cookie.substring(i, c) == cookieName){
			if((lastCharCookie = document.cookie.indexOf(";", c)) == -1) lastCharCookie = document.cookie.length;
			return encodeURI(document.cookie.substring(c, lastCharCookie));
		}
		
		i = document.cookie.indexOf(" ", i) + 1
		if(i == 0) break;			
	}
	return "";
}

function setCookie(name, value, expire){
	var today = new Date();
	today.setDate(today.getDate() + expire);
	document.cookie = name + "=" + encodeURI(value) + "; expires=" + today.toGMTString() + "; path=/;";
}

</script>

</head>
<div class="wrapper sub">
	<div class="header">

		<div class="header-link-wrap">
		    <div class="header-link-item">

		        <ul class="h-right">
		        	<c:if test="${sessionScope.SEQ eq null }"> 
			            <li><a href="${pageContext.request.contextPath}/login.do">로그인</a></li>
		            </c:if>
		            <c:if test="${sessionScope.SEQ ne null }">
						<li>
							<a title="${sessionScope.ANAME }" style="cursor: default;">· ${sessionScope.NAME }&nbsp;${sessionScope.ANAME }(${sessionScope.ID })</a>
						</li>					      

						<li>
							<a href="${pageContext.request.contextPath}/109" title="로그아웃">로그아웃</a>
						</li>
					</c:if>
		        </ul>
		    </div>
		</div>

	</div>

	<div class="site_menu_wrap">
        <div class="inner_ctwrap">
			<h2>
				<a href="${pageContext.request.contextPath}/index.do" title="납품대금 연동제"><img src="${pageContext.request.contextPath}/images/etc/etc-logo.png" alt=""></a>
			</h2>
			<nav class="site_menu" id="gnb">
				<button class="sitemenu_close_btn">전체 메뉴 닫기</button>
				<ul>
					<li>
						<button type="button" class="menu_depth1">납품대금 연동제란?</button>
						<a href ="#" class="menu_depth1">납품대금 연동제란?</a>
							<ul class="depth2_wrap" >
								<li><a href ="#" class="menu_depth2">도입배경</a></li>
								<li><a href ="#" class="menu_depth2">개념</a></li>
								<li><a href ="#" class="menu_depth2">적용대상</a></li>
								<li><a href ="#" class="menu_depth2">관련 법령</a></li>
								<li><a href ="#" class="menu_depth2">주요 통계</a></li>
							</ul>
					</li>
					<li><button type="button" class="menu_depth1">납품대금연동제 동참하기</button>
						<a href ="${pageContext.request.contextPath}/join/joinList.do" class="menu_depth1">납품대금연동제 동참하기</a>
						<ul class="depth2_wrap">
							<li><a href ="#"  class="menu_depth2">연동 절차</a></li>
							<li><a href ="#" class="menu_depth2">약정서 작성</a></li>
							<li><a href ="${pageContext.request.contextPath}/join/joinList.do" class="menu_depth2">동행기업 신청</a></li>
							<li><a href ="#" class="menu_depth2">기업들이 준비할 일</a></li>
						</ul>
					</li>
					<li><button type="button" class="menu_depth1">소통마당</button>
						<a href ="${pageContext.request.contextPath}/cmm/boardList.do?bbsId=11" class="menu_depth1">소통마당</a>
							<ul class="depth2_wrap" >
								<li><a href ="${pageContext.request.contextPath}/cmm/boardList.do?bbsId=11"  class="menu_depth2">공지사항</a></li>
								<li><a href ="${pageContext.request.contextPath}/cmm/boardList.do?bbsId=7"  class="menu_depth2">자주 묻는 질문</a></li>
								<li><a href ="${pageContext.request.contextPath}/cmm/qnaList.do"  class="menu_depth2">질의응답 게시판</a></li>
								<li><a href ="${pageContext.request.contextPath}/cmm/boardList.do?bbsId=9"  class="menu_depth2">자료실</a></li>
								<li><a href ="${pageContext.request.contextPath}/cmm/consulting.do" class="menu_depth2">컨설팅 신청</a></li>
							</ul>
					</li>
				</ul>

			</nav>
              
              <button class="sitemenu_btn">전체 메뉴 열기</button>
          </div>
      </div> 
</div>
	
							