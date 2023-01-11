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
</head>
<script>
    function test() {
        var p1 = document.getElementById('pw1').value;
        var p2 = document.getElementById('passwd').value;

            if (p1 != p2) {
                alert("비밀번호 불일치")
                return false;
            }
        $("#frmChange").submit();
    }
</script>
<page:applyDecorator name="menu_myPage"/>
<form:form name="frmChange" id="frmChange" method="POST" action="changePw.do">

    <div class="article">
        <div class="content">

            <col width="17%"/>
            <col width="*"/>
            <div class="article-header">
                <h3>비밀번호 변경</h3>
                <div class="side-wrap">
                </div>
            </div>
            <table class="tbl-list02">
                <tbody>
                <input type="hidden" id=id name="id" value="${sessionId}">
                <tr>
                    <th class="txt_alcnt" scope="row">비밀번호</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" name="pw1" id="pw1"/>
                    </td>
                    <th class="txt_alcnt" scope="row">비밀번호 재입력</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="passwd" name="passwd"/>
                    </td>
                </tr>
                </tbody>
            </table>

            <div class="btn-wrap type04">
                <button type="button" class="btn blue" onclick="test()">저장</button>
                <a href="${pageContext.request.contextPath}/main/management.do" class="btn blue">취소</a>
            </div>
        </div>
    </div>
</form:form>
