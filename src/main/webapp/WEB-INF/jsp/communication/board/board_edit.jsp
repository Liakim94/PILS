<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags/form" 		prefix="form"		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="fx" 											prefix="fx" 		%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/file-uploader-1.0.0.css" type="text/css">
	<script src="${pageContext.request.contextPath }/js/file-uploader-1.0.0.js?v=1"></script>
	<%--<script src="${pageContext.request.contextPath }/js/cms/board/edit.js"></script>--%>
	<script src="${pageContext.request.contextPath }/x2/plugins/dropzone/dropzone.js"></script>
	<script src="${pageContext.request.contextPath }/editor/naver/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script>
		var oEditors = [];
		$(function(){
			// 에디터 생성
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: "cont",
				sSkinURI: "${pageContext.request.contextPath }/editor/naver/SmartEditor2Skin.html",
				fCreator: "createSEditor2"
			});

			// 파일업로더 처리
			var fileUploader = new smes.FileUploader('.file-uploader').init({
				maxFileSize : 1024 * 1024 * 100,    // 100 MB 제한
				maxFileCount : 20,
				targetFolderPath : 'test2',
				//accept : '.png, .jpg',
				targetUrl: '<c:url value="/files/upload.do"/>',
				fileList: $('#jsonFileList').val(),
				deletedFileList: $('#jsonDeletedFileList').val()
			});

			// 저장 버튼 처리
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
	</script>
</head>

<page:applyDecorator name="menu" />
<%--@elvariable id="frmPost" type="kr.co.xicom.front.model.BoardVO"--%>
<section class="content">
	<div class="article">
		<!-- row start -->
		<div class="col-md-8">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">게시물 수정</h3>
				</div><!-- /.box-header -->
				<div class="box-body">
					<form:form modelAttribute="frmPost">
						<input type="hidden" name="action"/>
						<form:hidden path="bbsId"/>
						<form:hidden path="boardSeq"/>
						<form:hidden path="stat"/>
						<form:hidden path="jsonFileList"/>
						<form:hidden path="jsonDeletedFileList"/>
						<%--<form:hidden path="boardSeq" value="${rs.boardSeq }"/>--%>
						<%--<form:hidden path="fileStd" value="${option.thumStd }"/>--%>
						<div class="form-group">
							<label class="control-label">제목</label>
							<form:input class="form-control" path="title" maxlength="85"/>
						</div>
						<div class="form-group">
							<label class="control-label">내용</label>
							<textarea class="form-control" id="cont" name="cont" >${fx:resetXSSMinimum(frmPost.cont) }</textarea>
						</div>
					</form:form>
				</div><!-- /.box-body -->
				<%-- WildRain 추가 2023-01-12 --%>
				<div class="file-uploader-wrapper">
					<div class="file-uploader"></div>
				</div>
				<div class="box-footer">
					<div class="btn-wrap type02 low_margin">
						<button id="submit" class="btn btn-flat btn-primary">저장</button>
						<%--<a href="${pageContext.request.contextPath}/cmm/boardList.do?bbsId=${bbsId}" class="btn blue" title="취소">취소</a>--%>
						<a href="<c:url value="/cmm/boardView.do?boardSeq=${frmPost.boardSeq}&bbsId=${frmPost.bbsId}"/>" class="btn blue" title="취소">
							취소
						</a>
					</div>
				</div>
			</div><!-- /. box -->
		</div>
		<!-- row end -->
	</div>
</section>

