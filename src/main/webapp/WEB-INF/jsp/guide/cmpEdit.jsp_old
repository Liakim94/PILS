<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"				prefix="fmt" 		%>
<%@ taglib uri="fx"                                             prefix="fx"         %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page"      prefix="page" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
<script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
<title>Title</title>
<script>
    $(document).ready(function() {
        var fileUploader = new smes.FileUploader('.file-uploader').init({
            maxFileSize: 1024 * 1024 * 100,    // 100 MB 제한
            maxFileCount: 20,
            targetFolderPath: 'company',
            accept : '.png, .jpg, .gif',
            targetUrl: '<c:url value="/files/upload.do"/>',
            fileList: $('#jsonFileList').val(),
            deletedFileList: $('#jsonDeletedFileList').val()
        });

        let prodImgFileList = $('#prodImgFileList').val();
        let _storedProdFiles = JSON.parse(prodImgFileList);
        let _deletedProdFiles = new Array();

        for (const file of _storedProdFiles) {
            let $imageWrpper = $('<div data-name="' + file.name + '" class="image-wrapper"><img src="' + file.savedPath + file.savedFileName + '"/></div>').appendTo($('#product-image-list'));
            file.target = $imageWrpper;
        }

        console.log('init...');
        console.dir(_storedProdFiles);

        let prmtImgFileList = $('#prmtImgFileList').val();
        let _storedPrmtFiles = JSON.parse(prmtImgFileList);
        let _deletedPrmtFiles = new Array();

        for (const file of _storedPrmtFiles) {
            let html  = '<div data-name="' + file.name + '" class="image-wrapper">';
                html += '<img src="' + file.savedPath + file.savedFileName + '"/>';
                html += '</div>';
            $(html).appendTo($('#promotion-image-list'));
        }

        console.log('init promotion...');
        console.dir(_storedPrmtFiles);

        /* 메인 동영상 적용 */
        $('#main-video-info button').on('click', function() {

            var url = $('#mainMovieUrl').val();

            if (url && url.length > 0) {
                $('#main-video-wrapper iframe').attr('src', url);
            }
            else {
                alert("동영상 경로를 입력하세요.");
            }
           return false;
        });

        /* 기업홍보 동영상 적용 */
        $('#sub-video-info button').on('click', function() {

            var url = $('#subMovieUrl').val();

            if (url && url.length > 0) {
                $('#sub-video-wrapper iframe').attr('src', url);
            }
            else {
                alert("동영상 경로를 입력하세요.");
            }
            return false;
        });

        /* 로고 변경 */
        $('#logo-image-selector').find('input[type=file]').on('change', function(evt) {
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

            $('#logo-image-selector').find('input[type=text]').val(fileName);

            var fileReader = new FileReader();
            fileReader.readAsDataURL(fileList[0]);
            fileReader.onload = function(e) {
                console.log(e.target.result);
                $('#logo-image').attr('src', e.target.result);

            }
        });

        /* 주요 생산품 이미지 추가 */
        $('#product-image-selector').find('input[type=file]').on('change', function(evt) {

            var fileList = this.files || evt.target.files;

            if (fileList.length <= 0) {
                alert('파일을 선택하세요');
                return false;
            }


            for (const file of fileList) {
                let isExistFile = false;
                for (const storedFile of _storedProdFiles) {
                    if (storedFile.name === file.name) {
                        isExistFile = true;
                        break;
                    }
                }

                if (isExistFile) {
                    alert(file.name + '파일이 이미 존재합니다.');
                }
                else {
                    var fileReader = new FileReader();
                    fileReader.readAsDataURL(file);
                    fileReader.onload = function (e) {
                        let $img = $('<img class="logo"/>');
                        let $wrapper = $('<div data-name="' + file.name + '" class="image-wrapper"></div>');
                        $img.appendTo($wrapper).attr('src', e.target.result);
                        $wrapper.appendTo($('#product-image-list'));

                        _storedProdFiles.push(file);
                        console.log('add...')
                        console.dir(_storedProdFiles);
                    }
                }
            }
        });

        $('#product-image-list').on('click', '.image-wrapper', function() {
            if (confirm("정말 삭제하시겠습니까?")) {
                let fileName = $(this).data('name');
                for (let i=0; i<_storedProdFiles.length; i++) {
                    let file = _storedProdFiles[i];
                    if (file.name === fileName) {
                        if (file.savedFileName) {
                            _deletedProdFiles.push(file);
                        }
                        _storedProdFiles.splice(i, 1);
                        break;
                    }
                }
                $(this).remove();
                console.log('delete...');
                console.dir(_storedProdFiles);
                console.dir(_deletedProdFiles);
            }
            else {
                return false;
            }
        });

        /* 홍보 이미지 추가 */
        $('#promotion-image-selector').find('input[type=file]').on('change', function(evt) {
           let fileList = this.files || evt.target.files;
            if (fileList.length <= 0) {
                alert('파일을 선택하세요');
                return false;
            }

            for (const file of fileList) {

                if (containsFile(_storedPrmtFiles, file.name)) {
                    alert(file.name + ' 파일이 이미 존재합니다.');
                    continue;
                }

                let fileReader = new FileReader();
                fileReader.readAsDataURL(file);
                fileReader.onload = function(e) {
                    let $img = $('<img class="logo"/>');
                    let $wrapper = $('<div data-name="' + file.name + '" class="image-wrapper"></div>');
                    $img.appendTo($wrapper).attr('src', e.target.result);
                    $wrapper.appendTo($('#promotion-image-list'));

                    _storedPrmtFiles.push(file);
                    console.log('add promotion...');
                    console.dir(_storedPrmtFiles);
                }
            }
        });
        $('#promotion-image-list').on('click', '.image-wrapper', function() {
            if (confirm("정말 삭제하시겠습니까?")) {
                let filename = $(this).data('name');
                for (let i=0; i<_storedPrmtFiles.length; i++) {
                    let file = _storedPrmtFiles[i];
                    if (file.name === filename) {
                        if (file.savedFileName) {
                            _deletedPrmtFiles.push(file);
                        }
                        _storedPrmtFiles.splice(i, 1);
                        break;
                    }
                }
                $(this).remove();
                console.log('delete promotion...');
                console.dir(_storedPrmtFiles);
                console.dir(_deletedPrmtFiles);
            }
            else {
                return false;
            }
        });

        /* 저장 버튼 처리 */
        $('#submit-button').on('click', function() {
            alert('submit');

            // 로고 이미지 업로드
            let logoFiles = $('#logoImgFile')[0].files;

            console.log('logo');
            console.dir(logoFiles);

            if (logoFiles.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "company/logo");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 1);
                formData.append("savedFileSize", calcTotalSize(logoFiles));
                formData.append("savedFileCount", 0);
                for (const file of logoFiles) {
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

                        console.log("sucess logo");
                        console.dir(resultFiles);

                        $('#logoImgFiles').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                    // ,
                    // xhr: function() {
                    //     console.log('xhr');
                    //     // alert('xhr');
                    // }
                });

                console.log("adfasdfasdf");
            }

            // 제품 이미지 업로드
            let uploadProdFiles = new Array();
            for (const file of _storedProdFiles) {
                if (file.lastModified) {
                    uploadProdFiles.push(file);
                }
            }
            if (uploadProdFiles.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "company/product");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 10);
                formData.append("savedFileSize", calcTotalSize(_storedProdFiles) - calcTotalSize(uploadProdFiles));
                formData.append("savedFileCount", _storedProdFiles.length - uploadProdFiles.length);
                for (const file of uploadProdFiles) {
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
                        for (const file of _storedProdFiles) {
                            if (file.savedFileName) {
                                resultFiles.push(file);
                            }
                        }
                        for (const file of result.files) {
                            resultFiles.push(file);
                        }

                        console.log("sucess");
                        console.dir(resultFiles);

                        $('#prodImgFileList').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                    // ,
                    // xhr: function() {
                    //     console.log('xhr');
                    //     // alert('xhr');
                    // }
                });

                console.log("adfasdfasdf");
            }

            // 홍보 이미지 업로드
            let uploadPrmtFiles = new Array();
            for (const file of _storedPrmtFiles) {
                if (file.lastModified) {
                    uploadPrmtFiles.push(file);
                }
            }
            if (uploadPrmtFiles.length > 0) {
                let formData = new FormData();
                formData.append("targetFolderPath", "company/promotion");
                formData.append("maxFileSize", 1024 * 1024 * 100);
                formData.append("maxFileCount", 10);
                formData.append("savedFileSize", calcTotalSize(_storedPrmtFiles) - calcTotalSize(uploadPrmtFiles));
                formData.append("savedFileCount", _storedPrmtFiles.length - uploadPrmtFiles.length);
                for (const file of uploadPrmtFiles) {
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
                        for (const file of _storedPrmtFiles) {
                            if (file.savedFileName) {
                                resultFiles.push(file);
                            }
                        }
                        for (const file of result.files) {
                            resultFiles.push(file);
                        }

                        console.log("sucess2");
                        console.dir(resultFiles);

                        $('#prmtImgFileList').val(JSON.stringify(resultFiles));

                    },
                    error: function(request, status, error) {
                        alert(error);
                    }
                    // ,
                    // xhr: function() {
                    //     console.log('xhr');
                    //     // alert('xhr');
                    // }
                });

                console.log("prmt end...");
            }
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
    .company-info-edit-wrap,
    .image-selector {
        border: 1px solid #eee;
        display: flex;
        align-items: center;
        padding: 10px;
        margin: 0 0 30px 0;
    }
    .company-info-edit-wrap,
    .company-info-edit-wrap *,
    .image-selector,
    .image-selector * {
        box-sizing: border-box;
    }
    .company-info-edit-wrap::after {
        content: "";
        display: block;
        clear: both;
    }
    .company-info-edit-wrap label,
    .image-selector label {
        width: 15%;
        display: inline-block;
        text-align: center;
    }
    .company-info-edit-wrap input[type=text] {
        width: 70%;

    }
    .company-info-edit-wrap .apply-button,
    .image-selector .apply-button {
        width: 15%;

    }
    .company-name::before {
        content: "";
        display: block;
        clear: both;

    }
    .product-img-list,
    .promotion-img-list {
        display: flex;
        flex-wrap: wrap;
        /*justify-content: space-between*/
    }
    .product-img-list .image-wrapper,
    .promotion-img-list .image-wrapper {
        display: block;
        position: relative;
    }
    .product-img-list .image-wrapper,
    .product-img-list .image-wrapper img {
        width: 200px!important;
        height: 140px!important;
        box-sizing: border-box;
    }
    .promotion-img-list .image-wrapper,
    .promotion-img-list .image-wrapper img {
        width: 400px!important;
        height: 236px!important;
        box-sizing: border-box;
    }
    .product-img-list .image-wrapper img,
    .promotion-img-list .image-wrapper img {
        border: 1px solid #eee;
    }
    .product-img-list .image-wrapper::after,
    .promotion-img-list .image-wrapper::after {
        content: "X";
        display: block;
        position: absolute;
        top: 5px;
        right: 5px;
        border: 1px solid red;
        width: 20px;
        height: 20px;
        border-radius: 28px;
        text-align: center;
        line-height: 20px;
        background-color: red;
        color: white;
        font-size: 0.7em;
    }
