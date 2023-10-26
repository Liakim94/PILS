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
    function Checkform() {
        const selectedValue = document.getElementById("tag").value;
        if (selectedValue === "") {
            alert("검색 항목을 선택해주세요.");
            return false;
        }
    }
    function sortList(val) {
        $('input[name=sort]').attr('value',val);
        document.getElementById('frmSearch').submit();
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
                <li>담당자 관리</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">담당자 관리</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <form action="" name="frmSearch" id="frmSearch" method="get" onSubmit="return Checkform()">
                    <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                    <section style="margin-bottom: 10px">
                        <select id="tag" name="tag" value="">
                            <option value="">선택</option>
                            <option value="user_id" <c:if test="${vo.tag == 'user_id'}">selected="selected"</c:if>>아이디</option>
                            <option value="nm" <c:if test="${vo.tag == 'nm'}">selected="selected"</c:if>>이름</option>
                            <option value="cmp_nm" <c:if test="${vo.tag == 'cmp_nm'}">selected="selected"</c:if>>회사</option>
                            <option value="mbphno" <c:if test="${vo.tag == 'mbphno'}">selected="selected"</c:if>>전화번호</option>
                        </select>
                        <input type="text" name="keyword" value="${vo.keyword}" style=" border-radius: 5px;">
                        <button type="submit" style=" background: #E60024; border-radius: 5px;
                                 padding: 10px 12px; color: #FFFFFF;  font-weight: 300; font-size: 15px;border: none;">검색
                        </button>
                    </section>
                    <div class="write-container">
                        <table class="tbl-list01">
                            <colgroup>
                                <col width="10%"/>
                                <col width="17%"/>
                                <col width="12%"/>
                                <col width="20%"/>
                                <col width="12%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="15%"/>
                                <col width="10%"/>
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col"><a href="javascript:void(0);" onclick="sortList('user_id')">아이디</a></th>
                                    <th scope="col"><a href="javascript:void(0);" onclick="sortList('nm')">이름</a></th>
                                    <th scope="col"><a href="javascript:void(0);" onclick="sortList('cmp_nm')">회사</a></th>
                                    <th scope="col">직위</th>
                                    <th scope="col">부서</th>
                                    <th scope="col"><a href="javascript:void(0);" onclick="sortList('mbphno')">전화번호</a></th>
                                    <th scope="col">담당자구분</th>
                                    <th scope="col">승인여부</th>
                                    <input type="hidden" name="sort" id="sort" value="${vo.sort}">
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="rs" items="${rs }" varStatus="status">
                                <tr>
                                    <td>${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }</td>
                                    <td class="al"><a href="${pageContext.request.contextPath}/admin/memDetail.do?id=${rs.id}" style="color: rgb(0, 72, 255);">${rs.id }</a></td>
                                    <td>${rs.name}</td>
                                    <td class="al">${rs.cmpNm}</td>
                                    <td>${rs.position}</td>
                                    <td class="al">${rs.deptNm}</td>
                                    <td>${rs.mbphno}</td>
                                    <td>${rs.management_cd}</td>
                                    <c:choose>
                                        <c:when test="${rs.auth_cd eq 'M102' }">
                                            <td>승인</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>신청</td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty rs }">
                                <tr>
                                    <td colspan="9" class="text-center">조회된 데이터가 없습니다.</td>
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
                    <!-- paging -->
                </form>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

