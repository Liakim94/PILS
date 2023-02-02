<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>

<head>
    <title>중소벤처기업부 | 카드뉴스</title>
</head>

<div id="content">
    <div id="board">
        <page:applyDecorator name="menu"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    소통마당
                </li>
                <li>
                    ${bbsNm}
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">${bbsNm}</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <form action="" name="frmSearch" method="get">
                    <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                    <input type="hidden" name="bbsId" id="bbsId" value="6">
                <div id="gboard-list">
                <c:forEach var="post" items="${list}" varStatus="status">
                    <div class="lst">
                        <a href="<c:url value="/front/board/ready/view.do?boardSeq=${post.boardSeq}"/>">
                            <!-- 썸네일은 background 로 설정합니다. -->
                            <div class="thumbnail" style="background:url('<c:out value="${FileUploadController.makeDownloadLink(attachList[0].savedFilePath, attachList[0].fileNm)}"/>')
                                 , url('<c:url value="/images/no-image.jpg"/>')"></div>
                            <div class="lst-info">
                                <h3 class="title"><c:out value="${post.title}"/></h3>
                                <p class="regdate">${fn:substring(post.regDe,0,10)}</p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
                    <c:if test="${empty list }">
                    <div class="lst" class="text-center">
                        조회된 데이터가 없습니다.
                    </div>
                    </c:if>
                </div>

                <!-- paging -->
                <div class="board_bottom_wrap">
                    <div class="paging_wrap">
                        <ul class="paging">
                            <ui:pagination paginationInfo="${paginationInfo}" type="image"
                                           jsFunction="linkPage"/>
                        </ul>
                    </div>
                </div>
                <!-- // paging -->
                <!-- 컨텐츠 end -->
                </form>
            </div>
        </div>
    </div>
</div>
