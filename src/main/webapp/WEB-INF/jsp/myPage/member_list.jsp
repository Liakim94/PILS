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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<script>
    function linkPage(num) {
        var form = document.frmSearch;
        form.pageIndex.value = num;
        form.submit();
    }

</script>
<page:applyDecorator name="menu_myPage"/>
<div class="article">
    <div class="content">
        <!-- 컨텐츠 start -->
        <form action="" name="frmSearch" method="get">
            <input type="hidden" name="pageIndex" id="pageIndex" value="1">

            <div class="article-header">
                <h3>담당자 관리</h3>
                <div class="side-wrap">
                </div>
            </div>
            <div class="btn-wrap type02 low_margin">
                <a href="${pageContext.request.contextPath}/main/memAdd.do" class="btn blue">담당자 추가</a>
            </div>
            <div class="tbl-wrap separate1">
                <table class="tbl-list01">
                    <colgroup>
                        <col width="45%"/>
                        <col width="20%"/>
                        <col width="20%"/>
                    </colgroup>
                    <thead>
                    <th class="txt_alcnt" scope="col">담당자</th>
                    <th class="txt_alcnt" scope="col">아이디</th>
                    <th class="txt_alcnt" scope="col">정보수정</th>

                    </thead>
                    <tbody>
                    <c:forEach var="rs" items="${rs }" varStatus="status">
                        <tr>
                            <td>${rs.name}</td>
                            <td>${rs.id }</td>
                            <td><c:if test="${sessionId eq rs.id}">
                            <a href="${pageContext.request.contextPath}/main/memEdit.do">
                                정보수정</a> </c:if></td>
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

            <!-- 컨텐츠 end -->
        </form>
    </div>
</div>

