<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<head>
    <title>관리자 | 메인 배너 관리</title>
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
                    관리자페이지
                </li>
                <li>
                    메인 배너 관리
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">메인 배너 관리</h1>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <div class="tbl-wrap for_board">
                    <a href="<c:url value="/admin/banner/post.do"/>" class="write-question"
                       style="width: 125px">
                        배너 등록
                    </a>
                    <table class="tbl-list01">
                        <colgroup>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="50%"/>
                            <col width="30%"/>
                        </colgroup>
                        <thead>
                        <th class="txt_alcnt" scope="col">번호</th>
                        <th class="txt_alcnt" scope="col">순번</th>
                        <th class="txt_alcnt" scope="col">제목</th>
                        <th class="txt_alcnt" scope="col">등록일자</th>
                        </thead>
                        <tbody>
                        <c:forEach var="rs" items="${rs }" varStatus="status">
                            <tr>
                                <td class="txt_alcnt">
                                        ${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }
                                </td>
                                <td>${rs.sortSeq}</td>
                                <td class="al">
                                    <a href="<c:url value="/admin/banner/view.do?banSeq=${rs.banSeq}"/>">
                                            ${rs.banNm}</a>
                                </td>
                                <td>${fn:substring(rs.registDt,0,10)}</td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty rs }">
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
                            <ui:pagination paginationInfo="${paginationInfo}" type="image"
                                           jsFunction="linkPage"/>
                        </ul>
                    </div>
                </div>
                <!-- // paging -->
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

