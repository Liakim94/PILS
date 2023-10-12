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
    <title>관리자 | 메인 배너 관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
</head>
<script>
    $(document).ready(function() {

        /* pc 베너 추가 */
        $('#pc-banner-selector').find('input[type=file]').on('change', function(evt) {
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

            $('#pc-banner-selector').find('input[type=text]').val(fileName);

            var fileReader = new FileReader();
            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function(e) {
                console.log(e.target.result);
                $('.logo-image').attr('src', e.target.result);

            }
        });

        /* mobile 배너 추가 */
        $('#mobile-banner-selector').find('input[type=file]').on('change', function(evt) {
            console.dir(this.files);
            console.dir(evt.target.files);

            var fileList = this.files || evt.target.files;

            if (fileList.length <= 0) {
                alert('파일을 선택하세요.');
                return false;
            }

            var targetFile = fileList[0];
            var fileName = targetFile.name;

            $('#mobile-banner-selector').find('input[type=text]').val(fileName);

            var fileReader = new FileReader();
            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function(e) {
                console.log(e.target.result);
                $('.logo-image').attr('src', e.target.result);

            }
        });

        /* 저장 버튼 처리 */
        $('#submit').on('click', function() {

            if (!confirm("현재 상태로 저장하시겠습니까?")) {
                return false;
            }

            // pc 배너 업로드
            let pcFiles = $('#pcImgFile')[0].files;

            console.log('pc');
            console.dir(pcFiles);

            if (pcFiles.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "banner/pc");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 1);
                formData.append("savedFileSize", calcTotalSize(pcFiles));
                formData.append("savedFileCount", 0);
                for (const file of pcFiles) {
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

                        console.log("sucess pc");
                        console.dir(resultFiles);

                        $('#jsonPcImage').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                });

                console.log("pc,,,");
            }

            // mobile 배너 업로드
            let mobileFiles = $('#mobileImgFile')[0].files;

            if (mobileFiles.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "banner/mobile");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 1);
                formData.append("savedFileSize", calcTotalSize(mobileFiles));
                formData.append("savedFileCount", 0);
                for (const file of mobileFiles) {
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

                        console.log("sucess mobile");
                        console.dir(resultFiles);

                        $('#jsonMobileImage').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                });
                console.log("mobile,,,");
            }

            $('#post').submit();
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
<style>
    .input-box {
        display: flex;
        align-items: center;
        padding: 10px;
    }
    .input-box,
    .input-box * {
        box-sizing: border-box;
    }
    .input-box::after {
        content: "";
        display: block;
        clear: both;
    }
    .input-box input[type=text] {
        width: 100%;
        margin-right: 10px;
    }
    .input-box .button {
        width: 18%;
        line-height: 40px;
        height: 42px;
        padding: 0;
    }
    .file-selector,
    .banner-selector {
        position: relative;
        overflow: hidden;
        width: 80%;
    }
    .file-selector input[type=file],
    .banner-selector input[type=file] {
        position: absolute;
        top: -100px;
        width: 1px;
        height: 1px;
        opacity: 0;
    }
    .banner-selector {
        display: flex;
    }
</style>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_admin"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="<c:url value="/images/common/home-icon.png"/>" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>
                    관리자
                </li>
                <li>
                    메인 배너 관리
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">메인 배너 관리</h1>
                <div class="side-wrap"></div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <div class="write-container">
                    <form:form modelAttribute="post" action="post.do" method="post" id="post">
                        <div class="write-wrap">
                            <div class="write-container">
                                <div class="line-wrap">
                                    <div class="label">사이트명</div>
                                    <div class="input-wrap" >
                                        <form:input type="text" path="banNm"/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">URL주소</div>
                                    <div class="input-wrap" >
                                        <form:input type="text" path="siteUrl"/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <form:hidden path="jsonPcImage"/>
                                    <div class="label">PC 배너 선택</div>
                                    <div id="pc-banner-selector" class="input-box file-selector">
                                        <form:input path="pcImgPath" readonly="true" placeholder="pc 배너를 선택하세요."/>
                                        <input type="file" name="pcImgFile" id="pcImgFile"/>
                                        <label for="pcImgFile" class="button">선택...</label>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <form:hidden path="jsonMobileImage"/>
                                    <div class="label">MOBILE 배너 선택</div>
                                    <div id="mobile-banner-selector" class="input-box file-selector">
                                        <form:input path="mobileImgPath" readonly="true" placeholder="mobile 배너를 선택하세요."/>
                                        <input type="file" name="mobileImgFile" id="mobileImgFile"/>
                                        <label for="mobileImgFile" class="button">선택...</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
                <div class="write-bottom">
                    <button id="submit" class="submit" style="width: 135px">게시</button>
                    <a href="<c:url value="/admin/banner/list.do"/>" class="back">취소</a>
                </div>
            </div>
        </div>
    </div>
</div>


