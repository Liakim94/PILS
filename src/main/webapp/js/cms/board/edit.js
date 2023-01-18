
// board submit
function fn_submit(stat)
{
	var frm = document.getElementById('frmPost');

	if(stat == '1')
	{
		if(confirm("저장 하시겠습니까?"))
		{
			// frm.action.value= 'list';
			frm.stat.value = stat;
			oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);

			$("#frmPost").submit();
		}
	}
	else if(stat == '9' || stat == '8')
	{
		var msg = '';
		if(stat == '8') msg = '복원 하시겠습니까?';
		if(stat == '9') msg = '임시저장 하시겠습니까?';

		if(confirm(msg)){
			frm.stat.value = '9';
			$("#frmPost").submit();
		}
	}
	else
	{
		if(confirm("삭제 하시겠습니까?"))
		{
			frm.action.value= 'trash';
			frm.stat.value = stat;
			$("#frmPost").submit();
		}
	}
}



$(function(){


	//date-range
	var opts = {
		format: 'yyyy-mm-dd',
		autoclose: true,
		onSelect : function() {
			$(this).trigger('change');
		}
	};
	// first datepicker
	$('#datepicker').datepicker(opts);
	// second datepickers allows plain text
	opts.forceParse = false;
	$('#datepicker2').datepicker(opts);
	$('#datepicker2').datepicker("option", 'minDate', $('#datepicker').datepicker('getDate'));
	// add event listeners to datepickers
	$('#datepicker').on('change', function(selected) {
		// see if the second picker has a date selected
		var selectDate = $('#datepicker').datepicker('getDate');
		var toDate = $('#datepicker2').datepicker('getDate');
		if (toDate) {
			// if it is before the first date, set to the value of the first date
			if (selectDate.getTime() > toDate.getTime()) {
				$('#datepicker2').datepicker('setDate', selectDate);
			}
		}
		// sets the start date on the second picker
		$('#datepicker2').datepicker("option", 'minDate', selectDate);
	});
	$('#datepicker').on('clearDate', function() {
		$('#datepicker2').datepicker('clearDates');
	});


/*	// switcherry true or false
	$(".switch").on("change", function()
	{
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
	});*/

	//board validate
	 $("#frmPost").validate({
	        rules: {
	        	bbsId:{required:true},
	        	title:{required:true}
	        },
	        onkeyup:false,
	        onclick:false,
	        onfocusout:false,
	        messages: {
	        	bbsId:{required:"게시판을 선택하세요."},
	        	title:{required:"제목을 입력하세요."}

	        },
	        submitHandler: function (frm) {

	        	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);

	        	var ir1 = $("#cont").val();
	            if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
	                 alert("내용을 입력하세요.");
	                 oEditors.getById["cont"].exec("FOCUS"); //포커싱
	                 return;
	            }

	        	/*파일업로드*/
	        	// if (totalCount > uploadedCount) {
	        	// 	myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED));
	    		// 	myDropzone.processQueue();
	    		// 	console.log("uploading...");
	    		// 	//upload = false;
	    	    // }
	    	    // else {
	    	    // 	console.log("regist");
	    	    // 	$(".actionSave").addClass("disabled");
	    	    // 	$(".actionTemp").addClass("disabled");
	    	    //
	    	    // 	frm.submit();
	    	    // }

	        },
	        success: function (e) {
	        },
	        showErrors:function(errorMap, errorList){
				if(!$.isEmptyObject(errorList)){
			       	$.each(errorList, function() {
	                	alert(this.message); //summary += " * " + this.message + "<br>" ;
	                	return false;
	            	});
			       	//this.defaultShowErrors();
				}
			}
		});

});


function deleteFile(num){
	if(confirm("파일을 삭제하시겠습니까? 삭제 시 복구는 불가 합니다.")){
	$("#delete_files").append('<input type="hidden" name="deletefile" value="'+num+'"/>');
	$("#addedFile_"+num).remove();
	myDropzone.options.maxFiles += 1;
	//console.log("after="+myDropzone.options.maxFiles);
	}
}

/*
function handleDragOver(e){
	e.stopPropagation();
	e.preventDefault();
	e.dataTransfer.dropEffect='copy';
}

var ftCnt = 0;
var ftSize = 0;
var files = [];
function handleDrop(e){
	e.stopPropagation();
	e.preventDefault();
	file = e.dataTransfer.files;
	//files = file;

	var output = [];

	for(var i = 0,f;f=file[i];i++ ){

		files.push(file[i]);
		var html = '';
		html += '<tr id="f_'+ftCnt+'">';
		html += '<td><input type="checkbox" name="chkFile" value="f_'+ftCnt+'"></td>';
		html += '<td><span data-toggle="tooltip" title="'+f.name+'">'+f.name+'</span></td>';
		html += '<td><span data-toggle="tooltip" title="'+f.type+'">'+f.type+'</span></td>';
		html += '<td>'+getBytes(f.size)+'</td>';
		html += '<td><div class="progress progress-xxs"><div class="progress-bar progress-bar-danger" style="width: 0%"></div></div></td>';
		html += '<td>전송대기</td>';
		html += '</tr>'
		output.push(html);
		$("#fileList table > tbody").append(html);
		ftCnt += 1;
		//ftSize += f.size;
		setFileInfo();
	}


}

function handleSelectFile(e){
	e.stopPropagation();
	e.preventDefault();
	file = e.target.files;


	var output = [];
	var html = '';
	for(var i = 0, f; f=file[i]; i++){

		files.push(file[i]);
		var html = '<tr id="f_'+ftCnt+'">';
		html += '<td><input type="checkbox" name="chkFile" value="f_'+ftCnt+'"></td>';
		html += '<td><span data-toggle="tooltip" title="'+f.name+'">'+f.name+'</span></td>';
		html += '<td><span data-toggle="tooltip" title="'+f.type+'">'+f.type+'</span></td>';
		html += '<td>'+getBytes(f.size)+'</td>';
		html += '<td><div class="progress progress-xxs"><div class="progress-bar progress-bar-danger" style="width: 0%"></div></div></td>';
		html += '<td>전송대기</td>';
		html += '</tr>'
		output.push(html);
		$("#fileList table > tbody").append(html);
		ftCnt += 1;
		//ftSize += f.size;
		setFileInfo();
	}

}

function setFileInfo(){
	ftSize = 0;
	for(var i = 0, f; f = files[i];i++ ){
		ftSize += f.size;
	}

	if(files.length < 1){
		$("#fileList").css("display","none");
	}else{

		$("#sendFileCnt").text("0/"+files.length);
		$("#sendFileSize").text("0 byte(s)/"+getBytes(ftSize));

		$("#fileList").css("display","block");
	}
}



window.onload=function(){
	var drop_zone = document.getElementById("dropZone");
	drop_zone.addEventListener('dragover', handleDragOver, false);
	drop_zone.addEventListener('drop', handleDrop, false);
	document.getElementById('files').addEventListener('change', handleSelectFile, false);
}*/

function deleteBbs(){
	if(confirm("정말 삭제하시겠습니까?")){
		$("#frmDelete").submit();
		}else {
		return false;
	}
}