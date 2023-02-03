<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="fx" prefix="fx" %>
<%pageContext.setAttribute("crcf", "\r\n"); %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<div id="content">
    <div id="board">
        <page:applyDecorator name="guide_menu"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    납품대금 연동제란?
                </li>
                <li>
                    걸어온 발자취
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">걸어온 발자취</h1>
            </div>
            <div class="content">
                <div id="company-write" class="content">
                    <!-- 컨텐츠 start -->
                    <div class="board-view-wrap01">
                        <input type="hidden" value="${rs.seq}">
                        <p class="subj"> ${rs.title}</p>
                        <div class="info">
                            <ul>
                                <li>작성자 : 관리자</li>
                                <li>작성일 : ${fn:substring(rs.rgst_dt,0,10)}</li>
                            </ul>
                        </div>
                        <c:choose>
                            <c:when test="${fn:length(attachList) > 0}">
                                <div class="gallery-container">
                                    <div class="active-img-wrap">
                                        <!--    이미지 예시입니다.     -->
                                        <img src="<c:url value="${FileUploadController.makeDownloadLink(attachList[0].savedFilePath, attachList[0].fileNm)}"/>" alt="<c:out value="${attachList[0].fileNm}"/>"
                                             onerror="this.src='<c:url value="/images/no-image.jpg"/>'"/>
                                        <div class="cont">
                                                ${fx:resetXSSMinimum(rs.cont)}
                                        </div>
                                    </div>
                                    <div class="gallery-list">
                                        <c:forEach var="attach" items="${attachList}">
                                            <img src="<c:url value="${FileUploadController.makeDownloadLink(attach.savedFilePath, attach.fileNm)}"/>" alt="<c:out value="${attach.fileNm}"/>"
                                                 onerror="this.src='<c:url value="/images/no-image.jpg"/>'"/>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="gallery-container">
                                    <div class="active-img-wrap">
                                        <div class="cont">
                                                ${fx:resetXSSMinimum(rs.cont)}
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <div class="button-group">
                            <a class="button" href="<c:url value="/front/guide/trace.do"/>">목록</a>
                        </div>
                    </div>
                    <!-- 컨텐츠 end -->
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(".gallery-list img").click(function (){
        var src = $(this).attr("src");
        $(".gallery-list img").removeClass("active");
        $(this).addClass("active");
        $(".active-img-wrap img").css('opacity','0').stop().attr('src', src).animate({opacity:1},500);
    });
</script>
