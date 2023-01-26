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
    });
</script>
<style>
    .company-info-edit-wrap {
        border: 1px solid #eee;
        display: flex;
        align-items: center;
        padding: 10px;
        margin: 0 0 30px 0;
    }
    .company-info-edit-wrap,
    .company-info-edit-wrap * {
        box-sizing: border-box;
    }
    .company-info-edit-wrap::after {
        content: "";
        display: block;
        clear: both;
    }
    .company-info-edit-wrap label {
        width: 15%;
        display: inline-block;
        text-align: center;
    }
    .company-info-edit-wrap input[type=text] {
        width: 70%;

    }
    .company-info-edit-wrap .apply-button {
        width: 15%;

    }
    .company-name::before {
        content: "";
        display: block;
        clear: both;

    }
</style>


<div id="content" class="bg-top">
    <div id="company-detail" class="pr40 pl40">
        <form:form modelAttribute="cmpMember">
            <div class="logo-wrap">
                <img class="logo" src="<c:url value="/images/company/logo-temp.png"/>" alt="회사 로고">
            </div>
            <div class="company-info-edit-wrap">
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
                <div class="img-flex">
                    <img class="logo" src="<c:url value="/images/company/product-temp1.png"/>" alt="(주)한샘 주요생산품1">
                    <img class="logo" src="<c:url value="/images/company/product-temp2.png"/>" alt="(주)한샘 주요생산품2">
                    <img class="logo" src="<c:url value="/images/company/product-temp3.png"/>" alt="(주)한샘 주요생산품3">
                    <img class="logo" src="<c:url value="/images/company/product-temp4.png"/>" alt="(주)한샘 주요생산품4">
                </div>
                <div class="company-info-edit-wrap">
                    <label>이미지 추가</label>
                    <form:input path="logoImgPath" cssClass="apply-input"/>
                    <button class="apply-button">선택...</button>
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
                <div class="promotion-wrap">
                    <div class="item">
                        <div id="sub-video-wrapper" class="video-wrap">
<%--                            <iframe width="560" height="315" src="https://www.youtube.com/embed/93nQ2F4PdY4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>--%>
                            <iframe width="560" height="315" src="https://www.youtube.com/embed/ustj7twq0E0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="item">
                        <img class="logo" src="<c:url value="/images/company/logo-temp.png"/>" alt="(주)한샘 홍보이미지">
                    </div>
                </div>
                <div id="sub-video-info" class="company-info-edit-wrap">
                    <label>동영상 경로</label>
                    <form:input path="subMovieUrl"/>
                    <button class="apply-button">적용</button>
                </div>
                <div class="company-info-edit-wrap">
                    <label>이미지 추가</label>
                    <form:input path="logoImgPath" cssClass="apply-input"/>
                    <button class="apply-button">선택...</button>
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
<%--        </c:forEach>--%>
    </div>
</div>
