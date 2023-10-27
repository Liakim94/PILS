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
    <title>관리자 | 원재료 가격정보 관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
    <script src="${pageContext.request.contextPath }/editor/naver-se/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
    <script src="${pageContext.request.contextPath }/x2/plugins/dropzone/dropzone.js"></script>

</head>
<style>
    .line-wrap .label {
        display:inline-grid;
        align-content:center;
        vertical-align:middle;
    }
</style>
<script>
    var oEditors = [];

    $(function () {

        var fileUploader = new smes.FileUploader('.file-uploader').init({
            maxFileSize: 1024 * 1024 * 100,    // 100 MB 제한
            maxFileCount: 20,
            targetFolderPath: 'test2',
            targetUrl: '<c:url value="/files/upload.do"/>',
            fileList: $('#jsonFileList').val(),
            deletedFileList: $('#jsonDeletedFileList').val()
        });
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
                    fn_submit();
                },
                fail: function (error) {
                    console.dir(error);
                    alert(error.message);
                }
            });
        });
    });
    function fn_submit() {
        var frm = document.getElementById('post');

        if (frm.title.value == "") {
            alert("사이트명을 입력하세요.");
            return false;
        }

        $("#edit").submit();
    }

</script>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu_admin"/>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a></li>
                <li>관리자페이지</li>
                <li>${bbsNm} 관리</li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">${bbsNm} 관리</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <div class="write-container">
                    <form:form modelAttribute="edit" action="edit.do" method="post" id="edit">
                        <form:hidden path="bbsId"/>
                        <form:hidden path="boardSeq"/>
                        <form:hidden path="stat"/>
                        <form:hidden path="jsonFileList"/>
                        <form:hidden path="jsonDeletedFileList"/>
                        <div class="write-wrap">
                            <div class="write-container">
                                <div class="line-wrap">
                                    <div class="label">사이트명</div>
                                    <div class="input-wrap" >
                                        <form:input type="text" path="title"/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">URL주소</div>
                                    <div class="input-wrap" >
                                        <form:input type="text" path="siteUrl"/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">확인 가능 정보</div>
                                    <div class="input-wrap">
                                        <form:textarea type="text" path="chkInfo"/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">주요 특징</div>
                                    <div class="input-wrap">
                                        <form:textarea type="text" path="features"/>
                                    </div>
                                </div>
                                <div class="line-wrap">
                                    <div class="label">유‧무료 여부</div>
                                    <div class="input-wrap">
                                        <form:input type="text" path="chrg"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <div class="line-wrap">
                                <div class="label">
                                    첨부파일
                                </div>
                                <div class="file-uploader-wrapper">
                                    <div class="file-uploader"></div>
                                </div>
                            </div>
                        </div>
                        <div class="write-bottom">
                            <button id="submit" class="submit" style="width: 135px">게시</button>
                            <a href="<c:url value="/admin/price/list.do"/>" class="back">취소</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>

