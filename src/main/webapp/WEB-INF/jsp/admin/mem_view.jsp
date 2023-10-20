<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>

<head>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/temp.css"/>">
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<script>
    function deleteMem() {
        if (confirm("정말 담당자를 삭제하시겠습니까?")) {
            $("#frmDelete").submit();
        } else {
            return false;
        }
    }
    $(document).on('click', 'button' , function() {
        $.ajax({
            type: "post"
            , data: {"id": "${rs.id}"}
            , url: "${pageContext.request.contextPath}/admin/approve.do"
            , success: function (datas) {
                    alert("승인이 완료되었습니다.");
                window.location.href = "${pageContext.request.contextPath}/admin/management/list.do"
            },
            error: function (error){
                alert("에러");
            }
        });
    });
</script>
<style type="text/css">
    input.error, textarea.error{
        border:1px dashed red;
    }
    label.error{
        display:block;
        color:red;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_admin"/>
        <form:form modelAttribute="frmDelete" method="POST" action="memDetail.do">
        <input type="hidden" name="id" id="id" value="${rs.id}">
        <input type="hidden" name="bizNo" id="bizNo" value="${rs.bizNo}">
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
            <div id="company-write" class="content">
                <div class="write-container">
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">성명</div>
                            <div class="input-wrap">
                               ${rs.name}
                            </div>
                        </div>
                        <div class="fx2">
                            <div class="label">전화번호</div>
                            <div class="input-wrap">
                                ${rs.mbphno}
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">소속부서</div>
                            <div class="input-wrap">${rs.deptNm}</div>
                        </div>
                        <div class="fx2">
                            <div class="label">직위</div>
                            <div class="input-wrap">${rs.position}</div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">이메일<span class="required">*</span></div>
                            <div class="input-wrap ">${rs.email}</div>
                        </div>
                        <div class="fx2">
                            <div class="label">사무실 전화</div>
                            <div class="input-wrap">${rs.memTelNo}</div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">팩스</div>
                        <div class="input-wrap">${rs.memFaxNo}</div>
                    </div>
                </div>
                <div class="write-bottom">
                    <c:if test="${rs.auth_cd eq 'M103'}">
                        <button type="button" class="submit" id="approve">승인하기</button>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/admin/memEdit.do?id=${rs.id}" class="submit">수정</a>
                    <a onclick="javascript:deleteMem();return false;" class="submit">삭제</a>
                    <a href="${pageContext.request.contextPath}/admin/management/list.do" class="back">목록</a>
                </div>
                </form:form>
            </div>
            </div>
        </div>
    </div>
</div>