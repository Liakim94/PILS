<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags/form" 		prefix="form"		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
<script src="${pageContext.request.contextPath }/js/cms/board/post.js"></script>
<script src="${pageContext.request.contextPath }/editor/naver/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
<script>

    var oEditors = [];

    $(function(){
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "cont",
            sSkinURI: "${pageContext.request.contextPath }/editor/naver/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });

        var fileUploader = new smes.FileUploader('.file-uploader').init({
            maxFileSize : 1024 * 1024 * 100,    // 100 MB 제한
            maxFileCount : 20,
            targetFolderPath : 'test2',
            //accept : '.png, .jpg',
            targetUrl: '<c:url value="/files/upload.do"/>',
            <%--
                파일업로드 Ajax 처리시 csrf token 지정.
                참조 : https://blog.naver.com/PostView.nhn?isHttpsRedirect=true&blogId=jskimmail&logNo=221616372513&redirect=Dlog&widgetTypeCall=true&directAccess=false
                참조 : https://higugu.tistory.com/entry/Spring-Security-Ajax-%ED%98%B8%EC%B6%9C-%EC%8B%9C-403-Forbidden-%EC%97%90%EB%9F%AC
            --%>
            //csrfHeader: $('meta[name="_csrf_header"]').attr('content'),
            //csrfToken: $('meta[name="_csrf"]').attr('content'),
            fileList: $('#jsonFileList').val(),
            deletedFileList: $('#jsonDeletedFileList').val()
        });

        $('#submit').on('click', function() {

            fileUploader.upload({
                done: function (result, deleted, uploaded) {
                    // 업로드 완료 후 전송된 파일 리스트 정보를
                    // 특정 hidden 파라미터로 설정하고 form을 전송한다.
                    if (result) {
                        console.dir(result);
                        $('#jsonFileList').val(JSON.stringify(result));
                    }
                    else {
                        $('#jsonFileList').val('');
                    }
                    if (deleted) {
                        console.dir(deleted);
                        $('#jsonDeletedFiles').val(JSON.stringify(deleted));
                    }
                    else {
                        $('#jsonDeletedFiles').val('');
                    }
                    //$('#frmPost').submit();
                    fn_submit('1');
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

<page:applyDecorator name="menu" />

<section class="content">
    <div class="article">
        <!-- row start -->
        <div class="col-md-8">
            <div class="box box-primary">
                <%--@elvariable id="frmPost" type="kr.co.xicom.front.model.BoardVO"--%>
                <form:form modelAttribute="frmPost">
<%--                <form:form commandName="vo"  id="frmPost" name="frmPost"  method="POST" action="boardPost.do">--%>
<%--                    <input type="hidden" value ="${bbsId}" name="bbsId" id="bbsId" >--%>
                    <form:hidden path="bbsId"/>
                    <form:hidden path="stat" value=""/>
                    <form:hidden path="jsonFileList"/>
                    <form:hidden path="jsonDeletedFileList"/>
                    <div class="article-header"><h3>게시물 등록</h3>
                        <div class="side-wrap">
                        </div>
                    </div>
                    <div class="tbl-wrap for_board">
                        <div class="form-group">
                            <label class="control-label" >제목</label>
                            <form:input class="form-control" path="title" placeholder="제목을 입력하세요" maxlength="85"/>
                        </div>
                        <div class="form-group">
                            <label class="control-label" >내용</label>
<%--                            <textarea class="form-control" id="cont" name="cont" ></textarea>--%>
                            <form:textarea path="cont" cssClass="form-control"/>
                        </div>
                    </div>
                </form:form>
                <%--
                <div class="form-group file-upload" required="required" >
                    <label class="cols-sm-2 control-label" >File Upload</label><br>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-file" aria-hidden="true"></i></span>
                            <div class="form-control" data-message="">
                                <input required="required" type="file" name="document[file]" id="document_file">
                            </div>
                        </div>
                    </div>
                </div>
                --%>
                <%-- WildRain 추가 2023-01-12 --%>
                <div class="file-uploader-wrapper">
                    <div class="file-uploader"></div>
                </div>
                <div class="col-md-4">
                    <div class="box box-danger">
                        <div class="box-footer">
                            <div class="btn-wrap type02 low_margin">
                                <%--
                                <button type="button"  onclick="fn_submit('1')" class="btn blue">게시</button>
                                --%>
                                <button id="submit" class="btn blue">게시</button>
                                <a href="<c:url value="/cmm/boardList.do?bbsId=${bbsId}"/>" class="btn blue" title="취소">취소</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- row end -->
    </div>
</section>

