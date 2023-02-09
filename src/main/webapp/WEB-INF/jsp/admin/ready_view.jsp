<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>

<head>
    <title>관리자 | 카드뉴스</title>
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
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    관리자
                </li>
                <li>
                    ${bbsNm} 관리
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">${bbsNm} 관리</h1>
            </div>
            <div class="content">
                <div id="company-write" class="content">
                    <!-- 컨텐츠 start -->
                    <div class="board-view-wrap01">
                        <form name="frmDelete" id="frmDelete" method="POST"
                              action="<c:url value="/admin/ready/delete.do"/>">
                            <input type="hidden" id="stat" name="stat" value="0"/>
                            <input type="hidden" id="bbsId" name="bbsId" value="${bbsId}"/>
                            <input type="hidden" value="${rs.boardSeq}" name="boardSeq" id="boardSeq">
                            <p class="subj">${rs.title}</p>
                            <div class="info">
                                <ul>
                                    <li>작성자 : 관리자</li>
                                    <li>작성일 : ${fn:substring(rs.regDe,0,10)}</li>
                                </ul>
                            </div>
                            <div class="file-wrap">
                                <p class="label">첨부파일</p>
                                <ul>
                                    <c:forEach var="attach" items="${attachList}">
                                        <li>
                                            <a href="<c:url value="${FileUploadController.makeDownloadLink(attach.savedFilePath, attach.fileNm)}"/>">
                                                <c:out value="${attach.fileNm}"/>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="card-news">
                                <span class="card-prev"><i class="fas fa-chevron-left"></i></span>
                                <span class="card-next"><i class="fas fa-chevron-right"></i></span>
                                <div class="card-slide-container">
                                    <div class="swiper-wrapper">
                                        <c:forEach var="attach" items="${attachList}">
                                        <div class="swiper-slide">
                                                <img src="<c:url value="${FileUploadController.makeDownloadLink(attach.savedFilePath, attach.fileNm)}"/>">
                                        </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="write-bottom">
                                <a href="<c:url value="/admin/ready/edit.do?boardSeq=${rs.boardSeq}"/>"
                                   class="submit" title="수정">수정
                                </a>
                                <a onclick="javascript:deleteBbs();return false;" class="back">삭제</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function deleteBbs() {
        if (confirm("정말 삭제하시겠습니까?")) {
            $("#frmDelete").submit();
        } else {
            return false;
        }
    }

    var cardSlide = new Swiper(".card-slide-container", {
        slidesPerView: 1,
        loop: true,
        speed: 1000,
        observer: true,
        observeParents: true,
        navigation: { // 네비게이션 설정
            nextEl: '.card-next', // 다음 버튼 클래스명
            prevEl: '.card-prev', // 이번 버튼 클래스명
        },
    });
</script>