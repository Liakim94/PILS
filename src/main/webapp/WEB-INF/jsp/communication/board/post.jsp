<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.co.xicom.cmmn.web.EgovWebUtil" 									%>
<%@ page import="kr.co.xicom.cmmn.web.EgovProperties" 								%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 				prefix="c" 			%>
<%@ taglib uri="http://egovframework.gov/ctl/ui" 				prefix="ui" 		%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 		prefix="fn" 		%>
<%@ taglib uri="http://www.springframework.org/tags/form" 		prefix="form"		%>
<%@ taglib uri="http://www.springframework.org/tags" 			prefix="spring" 	%>
<%
String uploadPath = "";
uploadPath = EgovWebUtil.nvl(EgovProperties.getProperty("UploadPath").toString().trim()).equals("")?"upload":EgovProperties.getProperty("UploadPath").toString();
%>
<head>
<title>팝업관리</title>
<script>
var uploadPath = "<%=uploadPath%>";
</script>
<script src="${pageContext.request.contextPath }/editor/naver/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/cms/popup/dropzone.js"></script>
<script src="${pageContext.request.contextPath }/js/cms/popup/post.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
var oEditors = [];
Dropzone.autoDiscover = false;
var myDropzone;
var totalSize = 0;
var totalCount = 0;
var uploadedSize = 0;
var uploadingSize = 0;
var uploadedCount = 0;
$(function(){
	
	nhn.husky.EZCreator.createInIFrame({	
	    oAppRef: oEditors,
	    elPlaceHolder: "cont",
	    sSkinURI: "${pageContext.request.contextPath }/editor/naver/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});	
	
	var previewNode = document.querySelector("#template");
	previewNode.id = "";
	var previewTemplate = previewNode.parentNode.innerHTML;
	//var previewTemplate = previewNode.innerHTML;
	previewNode.parentNode.removeChild(previewNode);
	//var previewNode = $("#template");
	//var previewTemplate = $(previewNode).html();
	myDropzone = new Dropzone("#file_upload", {
		url : pageContext+"/cms/media/upload.do",
		paramName: "file",
		thumbnailWidth:80,
		thumbnailHeight:80,
		parallelUploads: 20,
		filesizeBase:1024,
		maxFilesize: 5, //fileMaxSize
		acceptedFiles : "image/*",
		maxFiles : 1,
		//createElement: 'table',
		//uploadMultiple: true,
		//autoProcessQueue: false,
		previewTemplate: previewTemplate,
		autoQueue: false, // Make sure the files aren't queued until manually added
		previewsContainer: "#previews"//, // Define the container to display the previews
		//clickable: ".fileinput-button"
	});
	
	myDropzone.on("addedfile", function(file) {
	  // Hookup the start button
	  //file.previewElement.querySelector(".start").onclick = function() { myDropzone.enqueueFile(file); };
	  //console.log(file);
	  //upload = true;
	  //totalCount++;
	  //totalSize += file.size;
	  //console.log("added="+$("#previews .file-row").length);
	  totalCount = $("#previews .file-row").length;
	});
	
	myDropzone.on("error", function(file,response) {
	   //console.log(file);
	   /* console.log("added="+$("#previews .file-row").length);
	   console.log("error="+$("#previews .file-row.dz-error").length); */
	   /* totalCount = ($("#previews .file-row").length - $("#previews .file-row.dz-error").length);
	   //totalCount--;
	   if (file.previewElement) {
			var statusElement = file.previewElement.querySelector(".dz-status-text");
			var btnElement = file.previewElement.querySelector(".btn-upload");
			statusElement.textContent = "전송불가";
			//btnElement.style.background = "red";
			$(btnElement).removeClass("btn-primary").addClass("btn-danger");
			
			var responseElement = file.previewElement.querySelector(".dz-response");
			$(responseElement).empty();
	   } */
	   myDropzone.removeFile(file);
	   //file.previewElement.remove();
	});

	// Update the total progress bar
	myDropzone.on("totaluploadprogress", function(progress, totalBytes, totalBytesSent) {
		//console.log(progress);
	});

	myDropzone.on("sending", function(file) {
	  // Show the total progress bar when upload starts
	  //document.querySelector("#total-progress").style.opacity = "1";
	  // And disable the start button
	  //file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
		//document.querySelector("#dz-uploading").style.display = "block";
		var cancelElement = file.previewElement.querySelector(".cancel");
    	//$(cancelElement).remove();
	});

	// Hide the total progress bar when nothing's uploading anymore
	myDropzone.on("queuecomplete", function(progress) {
	  //document.querySelector("#total-progress").style.opacity = "0";
	  /* console.log("======queuecomplete"); */
	});
	
	myDropzone.on("uploadprogress", function(file, progress, byteSent) {
	  //document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
		if (file.previewElement) {
			var progressElement = file.previewElement.querySelector(".dz-trans");
	    	progressElement.querySelector(".progress-text").textContent = parseInt(progress) + "% " + bytesToSize(byteSent) + "/" + bytesToSize(file.size);
	    	
	    	//var statusElement = file.previewElement.querySelector(".dz-status-text");
	    	var cancelElement = file.previewElement.querySelector(".cancel");
	    	
	    	/* if(progress >=100) {
	    		statusElement.textContent = "파일처리중";
	    		$(cancelElement).remove();
	    	}else statusElement.textContent = "전송중"; */
	    	
		}
	});
	
	
	myDropzone.on("success", function(file, response) {
	  
		if (file.previewElement) {
			var progressElement = file.previewElement.querySelector(".dz-trans");
			progressElement.querySelector(".progress-text").textContent = "";

			//var statusElement = file.previewElement.querySelector(".dz-status-text");
			//statusElement.textContent = "전송완료";	
	
			var cancelElement = file.previewElement.querySelector(".cancel");
			$(cancelElement).remove();
	
			uploadedCount++;
			uploadedSize += file.size;
			//document.querySelector("#total-files").textContent = uploadedCount +"/"+totalCount;
			//myDropzone.processQueue();
			
			//var responseElement = file.previewElement.querySelector(".dz-response");
			var data = response.response;
			
			/* responseElement.querySelector("input[name='arrFilename']").value = data.filename;
			responseElement.querySelector("input[name='arrOriginalFilename']").value = data.originalFilename;
			responseElement.querySelector("input[name='arrFilesize']").value = data.filesize;
			responseElement.querySelector("input[name='arrFileext']").value = data.fileext;
			//responseElement.querySelector("input[name='arrFolderpath']").value = data.folderpath;
			responseElement.querySelector("input[name='arrFilepath']").value = data.filepath;
			responseElement.querySelector("input[name='arrFiletype']").value = data.filetype; */
			
			//$("#strLogoName").val(data.originalFilename);
			//$("#siteLogo").val(data.mdaseq);
			
			setLogo(data.mdaseq, data.originalFilename, data.filepath, data.filename, data.filesize);
			
			$("#fileUploadModal").modal('hide');
	  	}
		
	});
	
	myDropzone.on("complete", function(file) {
		//myDropzone.processQueue();
		/* console.log("=============complete"); */
		/* file.previewElement.remove(); */
		myDropzone.removeFile(file);
		
	});
	
	myDropzone.on("removedfile", function(file) {
		//myDropzone.processQueue();
		file.previewElement.remove();
		
		totalCount = ($("#previews .file-row").length - $("#previews .file-row.dz-error").length);
		
		//if(totalCount < 0) totalCount = 0;
		
		/* if(totalCount == 0) {
			document.querySelector("#dz-uploading").style.display = "none";
			upload = false;
		}else{
			upload = true;
		} */
	});
});
</script>
<style>
	/* 글 줄이기 */
	.ellipsis_imgText{height:25px;text-overflow: ellipsis;-o-text-overflow: ellipsis;overflow: hidden;white-space: nowrap;word-wrap: normal !important;display: block;}
</style>
</head>
<section class="content-header">
	<h1>팝업관리
		<small></small>
	</h1>
	 <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath }/cms/main.do"><i class="fa fa-home"></i> Home</a></li>
        <li><a href="${pageContext.request.contextPath }/cms/content/list.do">콘텐츠관리</a></li>
        <li class="active">팝업관리</li>
      </ol>
</section>

<section class="content">
	<form name="postForm" method="POST" action="">
    <div class="row">
    	<input type="hidden" id="stat" name="stat" />
    	<div class="col-md-8">
    		<div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">팝업생성</h3>
                </div>
                <div class="box-body">
                	<div class="form-group">
	                  	<label for="site-id">사이트 *</label>
	                  	<select name="steId" id="site-id" class="form-control select2">
                			<option value="">사이트 선택</option>
                			<c:forEach var="list" items="${siteList }">
                			<option value="${list.steId }">${list.steNm }</option>
                			</c:forEach>
                		</select>
	                </div>
                	
                	<div class="form-group">
	                  	<label for="popNm">팝업명 *</label>
	                  	<input type="text" class="form-control" name="popNm" id="popNm" placeholder="팝업명을 입력하세요">
	                </div>
	                <%-- 
	                <div class="form-group">
	                  	<label for="">팝업유형 *</label>
	                  	<select class="form-control" name="popTyp">
	                  		<c:forEach items="${popType}" var="list">
	                  			<option value="${list.cd }">${list.cdNm }</option>
	                  		</c:forEach>
	                  	</select>
	                </div>
	                 --%>
	                <div class="form-group">
	                	<label for="">게시기간*</label>
	                  	<div class="input-group">
		                  <div class="input-group-addon">
		                    <i class="fa fa-calendar"></i>
		                  </div>
		                  <input type="text" id="datePublish" class="form-control pull-right range-dt" readonly="readonly">
		                  <input type="hidden" id="strDT" name="strDT" />
		                  <input type="hidden" id="endDT" name="endDT" />
		                </div>
	                </div>
	                <div class="form-group">
	                  	<label for="">팝업내용 </label>
	                  	<textarea class="form-control" id="cont" name="cont"></textarea>
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
	                <div class="form-group">
	                	<label for="">팝업크기 <i class="fa fa-question-circle" data-toggle="popover" data-trigger="hover" data-placement="top" title="팝업크기" data-html="true" data-content="팝업이미지 크기를 입력합니다(단위:픽셀)<br/>예)600X500<br/>사이트에 맞게 크기 설정"></i></label>
	                  	<input type="text" id="popSize" class="form-control" data-inputmask="'mask': ['9[9[9[9]]]X9[9[9[9]]]', '9[9[9[9]]]X9[9[9[9]]]']" data-mask>
	                  	<input type="hidden" id="popW" name="popW" />
	                  	<input type="hidden" id="popH" name="popH" />
	                </div>
	                <div class="form-group">
	                	<label for="">팝업위치 <i class="fa fa-question-circle" data-toggle="popover" data-trigger="hover" data-placement="top" title="팝업위치" data-html="true" data-content="팝업위치를 입력합니다(단위:픽셀)<br/>예)0X500<br/>팝업존이나 지정된 팝업일 경우 입력할 필요가 없습니다"></i></label>
	                	<input type="text" id="popPosition" class="form-control" data-inputmask="'mask': ['9[9[9[9]]]X9[9[9[9]]]', '9[9[9[9]]]X9[9[9[9]]]']" data-mask>
	                	<input type="hidden" id="popX" name="popX" />
	                	<input type="hidden" id="popY" name="popY" />
	                </div>
	                
    				<div class="form-group">
	                  	<label for="">링크</label>
	                  	<div class="input-group">
			                
			                <!-- /btn-group -->
			                <input type="text" class="form-control" id="strUrl" name="url" />
			                <input type="hidden" name="tgt" />
			                <div class="input-group-btn">
			                  <button type="button" class="btn btn-info btn-flat dropdown-toggle" data-toggle="dropdown"><span id="strTgt">_self</span>
			                  <span class="fa fa-caret-down"></span></button>
			                  <ul class="dropdown-menu pgm-tgt">
			                    <li><a href="#none">_blank</a></li>
			                    <li><a href="#none">_self</a></li>
			                    <li><a href="#none">_parent</a></li>
			                    <li><a href="#none">_top</a></li>
			                  </ul>
			                </div>
			        	</div>
	                </div>
	                
    			
                </div>
            </div>
    	</div>
    	<div class="col-md-4">
    		<div class="box box-danger">
    			<div class="box-header with-border">
                  <h4 class="box-title">저장하기</h4>
                  <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
	                </button>
	              </div>
                </div>
    			<div class="box-body no-padding">
    				<ul class="nav nav-pills nav-stacked">
	                    <li><a href="#none"><i class="fa fa-map-pin"></i> <span>상태</span> : <span>작성중</span></a></li>
	                    <li><a href="#none"><i class="fa fa-calendar"></i> <span>최종저장일시</span> : <span>-</span></a></li>
	                 </ul>
    			</div>
    			<div class="box-footer">
                  <div class="pull-right">
	                <button type="button" class="btn btn-flat btn-default" onclick="popsubmit('9');">임시저장</button>
	                <button type="button" class="btn btn-flat btn-primary" onclick="popsubmit('1');">생성</button>
	              </div>
                </div>
    		</div>
    		
    		<!-- <div class="box box-danger">
    			<div class="box-header with-border">
                  <h4 class="box-title">팝업 설정</h4>
                  <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
	                </button>
	              </div>
                </div>
    			<div class="box-body">
    				
	                <div class="form-group" id="switch1">
	                	<label class="control-label min-width-150" for="">타사이트 공유</label>
	                	<input type="checkbox" class="switch" id="shareAt" name="shareAt" />
	                </div>
	                
    			</div>
    			
    		</div> -->
    	</div>
    </div>
    </form>
</section>

<div class="modal fade" id="fileUploadModal" tabindex="-1" role="dialog" aria-labelledby="fileUploadModalLabel">
<input type="hidden" name="mdaSeq" id="mdaSeq">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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
                    <span class="preview"><img data-dz-thumbnail /></span>
                </div>
                <div class="dz-file text-ellipsis" style="min-width: 300px;text-align:center;"><span class="name" data-dz-name></span></div>
                <div class="dz-size"><span class="size" data-dz-size></span></div>
                <div class="dz-progress p-t-10">
                    <strong class="error text-danger" data-dz-errormessage></strong>
                    <!-- <div class="progress-text"></div> -->
                    <div class="progress progress-sm progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0">
                      <div class="progress-bar progress-sm progress-bar-success" style="width:0%;" data-dz-uploadprogress>
                      </div>                                                                                          
                    </div>
                    <!-- <div class="text-center"><span class="progress-text"></span></div> -->
                </div>
                <div class="dz-trans" style="width:0px;min-width: 0px;">
                     <span class="progress-text"></span>
                </div>
                <div class="dz-status text-center" style="min-width: 0;">
                    <!-- <button type="button" class="btn btn-xs btn-primary btn-upload"><i class="fa fa-upload"></i> <span class="dz-status-text ">전송대기</span></button> -->
                    <button type="button" data-dz-remove class="btn btn-xs btn-warning cancel"><i class="fa fa-times"></i><span>삭제</span></button>
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
