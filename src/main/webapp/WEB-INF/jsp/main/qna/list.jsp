<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title></title>

</head>
<script>
    function linkPage(num){
        var form = document.frmSearch;
        form.pageIndex.value = num;
        form.submit();
    }
</script>
<page:applyDecorator name="menu" />
<div class="article">
    <div class="content">
        <!-- 컨텐츠 start -->
        <form action="" name="frmSearch" method="get">
            <input type="hidden" name="pageIndex" id="pageIndex" value="1">
            <div class="article-header">
                <h3>질의응답</h3>
                <div class="side-wrap">
                </div>
            </div>
            <div class="btn-wrap type02 low_margin">
                <a href="${pageContext.request.contextPath}/qnaPost.do" class="btn blue">문의하기</a>
            </div>
        <div class="tbl-wrap separate1">
            <table class="tbl-list01">
                <caption>회원수정 목록</caption>
                <colgroup>
                    <col width="15%" />
                    <col width="55%" />
                    <col width="15%" />
                    <col width="15%" />
                </colgroup>
                <thead>
                <th class="txt_alcnt" scope="col">번호</th>
                <th class="txt_alcnt" scope="col">제목</th>
                <th class="txt_alcnt" scope="col">작성자</th>
                <th class="txt_alcnt" scope="col">작성일</th>
                </thead>
                <tbody>
                <c:forEach var="list" items="${list }" varStatus="status">
                    <tr>
                        <td class="txt_alcnt">${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }</td>
                        <td class="al">
                            <a href="${pageContext.request.contextPath}/147?no=${list.no }" >
                                <c:if test="${not empty list.reply }">
                                    <strong>[답변완료] </strong>
                                </c:if>${list.title }
                            </a>
                        </td>
                        <td class="txt_alcnt"> ${list.name }</td>
                        <td class="txt_alcnt">${list.rdate }</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty list }">
                    <tr><td colspan="4" class="text-center">조회된 데이터가 없습니다.</td></tr>
                </c:if>
                </tbody>
            </table>
        </div>

        <!-- paging -->
        <div class="board_bottom_wrap">
            <div class="paging_wrap">
                <ul class="paging">
                    <ui:pagination paginationInfo="${paginationInfo }" type="image" jsFunction="linkPage" />
                </ul>
            </div>
        </div>
        <!-- // paging -->


        <!-- 컨텐츠 end -->
        </form>
    </div>
</div>