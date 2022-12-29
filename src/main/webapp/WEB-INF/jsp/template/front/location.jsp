<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.xicom.cmmn.web.EgovWebUtil" 									%>
<%@ page import="kr.co.xicom.cmmn.web.EgovProperties" 								%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%
String uploadPath = "";
uploadPath = EgovWebUtil.nvl(EgovProperties.getProperty("UploadPath").toString().trim()).equals("")?"upload":EgovProperties.getProperty("UploadPath").toString();


%>              
<br/>
   <ul class="loc-list">   
   	   <c:forEach var="location" items="${location }">
   	   <li>
		   <c:choose>
				<c:when test="${location.id eq '1' }"><a href="${pageContext.request.contextPath}/">${location.menuName }</a></c:when>
				<c:otherwise>
					${location.menuName }
				</c:otherwise>
			</c:choose>
		</li>			
		</c:forEach>
   </ul>
   
   <div class="article-header">
       <h3>${menuName }</h3>
       <div class="side-wrap">
       </div>
   </div> 



