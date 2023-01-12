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
    // submit
    function fn_submit() {

        var frm = document.getElementById('frmWrite');

        if (frm.name.value == "") {
            alert("작성자를 입력하세요.");
            return false;
        }
        if (frm.id.value == "") {
            alert("공개여부를 선택하세요.");
            return false;
        }
        if (frm.passwd.value == "" && document.getElementById('ChkBox2').checked) {
            alert("비밀번호를 입력하세요.");
            return false;
        }
        if (frm.title.value == "") {
            alert("제목을 입력하세요.");
            return false;
        }

        oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);

        var ir1 = $("#cont");
        var ir2 = $("#cont").val();
        if (ir1 == "" || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>') {
            alert("내용을 입력하세요.");
            return false;
        }

        $("#frmEdit").submit();
    }

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
<page:applyDecorator name="menu_myPage"/>
<form:form name="frmEdit" id="frmEdit" method="POST" action="memEdit.do">

    <div class="article">
        <div class="content">

            <col width="17%"/>
            <col width="*"/>
            <div class="article-header">
                <h3>담당자 정보 수정</h3>
                <div class="side-wrap">
                </div>
            </div>
            <table class="tbl-list02">
                <tbody>
                <th colspan="4" class="txt_alcnt" scope="row">담당자</th>
                <tr>
                    <th class="txt_alcnt" scope="row">성명</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" name="name" id="name" value="${rs.name}"/>
                    </td>
                    <th class="txt_alcnt" scope="row">전화번호</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="mbphno" name="mbphno"
                               value="${rs.mbphno}"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">소속부서</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="deptNm" name="deptNm"
                               value="${rs.deptNm}"/>
                    </td>
                    <th class="txt_alcnt" scope="row">직위</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="position" name="position"
                               value="${rs.position}"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">이메일</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text " name="email1" id="email1" value="${rs.email1}"/>
                        @
                        <input type="text" class="uni_input_text " name="email2" id="email2" value="${rs.email2}"/>
                        <select id="email3" class="uni_input_text " style="border-radius: 5px;"
                                onclick="selectEmail(this)">
                            <option value="1">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="gmail.com">gmail.com</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">사무실 전화</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="memTelNo" name="memTelNo"
                               value="${rs.memTelNo}"/>
                    </td>
                    <th class="txt_alcnt" scope="row">팩스</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="memFaxNo" name="memFaxNo"
                               value="${rs.memFaxNo}"/>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="btn-wrap type04">
                <button type="submit" class="btn blue">저장</button>
                <a href="${pageContext.request.contextPath}/main/changePw.do" class="btn blue">비밀번호 변경</a>
                <a href="${pageContext.request.contextPath}/main/management.do" class="btn blue">취소</a>
            </div>
        </div>
    </div>
</form:form>
