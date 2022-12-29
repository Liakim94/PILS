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

<script src="${pageContext.request.contextPath }/js/cms/board/edit.js"></script>
<script src="${pageContext.request.contextPath }/x2/plugins/dropzone/dropzone.js"></script>
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


Dropzone.autoDiscover = false;
var myDropzone;
var totalSize = 0;
var totalCount = 0;
var uploadedSize = 0;
var uploadingSize = 0;
var uploadedCount = 0;
//var upload = false;

$(function(){
	var maxSize = 0;
	
	<c:if test="${option.attchSzUnt eq 'KB'}">maxSize = ${option.attchSz}/1024</c:if>
	<c:if test="${option.attchSzUnt eq 'MB'}">maxSize = ${option.attchSz}</c:if>
	<c:if test="${option.attchSzUnt eq 'GB'}">maxSize = ${option.attchSz}*1024</c:if>
	
	
	<c:if test="${option.attchAt eq 'Y'}">

	var previewNode = document.querySelector("#template");
	previewNode.id = "";
	var previewTemplate = previewNode.parentNode.innerHTML;
	//var previewTemplate = previewNode.innerHTML;
	previewNode.parentNode.removeChild(previewNode);
	//var previewNode = $("#template");
	//var previewTemplate = $(previewNode).html();
	myDropzone = new Dropzone("#file_upload", {
		url : "./upload.do",
		paramName: "file",
		thumbnailWidth:80,
		thumbnailHeight:80,
		parallelUploads: 20,
		filesizeBase: 1024,
		<c:if test="${not empty option && not empty option.attchSzUnt}">
		maxFilesize: maxSize, //fileMaxSize
		acceptedFiles : "${option.attchWtl}",
		maxFiles : ${option.attchCnt - fn:length(attach)},
		</c:if>
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
	  totalCount = $("#previews .file-row").length;
	  //totalSize += file.size;
	});
	
	myDropzone.on("error", function(file,response) {
	   //console.log(file);
	   totalCount = ($("#previews .file-row").length - $("#previews .file-row.dz-error").length);
	   //totalCount--;
	   if (file.previewElement) {
			var statusElement = file.previewElement.querySelector(".dz-status-text");
			var btnElement = file.previewElement.querySelector(".btn-upload");
			statusElement.textContent = "전송불가";
			//btnElement.style.background = "red";
			$(btnElement).removeClass("btn-primary").addClass("btn-danger");
			
			var responseElement = file.previewElement.querySelector(".dz-response");
			$(responseElement).empty();
	   }
	   //myDropzone.removeFile(file);
	   //file.previewElement.remove();
	});

    // maxFiles 카운터를 초과하면 경고창
    myDropzone.on("maxfilesexceeded", function (data) {
        alert('최대 업로드 파일 수는 ${option.attchCnt}개 입니다.');
    });
	
	// Update the total progress bar
	myDropzone.on("totaluploadprogress", function(progress, totalBytes, totalBytesSent) {
		//console.log(progress);
		
		document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
		document.querySelector("#total-files").textContent = uploadedCount +"/"+totalCount;
		//document.querySelector("#total-files").textContent = uploadedCount +"/"+activeFiles;
		  //document.querySelector("#total-files-size").textContent = bytesToSize(uploadedSize) +"/"+bytesToSize(totalSize);
	  	document.querySelector("#total-files-size").textContent = bytesToSize(totalBytesSent) +"/"+bytesToSize(totalBytes);
	});

	myDropzone.on("sending", function(file) {
	  // Show the total progress bar when upload starts
	  //document.querySelector("#total-progress").style.opacity = "1";
	  // And disable the start button
	  //file.previewElement.querySelector(".start").setAttribute("disabled", "disabled");
		document.querySelector("#dz-uploading").style.display = "block";
		var cancelElement = file.previewElement.querySelector(".cancel");
    	//$(cancelElement).remove();
	});

	// Hide the total progress bar when nothing's uploading anymore
	myDropzone.on("queuecomplete", function(progress) {
	  //document.querySelector("#total-progress").style.opacity = "0";
	  
		if(totalCount > 0 && totalCount == uploadedCount){
			//upload = false;
		  	$("#frmPost").submit();
		  }
	});
	
	myDropzone.on("uploadprogress", function(file, progress, byteSent) {
	  //document.querySelector("#total-progress .progress-bar").style.width = progress + "%";
		if (file.previewElement) {
			var progressElement = file.previewElement.querySelector(".dz-trans");
	    	progressElement.querySelector(".progress-text").textContent = parseInt(progress) + "% " + bytesToSize(byteSent) + "/" + bytesToSize(file.size);
	    	
	    	var statusElement = file.previewElement.querySelector(".dz-status-text");
	    	var cancelElement = file.previewElement.querySelector(".cancel");
	    	
	    	if(progress >=100) {
	    		statusElement.textContent = "파일처리중";
	    		$(cancelElement).remove();
	    	}else statusElement.textContent = "전송중";
	    	
		}
	});
	
	
	myDropzone.on("success", function(file, response) {
	  
		if (file.previewElement) {
			var progressElement = file.previewElement.querySelector(".dz-trans");
			progressElement.querySelector(".progress-text").textContent = "";

			var statusElement = file.previewElement.querySelector(".dz-status-text");
			statusElement.textContent = "전송완료";	
	
			var cancelElement = file.previewElement.querySelector(".cancel");
			$(cancelElement).remove();
	
			uploadedCount++;
				uploadedSize += file.size;
				document.querySelector("#total-files").textContent = uploadedCount +"/"+totalCount;
				//myDropzone.processQueue();
				
				var responseElement = file.previewElement.querySelector(".dz-response");
				var data = response.response;
				
				responseElement.querySelector("input[name='arrFilename']").value = data.filename;
				responseElement.querySelector("input[name='arrOriginalFilename']").value = data.originalFilename;
				responseElement.querySelector("input[name='arrFilesize']").value = data.filesize;
				responseElement.querySelector("input[name='arrFileext']").value = data.fileext;
				//responseElement.querySelector("input[name='arrFolderpath']").value = data.folderpath;
				responseElement.querySelector("input[name='arrFilepath']").value = data.filepath;
				responseElement.querySelector("input[name='arrFiletype']").value = data.filetype;
				
				//console.log(data.filename);
	  	}
		
	});
	
	myDropzone.on("complete", function(file) {
		//myDropzone.processQueue();
		//console.log("complete");
		//console.log(file);
		//myDropzone.removeFile(file);
	});
	
	myDropzone.on("removedfile", function(file) {
		//myDropzone.processQueue();
		file.previewElement.remove();
		totalCount--;
		
		if(totalCount < 0) totalCount = 0;
		
		if(totalCount == 0) {
			document.querySelector("#dz-uploading").style.display = "none";
			upload = false;
		}else{
			upload = true;
		}
	  	//totalSize -= file.size;
	});
	</c:if>
	// Setup the buttons for all transfers
	// The "add files" button doesn't need to be setup because the config
	// `clickable` has already been specified.
	/*document.querySelector(".actions.start").onclick = function() {
	  myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
	};
	document.querySelector("#actions .cancel").onclick = function() {
	  myDropzone.removeAllFiles(true);
	};*/
	$(".actionSave").on("click", function(){
		/* myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
		myDropzone.processQueue(); */
		$("#stat").val("");
		$("#form").submit();
		document.querySelector("#total-progress .progress-bar").style.width =  "0%";
		//$(this).addClass("disabled");
		//myDropzone.disable();
	});
	
	$(".actionTemp").on("click", function(){
		$("#stat").val("9");
		$("#form").submit();
		document.querySelector("#total-progress .progress-bar").style.width =  "0%";
	});
	
	
});


