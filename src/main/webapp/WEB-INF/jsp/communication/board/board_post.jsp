<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags/form" 		prefix="form"		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" 		prefix="page" 		%>

<head>

	<script src="${pageContext.request.contextPath }/js/cms/board/post.js"></script>
	<script src="${pageContext.request.contextPath }/editor/naver/js/HuskyEZCreator.js" charset="utf-8"></script>

	<script>

		var oEditors = [];

		$(function(){
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: "cont",
				sSkinURI: "${pageContext.request.contextPath }/editor/naver/SmartEditor2Skin.html",
				fCreator: "createSEditor2"
			});

		});


	</script>


</head>
<page:applyDecorator name="menu" />

<form:form commandName="vo"  id="frmPost" name="frmPost"  method="POST" action="boardPost.do">
	<input type="hidden" value ="${bbsId}" name="bbsId" id="bbsId" >
	<form:hidden path="stat" value=""/>

	<section class="content">

		<div class="article"> <!-- row start -->

			<div class="col-md-8">
				<div class="box box-primary">
					<div class="article-header"><h3>게시물 등록</h3>
							<div class="side-wrap">
							</div>
						</div>

					<div class="tbl-wrap for_board">
						<div class="form-group">
							<label class="control-label" >제목</label>
							<form:input class="form-control" path="title" id="title" placeholder="제목을 입력하세요" maxlength="85"/>
						</div>

						<div class="form-group">
							<label class="control-label" >내용</label>
							<textarea class="form-control" id="cont" name="cont" ></textarea>
						</div>

					</div>

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

				<div class="col-md-4">
					<div class="box box-danger">

						<div class="box-footer">
							<div class="btn-wrap type02 low_margin">
<%--								<button type="button"  onclick="fn_submit('9')" class="btn btn-flat btn-default">임시저장</button>--%>
								<button type="button"  onclick="fn_submit('1')" class="btn blue">게시</button>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
				</div>

			</div>

		</div> <!-- row end -->


	</section>

</form:form>