</style>


<div id="content" class="bg-top">
    <div id="company-detail" class="pr40 pl40">
        <form:form modelAttribute="cmpMember">
            <div class="logo-wrap">
                <img id="logo-image" class="logo" src="<c:url value="/images/company/logo-temp.png"/>" alt="회사 로고">
            </div>
            <input type="hidden" id="logoImgFiles" name="logoImgFiles" value=""/>
            <div id="logo-image-selector" class="company-info-edit-wrap file-selector">
                <label>로고변경</label>
                <form:input path="logoImgPath"/>
                <input type="file" name="logoImgFile" id="logoImgFile"/>
                <label for="logoImgFile" class="apply-button">선택...</label>
            </div>
            <h1 class="company-name tc mb30">${cmpMember.cmpNm}</h1>
            <div class="video-container">
                <div id="main-video-wrapper" class="video-wrap">
                    <iframe width="560" height="315" src="https://www.youtube.com/embed/ustj7twq0E0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </div>
            </div>
            <div id="main-video-info" class="company-info-edit-wrap">
                <label>동영상 경로</label>
                <form:input path="mainMovieUrl"/>
                <button class="apply-button">적용</button>
            </div>
            <section>
                <h1 class="title">주요 생산품</h1>
                <div class="table">
                    <div class="label">
                        <h4>주요 생산품</h4>
                    </div>
                    <div class="value">
                        <h4>${cmpMember.product}</h4>
                    </div>
                </div>
                <input type="hidden" id="prodImgFileList" name="prodImgFileList" value='[{"name":"product-temp1.png","size":1024, "type":"image/png", "savedPath":"/pis/images/company/", "savedFileName":"product-temp1.png"},
                                                                    {"name":"product-temp2.png","size":1024, "type":"image/png", "savedPath":"/pis/images/company/", "savedFileName":"product-temp2.png"},
                                                                    {"name":"product-temp3.png","size":1024, "type":"image/png", "savedPath":"/pis/images/company/", "savedFileName":"product-temp3.png"},
                                                                    {"name":"product-temp4.png","size":1024, "type":"image/png", "savedPath":"/pis/images/company/", "savedFileName":"product-temp4.png"}]'/>
                <div id="product-image-list" class="img-flex product-img-list">
                    <%--
                    <div class="image-wrapper">
                        <img data-file-info="{'name':'product-temp1.png','size':1024,'type':'image/png'}" class="logo" src="<c:url value="/images/company/product-temp1.png"/>" alt="(주)한샘 주요생산품1">
                    </div>
                    <div class="image-wrapper">
                        <img class="logo" src="<c:url value="/images/company/product-temp2.png"/>" alt="(주)한샘 주요생산품2">
                    </div>
                    <div class="image-wrapper">
                        <img class="logo" src="<c:url value="/images/company/product-temp3.png"/>" alt="(주)한샘 주요생산품3">
                    </div>
                    <div class="image-wrapper">
                        <img class="logo" src="<c:url value="/images/company/product-temp4.png"/>" alt="(주)한샘 주요생산품4">
                    </div>
                    --%>
                </div>
                <div id="product-image-selector" class="image-selector">
                    <label>이미지 추가</label>
                    <input type="file" name="prodImgFiles" id="prodImgFiles" accept="image/gif,image/jpeg,image/png" multiple="multiple"/>
                    <label for="prodImgFiles" class="button apply-button">선택...</label>
                </div>
            </section>
            <section>
                <h1 class="title">납품대금 연동제 적용 현황</h1>
                <h4 class="info-text"><span class="bold">${cmpMember.cmpNm}은 2022년 9월부터</span> 납품대금 연동제에 참여하며 <span class="bold">${cmpMember.joinCmp}개</span> 중소기업과 동행하고 있습니다.</h4>
                <div class="table">
                    <div class="label">
                        <h4>주요 원재료</h4>
                    </div>
                    <div class="value">
                            ${cmpMember.material}
                    </div>
                    <div class="label">
                        <h4>주요 적용 제품</h4>
                    </div>
                    <div class="value">
                            ${cmpMember.mainProduct}
                    </div>
                </div>
            </section>
            <section>
                <h1 class="title">기업홍보</h1>
                <input type="hidden" id="prmtImgFileList" name="prmtImgFileList" value='[
                    {"name":"product-temp1.png","size":1024, "type":"image/png", "savedPath":"/pis/images/company/", "savedFileName":"product-temp1.png"},
                    {"name":"product-temp2.png","size":1024, "type":"image/png", "savedPath":"/pis/images/company/", "savedFileName":"product-temp2.png"},
                    {"name":"product-temp3.png","size":1024, "type":"image/png", "savedPath":"/pis/images/company/", "savedFileName":"product-temp3.png"},
                    {"name":"product-temp4.png","size":1024, "type":"image/png", "savedPath":"/pis/images/company/", "savedFileName":"product-temp4.png"}]'/>
                <div id="promotion-image-list" class="promotion-wrap promotion-img-list">
                    <div class="item">
                        <div id="sub-video-wrapper" class="video-wrap">
