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
                    질의응답 게시판
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700"> 질의응답 게시판</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
        <!-- 컨텐츠 start -->
        <form action="" name="frmSearch" method="get">
            <input type="hidden" name="pageIndex" id="pageIndex" value="1">

            <div class="tbl-wrap for_board">
                <a href="<c:url value="/front/qna/post.do"/>" class="write-question">질의 등록</a>
                <table class="tbl-list01">
                    <caption>자주 묻는 질문: 번호, 응답여부, 제목, 작성자, 작성일, 조회수</caption>
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
                        <th scope="col">작성자</th>
                        <th scope="col">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="list" items="${list }" varStatus="status">
                        <input type="hidden" name="no" id="no" value="${list.no}">
                        <tr>
                            <td class="txt_alcnt">${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }</td>
                            <td class="al">
                                <c:choose>
                                    <c:when test="${list.id eq '1'}">
                                            <strong>[공개] </strong>
                                        <a href="<c:url value="/front/qna/view.do?no=${list.no}"/>">
                                                ${list.title }</a>
                                    </c:when>
                                    <c:otherwise>
                                        <strong>[비공개] </strong>
                                    <a href="checkPw" data-toggle="modal" data-target="#checkPw"
                                       onclick="modalData(${list.no})">
                                            ${list.title }</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="txt_alcnt"> ${list.name }</td>
                            <td class="txt_alcnt">${list.rdate }</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty list }">
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
                        <ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/>
                    </ul>
                </div>
            </div>
            <!-- // paging -->


            <!-- 컨텐츠 end -->
        </form>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="checkPw" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">비밀번호 확인</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="modalFrm">
                    <label text="비밀번호"> </label>
                    <input type="hidden" value="" id="hiddenNo">
                    <input id="passwd" type="password" name="passwd" class="form-control">
                    <div class="d-flex justify-content-center">
                        <input id="btnPw" type="submit" class="btn bg-gradient-dark mt-3" onclick="">확인</input>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>

    $(document).ready(function () {
        $("#btnPw").click(function () {
            try {
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/cmm/chkPasswd.do",
                    data: "no=" + $("#hiddenNo").val() + "&passwd=" + $('#passwd').val(),
                    success: function (data) {
                        if (data == "1") {
                            location.href = "${pageContext.request.contextPath}/front/qna./view.do?no=" + $("#hiddenNo").val()
                        } else {
                            alert("비밀번호를 확인해주세요.")
                        }
                    },
                    error: function (test) {
                        alert("error");
                    }
                })
            } catch (e) {
                alert(e);
            }
        })
    });

    function modalData(num) {
        $('#checkPw').on('show.bs.modal', function (event) {
            $("#hiddenNo").val(num);
        })
    };

</script>
