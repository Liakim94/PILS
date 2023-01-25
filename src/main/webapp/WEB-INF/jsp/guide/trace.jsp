<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
    .thumbnail-box {
        display: flex;
        align-items: center;
    }
    .thumbnail-box .image-wrapper {
        width:50px;
        height:50px;
        display: inline-flex;
        align-items: center;
        border: 1px solid #eee;
        margin-right: 15px;
        box-sizing: border-box;
    }
    .thumbnail-box .image-wrapper img {
        width:48px;
    }
    .content table td.al {
        text-align: left;
    }

</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="guide_menu"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    납품대금연동제란?
                </li>
                <li>
                    걸어온 발자취
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">걸어온 발자취</h1>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <div class="write-container">
                    <table class="tbl-list01">
                        <colgroup>
                            <col width="10%"/>
                            <col width="60%"/>
                            <col width="30%"/>
                        </colgroup>
                        <thead>
                        <th class="txt_alcnt" scope="col">번호</th>
                        <th class="txt_alcnt" scope="col">제목</th>
                        <th class="txt_alcnt" scope="col">등록일자</th>
                        </thead>
                        <tbody>
                        <c:forEach var="rs" items="${rs }" varStatus="status">
                            <tr>
                                <td class="txt_alcnt">
                                        ${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }
                                </td>
                                <td class="al">
                                    <div class="thumbnail-box">
                                        <span class="image-wrapper">
                                            <img src="<c:out value="${rs.imgPath}"/>" alt="<c:out value="${rs.title}"/>"/>
                                        </span>
                                        <a href="<c:url value="/front/guide/trace/view.do?seq=${rs.seq}"/>">
                                                ${rs.title}</a>
                                    </div>
                                </td>
                                <td>${fn:substring(rs.rgst_dt,0,10)}</td>
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
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

