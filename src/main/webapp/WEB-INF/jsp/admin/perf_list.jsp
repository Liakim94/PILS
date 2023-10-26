<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title>관리자페이지 | 동행기업 실적 제출 현황</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/temp.css"/>">
</head>
<script>
    function Checkform() {
        const selectedValue = document.getElementById("tag").value;
        if (selectedValue === "") {
            alert("검색 항목을 선택해주세요.");
            return false;
        }
    }
    function linkPage(num) {
        var form = document.frmSearch;
        form.pageIndex.value = num;
        form.submit();
    }
</script>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_admin"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>관리자페이지</li>
                <li>동행기업 실적 제출 현황</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 실적 제출 현황</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <form action="" name="frmSearch" method="get" onSubmit="return Checkform()">
                    <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                    <section style="margin-bottom: 10px">
                        <select id="tag" name="tag" value="">
                            <option value="">선택</option>
                            <option value="nm" <c:if test="${vo.tag == 'nm'}">selected="selected"</c:if>>담당자</option>
                            <option value="a.cmp_nm" <c:if test="${vo.tag == 'a.cmp_nm'}">selected="selected"</c:if>>기업명</option>
                        </select>
                        <input type="text" name="keyword" value="${vo.keyword}" style=" border-radius: 5px;">
                        <button type="submit" style=" background: #E60024; border-radius: 5px;
                                 padding: 10px 12px; color: #FFFFFF;  font-weight: 300; font-size: 15px;border: none;">검색
                        </button>
                    </section>
                    <div class="write-container">
                        <table class="table-list01">
                            <colgroup>
                                <col width="10%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                            </colgroup>
                            <thead>
                            <th class="txt_alcnt" scope="col">번호</th>
                            <th class="txt_alcnt" scope="col">기업명</th>
                            <th class="txt_alcnt" scope="col">담당자</th>
                            <th class="txt_alcnt" scope="col">제출일자</th>
                            </thead>
                            <tbody>
                            <c:forEach var="rs" items="${rs }" varStatus="status">
                                <tr>
                                    <td class="txt_alcnt">
                                            ${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/perf/view.do?seq=${rs.seq}" style="color: rgb(0, 72, 255);">${rs.cmp_nm}</a>
                                    </td>
                                    <td>
                                        ${rs.nm}
                                    </td>
                                    <td>${fn:substring(rs.regist_dt,0,10)}</td>
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
                    <div class="board_bottom_wrap">
                        <div class="paging_wrap">
                            <ul class="paging">
                                <ui:pagination paginationInfo="${paginationInfo }" type="image" jsFunction="linkPage"/>
                            </ul>
                        </div>
                    </div>
                </form>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

