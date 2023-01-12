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
<form:form commandName="rs" name="frmEdit" id="frmEdit" method="POST" action="joinEdit.do">

    <div class="article">
        <div class="content">

            <col width="17%"/>
            <col width="*"/>
            <div class="article-header">
                <h3>동행기업 수정</h3>
                <div class="side-wrap">
                </div>
            </div>
            <table class="tbl-list02">
                <tbody>
                <tr>
                    <th class="txt_alcnt" scope="row">기업명</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="cmpNm" name="cmpNm" value="${rs.cmpNm}"/>
                    </td>
                    <th class="txt_alcnt" scope="row">사업자번호</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="bizNo1" name="bizNo1"
                               style="width:60px;" value="${rs.bizNo1}"/>
                        -
                        <input type="number" class="uni_input_text wdh100" id="bizNo2" name="bizNo2"
                               style="width:50px;" value="${rs.bizNo2}"/>
                        -
                        <input type="number" class="uni_input_text wdh100" id="bizNo3" name="bizNo3"
                               style="width:60px;"  value="${rs.bizNo3}"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">대표자명</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="ceo" name="ceo" value="${rs.ceo}"/>
                    </td>
                    <th class="txt_alcnt" scope="row">설립일자</th>
                    <td>
                        <input type="date" class="uni_input_text wdh100" id="fdate" name="fdate" value="${rs.fdate}"/>
                    </td>
                </tr>

                <tr>
                    <th class="txt_alcnt" scope="row">본사 주소</th>
                    <td colspan="3">
                        <input type="text" class="uni_input_text " name="address" id="address"
                               value="${rs.address}" onclick="execPostCode()" readonly/>
                        <button type="button" class="btn"
                                onclick="execPostCode()">주소찾기
                        </button>
                        <input type="text" class="uni_input_text " name="address_dtl" id="address_dtl"
                               value="${rs.address_dtl}"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">전화번호</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="telNo" name="telNo" value="${rs.telNo}"/>
                    </td>
                    <th class="txt_alcnt" scope="row">팩스</th>
                    <td>
                        <input type="number" class="uni_input_text wdh100" id="faxNo" name="faxNo" value="${rs.faxNo}"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">업종</th>
                    <td>
                        <input type="text" class="uni_input_text wdh100" id="bizType" name="bizType"
                               value="${rs.bizType}"/>
                    </td>
                    <th class="txt_alcnt" scope="row">자본금</th>
                    <td>
                        <input type="text" class="uni_input_text" id="capital" name="capital" style="padding:0"
                               value="${rs.capital}"/>백만원
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">기업 로고</th>
                    <td colspan="3">
                        파일찾기
                    </td>
                </tr>
                <th colspan="4" class="txt_alcnt" scope="row">기업현황 (최근 3년)</th>
                <tr>
                    <th class="txt_alcnt" scope="row">지표</th>
                    <th class="txt_alcnt" scope="row">2019년</th>
                    <th class="txt_alcnt" scope="row">2020년</th>
                    <th class="txt_alcnt" scope="row">2021년</th>
                </tr>
                <c:forEach var="st" items="${st}" varStatus="status">
                    <c:if test="${status.index mod 3 eq 0}" >
                        <tr>
                        <th class="txt_alcnt" scope="row">${st.index_dv_nm} </th>
                    </c:if>
                    <td align="center">
                        <input type="number" class="uni_input_text wdh100" id="ix_data${status.index+1}" name="ix_data${status.index+1}" value="${st.index_data}"/>
                    </td>
                    <c:if test="${status.index mod 3 eq 2}" >
                        </tr>
                    </c:if>
                </c:forEach>

                <tr>
                    <th class="txt_alcnt" scope="row">주요생산품</th>
                    <td colspan="3">
                        <input type="text" id="product" class="uni_input_text" name="product" value="${rs.product}"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">첨부서류</th>
                    <td colspan="3">
                        파일찾기
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="btn-wrap type04">
                <button type="submit" class="btn blue">저장</button>
                <a href="${pageContext.request.contextPath}/main/myPage.do" class="btn blue">취소</a>
            </div>
        </div>
    </div>
</form:form>
