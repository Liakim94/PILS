<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<%@ taglib uri="fx" prefix="fx" %>
<%pageContext.setAttribute("crcf", "\r\n"); %>
<head>
    <title>중소벤처기업부 | 걸어온 발자취</title>
</head>
<style>
    .thumbnail-box {
        display: flex;
        align-items: center;
    }

    .thumbnail-box .image-wrapper {
        width: 50px;
        height: 50px;
        display: inline-flex;
        align-items: center;
        border: 1px solid #eee;
        margin-right: 15px;
        box-sizing: border-box;
    }

    .thumbnail-box .image-wrapper img {
        width: 48px;
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
                    납품대금 연동제란?
                </li>
                <li>
                    걸어온 발자취
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">걸어온 발자취</h1>
                <div class="side-wrap"></div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <div id="gboard-list">
                    <c:forEach var="rs" items="${rs }" varStatus="status">
                        <div class="lst">
                            <a href="<c:url value="/front/guide/trace/view.do?seq=${rs.seq}"/>">
<%--                                <div class="thumbnail" style="background:url('<c:out value="${FileUploadController.makeDownloadLink(rs.savedFilePath,rs.file_nm)}"/>')--%>
<%--                                        , url('<c:url value="/images/no-image.jpg"/>')"></div>--%>
                                <img src="<c:url value="${FileUploadController.makeDownloadLink(rs.savedFilePath, rs.file_nm)}"/>"
                                     onerror="this.src='<c:url value="/images/no-image.jpg"/>'"
                                     style="height:180px;width: 290px">
                                <div class="lst-info">
                                    <h3 class="title"> ${rs.title}</h3>
                                    <p class="regdate">${fn:substring(rs.rgst_dt,0,10)}</p>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                    <c:if test="${empty rs }">
                        <div>조회된 데이터가 없습니다.</div>
                    </c:if>
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