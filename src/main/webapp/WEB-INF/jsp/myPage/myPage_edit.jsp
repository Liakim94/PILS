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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
    <script src="${pageContext.request.contextPath }/x2/plugins/dropzone/dropzone.js"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/temp.css"/>">
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>

</head>
<script>
    //주소찾기
    function execPostCode() {
        daum.postcode.load(function () {
            new daum.Postcode({
                oncomplete: function (data) {
                    var addr = '';

                    if (data.userSelectedType === 'R') {
                        addr = data.roadAddress;
                    } else {
                        addr = data.jibunAddress;
                    }
                    document.getElementById("address").value = '(' + data.zonecode + ') ' + addr;
                    document.getElementById("address_dtl").focus();
                }
            }).open();
        });
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
                    $('#frmEdit').submit();
                },
                fail: function (error) {
                    console.dir(error);
                    alert(error.message);
                }
            });
        });
    });
    $(function () {
        $("#frmEdit").validate({
            ignore: "",
            rules: {
                cmpNm: {required: true},
                ceo: {required: true},
                fdate: {required: true},
                address: {required: true},
                telNo: {required: true},
                faxNo: {required: true},
                bizType: {required: true},
                capital: {required: true, digits : true},
                product: {required: true},
                mainProduct: {required: true},
                joinCmp: {required: true, digits : true},
                material: {required: true},
            },
            // onkeyup: false,
            // onclick: false,
            // onfocusout: false,
            messages: {
                cmpNm: {required: "기업명을 입력하세요."},
                ceo: {required: "대표자명을 입력하세요."},
                fdate: {required: "설립일자를 입력하세요."},
                address: {required: "본사 주소를 입력하세요."},
                telNo: {required: "기업 전화번호를 입력하세요."},
                faxNo: {required: "기업 팩스를 입력하세요."},
                bizType: {required: "업종을 입력하세요."},
                capital: {required: "자본금을 입력하세요.",  digits : "숫자만 입력하세요"},
                product: {required: "주요생산품을 입력하세요."},
                mainProduct: {required: "주요 적용 제품을 입력하세요."},
                joinCmp: {required: "참여기업 수를 입력하세요.",  digits : "숫자만 입력하세요"},
                material: {required: "주요원재료를 입력하세요."},
            },
            // submitHandler: function (frm) {
            //     $("#frmEdit").submit();
            // }
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
        <page:applyDecorator name="menu_myPage"/>
        <div class="article">
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>마이페이지</li>
                <li>동행기업 수정</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 수정</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="company-write" class="content">
                <!-- 컨텐츠 start -->
                <form:form modelAttribute="frmEdit" id="frmEdit" action="joinEdit.do">
                    <form:hidden path="jsonFileList"/>
                    <form:hidden path="jsonDeletedFileList"/>
                    <h2 class="title">기업 정보</h2>
                    <div class="write-container">
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    기업명<span class="required">*</span>
                                </div>
                                <div class="input-wrap">
                                    <form:input path="cmpNm"/>
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    사업자 번호
                                </div>
                                <div class="input-wrap">
                                    <form:input path="bizNo1" class="multi" readonly="true"/>
                                    <span>-</span>
                                    <form:input path="bizNo2" class="multi"  readonly="true"/>
                                    <span>-</span>
                                    <form:input path="bizNo3" class="multi"  readonly="true"/>
                                    <input type="hidden" id="bizNo" name=bizNo value="">
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    대표자명<span class="required">*</span>
                                </div>
                                <div class="input-wrap">
                                    <form:input path="ceo"/>
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    설립일자<span class="required">*</span>
                                </div>
                                <div class="input-wrap">
                                    <form:input path="fdate"/>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                본사 주소<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <form:input path="address" onclick="execPostCode()" readonly="true"/>
                                <button type="button" class="btn"
                                        onclick="execPostCode()">주소찾기
                                </button>
                                <form:input path="address_dtl"/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    전화번호<span class="required">*</span>
                                </div>
                                <div class="input-wrap">
                                    <form:input path="telNo"/>
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    팩스<span class="required">*</span>
                                </div>
                                <div class="input-wrap">
                                    <form:input path="faxNo"/>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    업종<span class="required">*</span>
                                </div>
                                <div class="input-wrap">
                                    <form:input path="bizType"/>
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    자본금<span class="required">*</span>
                                </div>
                                <div class="input-wrap">
                                    <form:input path="capital" style="width:100px;"/>백만원
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="write-container bt-none">
                        <div class="line-wrap">
                            <div class="label-full">
                                기업현황 (최근 3년)
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label label-long">
                                지표
                            </div>
                            <div class="tri">
                                <div class="colored">2019년</div>
                                <div class="colored">2020년</div>
                                <div class="colored">2021년</div>
                            </div>
                        </div>
                        <c:forEach var="st" items="${st}" varStatus="status">
                            <c:if test="${status.index mod 3 eq 0}">
                                <div class="line-wrap">
                                <div class="label label-long">
                                        ${st.index_dv_nm}
                                </div>
                                <div class="tri">
                            </c:if>
                            <div class="border">
                            <input type="number"
                                   id="ix_data${status.index+1}"
                                   name="ix_data${status.index+1}" value="${st.index_data}"/>
                            <c:if test="${status.index mod 3 eq 2}">
                                </div>
                                </div>
                            </c:if>
                            </div>
                        </c:forEach>
                        <div class="line-wrap">
                            <div class="label" style="width: 155px">
                                주요생산품<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <form:input path="product"/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label" style="width: 164px">주요 적용 제품
                                    <span class="required">*</span>
                                </div>
                                <div class="input-wrap">
                                    <form:input path="mainProduct"/>
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">참여기업 수<span class="required">*</span>
                                </div>
                                <div class="input-wrap">
                                    <form:input path="joinCmp"/>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label" style="width: 155px">주요 원재료<span class="required">*</span>
                            </div>
                            <div class="input-wrap">
                                <form:input path="material"/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label" style="width: 155px">
                                첨부서류
                            </div>
                            <div class="input-wrap ">
                                <div class="file-uploader-wrapper">
                                    <div class="file-uploader"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>
                <div class="write-bottom">
                    <button id="submit" class="submit" style="width:135px" >저장</button>
                    <a href="${pageContext.request.contextPath}/main/myPage.do">취소</a>
                </div>
            </div>
        </div>
    </div>
</div>