$(function(){
	
	getLike(${rs.boardSeq});
	getDislike(${rs.boardSeq});
	
	// switcherry true or false
	$(".switch").on("change", function()
	{
		<c:if test="${option.notiDtAt ne 'N'}">
		if(!$("#notiAt").is(':checked'))
		{
			$("#datepicker").prop("disabled", true);
			$("#datepicker2").prop("disabled", true);
		}
		else
		{
			$("#datepicker").prop("disabled", false);
			$("#datepicker2").prop("disabled", false);
		}
		</c:if>
	});
	
	// 공지 여부
	if("${rs.notiAt}" == "Y")
	{
		setSwitchery($("#notiAt"), true);
	}
	else
	{
		setSwitchery($("#notiAt"), false);
		$("#datepicker").prop("disabled", true);
		$("#datepicker2").prop("disabled", true);
	}
	// 오픈 여부
	if("${rs.opnAt}" == "Y")
	{
		setSwitchery($("#opnAt"), true);
	}
	else
	{
		setSwitchery($("#opnAt"), false);
	}
	
	$('#selectBbs').on('select2:select', function (e) 
	{
	    var data = e.params.data.id;
	    
	    $.ajax(
   		{
	    	url : "./getBbsOpt.do",
	    	type : "json",
	    	data : 
	    	{
	    		bbsId : data
	    	},
	    	method : "post",
			success : function(data){
				var rs = data.rs;
				location.href='./edit.do?bbsId='+rs.bbsId+'&no=${rs.boardSeq }';
			}
	    });
	});
	
	
	$('#cmtSubmit').on('click', function(){
		if($('#cmtCont').val() == ""){
			alert('내용을 입력하세요');
			return
		}
		
		
		if(confirm('댓글을 작성하시겠습니까?'))
		{
			 $.ajax(
	   		{
		    	url : "../comment/post.do",
		    	type : "json",
		    	data : 
		    	{
		    		cont : $('#cmtCont').val(),
		    		bbsId : '${rs.bbsId }',
		    		boardSeq : '${rs.boardSeq }'
		    		
		    	},
		    	method : "post",
				success : function(data){
					$('#cmtCont').val('');
					getCommentList();
				}
		    });
		}
	});
	
	
	if('${option.tagAt}' == 'N')
	{
		$("#taginput1 input[type='text']").prop("disabled", "disabled");
		$("#taginput1 input[type='text']").css("cursor","not-allowed");
		$("#taginput1 input[type='text']").css("background-color","#eee");
		$("#taginput1 div.bootstrap-tagsinput").css("cursor","not-allowed");
		$("#taginput1 div.bootstrap-tagsinput").css("background-color","#eee");
	}
	else 
	{
		$("#taginput1 input[type='text']").prop("disabled", "");
		$("#taginput1 input[type='text']").css("cursor","");
		$("#taginput1 input[type='text']").css("background-color","");
		$("#taginput1 div.bootstrap-tagsinput").css("cursor","");
		$("#taginput1 div.bootstrap-tagsinput").css("background-color","");
	}
	
	
	getCommentList();
	
});

