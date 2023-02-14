<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title>중소벤처기업부 | 자주 묻는 질문</title>
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
                <!--form name="viewfrm" action="${pageContext.request.contextPath}/cmm/boardView.do" method="get"
                          id="viewfrm">
                        <input type="hidden" id="no" name="no" value="">
                        <input type="hidden" name="bbsId" id="bbsId" value="${bbsId}">
                    </form-->

                <form action="" name="frmSearch" method="get">
                    <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                    <input type="hidden" name="bbsId" id="bbsId" value="${bbsId}">
                    <div class="content">
                        <c:if test="${bbsId eq 7}">
                        <select id="tag" name="tag" value="${vo.tag}">
                            <option value="">선택</option>
                            <option value="M701">적용 대상</option>
                            <option value="M702">연동 약정</option>
                            <option value="M703">현행법과의 관계</option>
                            <option value="M704">위반 시 제재</option>
                            <option value="M705">동행기업</option>
                            <option value="M706">지원</option>
                            <option value="M707">기타</option>
                        </select>
                        <input type="text" name="keyword" value="${vo.keyword}">
                        <button type="submit" class="btn">검색</button>
                        </c:if>
                        <div class="tbl-wrap for_board">
                            <c:if test="${sessionId eq 'admin' }">
                                <a href="<c:url value="/front/board/${bbsId}/post.do"/>" class="write-question"
                                   style="width: 141px">
                                    게시물 등록
                                </a>
                            </c:if>
                            <table class="tbl-list01">
                                <caption>공지사항 : 번호, 제목, 작성자, 작성일, 조회수</caption>
                                <c:if test="${bbsId ne 7}">
                                <colgroup>
                                    <col width="10%">
                                    <col width="65%">
                                    <col width="15%">
                                    <col width="10%">
                                </colgroup>
                                </c:if>
                                <c:if test="${bbsId eq 7}">
                                    <colgroup>
                                        <col width="8%">
                                        <col width="15%">
                                        <col width="52%">
                                        <col width="15%">
                                        <col width="10%">
                                    </colgroup>
                                </c:if>
                                <thead>
                                <c:if test="${bbsId ne 7}">
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성일</th>
                                    <th scope="col">조회수</th>
                                </tr>
                                </c:if>
                                <c:if test="${bbsId eq 7}">
                                    <tr>
                                        <th scope="col">번호</th>
                                        <th scope="col">구분</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">조회수</th>
                                    </tr>
                                </c:if>
                                </thead>
                                <tbody>
                                <c:forEach var="post" items="${list }" varStatus="status">
                                    <tr>
                                        <c:choose>
                                            <c:when test="${post.notiAt eq 'Y'}">
                                                <td>
                                                    <img class="home-icon"
                                                         src="${pageContext.request.contextPath}/images/common/pin.png"
                                                         style="width:20px; hight:20px;">
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="txt_alcnt">
                                                        ${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:if test="${bbsId eq 7}">
                                            <td><c:out value="${post.tag}"/></td>
                                        </c:if>
                                        <td class="al">
                                                <%--<a href="javascript:showView('${list.boardSeq}')" >${list.title }</a>--%>
                                            <a href="<c:url value="/front/board/${post.bbsId}/view.do?boardSeq=${post.boardSeq}"/>">
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