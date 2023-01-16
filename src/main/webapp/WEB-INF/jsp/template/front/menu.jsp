<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.xicom.cmmn.web.EgovWebUtil"                                  %>
<%@ page import="kr.co.xicom.cmmn.web.EgovProperties"                               %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"  %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page"      prefix="page"       %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"              prefix="c"          %>
<%@ taglib uri="http://egovframework.gov/ctl/ui"                prefix="ui"         %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"         prefix="fn"         %>
<%@ taglib uri="http://www.springframework.org/tags"            prefix="spring"     %>
<%
String uploadPath = "";
uploadPath = EgovWebUtil.nvl(EgovProperties.getProperty("UploadPath").toString().trim()).equals("")?"upload":EgovProperties.getProperty("UploadPath").toString();
%>
<script>
    $("li").click(function(){
        $("li").addClass("on");
    });
</script>

<aside class="sidebar">
    <div class="lnb">
        <h2>소통마당</h2>
        <ul>
            <li><a href ="${pageContext.request.contextPath}/cmm/boardList.do?bbsId=11">공지사항</a></li>
            <li><a href ="${pageContext.request.contextPath}/cmm/boardList.do?bbsId=7">자주 묻는 질문</a></li>
            <li><a href ="${pageContext.request.contextPath}/cmm/qnaList.do">질의응답 게시판</a></li>
            <li><a href ="${pageContext.request.contextPath}/cmm/boardList.do?bbsId=9">자료실</a></li>
            <li><a href ="${pageContext.request.contextPath}/cmm/conApply.do">컨설팅 신청</a></li>
            <li><a href ="${pageContext.request.contextPath}/cmm/conCheck.do">컨설팅 신청 확인</a></li>
        </ul>
    </div>
</aside>





