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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
    <script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
    <script src="${pageContext.request.contextPath }/x2/plugins/dropzone/dropzone.js"></script>
    <script src="${pageContext.request.contextPath }/editor/naver/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/js/front/jquery.validate.js"></script>

    <script>
        var oEditors = [];
        $(function () {
            // 에디터 생성
            nhn.husky.EZCreator.createInIFrame({
                oAppRef: oEditors,
                elPlaceHolder: "cont",
                sSkinURI: "${pageContext.request.contextPath }/editor/naver/SmartEditor2Skin.html",
                fCreator: "createSEditor2"
            });

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
                        $('#frmPost').submit();
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
        $(function () {
            $("#frmPost").validate({
                rules: {
                    title: {required: true}
                },
                onkeyup: false,
                onclick: false,
                onfocusout: false,
                messages: {
                    title: {required: "제목을 입력하세요."}
                },
                submitHandler: function (frm) {

                    oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);

                    var ir1 = $("#cont").val();
                    if (ir1 == "" || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>') {
                        alert("내용을 입력하세요.");
                        oEditors.getById["cont"].exec("FOCUS"); //포커싱
                        return;
                    }
                    frm.submit();
                },
                success: function (e) {
                },
                showErrors: function (errorMap, errorList) {
                    if (!$.isEmptyObject(errorList)) {
                        $.each(errorList, function () {
                            alert(this.message);
                            return false;
                        });
                    }
                }
            });
        });
    </script>
</head>
<div id="content">
    <div id="board">
        <page:applyDecorator name="menu"/>
        <%--@elvariable id="frmPost" type="kr.co.xicom.front.model.BoardVO"--%>
        <div class="article">
            <br>
            <ul class="loc-list">
                <li>
                    <img class="home-icon" src="${pageContext.request.contextPath}/images/common/home-icon.png" alt="홈">
                    <a href="${pageContext.request.contextPath}">홈</a>
                </li>
                <li>
                    소통마당
                </li>
                <li>
                    ${bbsNm}
                </li>
            </ul>
            <div class="article-header">
                <h1 class="fw700">${bbsNm}</h1>
                <div class="side-wrap">
                </div>
            </div>
            <div class="content">
                <!-- 컨텐츠 start -->
                <div class="write-container">
                    <form:form modelAttribute="frmPost">
                        <input type="hidden" name="action"/>
                        <form:hidden path="bbsId"/>
                        <form:hidden path="boardSeq"/>
                        <form:hidden path="stat"/>
                        <form:hidden path="jsonFileList"/>
                        <form:hidden path="jsonDeletedFileList"/>
                        <%--<form:hidden path="boardSeq" value="${rs.boardSeq }"/>--%>
                        <%--<form:hidden path="fileStd" value="${option.thumStd }"/>--%>
                        <div class="write-wrap">
                            <div class="line-wrap">
                                <div class="label">
                                    공지 제목
                                </div>
                                <div class="input-wrap">
                                    <form:input path="title" maxlength="85"/>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    상단 고정 여부
                                </div>
                                <div class="input-wrap  labeled-input-wrap label-right">
                                    고정 <input type="checkbox" name="notiAt" id="notiAt" value="Y" style="width:50px"/>
                                </div>
                            </div>
                            <div class="line-wrap">
                                <div class="label">
                                    내용
                                </div>
                                <div class="editor-input-wrap">
                                    <textarea class="form-control" id="cont" style="display:none;min-height:400px;height:400px;"
                                              name="cont">${fx:resetXSSMinimum(frmPost.cont) }</textarea>
                                </div>
                            </div>

                        </div>
                        <!-- /.box-body -->
                    </form:form>
                    <%-- WildRain 추가 2023-01-12 --%>
                    <div class="line-wrap">
                        <div class="label">
                            첨부서류
                        </div>
                        <div class="file-uploader-wrapper">
                            <div class="file-uploader"></div>
                        </div>
                    </div>
                    <div class="write-bottom">
                        <button id="submit" class="submit"  style="width:130px">저장</button>
                        <%--<a href="${pageContext.request.contextPath}/cmm/boardList.do?bbsId=${bbsId}" class="btn blue" title="취소">취소</a>--%>
                        <a href="<c:url value="/front/board/${frmPost.bbsId}/view.do?boardSeq=${frmPost.boardSeq}"/>">
                            취소
                        </a>
                    </div>
                </div>
            </div><!-- /. box -->
        </div>
        <!-- row end -->
    </div>
</div>



