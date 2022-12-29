
// bbs submit
function fn_submit(stat){
	var frm = document.getElementById('frmPost');
	
	$(".switch").each(function(index)
			{
				if($(this).is(':checked')) $(this).val('Y');
				else $(this).val('');

			}); 
	if(stat == '1'){
		if(confirm("등록하시겠습니까?")){
			frm.stat.value = stat;
			$("#frmPost").submit();
		}
	} else{
		if(confirm("임시저장 하시겠습니까?")){
			frm.action.value = 'list';
			frm.stat.value = stat;
			$("#frmPost").submit();
			
		}
	}
}

// bbs validate
$(function(){ 
	 $("#frmPost").validate({
	        rules: {
	        	steId:{required:true},
	        	bbsNm:{required:true},
	        	attchSz:{number:true}
	        	
	        },
	        onkeyup:false,
	        onclick:false,
	        onfocusout:false,
	        messages: {
	        	steId:{required:"사이트를 선택하세요."},
	        	bbsNm:{required:"게시판명을 입력하세요."},
	        	attchSz:{number:"숫자만 입력하실 수 있습니다."}
	 
	        },        
	        submitHandler: function (frm) {
	        	
	        	// 첨부파일 체크 시 파일용량 입력
	        	if(($("#attchAt").is(':checked')) && ($("#attchSz").val() == 0))
	        	{
	        		alert("파일용량을 입력하세요.");
	        		$("#att_tab").addClass("active");
	        		$("#tab_2").addClass("active");
	        		
	        		$("#tab_1").removeClass("active");
	        		$("#tab_3").removeClass("active");
	        		$("#tab_4").removeClass("active");
	        		$("#img_tab").removeClass("active");
	        		$("#cmm_tab").removeClass("active");
	        		$("#mov_tab").removeClass("active");
	        		$("#attchSz").focus();
	        		return false;
	        	} 
	        	
	        	var aclList = "";
	        	$("#acl-list option").each(function (index) {
	    			var id = $(this).val();
	    			var txt = $(this).text();
	    			var acl = $(this).attr("aria-acl");
	    			aclList += (id + "¶" + txt + "¶" + acl +",");
	    		});
	        	
	        	$("#arrAcl").val(aclList);
	        	
	        	frm.submit();	 
	    		
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

$(function(){
	
	$(".switch").on("change", function(){
		
		var fileCnt = $("#attchCnt").data("ionRangeSlider");
		var thumCreCyl = $("#thumCreCyl").data("ionRangeSlider");
		var movThumCnt = $("#movThumCnt").data("ionRangeSlider");
		var trcCreCyl = $("#trcCreCyl").data("ionRangeSlider");

		if(!$("#attchAt").is(':checked'))
		{
			$("#attchSz").prop("disabled", true);
			/*$("#attchOdp").prop("disabled", true);*/
			/* $("#attchBkl").prop("disabled", true);
			$("#attchWtl").prop("disabled", "disabled"); */
			setSwitchery($("#attchOdp"), false);
			/*$("#attchExtAt").prop("disabled", true);*/
			setSwitchery($("#attchExtAt"), false);
			$("#attchPath").prop("disabled", true);
			$("#attchSzUnt").prop("disabled", true);
			
			$("#switch1 .switchery").css("cursor","not-allowed");
			$("#taginput1 input[type='text']").prop("disabled", "disabled");
			$("#taginput1 input[type='text']").css("cursor","not-allowed");
			$("#taginput1 input[type='text']").css("background-color","#eee");
			$("#taginput1 div.bootstrap-tagsinput").css("cursor","not-allowed");
			$("#taginput1 div.bootstrap-tagsinput").css("background-color","#eee");
			fileCnt.update({
				disable : true
			})
		}
		else
		{
			$("#attchSz").prop("disabled", false);
			/*$("#attchOdp").prop("disabled", false);*/
			$("#attchBkl").prop("disabled", false);
			$("#attchWtl").prop("disabled", false);
			/*$("#").prop("disabled", false);*/
			$("#attchPath").prop("disabled", false);
			$("#attchSzUnt").prop("disabled", false);
			
			$("#switch1 .switchery").css("cursor","");
			$("#taginput1 input[type='text']").prop("disabled", "");
			$("#taginput1 input[type='text']").css("cursor","");
			$("#taginput1 input[type='text']").css("background-color","");
			$("#taginput1 div.bootstrap-tagsinput").css("cursor","");
			$("#taginput1 div.bootstrap-tagsinput").css("background-color","");
			
			fileCnt.update({
				disable : false
			})
		}
		
		
		if(!$("#thumAt").is(':checked'))
		{
			$("#thumExt").prop("disabled", true);
			$("#thumPath").prop("disabled", true);
			$("#thumStd").prop("disabled", true);
			/*$("#thumCreAt").prop("disabled", true);*/
			setSwitchery($("#thumCreAt"), false);
			$("#thumCreCyl").prop("disabled", true);
			
			$("#switch2 .switchery").css("cursor","not-allowed");
			$("#taginput2 input[type='text']").prop("disabled", "disabled");
			$("#taginput2 input[type='text']").css("cursor","not-allowed");
			$("#taginput2 input[type='text']").css("background-color","#eee");
			$("#taginput2 div.bootstrap-tagsinput").css("cursor","not-allowed");
			$("#taginput2 div.bootstrap-tagsinput").css("background-color","#eee");
			
			thumCreCyl.update({
				disable : true
			});
		}
		else
		{
			$("#thumExt").prop("disabled", false);
			$("#thumPath").prop("disabled", false);
			$("#thumStd").prop("disabled", false);
			$("#thumCreAt").prop("disabled", false);
			$("#thumCreCyl").prop("disabled", false);
			
			$("#switch2 .switchery").css("cursor","");
			$("#taginput2 input[type='text']").prop("disabled", "");
			$("#taginput2 input[type='text']").css("cursor","");
			$("#taginput2 input[type='text']").css("background-color","");
			$("#taginput2 div.bootstrap-tagsinput").css("cursor","");
			$("#taginput2 div.bootstrap-tagsinput").css("background-color","");
			
			thumCreCyl.update({
				disable : false
			});
		}
		
		if(!$("#trcAt").is(':checked'))
		{
			$("#movExt").prop("disabled", true);
			$("#movThumCnt").prop("disabled", true);
			$("#movPath").prop("disabled", true);
			/*$("#movCreAt").prop("disabled", true);*/
			setSwitchery($("#movCreAt"), false);
			$("#trcCreCyl").prop("disabled", true);
			$("#movStd").prop("disabled", true);
			
			$("#switch3 .switchery").css("cursor","not-allowed");
			$("#taginput3 input[type='text']").prop("disabled", "disabled");
			$("#taginput3 input[type='text']").css("cursor","not-allowed");
			$("#taginput3 input[type='text']").css("background-color","#eee");
			$("#taginput3 div.bootstrap-tagsinput").css("cursor","not-allowed");
			$("#taginput3 div.bootstrap-tagsinput").css("background-color","#eee");
			
			trcCreCyl.update({
				disable : true
			});
			movThumCnt.update({
				disable : true
			});
			
		}
		else
		{
			$("#movExt").prop("disabled", false);
			$("#movThumCnt").prop("disabled", false);
			$("#movPath").prop("disabled", false);
			$("#movCreAt").prop("disabled", false);
			$("#trcCreCyl").prop("disabled", false);
			$("#movStd").prop("disabled", false);
			
			$("#switch3 .switchery").css("cursor","");
			$("#taginput3 input[type='text']").prop("disabled", "");
			$("#taginput3 input[type='text']").css("cursor","");
			$("#taginput3 input[type='text']").css("background-color","");
			$("#taginput3 div.bootstrap-tagsinput").css("cursor","");
			$("#taginput3 div.bootstrap-tagsinput").css("background-color","");
			
			trcCreCyl.update({
				disable : false
			});
			movThumCnt.update({
				disable : false
			});
		}
		
	});
});
