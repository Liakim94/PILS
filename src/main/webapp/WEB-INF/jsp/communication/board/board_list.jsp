<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title>공지사항</title>
</head>
<script>
    function showView(seq) {
        var vf = document.viewfrm;
        vf.no.value = seq;
        vf.submit();
    }

    function linkPage(num) {
        var frm = document.frmSearch;
        frm.pageIndex.value = num;
        frm.submit();

    }
</script>
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
                    <form name="viewfrm" action="${pageContext.request.contextPath}/cmm/boardView.do" method="get"
                          id="viewfrm">
                        <input type="hidden" id="no" name="no" value="">
                        <input type="hidden" name="bbsId" id="bbsId" value="${bbsId}">
                    </form>

                    <form action="" name="frmSearch" method="get">
                        <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                        <input type="hidden" name="bbsId" id="bbsId" value="${bbsId}">
                        <div class="content">

                            <div class="tbl-wrap for_board">
                                <c:if test="${sessionId eq 'admin' }">
                    <a href="${pageContext.request.contextPath}/cmm/boardPost.do?bbsId=${bbsId}" class="write-question"
                          style="width: 135px">게시물 등록</a>
                                </c:if>
                                <table class="tbl-list01">
                                    <caption>공지사항 : 번호, 제목, 작성자, 작성일, 조회수</caption>
									<colgroup>
                                        <col width="10%">
                                        <col width="65%">
                                        <col width="15%">
                                        <col width="10%">
									</colgroup>
                                    <thead>
                                    <tr>
                                        <th scope="col">번호</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">조회수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="post" items="${list }" varStatus="status">
                                        <tr>
                                            <td>${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }</td>
                                            <td class="al">
                                                    <%--<a href="javascript:showView('${list.boardSeq}')" >${list.title }</a>--%>
                                                <a href="<c:url value="/cmm/boardView.do?boardSeq=${post.boardSeq}&bbsId=${post.bbsId}"/>">
                                                    <c:out value="${post.title}"/>
                                                </a>
                                            </td>
                                            <td>${fn:substring(post.regDe,0,10)}</td>
                                            <td><c:out value="${post.readCnt}"/></td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty list }">
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
                                        <ui:pagination paginationInfo="${paginationInfo}" type="image"
                                                       jsFunction="linkPage"/>
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
</div>