<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://egovframework.gov/ctl/ui" prefix="ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<head>
    <title>중소벤처기업부 | 동행기업 실적 제출</title>
    <script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>
</head>
<script>

    $(document).ready(function() {

        /* intrlck 파일 */
        $('#intrlck-selector').find('input[type=file]').on('change', function(evt) {
            console.dir(this.files);
            console.dir(evt.target.files);

            var fileList = this.files || evt.target.files;

            console.dir(fileList);

            if (fileList.length <= 0) {
                alert('파일을 선택하세요.');
                return false;
            }

            var targetFile = fileList[0];
            var fileName = targetFile.name;

            $('#intrlck-selector').find('input[type=text]').val(fileName);

            var fileReader = new FileReader();
            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function(e) {
                console.log(e.target.result);
                $('.logo-image').attr('src', e.target.result);

            }
        });

        /* change 추가 */
        $('#change-selector').find('input[type=file]').on('change', function(evt) {
            console.dir(this.files);
            console.dir(evt.target.files);

            var fileList = this.files || evt.target.files;

            if (fileList.length <= 0) {
                alert('파일을 선택하세요.');
                return false;
            }

            var targetFile = fileList[0];
            var fileName = targetFile.name;

            $('#change-selector').find('input[type=text]').val(fileName);

            var fileReader = new FileReader();
            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function(e) {
                console.log(e.target.result);
                $('.logo-image').attr('src', e.target.result);

            }
        });
        /* intrlck_perf 추가 */
        $('#intrlck_perf-selector').find('input[type=file]').on('change', function(evt) {
            console.dir(this.files);
            console.dir(evt.target.files);

            var fileList = this.files || evt.target.files;

            if (fileList.length <= 0) {
                alert('파일을 선택하세요.');
                return false;
            }

            var targetFile = fileList[0];
            var fileName = targetFile.name;

            $('#intrlck_perf-selector').find('input[type=text]').val(fileName);

            var fileReader = new FileReader();
            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function(e) {
                console.log(e.target.result);
                $('.logo-image').attr('src', e.target.result);

            }
        });
        /* 기타 파일 */
        $('#etc-selector').find('input[type=file]').on('change', function(evt) {
            console.dir(this.files);
            console.dir(evt.target.files);

            var fileList = this.files || evt.target.files;

            console.dir(fileList);

            if (fileList.length <= 0) {
                alert('파일을 선택하세요.');
                return false;
            }

            var targetFile = fileList[0];
            var fileName = targetFile.name;

            $('#etc-selector').find('input[type=text]').val(fileName);

            var fileReader = new FileReader();
            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function(e) {
                console.log(e.target.result);
                $('.logo-image').attr('src', e.target.result);

            }
        });

        /* 저장 버튼 처리 */
        $('#apply').on('click', function() {

            // intrlck 업로드
            let intrlckFile = $('#intrlckFile')[0].files;

            console.log('intrlck');
            console.dir(intrlckFile);

            if (intrlckFile.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "perf/연동표");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 1);
                formData.append("savedFileSize", calcTotalSize(intrlckFile));
                formData.append("savedFileCount", 0);
                for (const file of intrlckFile) {
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

                        console.log("sucess");
                        console.dir(resultFiles);

                        $('#jsonIntrlckFile').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                });

            }
            // change 업로드
            let changeFile = $('#changeFile')[0].files;

            console.log('pc');
            console.dir(changeFile);

            if (changeFile.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "perf/변동표");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 1);
                formData.append("savedFileSize", calcTotalSize(changeFile));
                formData.append("savedFileCount", 0);
                for (const file of changeFile) {
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

                        console.log("sucess");
                        console.dir(resultFiles);

                        $('#jsonChangeFile').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                });

                console.log("change");
            }

            // 연동실적 업로드
            let intrlck_perf = $('#intrlck_perfFile')[0].files;

            if (intrlck_perf.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "perf/연동실적");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 1);
                formData.append("savedFileSize", calcTotalSize(intrlck_perf));
                formData.append("savedFileCount", 0);
                for (const file of intrlck_perf) {
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

                        console.log("sucess intrlck_perf");
                        console.dir(resultFiles);

                        $('#jsonIntrlckPerfFile').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                });
                console.log("intrlck_perf,,,");
            }
            // 기타 파일 업로드
            let etc = $('#etcFile')[0].files;

            if (etc.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "perf/기타");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 1);
                formData.append("savedFileSize", calcTotalSize(etc));
                formData.append("savedFileCount", 0);
                for (const file of etc) {
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

                        console.log("sucess etc");
                        console.dir(resultFiles);

                        $('#jsonEtcFile').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                });
                console.log("etc");
            }
            fn_submit();
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
    function fn_submit() {
        var frm = document.getElementById('frmApply');

        if (frm.cmp_nm.value == "") {
            alert("기업명을 입력하세요.");
            return false;
        }
        if(isNaN(frm.cntr_numb.value)){
            alert("연동약정 계약 건 수는 숫자만 입력하세요.");
            return false;
        }
        if(isNaN(frm.cmp_numb.value)){
            alert("연동 약정체결 (수탁)기업 수는 숫자만 입력하세요.");
            return false;
        }
        frm.submit();
    }
