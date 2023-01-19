<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title> 동행기업 신청하기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
        <page:applyDecorator name="menu2"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    납품대금 연동제 동참하기
                </li>
                <li>
                    동행기업 신청
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 신청</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <form action="" name="frmSearch" method="get">
                    <input type="hidden" name="pageIndex" id="pageIndex" value="1">

                    <div class="tbl-wrap for_board">
                        <a href="${pageContext.request.contextPath}/join/joinApply.do" class="write-question">신청하기</a>

                        <table class="tbl-list01">
                            <caption>동행기업 신청</caption>
                            <colgroup>
                                <col width="10%">
                                <col width="65%">
                                <col width="15%">
                                <col width="10%">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">신청기업</th>
                                <th scope="col">작성자</th>
                                <th scope="col">신청일</th>
                            </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="list" items="${list }" varStatus="status">
                                    <tr>
                                        <td>${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }</td>
                                        <td class="al">

                                            <c:choose>
                                            <c:when test="${sessionId ne null && sessionId eq 'admin'}">
                                            <a href="${pageContext.request.contextPath}/join/joinView.do?bizNo=${list.bizNo}">
                                                    ${list.cmpNm }
                                                </c:when>
                                                <c:otherwise>
                                                <a href="checkPw" data-toggle="modal" data-target="#checkPw"
                                                   onclick="modalData('${list.bizNo}')">
                                                        ${list.cmpNm }
                                                    </c:otherwise>
                                                    </c:choose>
                                                </a>
                                        </td>
                                        <td> ${list.name }</td>
                                        <td>${list.appdate }</td>
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
                                    <ui:pagination paginationInfo="${paginationInfo }" type="image"
                                                   jsFunction="linkPage"/>
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
                            비밀번호: <input id="passwd" type="password" name="passwd" class="form-control">
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
                            url: "${pageContext.request.contextPath}/join/joinChkPw.do",
                            data: "bizNo=" + $("#hiddenNo").val() + "&passwd=" + $('#passwd').val(),
                            success: function (data) {
                                if (data == "1") {
                                    location.href = "${pageContext.request.contextPath}/join/joinView.do?bizNo=" + $("#hiddenNo").val()
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
