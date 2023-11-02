<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title>관리자페이지 | 컨설팅 신청 현황</title>
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
                    컨설팅 신청 현황
                </li>
            </ul>
            <!-- 컨텐츠 start -->
            <form action="" name="frmSearch" method="get">
                <input type="hidden" name="pageIndex" id="pageIndex" value="1">

                <div class="article-header">
                    <h1 class="fw700">컨설팅 신청 현황</h1>
                    <div class="side-wrap">
                    </div>
                </div>
                <div class="content">

                <div class="write-container">
                    <table class="tbl-list01">
                        <colgroup>
                            <col width="10%">
                            <col width="55%">
                            <col width="15%">
                            <col width="20%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">신청기업</th>
                            <th scope="col">작성자</th>
                            <th scope="col">신청일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="list" items="${list }" varStatus="status">
                            <tr>
                                <td class="txt_alcnt">${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }</td>
                                <td class="al">
                                    <a href="<c:url value="/admin/consulting/view.do?seq=${list.seq}"/>">
                                            ${list.cmp_nm }
                                    </a>
                                </td>
                                <td class="txt_alcnt"> ${list.mem_nm }</td>
                                <td class="txt_alcnt">${fn:substring(list.regist_dt,0,10)}</td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty list }">
                            <tr>
                                <td colspan="4" class="text-center">조회된 데이터가 없습니다.</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>

                <!-- paging -->
                <div class="board_bottom_wrap">
                    <div class="paging_wrap">
                        <ul class="paging">
                            <ui:pagination paginationInfo="${paginationInfo }" type="image" jsFunction="linkPage"/>
                        </ul>
                    </div>
                </div>
                <!-- // paging -->
                <!-- 컨텐츠 end -->
                </div>
            </form>
        </div>
    </div>
</div>
