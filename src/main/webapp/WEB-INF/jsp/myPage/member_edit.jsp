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
</head>
<script>

    function selectEmail(ele) {
        var $ele = $(ele);
        var $email2 = $('input[name=email2]');

        // '1'인 경우 직접입력
        if ($ele.val() == "1") {
            $email2.attr('readonly', false);
            $email2.val('');
        } else {
            $email2.attr('readonly', true);
            $email2.val($ele.val());
        }
    }
</script>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_myPage"/>
        <form:form name="frmEdit" id="frmEdit" method="POST" action="memEdit.do">
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png"
                         alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>마이페이지</li>
                <li>담당자 정보 수정</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">담당자 정보 수정</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="company-write" class="content">
                <div class="write-container">
                    <div class="line-wrap">
                        <div class="label">성명</div>
                        <div class="input-wrap">
                            <input type="text" name="name" id="name" value="${rs.name}"/>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">전화번호</div>
                        <div class="input-wrap">
                            <input type="text" id="mbphno" name="mbphno"
                                   value="${rs.mbphno}"/></div>
                    </div>
                    <div class="line-wrap">
                        <div class="fx2">
                            <div class="label">소속부서</div>
                            <div class="input-wrap">
                                <input type="text" id="deptNm" name="deptNm" value="${rs.deptNm}"/></div>
                        </div>
                        <div class="fx2">
                            <div class="label">직위</div>
                            <div class="input-wrap"><input type="text" id="position" name="position"
                                                           value="${rs.position}"/>
                            </div>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">이메일</div>
                        <div class="input-wrap ">
                            <input type="text" class="multi" name="email1" id="email1" value="${rs.email1}"/>
                            <span>@</span>
                            <input type="text" style="width: 130px" name="email2" id="email2" value="${rs.email2}"/>
                            <select id="email3" style="width: 130px" onclick="selectEmail(this)">
                                <option value="1">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="gmail.com">gmail.com</option>
                            </select>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">사무실 전화</div>
                        <div class="input-wrap">
                            <input type="text" id="memTelNo" name="memTelNo" value="${rs.memTelNo}"/>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <div class="label">팩스</div>
                        <div class="input-wrap">
                            <input type="text" id="memFaxNo" name="memFaxNo" value="${rs.memFaxNo}"/></td>
                        </div>
                    </div>
                </div>
                <div class="write-bottom">
                    <button type="submit" class="submit">저장</button>
                    <a href="${pageContext.request.contextPath}/main/changePw.do" class="submit">비밀번호 변경</a>
                    <a href="${pageContext.request.contextPath}/main/management.do" class="go-lst">취소</a>
                </div>
            </div>
            </form:form>
        </div>
    </div>
</div>