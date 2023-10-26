<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/temp.css"/>">
</head>
<script>
    function linkPage(num) {
        var form = document.frmSearch;
        form.pageIndex.value = num;
        form.submit();
    }
</script>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_myPage"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>마이페이지</li>
                <li>동행기업 실적 제출</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 실적 제출</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <form action="" name="frmSearch" method="get">
                    <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                    <div class="write-container">
                        <div class="tbl-wrap for_board">
                            <a href="${pageContext.request.contextPath}/main/perf/apply.do" class="write-question">
                                제출하기</a>
                        </div>
                        <table class="table-form">
                            <colgroup>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                            </colgroup>
                            <thead>
                            <th class="txt_alcnt" scope="col">번호</th>
                            <th class="txt_alcnt" scope="col">기업명</th>
                            <th class="txt_alcnt" scope="col">제출일자</th>
                            </thead>
                            <tbody>
                            <c:forEach var="rs" items="${rs }" varStatus="status">
                                <tr>
                                    <td class="txt_alcnt">
                                            ${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/main/perf/view.do?seq=${rs.seq}" style="color: rgb(0, 72, 255);">${rs.cmp_nm}</a>
                                    </td>
                                    <td>${fn:substring(rs.regist_dt,0,10)}</td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty rs }">
                                <tr>
                                    <td colspan="3" class="text-center">조회된 데이터가 없습니다.</td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </form>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