</script>
<style type="text/css">
    .write-container {
        width: 100%;
        border-top: 2px solid #505050;
        border-bottom: 2px solid #505050;
    }
    .input-box .button {
        width: 18%;
        line-height: 40px;
        height: 42px;
        padding: 0;
    }
    .input-box input[type=text] {
        width: 100%;
        margin-right: 10px;
    }
    .file-selector input[type=file],
    .banner-selector input[type=file] {
        position: absolute;
        top: -100px;
        width: 1px;
        height: 1px;
        opacity: 0;
    }
    .input-box {
        display: flex;
        align-items: center;
        padding: 10px;
    }
    .input-box,
    .input-box * {
        box-sizing: border-box;
        width: 80%;
    }
    .input-box::after {
        content: "";
        display: block;
        clear: both;
    }
    @media (max-width: 1024px) {
        .content .write-container .line-wrap {
            flex-wrap: inherit !important;
        }
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_myPage"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    마이페이지
                </li>
                <li>
                    동행기업 실적 제출
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">동행기업 실적 제출</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div id="about" class="content">
                <div class="info-link">
                    <div class="item">
                        <a href="<c:url value="/files/(양식)납품대금 연동제 시범운영 실적 작성표.xlsx"/>" download="(양식)납품대금 연동제 시범운영 실적 작성표.xlsx">
                            <img class="hover" src="<c:url value="/images/common/download-icon2.png"/>" >
                            <img class="unhover" src="<c:url value="/images/common/download-icon.png"/>" >
                            필수 제출 양식</a>
                    </div>
                </div>
            </div>
            <div id="company-write" class="content">
                <form:form modelAttribute="frmApply" action="apply.do">
                <form:hidden path="jsonFileList"/>
                <div class="write-container">
                    <div class="line-wrap">
                            <div class="label" style="width:200px;">
                                (위탁)기업명<span class="required">*</span>
                            </div>
                            <div class="input-wrap non-flex">
                                <input type="text" id="명" name="cmp_nm" placeholder="기업명을 입력해주세요." required/>
                            </div>
                    </div>
                    <div class="line-wrap">
                            <div class="label" style="width:200px;">
                                연동 계약 기간
                            </div>
                            <div class="input-wrap non-flex">
                                <td>
                                    <input type="text" id="cntr_pd" name="cntr_pd"/>
                            </div>
                        </div>
                    <div class="line-wrap">
                            <div class="label"style="width:200px;">
                                연동약정 계약 건 수(총합)
                            </div>
                            <div class="input-wrap non-flex">
                                <input type="text" id="cntr_numb" name="cntr_numb"/>
                            </div>
                    </div>
                    <div class="line-wrap">
                            <div class="label"style="width:200px;">
                                연동 약정체결 (수탁)기업 수
                            </div>
                            <div class="input-wrap non-flex">
                                <input type="text" id="cmp_numb" name="cmp_numb"/>
                            </div>
                    </div>
                    <div class="line-wrap">
                        <form:hidden path="jsonIntrlckFile"/>
                        <div class="label"style="width:192px;">
                            연동표
                        </div>
                        <div id="intrlck-selector" class="input-box file-selector">
                            <form:input path="intrlck_file_nm" readonly="true"/>
                            <input type="file" name="intrlckFile" id="intrlckFile"/>
                            <label for="intrlckFile" class="button">선택...</label>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <form:hidden path="jsonChangeFile"/>
                        <div class="label"style="width:192px;">
                            변동표
                        </div>
                        <div id="change-selector" class="input-box file-selector">
                            <form:input path="change_file_nm" readonly="true"/>
                            <input type="file" name="changeFile" id="changeFile"/>
                            <label for="changeFile" class="button">선택...</label>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <form:hidden path="jsonIntrlckPerfFile"/>
                        <div class="label"style="width:192px;">
                            연동실적
                        </div>
                        <div id="intrlck_perf-selector" class="input-box file-selector">
                            <form:input path="intrlck_perf_file_nm" readonly="true"/>
                            <input type="file" name="intrlck_perfFile" id="intrlck_perfFile"/>
                            <label for="intrlck_perfFile" class="button">선택...</label>
                        </div>
                    </div>
                    <div class="line-wrap">
                        <form:hidden path="jsonEtcFile"/>
                        <div class="label"style="width:192px;">
                            기타
                        </div>
                        <div id="etc-selector" class="input-box file-selector">
                            <form:input path="etc_file_nm" readonly="true"/>
                            <input type="file" name="etcFile" id="etcFile"/>
                            <label for="etcFile" class="button">선택...</label>
                        </div>
                    </div>
                </div>
            </div>
            </form:form>
            <div class="write-bottom">
                <button id="apply" class="submit" style="width:130px">등록</button>
                <a href="${pageContext.request.contextPath}/main/perf/list.do" class="back">취소</a>
            </div>
        </div>
    </div>
</div>
</div>