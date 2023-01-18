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
                <li>담당자 관리</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">담당자 관리</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <form action="" name="frmSearch" method="get">
                    <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                    <div class="write-container">
                        <table class="table-form">
                            <colgroup>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                                <col width="20%"/>
                            </colgroup>
                            <thead>
                            <th class="txt_alcnt" scope="col">아이디</th>
                            <th class="txt_alcnt" scope="col">이름</th>
                            <th class="txt_alcnt" scope="col">직위</th>
                            <th class="txt_alcnt" scope="col">부서</th>
                            <th class="txt_alcnt" scope="col">전화번호</th>
                            <th class="txt_alcnt" scope="col">정보수정</th>
                            </thead>
                            <tbody>
                            <c:forEach var="rs" items="${rs }" varStatus="status">
                                <tr>
                                    <td>${rs.id }</td>
                                    <td>${rs.name}</td>
                                    <td>${rs.position}</td>
                                    <td>${rs.deptNm}</td>
                                    <td>${rs.mbphno}</td>
                                    <td><c:if test="${sessionId eq rs.id}">
                                    <a href="${pageContext.request.contextPath}/main/memEdit.do">정보수정</a> </c:if></td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty rs }">
                                <tr>
                                    <td colspan="4" class="text-center">조회된 데이터가 없습니다.</td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                        <div class="write-bottom">
                            <a href="<c:url value="/main/memAdd.do"/>" class="btn blue">담당자 추가</a>
                        </div>
                    </div>
                </form>
                <!-- 컨텐츠 end -->
            </div>
        </div>
    </div>
</div>

