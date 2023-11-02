<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="fx" prefix="fx" %>
<head>
    <title></title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/front/temp.css"/>">
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
                    document.getElementById("addr").value = '(' + data.zonecode + ') ' + addr;
                    document.getElementById("addr_dtl").focus();
                }
            }).open();
        });
    }

    $.validator.addMethod("regex", function(value, element,regexpr){
        return regexpr.test(value);
    });

    $(function () {
        $("select[name=selectEmail]").on("change", function(){
            var $email2 = $('input[name=email2]');
            if ($(this).val() == "1") {
                $email2.val('');
                $email2.prop("readonly",false);

            } else {
                $email2.val($(this).val());
                $email2.prop("readonly",true);
            }
        });

        $('#apply').on('click', function () {

            var bizNo = $("#bizNo1").val() + $("#bizNo2").val() + $("#bizNo3").val();
            $('input[name=bizNo]').attr('value', bizNo);

            if($('input[type=checkbox]').each(function (index) {
                if($(this).is(":checked")==true){
                    $('input[name=const_ty]').attr('value',$(this).val());
                }
            })
            );

            var email =$("#email1").val() + $("#email2").val();
            $('input[name=email]').attr('value', email);
            $('#consultingVO').submit();
        });

        $("#consultingVO").validate({
            ignore: "",
            rules: {
                cmp_nm: {required: true},
                bizNo: {required: true, digits : true, minlength :10},
                ceo: {required: true},
                const_ty: {required: true},
                regist_num: {required: true},
                addr: {required: true},
                biz_ty: {required: true},
                product: {required: true},
                prmy_mat: {required: true},
                mem_nm: {required: true},
                pstn: {required: true},
                mbphno: {required: true},
                email1: {required: true},
                email2: {required: true},
                pswd: {required: true, regex: /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{4,10}$/ },
                passwdChk: {required: true, equalTo: "#pswd"},
            },
            onkeyup: false,
            onclick: false,
            onfocusout: false,
            messages: {
                cmp_nm: {required: "기업명을 입력하세요."},
                bizNo: {required: "사업자번호를 확인하세요.", digits : "숫자만 입력하세요", minlength: "사업자번호를 확인하세요."},
                ceo: {required: "대표자명을 입력하세요."},
                const_ty: {required: "신청분야를 선택하세요."},
                regist_num: {required: "법인등록번호를 입력하세요."},
                addr: {required: "본사 주소를 입력하세요."},
                biz_ty: {required: "대상여부를 입력하세요."},
                product: {required: "수위탁거래 대상물품명을 입력하세요."},
                prmy_mat: {required: "주요 원재료 후보를 입력하세요."},
                mem_nm: {required: "담당자 성명을 입력하세요."},
                pstn: {required: "담당자 직위를 입력하세요."},
                mbphno: {required: "담당자 연락처를 입력하세요."},
                email1: {required: "이메일을 입력하세요."},
                email2: {required: "이메일을 입력하세요."},
                pswd: {required: "비밀번호를 입력하세요.",
                    regex:"비밀번호는 4~10자의 영문소문자, 숫자, 특수문자를 조합하여 사용해야 합니다."},
                passwdChk: {required: "비밀번호를 재입력하세요.", equalTo: "비밀번호 불일치"},
            },
        });
    });

    $(document).ready(function() {

        /* 사업신청서&활용계획서 */
        $('#file1-selector').find('input[type=file]').on('change', function(evt) {

            var fileList = this.files || evt.target.files;

            if (fileList.length <= 0) {
                alert('파일을 선택하세요.');
                return false;
            }

            var targetFile = fileList[0];
            var fileName = targetFile.name;

            $('#file1-selector').find('input[type=text]').val(fileName);

            var fileReader = new FileReader();
            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function(e) {
                $('.logo-image').attr('src', e.target.result);

            }
        });
        /* 사업자등록증&중소기업확인서 */
        $('#file2-selector').find('input[type=file]').on('change', function(evt) {

            var fileList = this.files || evt.target.files;

            if (fileList.length <= 0) {
                alert('파일을 선택하세요.');
                return false;
            }

            var targetFile = fileList[0];
            var fileName = targetFile.name;

            $('#file2-selector').find('input[type=text]').val(fileName);

            var fileReader = new FileReader();
            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function(e) {
                $('.logo-image').attr('src', e.target.result);

            }
        });
        /* 개인 또는 법인(신용)정보 수집·이용·제공 조회 동의서 */
        $('#file3-selector').find('input[type=file]').on('change', function(evt) {

            var fileList = this.files || evt.target.files;

            if (fileList.length <= 0) {
                alert('파일을 선택하세요.');
                return false;
            }

            var targetFile = fileList[0];
            var fileName = targetFile.name;

            $('#file3-selector').find('input[type=text]').val(fileName);

            var fileReader = new FileReader();
            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function(e) {
                $('.logo-image').attr('src', e.target.result);

            }
        });
        /* 국세&지방세 완납증명서 */
        $('#file4-selector').find('input[type=file]').on('change', function(evt) {

            var fileList = this.files || evt.target.files;

            if (fileList.length <= 0) {
                alert('파일을 선택하세요.');
                return false;
            }

            var targetFile = fileList[0];
            var fileName = targetFile.name;

            $('#file4-selector').find('input[type=text]').val(fileName);

            var fileReader = new FileReader();
            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function(e) {
                $('.logo-image').attr('src', e.target.result);

            }
        });

        /* 저장 버튼 처리 */
        $('#apply').on('click', function() {

            let file1 = $('#file1')[0].files;

            if (file1.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "con/file1");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 1);
                formData.append("savedFileSize", calcTotalSize(file1));
                formData.append("savedFileCount", 0);
                for (const file of file1) {
                    formData.append("files", file);
                }

                $.ajax({
                    type: 'post',
                    url: '<c:url value="/files/upload.do"/>',
                    processData: false,
                    contentType: false,
                    dataType: 'json',
                    data: formData,
                    async: false,
                    beforeSend: function(xhr, settings) {

                    },
                    success: function(result) {
                        let resultFiles = new Array();
                        for (const file of result.files) {
                            resultFiles.push(file);
                        }

                        $('#jsonFile1').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                });
                console.log("file1");
            }
            let file2 = $('#file2')[0].files;

            if (file2.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "con/file2");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 1);
                formData.append("savedFileSize", calcTotalSize(file2));
                formData.append("savedFileCount", 0);
                for (const file of file2) {
                    formData.append("files", file);
                }

                $.ajax({
                    type: 'post',
                    url: '<c:url value="/files/upload.do"/>',
                    processData: false,
                    contentType: false,
                    dataType: 'json',
                    data: formData,
                    async: false,
                    beforeSend: function(xhr, settings) {

                    },
                    success: function(result) {
                        let resultFiles = new Array();
                        for (const file of result.files) {
                            resultFiles.push(file);
                        }

                        $('#jsonFile2').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                });
                console.log("file2");
            }

            let file3 = $('#file3')[0].files;

            if (file3.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "con/file3");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 1);
                formData.append("savedFileSize", calcTotalSize(file3));
                formData.append("savedFileCount", 0);
                for (const file of file3) {
                    formData.append("files", file);
                }

                $.ajax({
                    type: 'post',
                    url: '<c:url value="/files/upload.do"/>',
                    processData: false,
                    contentType: false,
                    dataType: 'json',
                    data: formData,
                    async: false,
                    beforeSend: function(xhr, settings) {

                    },
                    success: function(result) {
                        let resultFiles = new Array();
                        for (const file of result.files) {
                            resultFiles.push(file);
                        }

                        $('#jsonFile3').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                });
                console.log("file3");
            }
            let file4 = $('#file4')[0].files;

            if (file4.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "con/file4");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 1);
                formData.append("savedFileSize", calcTotalSize(file4));
                formData.append("savedFileCount", 0);
                for (const file of file4) {
                    formData.append("files", file);
                }

                $.ajax({
                    type: 'post',
                    url: '<c:url value="/files/upload.do"/>',
                    processData: false,
                    contentType: false,
                    dataType: 'json',
                    data: formData,
                    async: false,
                    beforeSend: function(xhr, settings) {

                    },
                    success: function(result) {
                        let resultFiles = new Array();
                        for (const file of result.files) {
                            resultFiles.push(file);
                        }

                        $('#jsonFile4').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                });
                console.log("file4");
            }
            // $('#consultingVO').submit();
        });
    });
    function calcTotalSize(files) {
        var totalSize = 0;
        if (files && files.length) {
            for (var i = 0; i < files.length; i++) {
                totalSize += files[i].size;
            }
        }
        return totalSize;
    };
    function containsFile(targetImageFiles, fileName) {
        if (targetImageFiles) {
            for (const file of targetImageFiles) {
                if (file.name === fileName) {
                    return true;
                }
            }
            return false;
        }
        else {
            return false;
        }
    };