/* $("#input-4").rating(); */


function fn_cmtDelete(a){
	if(confirm('댓글을 삭제하시겠습니까?'))
	{
		 $.ajax(
   		{
	    	url : "../comment/delete.do",
	    	type : "json",
	    	data : 
	    	{
	    		cmtSeq : a,
	    		
	    	},
	    	method : "post",
			success : function(data){
				$('#cmtCont').val('');
				getCommentList();
			}
	    });
	}
};

function getCommentList(){
	 $.ajax(
	{	
	   	url : "../comment/list.do",
	   	type : "json",
	   	data : 
	   	{
	   		boardSeq : '${rs.boardSeq }'
	   		
	   	},
	   	method : "post",
		success : function(data){
			
			var list = data.list;
			var html = "";
			$.each(list, function(index, item)
			{
				/* 내가 작성 */
				html += '<div class="direct-chat-msg right">';
                html += '<div class="direct-chat-info clearfix">';
                html +=  '<span class="direct-chat-name pull-right">"'+item.regNm+'"</span>';
                html +=  '<span class="direct-chat-timestamp pull-left">"'+item.regDe+'"</span>';
                html +=  '<span class="m-l-5 text-muted anchor" data-placement="right" data-toggle="tooltip" title="삭제"><i class="fa fa-trash" onclick="fn_cmtDelete('+item.cmtSeq+');"></i></span>';
                html +=  '</div>';
                html +=  '<div class="direct-chat-text">"'+item.cont+'"</div>';
                html +=  '</div>';
                
                /* 남이 작성 */
				/* html += '<div class="direct-chat-msg">';
                html += '<div class="direct-chat-info clearfix">';
                html +=  '<span class="direct-chat-name">"'+item.regNm+'"</span>';
                html +=  '<span class="direct-chat-timestamp pull-right">"'+item.regDe+'"</span>';
                html +=  '<span class="m-l-5 text-muted anchor" data-placement="right" data-toggle="tooltip" title="삭제"><i class="fa fa-trash" onclick="fn_cmtDelete('+item.cmtSeq+');"></i></span>';
                html +=  '</div>';
                html +=  '<div class="direct-chat-text">"'+item.cont+'"</div>';
                html +=  '</div>'; */
			});
			
			$('#cmtList').html(html);
		}
   });
}

var meLike = false;
var meDislike = false;


function fn_setLike(seq){
	if(meDislike) {
		alert("이미 비공감을 누르셨습니다.");
    	return;
	}
	$.ajax({
		url : "../board/setLike.do",
	   	type : "json",
	   	data : 
	   	{
	   		boardSeq : seq,
	   		like : 1
	   	},
	   	method : "post",
		success : function(data){
			var rs = data.rs;
			if(rs > 0) getLike(seq);
		}
	});
}

function fn_setDislike(seq){
	if(meLike) {
		alert("이미 공감을 누르셨습니다.");
    	return;
	}
	$.ajax({
		url : "../board/setDislike.do",
	   	type : "json",
	   	data : 
	   	{
	   		boardSeq : seq,
	   		dislike : 1
	   	},
	   	method : "post",
		success : function(data){
			var rs = data.rs;
			if(rs > 0) getDislike(seq);
		}
	});	
}

function getLike(num){
	$.ajax({
		url : "../board/getLike.do",	
		type : "json",
		method : "post",
		data : {no: num},
		beforeSend:function(){
		},
		success : function(data){
			var rs = data.rs;
			if(rs != null){
				if(rs.meLike > 0) {
					meLike = true;
				}else{
					meLike = false;
				}
				$("#btnLike > span").text(rs.cnt);
			}else $("#btnLike > span").text(0);
			
		},
		error : function(err){
			alert("에러가 발생했습니다.");
		}
    });
}

