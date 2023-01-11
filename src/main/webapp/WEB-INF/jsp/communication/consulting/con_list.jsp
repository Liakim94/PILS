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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
                <h3>컨설팅 신청</h3>
                <div class="side-wrap">
                </div>
            </div>
            <div class="btn-wrap type02 low_margin">
                <a href="${pageContext.request.contextPath}/cmm/conApply.do" class="btn blue">신청하기</a>
            </div>
        <div class="tbl-wrap separate1">
            <table class="tbl-list01">
                <colgroup>
                    <col width="15%" />
                    <col width="55%" />
                    <col width="15%" />
                    <col width="15%" />
                </colgroup>
                <thead>
                <th class="txt_alcnt" scope="col">번호</th>
                <th class="txt_alcnt" scope="col">신청기업</th>
                <th class="txt_alcnt" scope="col">작성자</th>
                <th class="txt_alcnt" scope="col">신청일</th>
                </thead>
                <tbody>
                <c:forEach var="list" items="${list }" varStatus="status" >
                    <tr>
                        <td class="txt_alcnt">${paginationInfo.totalRecordCount - ((paginationInfo.currentPageNo-1) * paginationInfo.recordCountPerPage + status.index) }</td>
                        <td class="al">
                            <c:choose>
                                <c:when test="${sessionId ne null && sessionId eq 'admin'}">
                                    <a href="${pageContext.request.contextPath}/cmm/conView.do?bizNo=${list.bizNo}">
                                        ${list.cmpNm }
                                </c:when>
                                <c:otherwise>
                                    <a href="checkPw" data-toggle="modal" data-target="#checkPw" onclick="modalData('${list.bizNo}')" >
                                        ${list.cmpNm }
                                </c:otherwise>
                            </c:choose>

                        </a>
                        </td>
                        <td class="txt_alcnt"> ${list.name }</td>
                        <td class="txt_alcnt">${list.appdate }</td>
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
<!-- Modal -->
<div class="modal fade" id="checkPw" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">비밀번호 확인</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form id="modalFrm" >
                    <label text="비밀번호"> </label>
                    <input type="hidden"value="" id="hiddenNo">
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
                    url: "${pageContext.request.contextPath}/cmm/conChkPw.do",
                    data: "bizNo=" + $("#hiddenNo").val() + "&passwd=" + $('#passwd').val(),
                    success: function (data) {
                        if (data == "1") {
                            location.href = "${pageContext.request.contextPath}/cmm/conView.do?bizNo="+ $("#hiddenNo").val()
                            <%--var form = document.createElement('form'); // 폼객체 생성--%>
                            <%--var objs;--%>
                            <%--objs = document.createElement('input'); // 값이 들어있는 녀석의 형식--%>
                            <%--objs.setAttribute('type', 'text'); // 값이 들어있는 녀석의 type--%>
                            <%--objs.setAttribute('name', 'bizNo'); // 객체이름--%>
                            <%--objs.setAttribute('value', $("#hiddenNo").val()); //객체값--%>
                            <%--form.appendChild(objs);--%>
                            <%--form.setAttribute('method', 'post'); //get,post 가능--%>
                            <%--form.setAttribute('action', "${pageContext.request.contextPath}/cmm/conView.do"); //보내는 url--%>
                            <%--document.body.appendChild(form);--%>
                            <%--form.submit();--%>
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
            <%--new Promise( (succ, fail)=>{--%>

            <%--    $.ajax({--%>
            <%--        url: "${pageContext.request.contextPath}/cmm/conChkPw.do",--%>
            <%--        type: "POST",--%>
            <%--        data: "bizNo=" + $("#hiddenNo").val() + "&passwd=" + $('#passwd').val(),--%>
            <%--        success: function(result) {--%>
            <%--            succ(result);--%>
            <%--            console.log(result); // 성공하면--%>
            <%--        },--%>
            <%--        fail: function(result) {--%>
            <%--            fail(error);--%>
            <%--            alert("비밀번호를 확인해주세요."); // 실패하면--%>
            <%--        }--%>
            <%--    });--%>

            <%--}).then((arg) =>{    // 두번째 ajax를 실행한다.--%>

            <%--    $.ajax({--%>
            <%--        url: "${pageContext.request.contextPath}/cmm/conView.do",--%>
            <%--        type: 'post',--%>
            <%--        data: "bizNo=" + $("#hiddenNo").val(),--%>
            <%--        success: function(result2) {--%>
            <%--            succ(result2);--%>
            <%--            console.log(result2); // 성공하면--%>
            <%--        },--%>
            <%--        fail: function(result2) {--%>
            <%--            fail(error);--%>
            <%--            console.log(result.responseText); // 실패하면--%>
            <%--        }--%>

            <%--    });--%>

            <%--});--%>
        })
    });
function modalData(num){
    $('#checkPw').on('show.bs.modal', function (event) {
        $("#hiddenNo").val( num );
    })
};

</script>
