<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<head>
    <title>관리자 | 메인 배너 관리</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_admin"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    관리자
                </li>
                <li>
                    메인 배너 관리
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">메인 배너 관리</h1>
                <div class="side-wrap"></div>
            </div>
            <div class="content">
                <div id="company-write" class="content">
                    <!-- 컨텐츠 start -->
                    <div class="board-view-wrap01">
                        <form action="<c:url value="/admin/banner/delete.do"/>" method="post" id="delete">
                            <div class="write-container">
                                <div class="line-wrap">
                                    <div class="label">사이트명</div>
                                    <div class="input-wrap" style="margin:5px">
                                        ${rs.banNm}
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">URL주소</div>
                                    <div class="input-wrap" style="margin:5px">
                                        ${rs.siteUrl}
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">정렬순</div>
                                    <div class="input-wrap" style="margin:5px">
                                        ${rs.sortSeq}
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">PC 배너</div>
                                    <div class="input-wrap" style="margin:5px">
                                        <img class="logo"
                                             src="<c:url value="${FileUploadController.makeDownloadLink(rs.pcImgPath)}"/>"
                                             onerror="this.src='<c:url value="/images/no-image.jpg"/>'"/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">MOBILE 배너</div>
                                    <div class="input-wrap" style="margin:5px">
                                        <img class="logo"
                                             src="<c:url value="${FileUploadController.makeDownloadLink(rs.mobileImgPath)}"/>"
                                             onerror="this.src='<c:url value="/images/no-image.jpg"/>'"/>
                                    </div>
                                </div>
                            </div>
                            <div class="write-bottom">
                                <a onclick="javascript:deleteBan();return false;" class="back">삭제</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function deleteBan() {
        if (confirm("정말 삭제하시겠습니까?")) {
            $("#delete").submit();
        } else {
            return false;
        }
    }
</script>