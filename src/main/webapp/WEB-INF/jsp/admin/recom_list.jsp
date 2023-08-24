<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title> 관리자페이지 | 동행기업 참여 추천 현황</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
                    관리자페이지
                </li>
                <li>
                    동행기업 참여 추천 현황
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 참여 추천 현황</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <form action="" name="frmSearch" method="get">
                    <input type="hidden" name="pageIndex" id="pageIndex" value="1">


                    <div class="write-container">
                        <table class="tbl-list01">
                            <colgroup>
                                <col width="10%">
                                <col width="35%">
                                <col width="35%">
                                <col width="20%">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">번호 </th>
                                <th scope="col">추천 신청 기업(수탁기업) </th>
                                <th scope="col">추천 기업(위탁기업)</th>
                                <th scope="col">신청일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="rs" items="${rs }" varStatus="status">
                                <tr>
                                    <td>${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }</td>
                                    <td>


                                        <a href="${pageContext.request.contextPath}/admin/recom/view.do?no=${rs.rcmd_no}">
                                                ${rs.apply_cmpNm }
                                        </a>
                                    </td>
                                    <td>${rs.rcmd_cmpNm }</td>
                                    <td>${fn:substring(rs.appdt,0,10)}</td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty rs }">
                                <tr>
                                    <td colspan="5" class="text-center">조회된 데이터가 없습니다.</td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>

                    <!-- paging -->
                    <div class="board_bottom_wrap">
                        <div class="paging_wrap">
                            <ul class="paging">
                                <ui:pagination paginationInfo="${paginationInfo }" type="image"
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