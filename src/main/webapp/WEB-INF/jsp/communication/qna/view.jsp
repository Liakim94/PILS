<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="fx" prefix="fx" %>
<%pageContext.setAttribute("crcf", "\r\n"); %>
<head>
<title></title>
	<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.11/lodash.min.js"></script>

</head>

<page:applyDecorator name="menu" />
<div class="article">	
	<div class="content">

		<div class="article-header">
			<h3>질의응답</h3>
			<div class="side-wrap">
			</div>
		</div>
	<!-- 컨텐츠 start -->
	    <div class="tbl-wrap separate2 mb50">
	        <table class="tbl-list02">
	            <caption>질의응답</caption>
	            <colgroup>
	                <col width="17%" />
	                <col width="*" />
	            </colgroup>
	<input type="hidden" id="no" name="no" value="${rs.no}"/>

	            <tbody>
	                <tr>
	                    <th class="txt_alcnt" scope="row">작성자</th>
	                    <td>${rs.name }</td>
	                </tr>
	                <tr>
	                    <th class="txt_alcnt" scope="row">제목</th>
	                    <td>${rs.title }</td>
	                </tr>
	                <tr>
	                    <th class="txt_alcnt" scope="row">내용</th>
	                    <td>
	                    	${fn:replace(rs.body, crcf, "<br>") }
	                    </td>
	                </tr>
				</tbody>
	        </table>
	    </div>
	    <div class="btn-wrap type04">
			<c:if test="${sessionId eq 'admin' }">
	        <a href='${pageContext.request.contextPath}/cmm/qnaRepost.do?no=${rs.no}' class="btn blue">답변달기</a>
	        </c:if>
	        <a href="${pageContext.request.contextPath}/cmm/qnaDelete.do?no=${rs.no}" class="btn blue">삭제</a>
	        <a href="${pageContext.request.contextPath}/cmm/qnaList.do" class="btn blue">목록</a>
	    </div>
	    <!-- 컨텐츠 end -->
	</div>
</div>