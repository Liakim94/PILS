var oEditors = [];
$(document).ready(function() {
	
	//임시저장 AJAX
	$(".doSubmit").on("click", function() {
			
		if($("#site-id option:selected").val() == "") {
			alert("사이트를 선택해주세요.");			
			return;
		}
		
		if($("#title").val().length < 1) {
			alert("페이지명을 입력해주세요.");
			$("#title").focus();
			return;
		}
		
		var aclList = "";
    	$("#acl-list option").each(function (index) {
			var id = $(this).val();
			var txt = $(this).text();
			var acl = $(this).attr("aria-acl");
			aclList += (id + "¶" + txt + "¶" + acl +",");
		});
    	
    	$("#arrAcl").val(aclList);
	
		oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);
		
		if($(this).attr("value") == "temp") {
			
			$.ajax({
				url : "Apost.do",
				data : {
					title : $("#title").val(),
					cont  : $("#cont").val(),
					flag  : "F",
					authList : $("#arrAcl").val()
				},
				type : "json",
				method : "post",
				success : function(data){
					if(data.rs == 1) {
						if(confirm("저장완료\n리스트 페이지로 이동하시겠습니까?")) {
							location.href="list.do";
						}else {
							location.href="edit.do?action=list&no="+data.no;
						}
					}else {
						alert("ERROR");
					}
				}
			});
			
		}
		
	});
	
	
	$("#postForm").validate({
		ignore: "",
        rules: {
        	steId:{required:true},
        	title:{required:true},
        	//steUrl:{required:true},
        	//steIp:{required:true, digit:true}
        },
        onkeyup:false,
        onclick:false,
        onfocusout:false,
        messages: {
        	steId:{required:"사이트를 선택하세요"},
        	title:{required:"콘텐츠명을 입력하세요"},
        },        
        submitHandler: function (frm) {
        	$(".switch").each(function(index)
			{
				if($(this).is(':checked')) $(this).val('Y');
				else $(this).val('N');

			}); 
        	
        	//??
        	//alert(frm);
        	var aclList = "";
        	$("#acl-list option").each(function (index) {
    			var id = $(this).val();
    			var txt = $(this).text();
    			var acl = $(this).attr("aria-acl");
    			aclList += (id + "¶" + txt + "¶" + acl +",");
    		});
        	
        	//alert(aclList);
        	
        	$("#arrAcl").val(aclList);
        	
        	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);
        	
        	//alert("endSubmit");
        	frm.submit();
        	//return false;
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
	
	
	
});

//콘텐츠 서브밋
/*function doSubmit() {
	
	$(".switch").each(function(index)
	{
		if($(this).is(':checked')) $(this).val('Y');
		else $(this).val('N');

	}); 
	
	if($("#site-id option:selected").val() == "") {
		alert("사이트를 선택해주세요.");			
		return;
	}
	
	if($("#title").val().length < 1) {
		alert("페이지명을 입력해주세요.");
		$("#title").focus();
		return;
	}
	
	var aclList = "";
	$("#acl-list option").each(function (index) {
		var id = $(this).val();
		var txt = $(this).text();
		var acl = $(this).attr("aria-acl");
		aclList += (id + "¶" + txt + "¶" + acl +",");
	});
	
	$("#arrAcl").val(aclList);
	
	alert(aclList);
	
	return false;
	
	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);
	//document.postForm.submit();
}*/