<%--                            <iframe width="560" height="315" src="https://www.youtube.com/embed/93nQ2F4PdY4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>--%>
                            <iframe width="560" height="315" src="https://www.youtube.com/embed/ustj7twq0E0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                        </div>
                    </div>
                    <%--
                    <div class="item image-wrapper">
                        <img class="logo" src="<c:url value="/images/company/logo-temp.png"/>" alt="(주)한샘 홍보이미지">
                    </div>
                    --%>
                </div>
                <div id="sub-video-info" class="company-info-edit-wrap">
                    <label>동영상 경로</label>
                    <form:input path="subMovieUrl"/>
                    <button class="apply-button">적용</button>
                </div>
                <div id="promotion-image-selector" class="image-selector">
                    <label>이미지 추가</label>
                    <input type="file" name="prmtImgFiles" id="prmtImgFiles" accept="image/gif,image/jpeg,image/png" multiple="multiple"/>
                    <label for="prmtImgFiles" class="button apply-button">선택...</label>
                </div>
            </section>
            <section>
                <h1 class="title">기업정보</h1>
                <div class="company-info-wrap">
                    <div class="logo-wrap">
                        <img class="logo" src="<c:url value="/images/company/logo-temp.png"/>" alt="(주)한샘 로고">
                    </div>
                    <div class="table">
                        <div class="label">
                            <h4>기업명</h4>
                        </div>
                        <div class="value">
                                ${cmpMember.cmpNm}
                        </div>
                        <div class="label">
                            <h4>대표자명</h4>
                        </div>
                        <div class="value">
                                ${cmpMember.ceo}
                        </div>
                        <div class="label">
                            <h4>설립일자</h4>
                        </div>
                        <div class="value">
                                ${cmpMember.fdate}
                        </div>
                        <div class="label">
                            <h4>업종</h4>
                        </div>
                        <div class="value">
                                ${cmpMember.bizType}
                        </div>
                        <div class="label">
                            <h4>본사 소재지</h4>
                        </div>
                        <div class="value">
                            ${cmpMember.address}&nbsp;${cmpMember.address_dtl}
                        </div>
                    </div>
                </div>
            </section>
        </form:form>
        <button id="submit-button" class="button">저장</button>
<%--        </c:forEach>--%>
    </div>
</div>
