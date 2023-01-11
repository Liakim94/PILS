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

    <script src="${pageContext.request.contextPath }/js/cms/board/edit.js"></script>
    <%--<script src="${pageContext.request.contextPath }/x2/plugins/dropzone/dropzone.js"></script>--%>
    <script src="${pageContext.request.contextPath }/editor/naver/js/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath }/js/cms/popup/dropzone.js"></script>
    <script src="${pageContext.request.contextPath }/js/cms/popup/post.js"></script>
    <script src="${pageContext.request.contextPath }/js/cms/common.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>

        var oEditors = [];
        $(function () {

            nhn.husky.EZCreator.createInIFrame({
                oAppRef: oEditors,
                elPlaceHolder: "cont",
                sSkinURI: "${pageContext.request.contextPath }/editor/naver/SmartEditor2Skin.html",
                fCreator: "createSEditor2"
            });

        });
    </script>

</head>

<page:applyDecorator name="menu"/>
<form:form commandName="rs" name="frmPost" id="frmPost" method="POST" action="boardEdit.do">
    <input type="hidden" name="action"/>
    <input type="hidden" value="${bbsId}" name="bbsId" id="bbsId">
    <input type="hidden" value="${rs.boardSeq}" name="boardSeq" id="boardSeq">

    <form:hidden path="stat" value=""/>
    <%--<form:hidden path="boardSeq" value="${rs.boardSeq }"/>--%>
    <%--<form:hidden path="fileStd" value="${option.thumStd }"/>--%>
    <section class="content">
        <div class="article"> <!-- row start -->

            <div class="col-md-8">


                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">게시물 수정</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">


                        <div class="form-group">
                            <label class="control-label">제목</label>
                            <form:input class="form-control" path="title" value="${rs.title}" id="title"
                                        maxlength="85"/>
                        </div>

                        <div class="form-group">
                            <label class="control-label">내용</label>
                            <textarea class="form-control" id="cont"
                                      name="cont">${fx:resetXSSMinimum(rs.cont) }</textarea>
                        </div>

                    </div><!-- /.box-body -->
                    <div class="box-footer">
                        <div class="btn-wrap type02 low_margin">
                            <button type="button" onclick="fn_submit('1')" class="btn btn-flat btn-primary">저장</button>
                            <a href="${pageContext.request.contextPath}/cmm/boardList.do?bbsId=${bbsId}"
                               class="btn blue" title="취소">취소</a>
                        </div>
                    </div>
					<div class="form-group">
						<label for="">팝업이미지</label>
						<div class="input-group">
							<div class="input-group-btn">
								<button type="button" class="btn btn-flat dropdown-toggle" data-toggle="dropdown">선택
									<span class="fa fa-caret-down"></span></button>
								<ul class="dropdown-menu">
									<li><a href="#none" data-toggle="modal" data-target="#fileUploadModal">직접등록</a></li>
									<li><a href="#none" data-toggle="modal" data-target="#mediaModal">미디어에서 선택</a></li>
								</ul>
							</div>
							<input type="text" class="form-control" id="img" readonly="readonly"/>
						</div>
						<input type="text" name="img" id="siteLogo" />
						<input type="text" class="form-control" placeholder="대체텍스트" name="alt"/>
						<div id="logo-img-box" class="input-group hidden">
							<ul class="mailbox-attachments clearfix">
								<li>
									<span class="mailbox-attachment-icon has-img"><img id="logo-img" src="${pageContext.request.contextPath}/images/cms/main1.jpg" alt=""></span>
									<div class="mailbox-attachment-info text-overflow">
										<a href="#" class="mailbox-attachment-name"><i class="fa fa-camera"></i> <span id="logo-img-name" class="ellipsis_imgText">photo</span></a>
										<span class="mailbox-attachment-size">
			                          <span id="logo-img-size">1,245</span>
											<!-- <a href="#" class="btn btn-default btn-xs pull-right"><i class="fa fa-cloud-download"></i></a> -->
			                        </span>
									</div>
								</li>
							</ul>
						</div>
					</div>
                </div><!-- /. box -->
            </div>


        </div>

        </div>

        </div> <!-- row end -->
        </div>
    </section>
</form:form>
<div class="modal fade" id="fileUploadModal" tabindex="-1" role="dialog" aria-labelledby="fileUploadModalLabel">
    <input type="hidden" name="mdaSeq" id="mdaSeq">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="fileUploadModalLabel">파일업로드</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="m-b-20">
                    </div>
                    <div class="col-md-12 files" id="previews">
                        <div id="template" class="file-row row" style="margin-left:10px;">
                            <!-- This is used as the file preview template -->
                            <div class="dz-image">
                                <span class="preview"><img data-dz-thumbnail/></span>
                            </div>
                            <div class="dz-file text-ellipsis" style="min-width: 300px;text-align:center;"><span
                                    class="name" data-dz-name></span></div>
                            <div class="dz-size"><span class="size" data-dz-size></span></div>
                            <div class="dz-progress p-t-10">
                                <strong class="error text-danger" data-dz-errormessage></strong>
                                <!-- <div class="progress-text"></div> -->
                                <div class="progress progress-sm progress-striped active" role="progressbar"
                                     aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                                    <div class="progress-bar progress-sm progress-bar-success" style="width:0%;"
                                         data-dz-uploadprogress>
                                    </div>
                                </div>
                                <!-- <div class="text-center"><span class="progress-text"></span></div> -->
                            </div>
                            <div class="dz-trans" style="width:0px;min-width: 0px;">
                                <span class="progress-text"></span>
                            </div>
                            <div class="dz-status text-center" style="min-width: 0;">
                                <!-- <button type="button" class="btn btn-xs btn-primary btn-upload"><i class="fa fa-upload"></i> <span class="dz-status-text ">전송대기</span></button> -->
                                <button type="button" data-dz-remove class="btn btn-xs btn-warning cancel"><i
                                        class="fa fa-times"></i><span>삭제</span></button>
                            </div>
                            <div class="dz-response">
                                <input type="hidden" name="arrFilename" value=""/>
                                <input type="hidden" name="arrOriginalFilename" value=""/>
                                <input type="hidden" name="arrFilesize" value=""/>
                                <input type="hidden" name="arrFileext" value=""/>
                                <input type="hidden" name="arrFolderpath" value=""/>
                                <input type="hidden" name="arrFilepath" value=""/>
                                <input type="hidden" name="arrFiletype" value=""/>
                            </div>
                        </div>
                    </div>
                    <div id="file_upload" class="col-md-12 text-center">
                        파일을 Drag&Drop하거나 클릭하세요
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-flat" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary btn-flat" onclick="goMediaUpload()">파일업로드</button>
            </div>
        </div>
    </div>
</div>