function getDislike(num){
	$.ajax({
		url : "../board/getDislike.do",			
		type : "json",
		method : "post",
		data : {no: num},
		beforeSend:function(){
		},
		success : function(data){
			var rs = data.rs;
			if(rs != null){
				if(rs.meDislike > 0){
					meDislike = true;
				}else{
					meDislike = false;
				}
				$("#btnUnlike > span").text(rs.cnt);
			}else $("#btnUnlike > span").text(0);
		},
		error : function(err){
			alert("에러가 발생했습니다.");
		}
    });
}

</script>

</head>

<page:applyDecorator name="menu" />
<form:form commandName="rs" name="frmPost" id="frmPost" method="POST" action="boardEdit.do">
<input type="hidden" name="action" />
	<input type="hidden" value ="${bbsId}" name="bbsId" id="bbsId" >
	<input type="hidden" value ="${rs.boardSeq}" name="boardSeq" id="boardSeq" >

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
	                  	<form:input class="form-control" path="title" value="${rs.title}" id="title" maxlength="85"/>
	                </div>

	                <div class="form-group">
	                <label class="control-label">내용</label>
	                  	<textarea class="form-control" id="cont" name="cont" >${fx:resetXSSMinimum(rs.cont) }</textarea>
	                </div>

                </div><!-- /.box-body -->
                <div class="box-footer">


<%--              <c:if test="${not empty attach }">--%>
<%--              <div class="form-group">--%>
<%--               	<label>첨부된 파일</label>--%>
<%--               	<div id="delete_files"></div>--%>
<%--               	<ul class="mailbox-attachments clearfix">--%>
<%--               		<c:forEach var="list" items="${attach }">--%>
<%--	                <li id="addedFile_${list.attchSeq }">--%>
<%--	                 <c:choose>--%>
<%--	                 	<c:when test="${fn:substring(list.fileMime,0,5) eq 'image' }"><span class="mailbox-attachment-icon has-img noImg"><img src="${pageContext.request.contextPath }/upload/${list.filePath }/${list.svFileNm}" alt="${list.fileNm }" onerror="src='/images/no-img.jpg'"/></span></c:when>--%>
<%--	                 	<c:otherwise>--%>
<%--	                 		<span class="mailbox-attachment-icon">--%>
<%--	                 			<i class="fa fa-${fx:getFileExt(list.fileExt) }"></i>--%>
<%--	                 		</span>--%>
<%--	                 	</c:otherwise>--%>
<%--					 </c:choose>--%>
<%--	                  <div class="mailbox-attachment-info">--%>

<%--	                    <a href="#" class="mailbox-attachment-name text-ellipsis" title="${list.fileNm }">--%>
<%--	                    	<c:choose>--%>
<%--	                    	<c:when test="${fn:substring(list.fileMime,0,5) eq 'image' }"><i class="fa fa-camera"></i></c:when>--%>
<%--	                    	<c:otherwise><i class="fa fa-paperclip"></i></c:otherwise>--%>
<%--	                    	</c:choose>--%>
<%--	                    ${list.fileNm }--%>
<%--	                    </a>--%>
<%--	                        <span class="mailbox-attachment-size">--%>
<%--	                          ${fx:getFileSize(list.fileSz) }--%>
<%--	                          <a href="javascript:deleteFile(${list.attchSeq })" class="btn btn-default btn-xs pull-right" data-toggle="tooltip" title="파일삭제"><i class="fa fa-trash"></i></a>--%>
<%--	                          <a href="${pageContext.request.contextPath }/cms/board/download.do?no=${list.attchSeq}" class="btn btn-default btn-xs pull-right" data-toggle="tooltip" title="다운로드"><i class="fa fa-cloud-download"></i></a>--%>
<%--	                        </span>--%>
<%--	                  </div>--%>
<%--	                </li>--%>
<%--	                </c:forEach>--%>
<%--	              </ul>--%>
<%--               </div>--%>
<%--	           </c:if>--%>
              </div>
              </div><!-- /. box -->
    	</div>


    	<div class="col-md-4">
    		<div class="box box-danger">
    			<div class="box-header with-border">
                  <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse" onclick=""><i class="fa fa-minus"></i>
	                </button>
	              </div>
                </div>

    			<div class="box-footer">
                  <div class="btn-wrap type02 low_margin">
	                <button type="button"  onclick="fn_submit('1')" class="btn btn-flat btn-primary">저장</button>
					<a href="${pageContext.request.contextPath}/boardList.do?bbsId=${bbsId}" class="btn blue" title="취소">취소</a>
                </div>
    		</div>

    	</div>

    </div> <!-- row end -->
	</div>
</section>
</form:form>
