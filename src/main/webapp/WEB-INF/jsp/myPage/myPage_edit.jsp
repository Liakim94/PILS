<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="fx" prefix="fx" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ page import="kr.co.xicom.common.FileUploadController" %>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
    <script src="${pageContext.request.contextPath }/x2/plugins/dropzone/dropzone.js"></script>

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

    $(function () {
               // 파일업로더 처리
        var fileUploader = new smes.FileUploader('.file-uploader').init({
            maxFileSize: 1024 * 1024 * 100,    // 100 MB 제한
            maxFileCount: 20,
            targetFolderPath: 'test2',
            //accept : '.png, .jpg',
            targetUrl: '<c:url value="/files/upload.do"/>',
            fileList: $('#jsonFileList').val(),
            deletedFileList: $('#jsonDeletedFileList').val()
        });

        // 저장 버튼 처리
        $('#submit').on('click', function () {
            fileUploader.upload({
                done: function (result, deleted, uploaded) {
                    // 업로드 완료 후 전송된 파일 리스트 정보를
                    // 특정 hidden 파라미터로 설정하고 form을 전송한다.
                    if (result) {
                        console.dir(result);
                        $('#jsonFileList').val(JSON.stringify(result));
                    } else {
                        $('#jsonFileList').val('');
                    }
                    if (deleted) {
                        console.dir(deleted);
                        $('#jsonDeletedFiles').val(JSON.stringify(deleted));
                    } else {
                        $('#jsonDeletedFiles').val('');
                    }
                    oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);
                    $('#frmEdit').submit();
                    //fn_submit('1');
                },
                fail: function (error) {
                    console.dir(error);
                    alert(error.message);
                }
            });
            // return false;
        });
    });
</script>
<page:applyDecorator name="menu_myPage"/>
<form:form modelAttribute="frmEdit"  action="joinEdit.do">
    <form:hidden path="jsonFileList"/>
    <form:hidden path="jsonDeletedFileList"/>

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
                        <form:input path="cmpNm"/>
                    </td>
                    <th class="txt_alcnt" scope="row">사업자번호</th>
                    <td>
                        <form:input path="bizNo1"/>
                        -
                        <form:input path="bizNo2"/>
                        -
                        <form:input path="bizNo3"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">대표자명</th>
                    <td>
                        <form:input path="ceo"/>
                    </td>
                    <th class="txt_alcnt" scope="row">설립일자</th>
                    <td>
                        <form:input path="fdate"/>
                    </td>
                </tr>

                <tr>
                    <th class="txt_alcnt" scope="row">본사 주소</th>
                    <td colspan="3">
                        <form:input path="address" onclick="execPostCode()" readonly="true"/>
                        <button type="button" class="btn"
                                onclick="execPostCode()">주소찾기
                        </button>
                        <form:input path="address_dtl"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">전화번호</th>
                    <td>
                        <form:input path="telNo"/>
                    </td>
                    <th class="txt_alcnt" scope="row">팩스</th>
                    <td>
                        <form:input path="faxNo"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">업종</th>
                    <td>
                        <form:input path="bizType"/>
                    </td>
                    <th class="txt_alcnt" scope="row">자본금</th>
                    <td>
                        <form:input path="capital"/>백만원
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
                        <form:input path="product"/>
                    </td>
                </tr>
                <tr>
                    <th class="txt_alcnt" scope="row">첨부서류</th>
                    <td colspan="3">
                        <div class="file-uploader-wrapper">
                            <div class="file-uploader"></div>
                        </div>
                    </td>
                </tr>

                </tbody>
            </table>
            <div class="btn-wrap type04">
                <button type="submit" id="submit" class="btn blue">저장</button>
                <a href="${pageContext.request.contextPath}/main/myPage.do" class="btn blue">취소</a>
            </div>
        </div>
    </div>
</form:form>
