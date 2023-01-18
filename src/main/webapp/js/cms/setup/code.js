var selCtgr = "";

$(function(){
	$("#frmPost").validate({
		ignore: "",
        rules: {
        	ctgr:{required:true,maxlength:5},
        	cd:{required:true,maxlength:5},
        	cdNm:{required:true},
        },
        onkeyup:false,
        onclick:false,
        onfocusout:false,
        messages: {
        	ctgr:{required:"카테고리는 필수 입력요소입니다."},
        	cd:{required:"코드는 필수 입력요소입니다."},
        	cdNm:{required:"코드명은 필수 입력요소입니다."},
        },        
        submitHandler: function (frm) {
        	codeSubmit();
        },
        showErrors:function(errorMap, errorList){
			if(!$.isEmptyObject(errorList)){
		       	$.each(errorList, function() {
                	alert(this.message); //summary += " * " + this.message + "<br>" ;
                	return false;
            	});
			}
		}
    });
	
	var group = $(".sorted_table").sortable({
		group: 'serialization',
		containerSelector : 'table',
		itemPath : '> tbody',
		itemSelector : 'tr',
		placeholder: '<tr class="placeholder"/>',
		onDrop: function ($item, container, _super) {
		    var data = group.sortable("serialize").get();
		    var jsonString = JSON.stringify(data, null, '');
		    
		    console.log(jsonString);
		    
		    $.ajax({
				url : "./setCodeSort.do",		
				type : "json",
				method : "post",
				data : {data : jsonString},
				beforeSend:function(){
				},
				success : function(data){
					var response = data.response;
					
					$.each($(".sorted_table > tbody > tr > td.code-sort"), function(index, item){
						$(this).text(index);
					});
					
					
				},
				error : function(err){
				}
		    });
		    
		    
		    _super($item, container);
		  }
	});
	
	$(".sorted_table tr.no-drag-drop").sortable({
		  group: 'no-drop',
		  drop: false
	});
	$(".sorted_table tr.no-drag-drop").sortable({
	  group: 'no-drop',
	  drag: false
	});
	
	
	
	getCategoryList();
});

function codeSubmit(){
	$.ajax({
		url : "./addCode.do",		
		type : "json",		
		method : "post",
		data : $("#frmPost").serialize(),
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		beforeSend:function(){
			$(document).ajaxStart(function() { Pace.restart(); });
		},
		success : function(data){
			var response = data.response;
			if(response > 0){
				$('#codeModal').modal('hide');
				getCategoryList();
				getCodeList(selCtgr);
				resetCode();
			}else{
				alert("오류가 발생하였습니다.");
			}
			
		},
		error : function(request,status,error){			
			alert("오류가 발생하였습니다.");
		}
	});
}

function showAddModal(){
	
	if(selCtgr == ""){
		alert("카테고리를 선택하세요");
		return false;
	}else{
		$('#codeModal').modal();
		$("#cmd").val("");
		resetCode();
		$("#category").val(selCtgr);
	}
}


function getCategoryList(){
	$.ajax({
		url : "./getCategory.do",		
		type : "json",
		method : "post",
		beforeSend:function(){
			$(document).ajaxStart(function() { Pace.restart(); });
		},
		success : function(data){
			var list = data.response;
			
			var html = "";
			$.each(list, function(index, item){
				html += '<tr>';
				html += '<td><a href="javascript:getCodeList(\''+item.cd+'\')">'+item.cd+'</a></td>';
				html += '<td>'+item.cdNm+'</td>';
				html += '</tr>';
			});
			$("#categoryBody").html(html);
			
		}
	});
	
}


function getCodeList(a){
	selCtgr = a;
	$.ajax({
		url : "./getCodeList.do",		
		type : "json",
		data : {category : a},
		method : "post",
		beforeSend:function(){
			$(document).ajaxStart(function() { Pace.restart(); });
		},
		success : function(data){
			var list = data.response;
			var html = "";
			if(list.length > 0){
				$.each(list, function(index, item){
					if(item.ctgr === '00000' && item.cd === '00000'){
					html += '<tr class="no-drag-drop" data-id="'+item.cd+'" data-name="'+item.ctgr+'">';
					}else{
					html += '<tr data-id="'+item.cd+'" data-name="'+item.ctgr+'">';
					}
					html += '<td><a href="javascript:getCode(\''+item.ctgr+'\',\''+item.cd+'\')">'+item.cd+'</a><input type="hidden" name="cd" value="'+item.cd+'"/></td>';
					html += '<td>'+item.cdNm+'</td>';
					html += '<td class="code-sort">'+item.sort+'</td>';
					html += '<td>'+item.useAt+'</td>';
					html += '</tr>';
				});
			}else{
				html = "<tr><td colspan='4' class='text-center'>코드가 존재하지 않습니다.</td></tr>";
			}
			
			$("#codeBody").html(html);
			
		}
	});
}

function getCode(a, b){
	$.ajax({
		url : "./getCode.do",		
		type : "json",
		data : {category : a, code : b},
		method : "post",
		beforeSend:function(){
			$(document).ajaxStart(function() { Pace.restart(); });
		},
		success : function(data){
			var response = data.response;
			console.log(response);
			$('#codeModal').modal();
			resetCode();
			$("#cmd").val("update");
			$("#category").val(response.ctgr).prop("readonly", "readonly");
			$("#code").val(response.cd).prop("readonly", "readonly");
			$("#codeName").val(response.cdNm);
			$("#codeDesc").val(response.cdDesc);
			$("#rsv1").val(response.rsv1);
			$("#rsv2").val(response.rsv2);
			$("#rsv3").val(response.rsv3);
			$("#sort").val(response.sort);
			if(response.useAt == 'Y'){
				$("#strUseAt_N").prop("checked", false);
				$("#strUseAt_N").prop("checked", "checked").parent().removeClass("active");
				
				$("#strUseAt_Y").prop("checked", true);
				$("#strUseAt_Y").prop("checked", "checked").parent().addClass("active");
			}else if(response.useAt == 'N'){
				$("#strUseAt_Y").prop("checked", false);
				$("#strUseAt_Y").prop("checked", "checked").parent().removeClass("active");
				
				$("#strUseAt_N").prop("checked", true);
				$("#strUseAt_N").prop("checked", "checked").parent().addClass("active");
				

			}
		}
	});
}


function resetCode(){
	
	$("#category").val('');
	$("#code").val('').prop("readonly", false);
	$("#codeName").val('');
	$("#codeDesc").val('');
	$("#rsv1").val('');
	$("#rsv2").val('');
	$("#rsv3").val('');
	$("#sort").val('0');
	$("#strUseAt_Y").prop("checked", "checked").parent().addClass("active");
	$("#strUseAt_N").prop("checked", false).parent().removeClass("active");
	
}