</script>
<style type="text/css">
    input.error, textarea.error{
        border:1px dashed red;
    }
    label.error{
        display:block;
        color:red;
    }
    .tip{
        background: rgba(145, 145, 145, 0.1);
        padding: 16px 17px;
        width: 100%;
        color: blue;
    }
    .line-wrap .input-box {
        box-sizing: border-box;
        width: 80%;
        display: flex;
        align-items: center;
        padding: 10px;
    }
    .input-box input[type=text] {
        width: 100%;
        margin-right: 10px;
    }
    .box-container{
        background: #FAFAFC;
        border-radius: 10px;
        padding: 20px;
        box-sizing: border-box;
        margin-bottom: 20px;
        font-size: 18px;
        line-height: 28px;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>소통·상담</li>
                <li>컨설팅 신청</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">컨설팅 신청</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about">
                <div class="info-link">
                    <div class="item">
                        <a href="<c:url value="/files/원가분석 컨설팅 공고문＋신청서 양식.zip"/>" download style="width: 300px;">
                            <img class="hover" src="<c:url value="/images/common/download-icon2.png"/>" >
                            <img class="unhover" src="<c:url value="/images/common/download-icon.png"/>" >
                            모집공고&필수 서류 제출 양식</a>
                    </div>
                </div>
            </div>
            <div id="company-write" class="content">
                <!-- 컨텐츠 start -->
                <form:form modelAttribute="consultingVO" method="post" action="edit.do">
                    <form:hidden path="seq"/>
                    <h2 class="title">기업 정보</h2>
                    <div class="write-container">
                        <div class="line-wrap ">
                            <div class="label" style="width: 29%;">
                                신청분야<span class="required">*</span>
                                <p style="color: blue;">※ 둘 다 혹은 택1 지원 가능</p>
                            </div>
                            <div class="input-wrap" style="border-right: 1px solid #505050; padding-top: 18px;text-align: center;">
                                <input type="checkbox" name="const_ty1" id="const_ty1" value="원재료 비중 확인서 발급" style="width: 25%"
                                       <c:if test='${rs.const_ty1 == "원재료 비중 확인서 발급"}'>checked</c:if>>
                                <div style="vertical-align: middle;">원재료 비중 확인서 발급 &nbsp;<p style="color: blue;">*수탁기업(수급사업자)만 지원가능</p></div>

                            </div>
                            <div class="input-wrap" style="text-align: center;">
                                <input type="checkbox" name="const_ty2" id="const_ty2" value="연동 약정 컨설팅" style="width: 25%;"
                                       <c:if test='${rs.const_ty2 == "연동 약정 컨설팅"}'>checked</c:if>>
                                연동 약정 컨설팅
                            </div>
                            <input type="hidden" name="const_ty" id="const_ty" value="">
                            <label class="error" for="const_ty" generated="true" style="display:none;padding-top: 28px;"/>
                        </div>

                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    기업명<span class="required">*</span>
                                </div>
                                <div class="input-wrap non-flex">
                                    <input type="text" name="cmp_nm" id="cmp_nm"  value="  ${rs.cmp_nm}">
                                    <label class="error" for="cmp_nm" generated="true" style="display:none;"/>

                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    사업자 번호
                                </div>
                                <div class="input-wrap non-flex ">
                                    <input value="${rs.bizNo1}" class="multi" type="text" name="bizNo1" id="bizNo1" maxlength="3" style="width: 103px !important;">
                                    <span>-</span>
                                    <input value="${rs.bizNo2}" class="multi" type="text" name="bizNo2" id="bizNo2" maxlength="2" style="width: 103px !important;">
                                    <span>-</span>
                                    <input value="${rs.bizNo3}" class="multi" type="text" name="bizNo3" id="bizNo3" maxlength="5" style="width: 103px !important;">
                                    <input type="hidden" name="bizNo" id="bizNo" value="">
                                    <label class="error" for="bizNo" generated="true" style="display:none;"/>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    대표자명<span class="required">*</span>
                                </div>
                                <div class="input-wrap non-flex">
                                    <input type="text" id="ceo" name="ceo" value=" ${rs.ceo}" required/>
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    법인등록번호<span class="required">*</span>
                                </div>
                                <div class="input-wrap non-flex">
                                    <input type="text" id="regist_num" name="regist_num" value=" ${rs.regist_num}"/>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                본사 주소<span class="required">*</span>
                            </div>
                            <div class="input-wrap non-flex address-input-wrap">
                                <input type="text" name="addr" id="addr" onclick="execPostCode()" value="${rs.addr}" readonly/>
                                <button type="button" class="btn" onclick="execPostCode()">주소찾기</button>
                                <input type="text" name="addr_dtl" id="addr_dtl" value="${rs.addr_dtl}"  placeholder="상세주소"/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label" style="width: 29%">
                                수탁위탁거래 시 대상여부<span class="required">*</span>
                            </div>
                            <div class="input-wrap" style="border-right: 1px solid #505050;">
                                <input type="radio" id="biz_ty" name="biz_ty" value="위탁기업" style="width: 40%;"
                                       <c:if test='${rs.biz_ty == "위탁기업"}'>checked</c:if>>
                                위탁기업(원사업자)
                            </div>
                            <div class="input-wrap" >
                                <input type="radio" id="consign" name="biz_ty"  value="수탁기업" style="width: 40%;"
                                       <c:if test='${rs.biz_ty == "수탁기업"}'>checked</c:if>>
                                수탁기업(수급사업자)
                            </div>
                            <label class="error" for="biz_ty" generated="true" style="display:none;padding-top: 15px;"/>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                수위탁거래 대상물품명<span class="required">*</span>
                            </div>
                            <div class="input-wrap non-flex">
                                <input type="text" id="product" name="product" value=" ${rs.product}"
                                       placeholder="* 추후 연동 희망 예정인 대상 물품명"/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                주요 원재료 후보<span class="required">*</span>
                            </div>
                            <div class="input-wrap non-flex">
                                <input type="text" id="prmy_mat" name="prmy_mat" value="${rs.prmy_mat}"/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <p class="tip">* 원재료 : 물품등의 제조를 위해 필요한 재료로서 원료와 재료를 포괄하고, 천연재료, 화합물, 가공물, 중간재 등을 포함하되 이에 한정하지 않음</p>
                        </div>
                    </div>
                    <h2 class="title mt40">담당자</h2>
                    <div class="write-container">
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label">
                                    성명<span class="required">*</span>
                                </div>
                                <div class="input-wrap non-flex">
                                    <input type="text" id="mem_nm" name="mem_nm" value="${rs.mem_nm}"/>
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label">
                                    직위<span class="required">*</span>
                                </div>
                                <div class="input-wrap non-flex">
                                    <input type="text" id="pstn" name="pstn" value=" ${rs.pstn}"/>
                                </div>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                연락처<span class="required">*</span>
                            </div>
                            <div class="input-wrap non-flex">
                                <input type="text" id="mbphno" name="mbphno" value="${rs.mbphno}"/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="label">
                                이메일<span class="required">*</span>
                            </div>
                            <div class="input-wrap flex">
                                <input type="text" class="multi" name="email1" id="email1" value=" ${rs.email1}"/>
                                <span>@</span>
                                <input type="text" style="width: 130px" name="email2" id="email2"  value=" ${rs.email2}"/>
                                <select id="selectEmail" style="width: 130px" name="selectEmail">
                                    <option value="1">직접입력</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="daum.net">daum.net</option>
                                    <option value="gmail.com">gmail.com</option>
                                </select>
                                <input type="hidden" value="" id="email" name="email">
                                <label class="error" for="email2" generated="true" style="display:none;"/>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <div class="fx2">
                                <div class="label label-long">
                                    비밀번호<span class="required">*</span>
                                </div>
                                <div class="input-wrap non-flex long-input">
                                    <input type="password" name="pswd" id="pswd" placeholder="비밀번호를 입력해주세요." required>
                                    <h5 class="sub">※ 비밀번호는 4~10자의 영문소문자, 숫자, 특수문자를 조합하여 사용해야 합니다.</h5>
                                </div>
                            </div>
                            <div class="fx2">
                                <div class="label label-long">
                                    비밀번호 재입력<span class="required">*</span>
                                </div>
                                <div class="input-wrap non-flex long-input">
                                    <input type="password" id="passwdChk" name="passwdChk" placeholder="비밀번호를 재입력해주세요."
                                           required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <h2 class="title mt40">필수 제출 서류 첨부</h2>
                    <div class="box-container">
                        <ul style="padding-left: 30px;">
                            <li style="list-style: disc;">필수 제출(업로드) 서류(pdf, hwp, docx 활용)</li>
                            &nbsp;&nbsp;1. 사업신청서(활용계획서 포함, 신청서 날인본)<br>
                            &nbsp;&nbsp;2. 개인 또는 법인(신용)정보 수집·이용·제공 조회 동의서(날인본)<br>
                            &nbsp;&nbsp;3. 사업자등록증(신청일로부터 3개월이내) 및 중소기업확인서(유효기간 내) 각 1부<br>
                            &nbsp;&nbsp;4. 국세 및 지방세 완납 증명서 각 1부(접수일 기준 유효기간 내)
                        </ul>
                    </div>
                    <div class="write-container">
                        <div class="line-wrap">
                            <form:hidden path="jsonFile1"/>
                            <div class="label" style="width: 30%">
                                1. 사업신청서&활용계획서
                            </div>
                            <div id="file1-selector" class="input-box file-selector">
                                <form:input path="filenm1" readonly="true"/>
                                <input type="file" name="file1" id="file1"/>
                                <label for="file1" class="button">선택...</label>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <form:hidden path="jsonFile2"/>
                            <div class="label" style="width: 30%">
                                2. 사업자등록증&중소기업확인서
                            </div>
                            <div id="file2-selector" class="input-box file-selector">
                                <form:input path="filenm2" readonly="true"/>
                                <input type="file" name="file2" id="file2"/>
                                <label for="file2" class="button">선택...</label>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <form:hidden path="jsonFile3"/>
                            <div class="label" style="width: 30%">
                                3. 개인 또는 법인(신용)정보 수집·이용·제공 조회 동의서
                            </div>
                            <div id="file3-selector" class="input-box file-selector">
                                <form:input path="filenm3" readonly="true"/>
                                <input type="file" name="file3" id="file3"/>
                                <label for="file3" class="button">선택...</label>
                            </div>
                        </div>
                        <div class="line-wrap">
                            <form:hidden path="jsonFile4"/>
                            <div class="label" style="width: 30%">
                                4.국세&지방세 완납증명서
                            </div>
                            <div id="file4-selector" class="input-box file-selector">
                                <form:input path="filenm4" readonly="true"/>
                                <input type="file" name="file4" id="file4"/>
                                <label for="file4" class="button">선택...</label>
                            </div>
                        </div>
                    </div>
                </form:form>
                <div class="write-bottom">
                    <button  id="apply" class="submit">등록</button>
                    <a href="<c:url value="/front/consulting/view.do?seq=${rs.seq}"/>" class="back">취소</a>
                </div>

            </div>
        </div>
    </div>
</div>
